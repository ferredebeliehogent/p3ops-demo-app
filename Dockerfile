FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app
COPY . ./
RUN dotnet restore src/Server/Server.csproj
RUN dotnet build src/Server/Server.csproj
RUN dotnet publish src/Server/Server.csproj -c Release -o publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0 as final
WORKDIR /app
COPY --from=build-env /app/publish .
ENTRYPOINT ["dotnet", "Server.dll"]