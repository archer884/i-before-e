dotnet build -c Release | Out-Null
Measure-Command { dotnet .\bin\Release\netcoreapp2.2\csharp-ie.dll ..\resource\enable1.txt }
Measure-Command { dotnet .\bin\Release\netcoreapp2.2\csharp-ie.dll ..\resource\enable1.txt }
