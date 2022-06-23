@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
for %%i in ("%~dp0..") do set "BASEDIR=%%~fi"

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\ch\qos\logback\logback-classic\1.2.3\logback-classic-1.2.3.jar;"%REPO%"\ch\qos\logback\logback-core\1.2.3\logback-core-1.2.3.jar;"%REPO%"\org\slf4j\slf4j-api\1.7.25\slf4j-api-1.7.25.jar;"%REPO%"\org\apache\jena\jena-core\3.13.1\jena-core-3.13.1.jar;"%REPO%"\org\apache\jena\jena-iri\3.13.1\jena-iri-3.13.1.jar;"%REPO%"\commons-cli\commons-cli\1.4\commons-cli-1.4.jar;"%REPO%"\commons-codec\commons-codec\1.13\commons-codec-1.13.jar;"%REPO%"\org\apache\jena\jena-base\3.13.1\jena-base-3.13.1.jar;"%REPO%"\org\apache\commons\commons-csv\1.7\commons-csv-1.7.jar;"%REPO%"\org\apache\commons\commons-compress\1.19\commons-compress-1.19.jar;"%REPO%"\com\github\andrewoma\dexx\collection\0.7\collection-0.7.jar;"%REPO%"\org\apache\jena\jena-shaded-guava\3.13.1\jena-shaded-guava-3.13.1.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.10\httpclient-4.5.10.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.12\httpcore-4.4.12.jar;"%REPO%"\com\github\jsonld-java\jsonld-java\0.12.5\jsonld-java-0.12.5.jar;"%REPO%"\commons-io\commons-io\2.6\commons-io-2.6.jar;"%REPO%"\org\apache\httpcomponents\httpclient-cache\4.5.10\httpclient-cache-4.5.10.jar;"%REPO%"\org\apache\thrift\libthrift\0.12.0\libthrift-0.12.0.jar;"%REPO%"\org\slf4j\jcl-over-slf4j\1.7.26\jcl-over-slf4j-1.7.26.jar;"%REPO%"\org\apache\commons\commons-lang3\3.9\commons-lang3-3.9.jar;"%REPO%"\org\apache\jena\jena-shacl\3.13.1\jena-shacl-3.13.1.jar;"%REPO%"\org\apache\jena\jena-tdb\3.13.1\jena-tdb-3.13.1.jar;"%REPO%"\org\apache\jena\jena-tdb2\3.13.1\jena-tdb2-3.13.1.jar;"%REPO%"\org\apache\jena\jena-dboe-storage\3.13.1\jena-dboe-storage-3.13.1.jar;"%REPO%"\org\apache\jena\jena-dboe-trans-data\3.13.1\jena-dboe-trans-data-3.13.1.jar;"%REPO%"\org\apache\jena\jena-dboe-transaction\3.13.1\jena-dboe-transaction-3.13.1.jar;"%REPO%"\org\apache\jena\jena-dboe-base\3.13.1\jena-dboe-base-3.13.1.jar;"%REPO%"\org\apache\jena\jena-dboe-index\3.13.1\jena-dboe-index-3.13.1.jar;"%REPO%"\org\apache\jena\jena-rdfconnection\3.13.1\jena-rdfconnection-3.13.1.jar;"%REPO%"\com\google\guava\guava\28.1-jre\guava-28.1-jre.jar;"%REPO%"\com\google\guava\failureaccess\1.0.1\failureaccess-1.0.1.jar;"%REPO%"\com\google\guava\listenablefuture\9999.0-empty-to-avoid-conflict-with-guava\listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar;"%REPO%"\com\google\code\findbugs\jsr305\3.0.2\jsr305-3.0.2.jar;"%REPO%"\org\checkerframework\checker-qual\2.8.1\checker-qual-2.8.1.jar;"%REPO%"\com\google\errorprone\error_prone_annotations\2.3.2\error_prone_annotations-2.3.2.jar;"%REPO%"\com\google\j2objc\j2objc-annotations\1.3\j2objc-annotations-1.3.jar;"%REPO%"\org\codehaus\mojo\animal-sniffer-annotations\1.18\animal-sniffer-annotations-1.18.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-core\2.10.0\jackson-core-2.10.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-databind\2.10.0\jackson-databind-2.10.0.jar;"%REPO%"\com\fasterxml\jackson\core\jackson-annotations\2.10.0\jackson-annotations-2.10.0.jar;"%REPO%"\org\topbraid\shacl\1.3.2\shacl-1.3.2.jar;"%REPO%"\org\apache\jena\jena-arq\3.13.1\jena-arq-3.13.1.jar;"%REPO%"\org\antlr\antlr4-runtime\4.5.3\antlr4-runtime-4.5.3.jar;"%REPO%"\info\picocli\picocli\3.9.6\picocli-3.9.6.jar;"%REPO%"\com\github\nextcenturycorporation\aida-interchange\1.2.2-SNAPSHOT\aida-interchange-1.2.2-SNAPSHOT.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="validateAIF" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" com.ncc.aif.ValidateAIFCli %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
