FROM microsoft/dotnet:2.1-sdk AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
COPY ./appsettings.*.json /app/out/
COPY ./appsettings.json /app/out/


#FROM build-env as test
#RUN mkdir -p tests/UnitTests
#COPY test/* tests
#RUN dotnet test
#RUN dotnet test --no-restore --verbosity normal tests/UnitTests  /p:CollectCoverage=true /p:CoverletOutput=lcov/ /p:CoverletOutputFormat=lcov




# build runtime image
FROM microsoft/dotnet:2.1-aspnetcore-runtime as final
WORKDIR /app

ENV SQL_USER="YourUserName" \
SQL_PASSWORD="changeme" \
SQL_SERVER="changeme.database.windows.net" \
SQL_DBNAME="mydrivingDB" \
WEB_PORT="8080" \
WEB_SERVER_BASE_URI="http://0.0.0.0" \
ASPNETCORE_ENVIRONMENT="Production"

COPY --from=build-env /app/out .

ENTRYPOINT ["dotnet", "poi.dll"]

