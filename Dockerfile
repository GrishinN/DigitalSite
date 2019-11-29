FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY sitedigitalstore.sln .
COPY ./sitedigitalstore/*.csproj ./sitedigitalstore/
COPY ./XUnitTest/*.csproj ./XUnitTest/
RUN dotnet restore

# copy everything else and build app
COPY ./sitedigitalstore/. ./sitedigitalstore/
COPY ./XUnitTest/. ./XUnitTest/
WORKDIR /app
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "sitedigitalstore.dll"]