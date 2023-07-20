# AutoUpdate Powershell
 
$currentVersion = [version]$PSVersionTable.PSVersion

$latestReleaseUrl = "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
$downloadUrlPattern = 'https://github.com/PowerShell/PowerShell/releases/download/v{0}/PowerShell-{0}-win-x64.msi'

# Make a GET request to the GitHub API to retrieve the latest release information
$response = Invoke-RestMethod -Uri $latestReleaseUrl
$latestVersionNumber = [version]$response.tag_name.TrimStart('v')

Write-Host "Current PowerShell version: $currentVersion	"
Write-Host "Latest PowerShell version: $($latestVersionNumber)"

if ($latestVersionNumber -gt $currentVersion) {	

  # Checks if has Administration Rights
  if ([bool]((New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
    
    Write-Host "Updating PowerShell to the latest version..."
    $downloadUrl = $downloadUrlPattern -f $latestVersionNumber
    $msiFilePath = Join-Path $env:TEMP ("PowerShell-{0}.msi" -f $latestVersionNumber)
    
    # Download the latest version
    Invoke-WebRequest -Uri $downloadUrl -OutFile $msiFilePath
    
    # Run the installation script
    try {
    
      $msiExecArgs = "/package ${msiFilePath} /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1 USE_MU=1 ENABLE_MU=1 ADD_PATH=1"
      Start-Process -FilePath "msiexec.exe" -ArgumentList $msiExecArgs -Wait
      Write-Host "MSI installation completed successfully."
      
    }
    catch {
    
      Write-Host "Error occurred during MSI installation: $_"
      Exit
      
    }
  
    
    Write-Host "PowerShell has been updated to version $latestVersionNumber. Please restart your session."
    Write-Host "Please restart the script."
    Exit
    
  }
  else {
  
    Write-Host "You are not running this script as Administrator."
    Write-Host "Your current version of PowerShell is outdated. Please update PowerShell manually."
    Write-Host "Download the latest version of PowerShell from: $latestReleaseUrl"
    Write-Host "-----------------------------------------------------------------"
    Write-Host "The script will try to run, but it can fail because of the version conflict!"
    Write-Host "Always try to run with the latest powershell version."
    
  }
  
} else {

  Write-Host "PowerShell is already up to date."
  
}




