@echo off

setlocal EnableDelayedExpansion

if not exist KTX-Software (
    git clone --recurse-submodules --revision 0b3fad6a6dbe79fdd2872247035513fab84b5b40 https://github.com/KhronosGroup/KTX-Software --depth=1
)

set binaries_dir=build

echo Configuring build...
cmake . -B %binaries_dir% -DKTX_FEATURE_TOOLS=OFF -DBUILD_SHARED_LIBS=OFF -DKTX_FEATURE_TESTS=OFF

echo Building project...
make -C %binaries_dir%

copy /y %binaries_dir%\ktx.lib .\spirv.lib

echo Build completed successfully!
