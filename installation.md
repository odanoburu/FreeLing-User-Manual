# Getting it to work {#getting-it-to-work}

## Requirements {#requirements}

To install FreeLing you'll need:

*   A typical Linux box with usual development tools:
    *   bash
    *   make
    *   C++ compiler with STL and C++11 support (e.g. g++ 4.6 or newer)
*   Enough hard disk space -about 3 Gb for source and temporary compilation files (which you can delete later if needed), plus some 1.1Gb for final installation.
*   Some external libraries are required to compile FreeLing:
    *   <tt>libboost & libicu</tt> Boost library. Included in all Linux distributions. You probably do not have all neeeded components installed. Make sure to install both runtime and development packages for:
        *   libicu
        *   libboost-regex
        *   libboost-system
        *   libboost-thread
        *   libboost-program-options
        *   libboost-locale (only required for MacOSX or FreeBSD, not required in Linux)
    *   <tt>libz</tt> Compression library. Included in all Linux distributions. You probably do not have all neeeded components installed. Make sure to install both runtime and development packages for:
        *   zlib

    Orientative package names

    The name of the packages containing the dependencies listed above vary depending on your linux distribution.

    Please check the package manager in your system, and use its package search capabilities to install the needed dependencies.

    As an orientation, here are the names of these packages in some popular distributions. (Note that this may change over time too)

    *   Ubuntu/Debian: <tt>libboost-dev libboost-regex-dev libicu-dev libboost-system-dev</tt> <tt>libboost-program-options-dev libboost-thread-dev zlib1g-dev</tt>
    *   OpenSuse/Fedora/Mandriva: <tt>boost-devel boost-regex-devel libicu-devel boost-system-devel</tt> <tt>boost-program-options-devel boost-thread-dev zlib-devel</tt>
    *   Slackware: <tt>boost icu4c zlib</tt>

    Note that you need to install both the binary libraries and the development packages (usually sufixed as <tt>-dev</tt> or <tt>-devel</tt>). Most package managers will install both binary and development packages when the <tt>-dev</tt> package is required. If this is not your case, you'll need to manually select both packages.

See details on the installation procedure in section

2.2

.

## Installation {#installation}

This section provides a detailed guide on different options to install FreeLing (and all its required packages).

### Install from <tt>.deb</tt> binary packages {#install-from-deb-binary-packages}

This installation procedure is the fastest and easiest. If you do not plan to modify the code, this is the option you should take.

Binary packages are available only for stable FreeLing versions. If you want to install an alpha or beta version, please see sections

2.2.2

and

2.2.3

.

The provided packages will only work on debian-based distributions. They have been tested in Ubuntu (12.04-LTS Precise, 14.04-LTS Trusty, 16.04-LTS Xenial) and Debian (7.0 Wheezy, 8.3 Jessy).

Most debian-bawsed systems will launch the apropriate installer if you just double click on the package file. The installer should solve the dependencies and install all required packages.

If that doesn't work, you can install it by hand (in Ubuntu or Debian) with the following procedure (will probably work for other debian-based distros):

1.  Install required system libraries

    The following commands should install *both* header packages and binary libraries. If they don't, use your package manager as described in section Section 

    2.1

    to install all required packages.

    <pre> sudo apt-get install libboost-regex-dev libicu-dev zlib1g-dev
     sudo apt-get install libboost-system-dev libboost-program-options-dev
    </pre>

*   Install freeling package

    <pre> sudo dpkg -i freeling-4.0.deb
    </pre>

In a Debian system, the above commands must be issued as root and without <tt>sudo</tt>.

### Install from <tt>.tar.gz</tt> source packages {#install-from-tar-gz-source-packages}

Installation from source follows standard GNU autoconfigure installation procedures (that is, the usual `./configure && make && make install` stuff).

Installing from source is slower and harder, but it will work in any Linux box, even if you have library versions different than those required by the <tt>.deb</tt> package.

1.  Install development tools

    You'll need to install the C++ compiler and other developer tools:

    <pre> sudo apt-get install build-essential automake autoconf
    </pre>

    In Debian, use the same command as root, without <tt>sudo</tt>. In other distributions, check the distribution package manager to install a working C++ compiler and autotools.

2.  Install packaged requirements

    All required libraries are standard packages in all Linux distributions. Just open your favorite software package manager and install them.

    Package names may vary slightly in different distributions. See section

    2.1

    for some hints on possible package names.

As an example, commands to install the packages from command line in Ubuntu and Debian are provided, though you can do the same using synaptic, or aptitude. If you have another distribution, use your package manager to locate and install the appropriate library packages (see section

2.1

).

Both in Debian and in Ubuntu you need to do:

<pre> sudo apt-get install libboost-regex-dev libicu-dev zlib1g-dev
 sudo apt-get install libboost-system-dev libboost-program-options-dev
</pre>

*   Download and Install FreeLing

    Download source package `freeling-4.0.tar.gz` from FreeLing webpage download section, and then execute:

    <pre> tar xzvf freeling-4.0.tar.gz
     cd freeling-4.0
     ./configure
     make
     sudo make install
    </pre>

    FreeLing library is entirely contained in the file <tt>libfreeling.so</tt> installed in <tt>/usr/local/lib</tt> by default.

    Sample program <tt>analyze</tt> is installed in <tt>/usr/local/bin</tt>. See sections

    2.3

    and

    7

    for details.

    See `./configure --help` for options about installing in non-default directories or disabling some FreeLing options.

### Install from <tt>GitHub</tt> repositories {#install-from-github-repositories}

Installing from GitHub is very similar to installing from source, but you'll have the chance to easily update your FreeLing to the latest development version.

