# Remote installation of Microsoft Defender for Endpoint WSL plugin.

$compressedFile = "C:\ProgramData\Microsoft\Windows Defender Advanced Threat Protection\Downloads\wslmdeplugin.zip"
$fileExtractionPath = "C:\wslmdeplugin"

# Extract the file at the destination folder
$shell = New-Object -ComObject Shell.Application
$zipFile = $shell.NameSpace($compressedFile)
$destination = $shell.NameSpace($fileExtractionPath)
$destination.CopyHere($zipFile.Items())

# Wait for the extraction process to complete 
while ($destination.Items().Count -ne $zipFile.Items().Count) {
    Start-Sleep -Seconds 1
}

# Execute wslmdeplugin.exe
$command = "C:\wslmdeplugin\wslmdeplugin.msi"
Start-Process -FilePath $command
