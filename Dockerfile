FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /sitedigitalstore

# copy csproj and restore as distinct layers
COPY ["sitedigitalstore.csproj", "./"]
RUN dotnet restore
COPY . .
RUN dotnet build "sitedigitalstore.csproj" -c Release -o /app