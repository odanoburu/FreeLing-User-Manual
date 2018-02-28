# Install from source on Windows

This section assumes you already downloaded and uncompressed FreeLing sources in a folder of your choice.
If not, please read Section [Installing from source](installation-source.md) before continuing.

It also assumes you installed development tools and FreeLing dependencies. 
If not, please read Section [Install FreeLing Requirements on Windows](requirements-windows.md)

Finally, it assumes you know where you want to install FreeLing (e.g. `C:\FreeLing`, `C:\Program Files\FreeLing`, etc.). 
***IMPORTANT***: From this point on, we will refer to this FreeLing installation folder (where you should already have installed the dependencies) as `%FLINSTALL%`.

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


# OBSERVATIONS

## Installing dependencies in different folders

You can install zlib, boost, and icu anywhere (that is, they don't HAVE to be in `%FLINSTALL%\dependencies`).

If you install them somewhere else, you'll need to set the right paths for variables `ZLIB_INCLUDE_DIR`, `ZLIB_LIBRARY`, `BOOST_ROOT`, and `ICU_ROOT`  in the `CMake` command, and adjust the `%PATH%` definition if you are using an API.

Also, if you plan to use the `analyzer.bat` script, you'll need to edit it and adjust the paths to those libraries too.

