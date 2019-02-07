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

Measure-Runtime Csharp .\csharp-ie
Measure-Runtime Go .\go-ie
Measure-Runtime Node .\node-ie
Measure-Runtime Python .\python-ie
Measure-Runtime Ruby .\ruby-ie
Measure-Runtime Rust .\rust-ie
