$source="C:\folder1"
$destination="D:\folderx"
$extensions="*.jpeg","*.png","*.jpg"

# Create an array of file names in the source folder
$sourceFiles = Get-ChildItem -Path $source -Recurse -Include $extensions | Select-Object -ExpandProperty Name

foreach ($ext in $extensions) {
	# Copy files
    Get-ChildItem -Path $source -Recurse -Include $ext | %{
        $destinationFile = Join-Path -Path $destination -ChildPath $_.Name
        if (!(Test-Path -Path $destinationFile) -or ($_.LastWriteTime -gt (Get-Item -Path $destinationFile).LastWriteTime)) {
            Copy-Item -Path $_.FullName -Destination $destinationFile -Force
        }
    }
    # Remove files from destination that are not present in source
    Get-ChildItem -Path $destination -Recurse -Include $ext | Where-Object { !($sourceFiles -contains $_.Name) } | Remove-Item -Force
}
