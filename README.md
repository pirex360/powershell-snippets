# Some Powershell Scripts Snippets
Some useful scripts for Powershell :

## Auto Update Powershell Script
File: `update-pwsh.ps1`
- For Microsoft Windows, always have the latest version of Powershell installed.

## Auto Update Powershell Script
File: `copy_source_destination.ps1`
- For Microsoft Windows, copy files from the source folder and all sub-directories to a destination path. The extension could be personalized, ex: `"*.pdf" or "*.*"`
- Also it checks if in destination are files that do not belong to the source folder, deleting the ones that are absent.
- Source files are untouched

## Concept of require(like in PHP) to separate code concerns into different files
Folder: `\require`
- This is not class implementation in Powershell, it's a simple approach that sometimes is needed to separate our functions into simple files. Like in PHP `require` or `include` functions.
