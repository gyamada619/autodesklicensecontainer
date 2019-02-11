# Load lmgrd.exe process and start license server
Start-Process 'C:\Autodesk\Network License Manager\lmgrd.exe' '-c "C:\Autodesk\Network License Manager\example.lic" -L "C:\Autodesk\Network License Manager\Logs\debug.log"' -PassThru | Wait-Process;

# Note beginning of log file output
Write-Output 'Tailing log file'

# Tail the log output to keep container running
Get-Content -path 'C:\Autodesk\Network License Manager\Logs\debug.log' -Tail 1 -Wait
