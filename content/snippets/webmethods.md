---
date: 2007-02-26T01:04:25Z
lang: en
tags: [ webmethods, info, tips, tricks, how to ]
title: webMethods
summary: Small information nuggets and recipies about webMethods
showToc: true
tocOpen: true
---

*(most recent on top)*

## Installer

*… running installer from a jar*

```java
java -Xmx1024m -Xincgc -jar webMethodsInstaller71.jar
```

## Diagnostics info

*… Integration Server*

* Thread Dump ("Administering Integration Server", section "Generating Thread Dumps"):
    1. "Server" ➤ "Statistics page"
    2. Under "Usage", click the "Current number of System Threads"
    3. Click "Generate JVM Thread Dump"

* Diagnostic Data ("Administering Integration Server", section "Using the Diagnostic Utility"):
    - svc: `wm.server.admin:getDiagnosticData`
    - url: `http://localhost:5555/invoke/wm.server.admin/getDiagnosticData`
    - out: `C:\SoftwareAG\IntegrationServer\logs\diagnostic_data.zip`

*… Mediator*

* svc: `mediator.util:mediatorDiagnosticZip`
* url: `http://localhost:5555/invoke/mediator.util:mediatorDiagnosticZip`
* out: `<download>`

*… My webMethods Server*

* See "Diagnosing My webMethods Server" PDF document
    - cmd:
        ```batch
        copy C:\SoftwareAG\MWS\components\extras\analysis\wm_eventscollector.pdp C:\SoftwareAG\MWS\server\default\deploy
        cd SoftwareAG\MWS\tools\env_capture
        run -s default
        ```
    - out: `C:\SoftwareAG\MWS\tools\env_capture\portal-env.zip`

*… Optimize*

* cmd: Navigate ➤ Applications ➤ Administration ➤ Analytics ➤ Diagnostics
* out: `export.csv`

## Broker setup

*… see "webMethods Broker Administrators Guide.pdf"*

* Create shared broker with more storage

    ```text
    -session_config qs
    -qs_log_file <datadir>/Broker.qs.log 128M            #   8  [32]  128
    -qs_storage_file <datadir>/Broker.qs.stor 2048M 256M # 256 [512] 1024
                                                            #   ?  [64]    ?
    ```

* Increase storage cache size ("should at least be the size of the log file")
    1. Edit: `awbroker.cfg`
    2. Add: `storage-max-cache-size=512 # [128]`

## Broker install problems

*… aborted or interrupted installation*

1. Delete directories:

    ```batch
    C:\WINDOWS\activesw
    {WM_HOME}\Broker\data\awbrokers61 (?)
    ```

2. Delete services from registry:

    ```text
    HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ActiveWorksBrokerMonitor_3.0
    HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\webMethodsBroker_6.1_6849
    ```

## Integration Server

*… see "webMethods Integration Server Administrators Guide.pdf"*

* url: <http://localhost:5555>
* url: <http://localhost:9999> (diagnostics port with a dedicated thread)

*… default users*

* file: `{WM_HOME}/IntegrationServer/config/users.cnf`
    * user: `Administrator` / `manage`
        * hash: `vI5TC3V31VdoYdyukqpb7AYXHXQ`
  * user: `Developer` / `isdev`
  * user: `Replicator` / `iscopy`

… *starting up*

1. Debug/Safe mode:

    ```batch
    {WM_HOME}\IntegrationServer\bin\server.bat -debug 4 -log none
    {WM_HOME}\IntegrationServer\bin\server.bat -safeboot
    ```

2. If it fails to run after improper shutdown, delete file:

    ```batch
    {WM_HOME}\IntegrationServer\LOCKFILE
    ```

3. To run as a service, use installation file:
    - <http://www.wmusers.com/wmusers/messages/1825/36646.shtml>

    ```batch
    {WM_HOME}\IntegrationServer\support\win32\installSvc.bat
    ```

4. When running multiple instances on the same machine, tweak:
    - <http://www.wmusers.com/wmusers/messages/1825/1045.shtml>

    ```batch
    {WM_HOME}\IntegrationServer\bin\ini.cnf
    {WM_HOME}\IntegrationServer\bin\jcode.bat
    ```

