# Look, there are some neat things about this program, BUT...
#
# ...It's slower than Christmas, and I figured it would be, and I'm not even 
# all that good at writing PowerShell. I thought it was only fair to include
# it because I used PowerShell for all the glue that runs the other tests.
#
# Come on, everyone gets a turn at bat.
#
# Besides, the following script would just be too simple:
# Select-String .\resource\enable1.txt -Pattern '(?<!c)ei'
#
# ...The above script executes in about the same time as the Rust version.

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
