---
date: 2019-05-21T11:44:27Z
lang: en
tags: [ slack, info, tips, tricks, how to ]
title: Slack
summary: Small information nuggets and recipies about Slack
showToc: true
tocOpen: true
---

*(most recent on top)*

## Channel URLs

Template URL for browsers to navigate to a certain channel name:

```text
https://example.slack.com/archives/example-channel-name
```

{{< notice info >}}
The above template might seem fragile in case the channel is renamed but Slack follows through and redirects to the new channel name.
{{< /notice >}}

Another way is create a link URL is to “Copy link” from a channel name in the Slack app sidebar, which will get you an URL similar to the following (independent from the channel name):

```text
https://example.slack.com/archives/C0123456789
```

## Reminders with custom frequency

Template for setting reminders that repeat with a custom frequency (example of a “fortnight meeting”):

```text
/remind #channel "Fortnight meeting starts in 10 min" Jan 2 at 14:50 every 2 weeks
```

## Giphy captions

* [The Secret GIPHY Slack Commands – GIPHY – Medium](https://medium.com/@giphy/the-secret-giphy-slack-commands-9cb4693ca6bf) *(via [Alun Coppack](https://equalexperts.slack.com/archives/C02QA1EC2/p1552584831088900))*

*… using caption as search terms*

```text
/giphy #caption example text
```

*… separate caption from search terms*

```text
/giphy #caption "example text" search terms
```