5. Setup X-Referencing:

    ```batch
    {WM_HOME}\IntegrationServer\config\server.cnf
    ```

    ```properties
    watt.server.xref.type=jdbc
    # jdbc - use connection pool
    # repo - use repository (see clustering) [default]
    ```

*… extended settings*

```text
watt.server.ns.hideWmRoot=false
```

## Repo Server

To be able to start it after the initial setup:

1. Manually create logs directory:

    ```batch
    {WM_HOME}\IntegrationServer\reposerver\log directory
    ```

2. Create lib directory and put there the JDBC Driver jar:

    ```batch
    {WM_HOME}\IntegrationServer\reposerver\lib
    ```

    or else you'll get the error:

    > [ISC.0067.0099C] Repository Server initialization failed

3. Install fix `IS_6-1_Fix14` to run as a service or else it aborts starting up:
    - <http://www.wmusers.com/wmusers/messages/1825/36668.shtml>

    > System error 1067 has occurred.

## Jdbc adapter

* URL format, see "IntegrationServerAdminGuide.pdf" (pag. 86)

*… Oracle*:

```text
jdbc:wm:oracle://host_or_IPaddress:1521;SID=database_name
```

*… SQL Server*

```text
jdbc:wm:sqlserver://host_or_IPaddress:1433
    ;databaseName=database_name
    ;SelectMethod=cursor
```

*… DB2 UDB*

```text
jdbc:wm:db2://host_or_IPaddress:50000
    ;databaseName=database_name
    ;PackageName=package_name
    ;CreateDefaultPackage=true
    ;ReplacePackage=true
```

*… DB2 (AS/400)*

```text
jdbc:wm:db2://host_or_IPaddress:446
    ;LocationName=location_to_access
    ;PackageName=package_name
    ;AlternateId=schema_to_use
    ;CollectionId=package_collection
```

*… driver classes*

```java
// DataDirect Connect
com.wm.dd.jdbc.oracle.OracleDriver       // JDBC Oracle Driver
com.wm.dd.jdbc.sqlserver.SQLServerDriver // JDBC SQL Server Driver
com.wm.dd.jdbc.db2.DB2Driver             // JDBC DB2 Driver
com.wm.dd.jdbc.sybase.SybaseDriver       // JDBC Sybase Driver: TN Only
```

```java
// DataDirect SequeLink
com.merant.sequelink.jdbc.SequeLinkDriver // JDBC Driver: TN Only
```

*… adapter services*

1. Copy an existing connection in the admin pages
2. Find dependents on the old connection
3. For each service, call the `WmART` package service `pub.art.service:setAdapterServiceNodeConnection` using the service name and the new connection alias
4. For each notification, call the `WmART` package service `pub.art.notification:setPollingNotificationNodeConnection` instead

* *NOTE: use different connections for adapter services and adapter notifications <mark>(HF: why?)</mark>*

## Debug from Java or JSP to `server.log`

*… send `DEBUG` messages directly to the `server.log` from inside an IS java service*

* Used in the implementation of the `pub.flow.debugLog` service:

    ```java
    com.wm.util.JournalLogger.log(3, 90, 4, "message");
    //  3 ... param = "code"    , value = ?!?
    // 90 ... param = "facility", value = FAC_FLOW_SVC
    //  4 ... param = "severity", value = DEBUG
    ```

## My webMethods Server (MWS)

*… configure database access without using the installer*

* Edit file: `webMethods7\MWS\server\default\config\db.xml`

*… example connection block, using a local Oracle 10g XE*

```xml
<CONNECTION default="true" displayname="Default" id="1"
    name="default" type="oracle">
    <SQLWORKERCLASS>com.webmethods.portal.service.sql.core.BaseSqlWorker</SQLWORKERCLASS>
    <CONNPROVIDERCLASS>com.webmethods.portal.service.sql.core.provider.pool.PooledConnectionProvider</CONNPROVIDERCLASS>
    <PARAMS>
        <DRIVER>com.wm.dd.jdbc.oracle.OracleDriver</DRIVER>
        <URL>jdbc:wm:oracle://localhost:1521;serviceName=XE</URL>
        <USER>wm</USER>
        <PASSWORD>{DES}MddXF68fUu0=</PASSWORD>
        <MAXCONNECTIONS>100</MAXCONNECTIONS>
        <CACHESTATEMENTS>false</CACHESTATEMENTS>
        <TESTSQL>SELECT 1 FROM DUAL</TESTSQL>
    </PARAMS>
</CONNECTION>
```

