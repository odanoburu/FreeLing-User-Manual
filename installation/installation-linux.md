# Install from source on Linux

This section assumes you already downloaded and uncompressed FreeLing sources in a folder of your choice.
If not, please read Section [Installing from source](installation-source.md) before continuing.

It also assumes you installed development tools and FreeLing dependencies. 
If not, please read Section [Install FreeLing Requirements on Linux](requirements-linux.md)

Finally, it assumes you know where you want to install FreeLing (e.g. `/home/user/freeling`, `/home/user/programs/freeling`). You can omit this, and FreeLing will be installed in the default location `/usr/local`.
***IMPORTANT***: From this point on, we will refer to FreeLing installation folder (either chosen by you or the default location) as `$FLINSTALL`.

# Build FreeLing

* Open a terminal and change to the folder where you uncompressed or cloned the downloaded FreeLing source.

* Execute the commands:
  ```
  mkdir build
  cd build
  cmake .. 
  make install
  ```
  This will install FreeLing in `/usr/local`.  
  
  You can speed up compilation using several processors with, e.g.,  `make -j 4 install` (you can replace `4` with the number of processors you want to use).
  
  To change the destination directory, add option `-DCMAKE_INSTALL_PREFIX=$FLINSTALL` to the `cmake` command (where `$FLINSTALL` is the path where you want to install FreeLing).

  Note that cmake does not create an "uninstall" target. So, if you install in `/usr/local`, you may need to selectively remove files when you want to uninstall FreeLing.

  If you installed in a custom folder and want a clean re-install, you can delete folder `$FLINSTALL` (be careful if it is  `/usr/local`, there may be other software installed there), and run `make install` again from the `build` folder.

  If you want a clean re-build, you can delete the `build` folder, and repeat the  whole procedure.

  Available options that can be added to the `cmake` command:

  `-DCMAKE_INSTALL_PREFIX=[path]`  Install FreeLing in given location \(default: `/usr/local`\)
  `-DTRACES=ON`        Build FreeLing with debugging traces \(default: `OFF`\)
  `-DWARNINGS=OFF`     Build FreeLing without warning messages \(default: `ON`\)
  `-DXPRESSIVE=ON`     Build FreeLing using boost::xpressive regexps instead of boost::regex  \(default: `OFF`\)
  `-DEMBEDDINGS=ON`    Download word embeddings files when installing \(default: `OFF`\)
  `-DJAVA_API=ON`      Build Java API \(see "Observations" below before running cmake\) \(default: `OFF`\)
  `-DPYTHON2_API=ON`   Build Python 2 API \(see "Observations" below before running cmake\) \(default: `OFF`\)
  `-DPYTHON3_API=ON`   Build Python 3 API \(see "Observations" below before running cmake\) \(default: `OFF`\)


# Calling FreeLing library from Python or Java \(optional\)

If you don't want to write Python or Java programs that call Freeling, you can skip this section.

To be able to call FreeLing from Python or Java, you should ahve built it with cmake options `-DPYTHON2_API`, `-DPYTHON3_API`, or `-DJAVA_API`, depending on your target.

## PYTHON

If you built the Python2 \(or Python3 API\), you'll find in `$FLINSTALL/share/freeling/APIs/python2` \(or `python3`\) the following files:

| File | Content |
| --- | --- |
| `pyfreeling.py` | FreeLing python module, to be imported from your program.<br>It must be in the same folder than your program or in a folder included in `$PYTHONPATH`.|
| `_pyfreeling.so` | This file is the actual API DLL, bridging between Python and C++.<br>It must be in the same folder than your program, or in a folder included in `$LD_LIBRARY_PATH`. |
| `sample.py` | An example of a python program that calls FreeLing. |

To run the example, do:
```
   cd $FLINSTALL/share/freeling/APIs/python
   python sample.py < mytext.txt
```

* If you get "ImportError" about not found modules, you need to set `$LD_LIBRARY_PATH` so all the required libraries \(freeling and all its dependencies\) are found, as well as the \_pyfreeling.so API library \(you need to do this only once per session, or you can set it once and forever in your system-wide configuration\):
  ```
  export LD_LIBRARY_PATH=$FLINSTALL/lib;$FLINSTALL/share/freeling/APIs/python2
  ```

