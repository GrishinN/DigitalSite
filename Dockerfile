FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /sitedigitalstore

# copy csproj and restore as distinct layers
COPY sitedigitalstore/sitedigitalstore.csproj .sitedigitalstore
WORKDIR /XUnitTest
COPY XUnitTest/XUnitTest.csproj /sitedigitalstore
RUN dotnet restore

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime

COPY --from=build . ./
ENTRYPOINT ["dotnet", "sitedigitalstore.dll"]
ENTRYPOINT ["dotnet", "XUnitTest.dll"]