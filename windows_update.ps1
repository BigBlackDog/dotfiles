# everything goes to the local AppData folder 

$destination = $env:LOCALAPPDATA + "\nvim"

# recursively copy all items over
Get-ChildItem -Path ".\neovim\.config\nvim" | Copy-Item -Destination $destination -Recurse -verbose