* If you get "FREELINGDIR not defined", you need to set the location where FreeLing was installed:
  ```
  set FREELINGDIR=$FLINSTALL
  ```
  \(this is because the example program "sample.py" checks that variable, it is not a general requirement of the API or FreeLing\)

## JAVA

If you built the Java API, you'll find in `$FLINSTALL/share/freeling/APIs/java` the following files:

| File | Content |
| --- | --- |
| Jfreeling.jar | FreeLing Java module, to be imported from your program.<br>It must be included in `$CLASSPATH`. |
| libJfreeling.so | The actual API, bridging between Java and C++.<br>It must be in the same folder than your program or in a folder included in `LD_LIBRARY_PATH` |
| Analyzer.java | An example of a Java program that calls FreeLing. |

To run the example, do:
```
   cd $FLINSTALL/share/freeling/APIs/java
   javac Analyzer.java
   java Analyzer < mytext.txt
```

* If you get "UnsatisfiedLinkError" about not found libraries, you need to set `$LS_LIBRARY_PATH` so all the required libraries \(freeling and all its dependencies, as well as `libJfreeling.so`\) are found \(you need to do this only once per session, or you can set it once and forever in your system-wide configuration\):
  ```
  export LD_LIBRARY_PATH=$FLINSTALL/lib;$FLINSTALL/share/freeling/APIs/java
  ```

* If you get "FREELINGDIR not defined", you need to set the location where reeLing was installed:
  ```
     export FREELINGDIR=$FLINSTALL
  ```
  \(this is because the example program "Analyzer.java" checks that variable, it is not a general requirement of the API or FreeLing\)

* If you get memory-related errors \(allocation error, array out of range, etc\), it may be that your JVM has not enough RAM for FreeLing.  Try with -Xmx1G or more.

# OBSERVATIONS

## APIs REQUIREMENTS

If you want to call FreeLing library from Python or Java, you need to install some extra software before building FreeLing:

1. **Install SWIG** 
   Available as a package in most distributions.  
   If not, you can download the source from  [http://swig.org](http://swig.org) and compile it.

2. Install target language, including interfaces, that is:

   * **For Python**: Install Python2 or Python3, at your choice (Python3 is recommended though)
     Make sure you install also development headers (e.g. package python3-dev)
    
   * **For Java**: Install Java Development Kit.

3. Add the following options to the "cmake" command  
   `-DPYTHON2_API=ON`  \(if you want to build Python 2 API. Not compatible with `-DPYTHON3_API`\)  
   `-DPYTHON3_API=ON`  \(if you want to build Python 3 API. Not compatible with `-DPYTHON2_API`\)  
   `-DJAVA_API=ON`     \(if you want to build Java API\)

## Using Python2 instead of Python3

FreeLing uses UTF8 encoding to support multilinguality. Python3 is native in UTF8, which provides a much smoother integration with FreeLing.

However, you can use FreeLing from Python2 too \(though if you encounter encoding problems, don't complain, we told you so...\).  

You can choose which Python API is generated with CMake options `-DPYTHON2_API` and `-DPYTHON3_API`.

## Locale-related problems when installing {#locale-related-problems-when-installing}

If you get an error about `bad locale` when you enter `make install` or when you try to execute the `analyzer` sample program, you probably need to generate some locales in your system.

FreeLing uses `en_US.UTF8` locale as default during installation. If this locale is not installed in your system, you'll get an error during dictionary installation.

all languages in FreeLing should work with this locale, though Russian may need to have its own locale installed in the system.

The procedure to install a locale in your system varies depending on your distribution. For instance:

* In Ubuntu, you must use the `locale-get` command. E.g.:  
  `sudo locale-gen en_US.UTF8`  
  `sudo locale-gen pt_BR.UTF8`  
  `sudo locale-gen ru_RU.UTF8`  
  `...`

* In Debian, you need to run the command:  
  `dpkg-reconfigure locales`  
  and select the desired locales from the list.



