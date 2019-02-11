# Autodesk License Server Container

This repository contains a Dockerfile and setup files needed for a Windows Server 2019 container running Autodesk licensing.

The image(s) built with this repository depend on the Microsoft official Windows server container images. These image(s) do not contain a license file and do not start the license server process. You will need to provide a license (.lic) file and a PowerShell CMD to start the container in production and serve licenses.

## Knowledge Assumptions

The README below assumes some intermediate knowledge of `docker`, and basic `git` and Powershell.

## Requirements

To build and test, you must:

1. Have Windows 10 build 1809 running on your workstation.
2. Enable `Hyper-V `. See [the Microsoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).
3. Install [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
4. Switch Docker Desktop's running mode [to Windows containers](https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers)

## Setup

1. Clone this repository locally.
2. Launch Powershell as an administrator.
3. `cd` to the directory where the repository you cloned is located. 
4. Run `docker build --tag=yourtag .` 
5. After 5-10 minutes, your container should be built.
6. Run the container by running: 

```
docker run -td -p 2080:2080 -p 27000-27009:27000-27009 -h="yourhostname" --mac-address="macaddressinyourlicensefile" yourtag     
```

