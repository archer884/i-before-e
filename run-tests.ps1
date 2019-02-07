function Measure-Runtime
{
    Param
    (
        [Parameter(Mandatory=$true, Position=0)]
        [String]
        $Name,

        [Parameter(Mandatory=$true, Position=1)]
        [String]
        $Path
    )

    Push-Location $Path
    $result = .\test.ps1
    Write-Output "$($Name): $($result)"
    Pop-Location
}

Measure-Runtime Rust .\rust-ie
