# Helpers.ps1 file


function helloFromTheOtherFile {

  param (
      [string]$name = 'John Doe'
  )
  
  return @"Hello $name, this code origin is delivered by an external file!!!!"
  
}

# ...
