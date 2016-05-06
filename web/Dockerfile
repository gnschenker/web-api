FROM clearmeasure/aspnet45:1.0.0
#copy web app source and utility script(s) to image
COPY . /inetpub/wwwroot/web

#set to base web app dir
WORKDIR /inetpub/wwwroot/web

#restore packages (which are intentionally not in source control)
#Build (via msbuild)
#Create IIS ASP.NET web application
RUN nuget restore -PackagesDirectory .\packages
RUN powershell /inetpub/wwwroot/web/Run-MsBuild
RUN powershell /inetpub/wwwroot/web/Create-WebApplication -name "web" -physicalPath "c:\inetpub\wwwroot\web"
 