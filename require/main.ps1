# Simple Require / Include Concept in Powershell

# :: GLOBAL VARIABLES
$currentScriptPath = $PSCommandPath
$scriptDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$includesPath = Join-Path -Path $scriptDirectory -ChildPath "includes\"

# :: INCLUDES
Invoke-Expression -Command ". '${includesPath}helpers.ps1'"

# :: MAIN

# function from the external file helpers.ps1
helloFromTheOtherFile -name "Rambo"
