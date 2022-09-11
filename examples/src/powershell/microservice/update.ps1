param (
    [string] $baseFolder,
    [string] $specFile
)

if (!(Test-Path $baseFolder)) {
    Write-Host "The base folder '$baseFolder' not found" -ForegroundColor Red
    return
}

$wellFile = $baseFolder + "/.well-known/devops.json"
$devops =  Get-Content $wellFile | ConvertFrom-JSON 

if ($specFile -eq "") {
    $devops.apis | ForEach-Object {
       if ($_.engine.url.endswith(".json") -and ($_.engine.category -eq "API") -and ($_.engine.name -eq "openapi")) {
            $specFile = $baseFolder + $_.engine.url
        }
    }
}

if (!(Test-Path $specFile -PathType Leaf)) {
    Write-Host "The specification file '$specFile' not found" -ForegroundColor Red
    return
}
Write-Host "Using specification file '$specFile' " -ForegroundColor White

$opapiCodeGen = $env:USERPROFILE + "/go/pkg/mod/github.com/deepmap/oapi-codegen@v1.11.0/cmd/oapi-codegen/oapi-codegen.go"
if (!(Test-Path $opapiCodeGen -PathType Leaf)) {
    Write-Host "The codse generator '$opapiCodeGen' not found" -ForegroundColor Red
    return
}

Write-Host "Commencing code generation" -ForegroundColor White

go env -w GOOS=windows
go env -w GOARCH=386

go get gopkg.in/yaml.v2
go get github.com/deepmap/oapi-codegen/pkg/codegen
go get github.com/deepmap/oapi-codegen/pkg/util
go get github.com/deepmap/oapi-codegen/pkg/types@v1.11.0

$configFile = "./config/types.cfg.yaml"
go run $opapiCodeGen  --config $configFile $specFile
$configFile = "./config/server.cfg.yaml"
go run $opapiCodeGen  --config $configFile $specFile 

go mod tidy

$buildCode = "./rediops.go"
go build $buildCode

Write-Host "Code generation completed" -ForegroundColor Green
