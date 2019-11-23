FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /sitedigitalstore

# copy csproj and restore as distinct layers
COPY sitedigitalstore/sitedigitalstore.csproj ./
WORKDIR /XUnitTest
COPY XUnitTest/XUnitTest.csproj ./
RUN dotnet restore
COPY . .

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/sitedigitalstore/out ./
ENTRYPOINT ["dotnet", "sitedigitalstore.dll"]