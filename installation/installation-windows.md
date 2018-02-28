
# Install from source on Windows

This section assumes you already downloaded and uncompressed FreeLing sources in a folder of your choice.
If not, please read Section [Getting it to work](installation.md) before continuing.

# Preliminaries

Decide where will you install FreeLing (e.g. `C:\FreeLing`, `C:\Program Files\FreeLing`, etc.). You can omit this, and FreeLing will be installed in the default location `C:\Program Files`.

***IMPORTANT***: From this point on, we will refer to FreeLing installation folder (either chosen by you or the default location) as `%FLINSTALL%`.

# Install development tools

* Install MSVC (MS Visual Studio, with C++ compiler)

* Install CMake (3.8 or newer) using installer available at [https://cmake.org/download/](https://cmake.org/download/)

# Install dependencies

Some external libraries are required to compile FreeLing:

## Install ZLIB

1. Download zlib source from [http://www.zlib.net/](http://www.zlib.net/), and unzip the source file somewhere you know where it is.

2. From the start menu, open a "Visual Studio x64 Native Tools Command Prompt" (or "x86" if your system is 32 bits)

3. Change to the folder where you unzipped the source, and execute the commands:
   ```
   mkdir build
   cd build
   cmake .. -DCMAKE_INSTALL_PREFIX=%FLINSTALL%\dependencies\zlib -G "NMake Makefiles"
   nmake install
   ```
  
## Install Boost and ICU

The easiest way to install these dependencies is to get precompiled binary packages.

* Get boost binaries from: [https://www.npcglib.org/~stathis/blog/precompiled-boost/](https://www.npcglib.org/~stathis/blog/precompiled-boost/)
  Select a package that matches your MSVC version (2014, 2015, ...) and architecture (32/64 bits)

* Uncompress boost package in `%FLINSTALL%\dependencies`

* Each boost binary package has associated an ICU version, which is mentioned in the rightmost column of the table ("Notes").
  Follow the link to the associated ICU version, and download the package.  Make sure you are getting the right version (you may need to go to "past builds" page [https://www.npcglib.org/~stathis/blog/precompiled-icu-past/](https://www.npcglib.org/~stathis/blog/precompiled-icu-past/).
  Also, make sure the package matches your MSVC version and architecture.
    
* Uncompress icu package in `%FLINSTALL%\dependencies`.

After this, the content of your %FLINSTALL% folder should look like (version numbers may differ):
```
   %FLINSTALL%\dependencies\zlib
              \boost64-1.61.0-vs2015
              \icu-57.1-vs2015
```

You can keep these names or change them to "boost" and "icu". (From now on we will assume you changed them, so if you keep the full names, you'll need to change some paths in the commands described in steps below).
Now your installation folder looks like:
```
   %FLINSTALL%\dependencies\zlib
                           \boost
                           \icu
```

# Build FreeLing

1. Open a terminal and change to the folder where you uncompressed or cloned the downloaded FreeLing source.

2. From the start menu, open a "Visual Studio x64 Native Tools Command Prompt" (or "x86" if your system is 32 bits)

3. Change to the folder where you unzipped the source, and execute the commands:
   ```
   mkdir build
   cd build
   cmake .. -DCMAKE_INSTALL_PREFIX=%FLINSTALL%\freeling -DZLIB_INCLUDE_DIR=%FLINSTALL%\dependencies\zlib\include -DZLIB_LIBRARY=%FLINSTALL%\dependencies\zlib\lib\zlibd.lib -DBOOST_ROOT=%FLINSTALL%\dependencies\boost -DICU_ROOT=%FLINSTALL%\dependencies\icu -G "NMake Makefiles"
   nmake install
   ```

   Since most dependencies are not installed in default locations, we need to specify the paths for them all, that is why the command is so long.

   With this, you are done. Your `%FLINSTALL%` folder should look like:
   ```
   %FLINSTALL%\dependencies\zlib
              |            \boost
              |            \icu
              \freeling\bin
                       \include
                       \lib
                       \share
   ```

   If you want a clean re-install, you can delete folder `%FLINSTALL%\freeling`, and run again "nmake install" from the "build" folder.

   If you want a clean re-build, you can delete the "build" folder, and repeat the whole procedure.

   Available options that can be added to the `cmake` command:

   `-DCMAKE_INSTALL_PREFIX=[path]`  Install FreeLing in given location (default: `C:\Program Files`)
   `-DTRACES=ON`        Build FreeLing with debugging traces (default: `OFF`)
   `-DWARNINGS=OFF`     Build FreeLing without warning messages (default: `ON`)
   `-DXPRESSIVE=ON`     Build FreeLing using boost::xpressive regexps instead of boost::regex  (default: `OFF`)
   `-DEMBEDDINGS=ON`    Download word embeddings files when installing (default: `OFF`)
   `-DJAVA_API=ON`      Build Java API (see "Observations" below before running cmake) (default: `OFF`)
   `-DPYTHON2_API=ON`   Build Python 2 API (see "Observations" below before running cmake) (default: `OFF`)
   `-DPYTHON3_API=ON`   Build Python 3 API (see "Observations" below before running cmake) (default: `OFF`)



# Calling FreeLing library from Python or Java (optional)

If you don't want to write Python or Java programs that call Freeling, you can skip this section.

To be able to call FreeLing from Python or Java, you should have built it with CMake options `-DPYTHON2_API`, `-DPYTHON3_API`, or `-DJAVA_API`, depending on your target. 

## PYTHON
  
If you built the Python2 (or Python3) API, you'll find in `%FLINSTALL%\freeling\share\freeling\APIs\python2` (or `python3`) the following files:

| File | Content |
| -- | -- |
| `pyfreeling.py`   | FreeLing python module, to be imported from your program.<br>It must be in the same folder than your program or in a folder included in `%PYTHONPATH%`. |
| `_pyfreeling.lib`<br>`_pyfreeling.pyd` | These two files are the actual API DLL, bridging between Python and C++.<br>They both must be in the same folder than your program, or in a folder included in `%PATH%`. | 
| `sample.py`       | An example of a python program that calls FreeLing. |
	
To run the example, do:
```
   cd %FLINSTALL%\freeling\share\freeling\APIs\python
   python sample.py < mytext.txt
```

- If you get "ImportError" about not found DLLs, you need to set %PATH% so all the required libraries (freeling and all its dependencies) are found. (You need to do this only once per session, or you can set it once and forever in your system-wide configuration):
  ```
  set PATH=%PATH%;%FLINSTALL%\freeling\bin;%FLINSTALL%\dependencies\boost\lib;%FLINSTALL%\dependencies\zlib\bin;%FLINSTALL%\dependencies\icu\bin64;
  ```
  
- If you get "FREELINGDIR not defined", you need to set the location where FreeLing was installed:
  ```     
  set FREELINGDIR=%FLINSTALL%\freeling
  ```
  (this is because the example program "sample.py" checks that variable, it is not a general requirement of the API or FreeLing)


## JAVA

If you built the Java API you'll find in `%FLINSTALL%\freeling\share\freeling\APIs\java` the following files:

| File | Content |
| -- | -- |
| Jfreeling.jar  | FreeLing Java module, to be imported from your program.<br>It must be included in `%CLASSPATH%` | 
| Jfreeling.lib<br>Jfreeling.dll  | The actual API DLL, bridging between Java and C++.<br>They both must be in the same folder than your program or in a folder included in `%PATH%` |
| Analyzer.java  | An example of a Java program that calls FreeLing. |
	
To run the example, do:
``` 
   cd %FLINSTALL%\freeling\share\freeling\APIs\java
   javac Analyzer.java
   java Analyzer < mytext.txt
```

- If you get "UnsatisfiedLinkError" about not found libraries, you need to set `%PATH%` so all the required libraries (freeling and all its dependencies) are found (you need to do this only once per session, or you can set it once and forever in your system-wide configuration):
  ```
      set PATH=%PATH%;%FLINSTALL%\freeling\bin;%FLINSTALL%\dependencies\boost\lib;%FLINSTALL%\dependencies\zlib\bin;%FLINSTALL%\dependencies\icu\bin64;
  ``` 
  
- If you get "FREELINGDIR not defined", you need to set the location where FreeLing was installed:
  ```       
     set FREELINGDIR=%FLINSTALL%\freeling
  ```
  (this is because the example program "Analyzer.java" checks that variable, it is not a general requirement of the API or FreeLing)

- If you get memory-related errors (allocation error, array out of range, etc), it  may be that your JVM has to not enough RAM for FreeLing.  Try with -Xmx1G or more.


# OBSERVATIONS

## Installing dependencies in different folders

You can install zlib, boost, and icu anywhere (that is, they don't HAVE to be in `%FLINSTALL%\dependencies`).

If you install them somewhere else, you'll need to set the right paths for variables `ZLIB_INCLUDE_DIR`, `ZLIB_LIBRARY`, `BOOST_ROOT`, and `ICU_ROOT`  in the `CMake` command, and adjust the `%PATH%` definition if you are using an API.

Also, if you plan to use the `analyzer.bat` script, you'll need to edit it and adjust the paths to those libraries too.


## APIs REQUIREMENTS 

If you want to call FreeLing library from Python or Java, you need to install some
extra software before building FreeLing:

1. **Install SWIG**
   Download swigwin.zip package from http://swig.org and uncompress it anywhere you want (e.g. `C:\Program Files\swigwin`).
   ***IMPORTANT***: We will refer to this folder as `%SWIGDIR%` from now on.

2. Install target language, including interfaces, that is:
    * **For Python**: Install Python2 or Python3, to your choice (Python3 is recommended though).
    * **For Java**: Install Java Development Kit.
    
    
3. Add the following options to the "cmake" command:

   `-DSWIG_DIR=%SWIGDIR%`             
   `-DSWIG_EXECUTABLE=%SWIGDIR%\swig.exe`
   `-DPYTHON2_API=ON`  (if you want to build Python 2 API. Not compatible with `-DPYTHON3_API`)
   `-DPYTHON3_API=ON`  (if you want to build Python 3 API. Not compatible with `-DPYTHON2_API`)
   `-DJAVA_API=ON`     (if you want to build Java API)


## Using Python2 instead of Python3

FreeLing uses UTF8 encoding to support multilinguality. Python3 is native
in UTF8, which provides a much smoother integration with FreeLing.

However, you can use FreeLing from Python2 too (though if you encounter
encoding problems, don't complain, we told you so...)
Just specify cmake option `-DPYTHON2_API` instead of `-DPYTHON3_API`.
