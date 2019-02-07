param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]
    $Path
)

function Test-Validity
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string]
        $Word
    )

    $matches = $Word `
        | Select-String -Pattern 'c?ei' -AllMatches `
        | Select-Object -ExpandProperty Matches `

    foreach ($match in $matches) {
        if ($match.Value -notlike 'c*') {
            return $false
        }
    }

    $true
}

Get-Content $Path | ForEach-Object {
    if (-Not (Test-Validity $_)) {
        Write-Output $_
    }
}
