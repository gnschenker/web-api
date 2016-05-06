﻿FROM clearmeasure/aspnet45:1.0.0
#copy web app source and utility script(s) to image
COPY . /inetpub/wwwroot/web-api

#set to base web app dir
WORKDIR /inetpub/wwwroot/web-api/api

#restore packages (which are intentionally not in source control)
#Build (via msbuild)
#Create IIS ASP.NET web application
RUN nuget restore -PackagesDirectory ..\packages \
  && powershell /inetpub/wwwroot/web-api/Run-MsBuild \
  && powershell /inetpub/wwwroot/web-api/Create-WebApplication -name "web-api" -physicalPath "c:\inetpub\wwwroot\web-api\api"
