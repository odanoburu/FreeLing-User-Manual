# Installing from binary packages {#install-from-binary-packages}

This installation procedure is the fastest and easiest. If you do not plan to modify the code, this is the option you should take.

Binary packages are available only for stable FreeLing versions. If you want to install a development version or the provided packages do not match your system, please see section [Installing from source](installation-source.md).

You'll find downloadable binary packages in [GitHub FreeLing Releases page](https://github.com/TALP-UPC/FreeLing/releases).
Packages for several Debian/Ubuntu versions are provided, as well as for MS-Windows.

## Install binary package on Linux

Most debian-based systems will launch the apropriate installer if you just double click on the package file. The installer should solve the dependencies and install all required packages.

If that doesn't work, you can install it by hand (in Ubuntu or Debian) with the following procedure (will probably work for other debian-based distros):

1.  Install required system libraries.
  
    The following commands should install *both* header packages and binary libraries. If they don't, use your package manager to install all required packages as described in section [Requirements](#orientative-package-names).    
    `sudo apt-get install libboost-regex-dev libicu-dev zlib1g-dev`    
    `sudo apt-get install libboost-system-dev libboost-program-options-dev libboost-thread-dev`

2.   Install freeling package
    `sudo dpkg -i freeling-4.1.deb`
  
In a Debian system, the above commands must be issued as root and without `sudo`.
  
In other distributions, package names may differ.  You will  find further information in [linux requirements](installation.md#install-from-github-repositories)
        
  
## Install binary package on MS-Windows

Get the zip file FreeLing-4.0.zip and uncompress it in a folder of your choice (let's call it %FLINSTALL%).

The zipfile already includes all third-party dependencies required by FreeLing (you can find out how to install them yourself in section [Install from source on Windows](installation-windows.md) if you are curious).

See sections [Execute FreeLing demo](#execute-analyzer) and [Call FreeLing Library](#call-library) to find out more on how to use FreeLing.


