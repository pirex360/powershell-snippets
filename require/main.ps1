# Simple Require / Include Concept in Powershell

# :: GLOBAL VARIABLES
$scriptDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$includesPath = Join-Path -Path $scriptDirectory -ChildPath "includes\"

# :: INCLUDES
Invoke-Expression -Command ". '${includesPath}helpers.ps1'"
Invoke-Expression -Command ". '${includesPath}functions.ps1'"

# :: MAIN

# function from the external file helpers.ps1 with parameters
helloFromTheOtherFile -name "Rambo"

# function from the external file functions.ps1
helloWord