*… change web service timeout for a CAF application*

* url: <http://localhost:8585>
* user: `sysadmin`
* pass: `manage`
* path: Folders ➤ Administrative Folders ➤ Administration Dashboard ➤ Configuration ➤ CAF Application Runtime Configuration

## Designer

### Preferences to prevent slow background operations

* Open menu "Windows" ➤ "Preferences..." and, on the left side panel, select:
    - *Version 7.x*
        1. Server
            + Uncheck "Automatically publish to local servers"
            + Uncheck "Automatically publish to remote servers"
        2. Validation
            + Check "Suspend all validators"
        3. webMethods ➤ Metadata Library
            + Check "Disable Workspace Asset Indexing (takes effect on next restart)"
    - *Version 8.x*
        1. Open each MwS on the server panel (right-click)
            + Check "Never publish automatically"
        2. Validation
            + Check "Suspend all validators"
        3. Software AG ➤ Workspace Index
            + Check "Disable Workspace Indexing"

### Setup problems with `caf.default.runtime`

* Eclipse workspace default runtime settings file:

    ```batch
    {WORKSPACE_HOME}\.metadata\.plugins\org.eclipse.core.runtime\.settings\org.eclipse.wst.server.core.prefs
    {WORKSPACE_HOME}\.metadata\.plugins\org.eclipse.jst.j2ee.ui\dialog_settings.xml
    {WORKSPACE_HOME}\.metadata\.plugins\org.eclipse.wst.server.core\servers.xml
    ```

* In each portlet project:

    ```batch
    {PORTLET_HOME}\.classpath
    {PORTLET_HOME}\.settings\org.eclipse.jst.common.project.facet.core.prefs
    {PORTLET_HOME}\.settings\org.eclipse.wst.common.project.facet.core.xml
    ```

### CAG: Project not compiling and/or not showing portlets in the solutions

*NOTE: If on Windows, make sure there are no "hidden" or "read-only" files in the portlet project.*

In the "Navigator" tab, the project folder needs to have a "world" icon to be considered a CAF project. If not

1. Select "Project" ➤ "Properties"
2. Select "Project Facets" (on the left side panel)
   - Press "Modify Project..."
   - Select in the Configurations: "CAF Portlet Application"
   - Press "Finish"
3. Select "Java Build Path" (on the left side panel)
   - Remove duplicates ➤ Ok ➤ Add single again

### CAF: Object ids formats

* <http://ajax-softwareag.com/articles/N7M0TP/DesignerOnlineHelp/caf_controls_id_ref.html>

```text
:myForm:myObject                  // absolute
myForm:myObject                   // relative
myPortleAlias#myForm:myObject     // external
$myObject                         // raw html
```

### CAF: Get object by id

```java
CAF.model("#{activePageBean.clientIds['objectId']}")
```

### CAF: SOAP monitor

* install:

    ```batch
    copy {WM_HOME}\MWS\components\development\tools\wm_soapmonitor.pdp {WM_HOME}\MWS\server\default\deploy
    ```

* execute: <http://server:8585/portlet/wm_soapmonitor>

### CAF: Client side logger

* <http://ajax-softwareag.com/articles/N7M0TP/DesignerOnlineHelp/caf_cls_logger.html>

*… bookmarklet*

* install: <http://server:port/wm_cafshared/ui/js/bookmarklet/>
* execute: `CAF Logger; List Scripts`

*… Firebug*

* You can direct CAF Logger messages to the Firebug console with the following Javascript:

    ```js
    Logger.appendToFirebug();
    ```

* Alternately, you could start a `Logger.FirebugAppender` instance that listens to a custom log level and/or category (so as to avoid all the CAF debug messages):

    ```js
    Logger.history.replay(new Logger.FirebugAppender(Logger.INFO, "my-category").start().append);
    ```
