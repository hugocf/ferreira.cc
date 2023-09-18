---
date: 2019-02-15
description: Small information nuggets and recipies about Splunk
lang: en
tags: [ splunk, info, tips, tricks, how to ]
title: Splunk
showToc: true
tocOpen: true
tocSide: right
---

<!--more-->

*(most recent on top)*

## Exclude lines from the log

```text
stream_name="*tax*" stderr NOT TimeoutException
| regex log!="\.\.\..*"
| regex log!="at .*"
| table _time log
```

## Group and concatenate messages with the same time

```text
stream_name="*tax*" stderr
| concurrency duration=1
| reverse
| stats list(log) by _time
```

## Aggregated sum of numeric fields

*… totals*

```text
"payments.tax" live "rest client response" "/transactions}"
| spath input=log
| rex field=message ".*(?:} ->)(?<response>.*)" 
| spath input=response
| stats sum(transaction.tax_amount) as "Total taxed amount"
```

*… partials*

```text
"payments.tax" live "rest client response" "/transactions}"
| spath input=log
| rex field=message ".*(?:} ->)(?<response>.*)" 
| spath input=response
| search transaction.tax_amount > 0
| rename transaction.tax_country_code as Country
| rename transaction.tax_entity_name as "Tax Entity"
| stats sum(transaction.tax_amount) as "Total taxed amount" by Country, "Tax Entity"
| sort by -Country
```

## Search query with JSON parsing (spath)

```text
"Generate Receipt request"
| spath input=log
| rex field=message ".*(?:Request Body = )(?<request>.*)"
| spath input=request
| rename "transaction.custom_fields{}.key" as "keys"
| rename "transaction.custom_fields{}.value" as "values"
|  eval k=mvindex(keys,10)
|  eval v=mvindex(values,10)
| search v!=1 AND v!=6
```

## Left join with inner query + Loop several fields into a single string

```text
log="*com.meetup.payments.tax*"
| spath input=log
| search mdc.run_mode!="Test"
| search exception.stacktrace!="" OR level="ERROR" 
| eval time = strftime(_time,"%Y-%m-%d %H:%M:%S") 
| rename message as error_message 
| join mdc.request_id type=left
    [ search "REST client response" live 
    | spath input=log 
    | rex field=message ".*(?:} ->)(?<response>.*)"]
| spath output=taxamo_errors input=response path=errors{} 
| join mdc.request_id type=left
    [ search "message received from SQS" "live" 
    | spath input=log 
    | rex field=message ".*(?:Body: )(?<webhook_event>.*)(?:,Attributes).*" ] 
| rex field=error_message ".*(?:\":)(?<error_description>.*)" 
| rex field=error_message ".*(?:MemberId\()(?<member_id>.*)(?:\))" 
| strcat "http://api.meetup.com/members/" member_id triage.url.member 
| rename mdc.customer_id as customer_id 
| rename webhook_event as triage.webhook_event 
| spath input=triage.webhook_event 
| strcat "https://dashboard.stripe.com/events/" id triage.url.stripe_event 
| strcat "https://dashboard.stripe.com/customers/" data.object.customer triage.url.stripe_customer 
| strcat "https://dashboard.stripe.com/payments/" data.object.charge triage.url.stripe_charge 
| strcat "https://dashboard.stripe.com/invoices/" data.object.id triage.url.stripe_invoice 
| strcat "https://dashboard.stripe.com/subscriptions/" data.object.subscription triage.url.stripe_subscription 
| strcat "https://manage.taxamo.com/dashboard.html#/live/transactions?key_or_custom_id=" data.object.number triage.url.taxamo_transaction 
| rename data.object.total as total 
| eval triage.data.total_amount_in_dollars=total/100 
| rename type as triage.data.event_type 
| rename data.object.number as triage.data.invoice_number 
| rename data.object.lines.data{}.metadata.* as triage.metadata.* 
| rename data.object.lines.data{}.plan.* as plan.* 
| strcat plan.interval_count " " plan.interval triage.data.plan_period 
| foreach triage.* 
    [| strcat ":  " <<FIELD>> f 
    | eval fields=mvappend(fields,f) 
    | eval cols=mvappend(cols,"<<FIELD>>")] 
| eval triage=mvzip(cols, fields,"") 
| table time,customer_id,error_description,taxamo_errors,triage
| reverse
```
