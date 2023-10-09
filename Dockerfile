FROM mcr.microsoft.com/dotnet/sdk:6.0
WORKDIR /app
COPY ./src .
RUN dotnet restore Server/Server.csproj
RUN dotnet build Server/Server.csproj
RUN dotnet publish Server/Server.csproj -c Release -o publish
CMD [ "dotnet", "publish/Server.dll" ]