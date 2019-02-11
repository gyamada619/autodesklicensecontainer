# Pull Windows Server 2019 Base Image
FROM mcr.microsoft.com/windows:1809_amd64

# Expose ports necessary for FlexLM License Server
EXPOSE 2080 27000-27009

# Set shell as PowerShell with sane defaults
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Set working directory to C:\
WORKDIR /

# Copy contents of Autodesk docker repo to C:\
COPY . /

# Install the Network License Manager
RUN Start-Process 'C:\\nlm11.16.2.0_ipv4_ipv6_win64.msi' '/qn' -PassThru | Wait-Process;

# Create the "Logs" directory
RUN New-Item -Path "C:\\Autodesk\\Network` License` Manager\\" -Name "Logs" -ItemType "directory"

# Create "debug.log", per Autodesk docs
RUN New-Item -Path "C:\\Autodesk\\Network` License` Manager\\Logs\\" -Name "debug.log" -ItemType "file"

# Run script which starts lmgrd.exe and tails log file to keep container alive
# CMD Get-Content .\\start.ps1 | PowerShell.exe -noprofile -

