# Getting it to work {#getting-it-to-work}

This chapter describes how to install and execute FreeLing. The steps to follow may be different depending on your needs and platform.

* [Installing from binary packages](#install-from-binary-packages)
* [Installing from source](#install-from-source)

Other issues you might be interested in;

* [Reducing needed disk space](#reducing-disk)

## Installing from binary packages {#install-from-binary-packages}

This installation procedure is the fastest and easiest. If you do not plan to modify the code, this is the option you should take.

Binary packages are available only for stable FreeLing versions. If you want to install a development version or the provided packages do not match your system, please see section [Installing from source](#install-from-source).

You'll find downloadable binary packages in [GitHub FreeLing Releases page](https://github.com/TALP-UPC/FreeLing/releases).
Packages for several debian and Ubuntu versions are provided, as well as for MS-Windows.

### Install binary package on Linux

Most debian-based systems will launch the apropriate installer if you just double click on the package file. The installer should solve the dependencies and install all required packages.

If that doesn't work, you can install it by hand (in Ubuntu or Debian) with the following procedure (will probably work for other debian-based distros):

1.  Install required system libraries.
  
    The following commands should install *both* header packages and binary libraries. If they don't, use your package manager to install all required packages as described in section [Requirements](#orientative-package-names).    
    `sudo apt-get install libboost-regex-dev libicu-dev zlib1g-dev`    
    `sudo apt-get install libboost-system-dev libboost-program-options-dev libboost-thread-dev`

2.   Install freeling package
    `sudo dpkg -i freeling-4.1.deb`

  
   In a Debian system, the above commands must be issued as root and without `sudo`.
  
  
### Install binary package on MS-Windows

Get the zip file FreeLing-4.0.zip and uncompress it in a folder of your choice (let's call it %FLINSTALL%).

The zipfile already includes all third-party dependencies required by FreeLing (you can find out how to install them yourself in section [Install from source on Windows](installation-windows.md) if you are curious).

See sections [Execute FreeLing demo](#execute-analyzer) and [Call FreeLing Library](#call-library) to find out more on how to use FreeLing.


## Installing from source {#install-from-source}

Unless you have a special interest in compiling FreeLing, [installing it from a binary package](#install-from-binary-packages) is recommended.

Installing FreeLing from source makes sense only in one of the following cases:
  - You want to use a development FreeLing version for which there is no binary package yet
  - You want to modify or extend FreeLing
  
To install from source, you need to follow the steps:

1. Download FreeLing source
2. Install development tools and FreeLing requirements
3. Build FreeLing

The first step is the same for all systems, and can be performed in two ways:
* Go to [GitHub FreeLing Releases page](https://github.com/TALP-UPC/FreeLing/releases), download the source package (e.g. FreeLing-4.1.tar.gz or FreeLing-4.1.zip), and uncompress it in a folder of your choice.
* Alternatively, clone FreeLing GitHub repository (either a stable version tag such as "v4.1", or the development version "master"). If you don't know what a git repository is, you probably should stick with the first option above.

Next steps vary depending on your operating system:
* [Install from source on Linux](installation-linux.md)
* [Install from source on Windows](installation-windows.md)
* [Install from source on MacOS](installation-mac.md)



## Reducing needed disk space {#reducing-disk}

FreeLing packages include linguistic data for all supported languages, which total up over 1Gb of disk space.

It is possible to safely remove data for languages that are not needed, saving that space.

FreeLing installation directory contains all linguistic data in the subfolder 
``FREELINGDIR/share/freeling``.
This folder contains a directory for each language.

To free space, you can simply remove the unneeded language directories ``FREELINGDIR/share/freeling/XX``.

Make sure to keep 
`FREELINGDIR/share/freeling/common`, `FREELINGDIR/share/freeling/config`, and `FREELINGDIR/share/freeling/XX` for any language XX you want to process.


Where the folder ``FREELINGDIR`` is located, depends on which is your system and on how did you install FreeLing.
* If you installed a Linux .deb package, ``FREELINGDIR`` is ``/usr``
* If you installed on Linux compiling from source, ``FREELINGDIR`` is ``/usr/local`` (unless you specified a custom installation directory... then, ``FREELINGDIR`` is that directory).
* If you installed a Windows binary package, ``FREELINGDIR`` is the folder where you uncompressed it)
* If you installed on Windows compiling from source, ``FREELINGDIR`` is the folder you used as ``CMAKE_INSTALL_PREFIX``.  If you used the default installation, it is ``C:\Program Files``


----------------------------------------------------------------
daqui en avall es el vell

## Installation {#installation}

This section provides a detailed guide on different options to install FreeLing (and all its required packages).

### Install from <tt>.deb</tt> binary packages {#install-from-deb-binary-packages}

This installation procedure is the fastest and easiest. If you do not plan to modify the code, this is the option you should take.

Binary packages are available only for stable FreeLing versions. If you want to install an alpha or beta version, please see section about [installing from GitHub](#install-from-github-repositories).

The provided packages will only work on debian-based distributions. They have been tested in Ubuntu (12.04-LTS Precise, 14.04-LTS Trusty, 16.04-LTS Xenial) and Debian (7.0 Wheezy, 8.3 Jessy, 9.0 Strecht).

Most debian-based systems will launch the apropriate installer if you just double click on the package file. The installer should solve the dependencies and install all required packages.

If that doesn't work, you can install it by hand (in Ubuntu or Debian) with the following procedure (will probably work for other debian-based distros):

1.  Install required system libraries.
  
    The following commands should install *both* header packages and binary libraries. If they don't, use your package manager to install all required packages as described in section [Requirements](#orientative-package-names).    
    `sudo apt-get install libboost-regex-dev libicu-dev zlib1g-dev`    
    `sudo apt-get install libboost-system-dev libboost-program-options-dev libboost-thread-dev`

*   Install freeling package  
    `sudo dpkg -i freeling-4.0.deb`

    In a Debian system, the above commands must be issued as root and without `sudo`.

### Install from <tt>.tar.gz</tt> source packages {#install-from-tar-gz-source-packages}

Installation from source follows standard GNU autoconfigure installation procedures (that is, the usual `./configure && make && make install` stuff).

Installing from source is slower and harder, but it will work in any Linux box, even if you have library versions different than those required by the <tt>.deb</tt> package.

1.  Install development tools

    You'll need to install the C++ compiler and other developer tools:  
    `sudo apt-get install build-essential automake autoconf libtool`

    In Debian, use the same command as root, without `sudo`. In other distributions, check the distribution package manager to install a working C++ compiler and autotools.

*  Install packaged requirements

    All required libraries are standard packages in all Linux distributions. Just open your favorite software package manager and install them.

    Package names may vary slightly in different distributions. See section [Requirements](#orientative-package-names) for some hints on possible package names.

    As an example, commands to install the packages from command line in Ubuntu and Debian are provided, though you can do the same using synaptic, or aptitude. If you have another distribution, use your package manager to locate and install the appropriate library packages.

    Both in Debian and in Ubuntu you need to do:  
    `sudo apt-get install libboost-regex-dev libicu-dev zlib1g-dev`  
    `sudo apt-get install libboost-system-dev libboost-program-options-dev`

*   Download and Install FreeLing

    Download source package `freeling-4.0.tar.gz` from FreeLing webpage download section, and then execute:          
    `tar xzvf freeling-4.0.tar.gz`  
    `cd freeling-4.0`  
    `autoreconf --install`  
    `./configure`  
    `make`  
    `sudo make install`

    FreeLing library is entirely contained in the file `libfreeling.so` installed in `/usr/local/lib` by default.

    Sample program `analyze` is installed in `/usr/local/bin`. See chapter about [`analyzer`](#using-the-sample-main-program-to-process-corpora) for details.

    See `./configure --help` for options about installing in non-default directories or disabling some FreeLing options.

### Install from <tt>GitHub</tt> repositories {#install-from-github-repositories}

Installing from GitHub is very similar to installing from source, but you'll have the chance to easily update your FreeLing to the latest development version.

1.  Install development tools

    You'll need to install the C++ compiler, the GNU autotools, plus a <tt>git</tt> client.  
    `sudo apt-get install build-essential automake autoconf libtool git`

    If you use a distribution different than Debian or Ubuntu, these packages may have different names. Use your package manager to locate and install the appropriate ones.

*  Install packaged requirements

    Follow the same procedure described in section about [Source Installation](#install-from-tar-gz-source-packages) for this step.

*   Checkout FreeLing sources

   If you want the latest development version, do:  
    `git clone https://github.com/TALP-UPC/FreeLing.git mysrc`

    (you can replace `mysrc` with the directory name of your choice).

    If you want a previous release, after cloning the repository with the above command, you can checkout any previous tagged version with something like:  
    `git checkout -b mybranch-v4 4.0-beta1`

    (that will create a new branch `mybranch-v4` in your local repository that will contain the version tagged as `4.0-beta1` in GitHub).

    You can find out the available tags at [https://github.com/TALP-UPC/freeling](https://github.com/TALP-UPC/freeling).

    Versions older than 4.0 are available at the [old SVN repository](http://devel.cpl.upc.edu/freeling/svn/versions)
    
*   Prepare local repositories for compilation  
     `cd mysrc`  
     `autoreconf --install`  

*   Build and install FreeLing  
    `./configure`  
    `make`  
    `sudo make install`

If you keep the source directories, you will be able to update to newer versions at any moment with:  
 `cd mysrc`  
 `git pull`  
 `./configure`  
 `make`
 `sudo make install`

Depending on what changed in the repository, you may need to issue `autoreconf --install` after `git pull`. You may also need to issue `make distclean` and repeat the process from `./configure` onwards.




## Installing on MacOS {#installing-on-macos}

Installing on MacOS is very similar to installing on Linux. The main difference is how to install the dependencies and required development tools, which is greatly eased by MacPorts or Homebrew (you only need one of them, not both).

### Install Apple development tools

First of all, you need to install XCode to be able to compile in MacOS:
    * Download and install `XCode` from Apple AppStore
    * Configure it with: 
           sudo xcodebuild -license 
           sudo xcode-select --install

### Get FreeLing source code

Then, you need to get FreeLing source, either from a tar file or from GitHub.

##### Getting source from tar.gz file
*   Download source package `freeling-4.0.tar.gz` from FreeLing webpage download section, and then execute:  
        tar xzvf freeling-4.0.tar.gz
        cd freeling-4.0
    
##### Getting source from GitHub repository
*   Clone latest development version (to clone other stable versions, see section [Install from <tt>GitHub</tt> repositories](#install-from-github-repositories)):
         git clone https://github.com/TALP-UPC/FreeLing.git freeling-4.0
         cd freeling-4.0

### Install using Homebrew
 
*   Download and install [Homebrew](http://brew.sh) if you don't have it already.

*   Use Homebrew to install required developer tools:  
    `brew install automake`
    `brew install autoconf`
    `brew install libtool`
    `brew install boost —with-icu4c`

*   Build and install FreeLing  
    `./configure CPPFLAGS="-I/usr/local/opt/icu4c/include" LDFLAGS="-L/usr/local/opt/icu4c/lib"`
    `make`  
    `sudo make install`

    You can add to `configure` any extra options you wish (`-enable-traces`, `-prefix`, etc). Use `./configure --help` to find out available options.

### Install using MacPorts

*   Install `MacPorts` if you don't have it already
    * Download and install [MacPorts](http://www.macports.org/install.php)
    * Update and configure:  
          sudo port -v selfupdate

*   Use MacPorts to install required developer tools:  
    `sudo port install automake`  
    `sudo port install autoconf`  
    `sudo port install libtool`  
    `sudo port install git`

*   Use MacPorts to install required dependencies:  
    `sudo port install boost`

    This will install also `libicu` and `zlib`. If configure below complains about it not being there, you can install it with `sudo port install zlib`.

*   Build and install FreeLing  
    `./configure CPPFLAGS="-I/opt/local/include" LDFLAGS="-L/opt/local/lib"`
    `make`  
    `sudo make install`

    You can add to `configure` any extra options you wish (`-enable-traces`, `-prefix`, etc). Use `./configure --help` to find out available options.


## Executing {#executing}

FreeLing is a library, which means that it not a final-user oriented executable program but a tool to develop new programs that require linguistic analysis services.

Nevertheless, a sample main program is included in the package for those who just want a text analyzer. This program may be adapted to fit your needs up to certain point (e.g. customized input/output formats, desired level of analysis) but very specific adaptations will require that you write your own main program, or adapt one of the existing examples.

The usage and options of this main program is described in [this chapter](#using-the-sample-main-program-to-process-corpora).

Please take into account that this program is only a friendly interface to demonstrate FreeLing abilities, but that there are many other potential usages of FreeLing.

Thus, the question is not *why this program doesn't offer functionality X?*, *why it doesn't output information Y?*, or *why it doesn't present results in format Z?*, but *How should I use FreeLing library to write a program that does exactly what I need?*.

In the directory `src/main/simple_examples` in the tarball, you can find simpler sample programs that illustrate how to call the library, and that can be used as a starting point to develop your own application.




