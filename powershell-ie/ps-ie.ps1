# The commented-out version of this script duplicates the logic of the other
# programs in this suite. It's also several orders of magnitude slower, with 
# a runtime measured in **minutes.**

# param (
#     [Parameter(Mandatory=$true, Position=0)]
#     [string]
#     $Path
# )

# function Test-Validity
# {
#     param (
#         [Parameter(Mandatory=$true, Position=0)]
#         [string]
#         $Word
#     )

#     $matches = $Word `
#         | Select-String -Pattern 'c?ei' -AllMatches `
#         | Select-Object -ExpandProperty Matches `

#     foreach ($match in $matches) {
#         if ($match.Value -notlike 'c*') {
#             return $false
#         }
#     }

#     $true
# }

# Get-Content $Path | ForEach-Object {
#     if (-Not (Test-Validity $_)) {
#         Write-Output $_
#     }
# }

# This version is more idiomatic. It's also obviously a cheat.

param (
    [Parameter(Mandatory=$true, Position=0)]
    [string]
    $Path
)

Select-String $Path -Pattern '(?<!c)ei'

