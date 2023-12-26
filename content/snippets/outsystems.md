---
date: 2015-10-15
description: Small information nuggets and recipies about OutSystems
lang: en
tags: [ outsystems, info, tips, tricks, how to ]
title: OutSystems
showToc: true
tocOpen: true
---

<!--more-->

*(most recent on top)*

## Meaning of Entity Icons @ Service Studio

* Different icons usually indicate “multi-tenant” support
* Online Help: [OutSystems Platform 9 Help - Tenant-Specific Elements](http://www.outsystems.com/help/servicestudio/9.0/default.htm#Multi-tenant_eSpaces/tenant_specific_elements.htm)
* Forum Post: [Icons of entities - OutSystems](https://www.outsystems.com/forums/discussion/15470/icons-of-entities/)

## Bind JavaScript code to run after an Ajax Refresh

```js
osAjaxBackend.BindAfterAjaxRequest(myCustomFunction);
```

*… example*

```java
function metricsEvents(e) {
    // hook the code here!
}
function addMetricsEvents() {
    $("[data-action-type]").unbind( "click", metricsEvents );
    $("[data-action-type]").bind( "click", metricsEvents );
}
osAjaxBackend.BindAfterAjaxRequest(addMetricsEvents);
```

## Unlock stuck deployment from LifeTime

* Email “Case [#1021105] was updated - How to abort a LifeTime migration plan that is hanging?”

```sql
update osltm_staging set finishedon = getdate() where id = 137
```

## OutSystems 9 CSS Optimization

* [Amsterdam: CSS optimization | OutSystems](http://www.outsystems.com/forums/discussion/14708/amsterdam-css-optimization/)

## Check the deployment-time SQL scripts generated to change the database

*… overridden every time there is a new publish/deploy*

```shell
ls -l $OUTSYSTEMS_HOME/share/<eSpaceName>/full/*.sql
```

## Using table alias in Advanced Queries

```sql
update {Entity}
set {Entity}.[ParentId] = (
    select tbl.[Id]
    from {Entity} tbl
    where tbl.[Name] = {Entity}.[ParentName]
)
```

## Figure out in which table a constraint violation refers to

```sql
select PHYSICAL_TABLE_NAME, NAME, DESCRIPTION
from OSSYS_ENTITY
where PHYSICAL_TABLE_NAME = (
    select table_name
    from all_constraints
    where constraint_name ='OSFRK_OSUSR_CONSTRAINT_NAME'
);
```

```sql
select *
from ALL_CONS_COLUMNS
where constraint_name = '<name>'
order by position;
```

## Results of the support `collect_stats.sh` script

```shell
$OUTSYSTEMS_HOME/outsystems_data_$TIMESTAMP.tgz
```

*… actions that the script does for requiring root access:*

* **Software configuration**
    - Java version, paths and preferences, e.g.  
      `/etc/.java/.systemPrefs/outsystems/prefs.xml`
    - JBoss version, paths and configs, e.g.  
      `$JBOSS_HOME/standalone/configuration/`
    - OutSystems version, paths and configs, e.g.  
      `$OUTSYSTEMS_HOME/version.txt`, `/etc/`
* **Server log files**
    - `$JBOSS_HOME/standalone/log/`
    - `$JBOSS_HOME/standalone/log-mq/`
    - `$OUTSYSTEMS_HOME/logs/`
* **Machine information**
    - `/var/log/messages*`
    - `/proc/cpuinfo`
    - `/proc/meminfo`
    - disk space usage
    - iptables
    - running processes
    - cpu status and statistics
    - java thread stacks, counters, heap diagnostics, memory dumps, etc.

## Typical JBoss directories in an OutSystems installation

```shell
$ cat /etc/sysconfig/outsystems
JAVA_HOME=/etc/alternatives/java_sdk_1.6.0
ANT_HOME=/usr/share/ant
OUTSYSTEMS_HOME=/opt/outsystems/platform
```

## Restart JBoss server and the OutSystems platform

*… as outsystems user?*

```shell
service outsystems stop
service jboss-outsystems restart
service outsystems start
```

## Service Studio command line options

```text
C:\Program Files\OutSystems\Development Environment 8.0>ServiceStudio -help
[<eSpace.oml>]
-create NewApplication|NewMobileApplication|<templateKey> [-url <hostName>] [-userName <userName>] [-password|-encryptedPassword <password>]
-d <localESpace.oml> <foreignESpace.oml> <diffTextFile.txt>
-demoMode [<eSpace.oml>] [<hostName> <userName> <password>]
-diff <localESpace.oml> <foreignESpace.oml>
-downloadAndOpen -eSpaceKey <eSpaceKey> [-elementKey <elementKey>] [-url <hostName>] [-userName <userName>] [-password|-encryptedPassword <password>]
-export <eSpace.oml> <directory> xls|xlsx|resX [<output>]
-exportSettings settings.xml
-import <eSpace.oml> <resources.xls>|<resources.xlsx>|<resources.resX> [<output>]
-importResource <eSpace.oml> <resource file> [<target directory>]
-importSettings settings.xml
-merge <localESpace.oml> <foreignESpace.oml>
-mergeModules <PlatformServicesHost> <Authtoken> <LocalEnvironmentHostname> <LocalModuleVersionId> <LocalEnvironmentId> <ForeignEnvironmentHostname> <ForeignModuleVersionId> <ForeignEnvironmentId> <LocalEnvironmentName> <ForeignEnvironmentName>
-openApp <appId> <appName> <packageUrl>
-openFromUrl (<.oml url> -connect)|(<.osp url> <eSpaceName> -connect) <hostName> <userName> <password>
-recover <espace.oml> [<lastSavePath>]
-refresh <eSpace.oml> <verify.xml> <hostName> <userName> <password> [<productKey>]
-removeChangeTracking <eSpace.oml> [<productKey>]
-resetSettings
-runTests <eSpace.oml>|<eSpaceKey> <output.xml> <hostName> <userName> <password> <tests>
-showApp <applicationKey> <applicationName> <hostName>
-structuralDiff <localESpace.oml> <foreignESpace.oml>
-structuralMerge <localESpace.oml> <foreignESpace.oml>
-support [password [<espace.oml>]]
-u <eSpace.oml> [<verify.xml>] [<staticEntities.xml>] [<productKey>]
-uu <eSpace.oml> [<productKey>]
```

## Clear the MRU servers list in Service Studio

1. Delete settings file; it will be regenerated automatically
2. Edit keys `<MruServers>...</MruServers>` in …

*… Windows XP*

```text
C:\Documents and Settings\<username>\Local Settings\Application Data\OutSystems\ServiceStudio 8.0.1\Settings.xml
```

*… Windows 7*

```text
C:\Users\<username>\AppData\Local\OutSystems\ServiceStudio 8.0.1\Settings.xml
```

## Workaround to “OSUSR is a reserved prefix”

```shell
# @table = "USR_OSUSR_e8b_File1"
# Data Type = Text
# Expand Inline = Yes
begin
delete from OS@table;
commit;
end;
```