1.  Install development tools

    You'll need to install the C++ compiler, the GNU autotools, plus a <tt>git</tt> client.

    <pre> sudo apt-get install build-essential automake autoconf libtool git
    </pre>

    If you use a distribution different than Debian or Ubuntu, these packages may have different names. Use your package manager to locate and install the appropriate ones.

2.  Install packaged requirements

    Follow the same procedure described in section

    2.2.2

    for this step.

*   Checkout FreeLing sources

    If you want the latest development version, do:

    <pre>  git clone https://github.com/TALP-UPC/FreeLing.git mysrc
    </pre>

    (you can replace `mysrc` with the directory name of your choice).

    If you want a previous release, after cloning the repository with the above command, you can checkout any previous tagged version with something like:

    <pre> git checkout -b mybranch-v4 4.0-beta1
    </pre>

    (that will create a new branch `mybranch-v4` in your local repository that will contain the version tagged as `4.0-beta1` in GitHub).

    You can find out the available tags at <tt>[https://github.com/TALP-UPC/freeling](https://github.com/TALP-UPC/freeling)</tt>.

    Versions older than 4.0 are available at the SVN repository <small class="SMALL"><tt>[http://devel.cpl.upc.edu/freeling/svn/versions](http://devel.cpl.upc.edu/freeling/svn/versions)</tt></small>

    <sup><span class="arabic">2</span>.<span class="arabic">1</span></sup>

    .

    *   Prepare local repositories for compilation

    <pre> cd mysrc
     autoreconf --install
    </pre>

    *   Build and install FreeLing

    <pre> ./configure
     make
     sudo make install
    </pre>

If you keep the source directories, you will be able to update to newer versions at any moment:

<pre> cd mysrc
 git pull
 ./configure
 make
 sudo make install
</pre>

Depending on what changed in the repository, you may need to issue `autoreconf --install` after `git pull`. You may also need to issue `make distclean` and repeat the process from `./configure` onwards.

## Locale-related problems when installing {#locale-related-problems-when-installing}

If you get an error about <tt>bad locale</tt> when you enter <tt>make install</tt> or when you try to execute the <tt>analyzer</tt> sample program, you probably need to generate some locales in your system.

FreeLing uses `en_US.UTF8` locale as default during installation. If this locale is not installed in your system, you'll get an error during dictionary installation.

all languages in FreeLing should work with this locale, though Russian may need to have its own locale installed in the system.

The procedure to install a locale in your system varies depending on your distribution. For instance:

*   In Ubuntu, you must use the `locale-get` command. E.g.:    `sudo locale-gen en_US.UTF8`    `sudo locale-gen pt_BR.UTF8`    `sudo locale-gen ru_RU.UTF8`    ...
*   In Debian, you need to run the command:    `dpkg-reconfigure locales`    and select the desired locales from the list.

## Installing on MacOS {#installing-on-macos}

Installing on MacOS is very similar to installing on Linux. The main difference is how to install the dependencies and required development tools, which is greatly eased by MacPorts.

*   Download and install MacPorts following the instructions in <tt>www.macports.org/install.php</tt>. Note that you will need to install Apple XCode too, as described in the same page.
*   Use MacPorts to install required developer tools:

    <pre> sudo port install automake
     sudo port install libtoool
     sudo port install subversion
    </pre>

*   Use MacPorts to install required dependencies

    <pre> sudo port install boost
    </pre>

    This will install also <tt>libicu</tt>. Note that <tt>zlib</tt> is already installed in MacOS. If configure complains about it not being there, you can install it with <tt>sudo port install zlib</tt>.
*   Compile and install FreeLing using the procedures described above (either ``install from source'' or ``install from SVN''), but skipping the steps about installing development tools and dependencies.

    Important: libraries in MacOS are installed in <tt>/opt/local</tt> instead of <tt>/usr/local</tt>. So, when running <tt>configure</tt>, you need to specify the right library paths. Also, locales need some specific handling which requires the use of <tt>libboost-locale</tt>

    In summary, you need to run <tt>./configure</tt> with the command:

    <pre> ./configure --enable-boost-locale CPPFLAGS="-I/opt/local/include" 
                                                          LDFLAGS="-L/opt/local/lib"
    </pre>

    You can add to this command any extra options you wish (<tt>-enable-traces</tt>, <tt>-prefix</tt>, etc). Use <tt>./configure -help</tt> to find out available options.

# Executing {#executing}

FreeLing is a library, which means that it not a final-user oriented executable program but a tool to develop new programs that require linguistic analysis services.

Nevertheless, a sample main program is included in the package for those who just want a text analyzer. This program may be adapted to fit your needs (e.g. customized input/output formats).

The usage and options of this main program is described in chapter

7

.

Please take into account that this program is only a friendly interface to demonstrate FreeLing abilities, but that there are many other potential usages of FreeLing.

Thus, the question is not why this program doesn't offer functionality X?, why it doesn't output information Y?, or why it doesn't present results in format Z?, but How should I use FreeLing library to write a program that does exactly what I need?.

In the directory <tt>src/main/simple_examples</tt> in the tarball, you can find simpler sample programs that illustrate how to call the library, and that can be used as a starting point to develop your own application.

# Porting to other platforms {#porting-to-other-platforms}

The FreeLing library is entirely written in C++, so it is possible to compile it on non-unix platforms with a reasonable effort.

FreeLing can be successfully built for MacOS, as described above.

It can also be built for MS-Windows using project files included in the tarball. You'll find the solution/project files and a README in the <tt>msvc</tt> folder inside FreeLing tarball.

You can visit the Forum FAQs sections in FreeLing webpage for further help and details.

