FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /sitedigitalstore

# copy csproj and restore as distinct layers
COPY sitedigitalstore/sitedigitalstore.csproj ./
WORKDIR /XUnitTest
COPY XUnitTest/XUnitTest.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet build "sitedigitalstore.csproj" -c Release -o /sitedigitalstore