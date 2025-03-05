# Creating a Simple Hello World Yocto Recipe


### Steps to Create a Simple Hello World Yocto Recipe



#### 1. **Create a Custom Layer**
   - Yocto recipes should live in a layer. Create a custom layer using the `bitbake-layers` tool:
     ```bash
     bitbake-layers create-layer ../meta-mylayer
     ```
   - This creates a `meta-mylayer/` directory at the same level as your `build_rpi/` directory.
   - Add the layer to your build configuration:
     ```bash
     bitbake-layers add-layer ../meta-mylayer
     ```
   - Verify it’s added by checking `build_rpi/conf/bblayers.conf`. You should see `../meta-mylayer` in the `BBLAYERS` variable.

#### 2. **Create the Recipe Directory**
   - Inside `meta-mylayer/`, create a directory for your recipe:
     ```bash
     mkdir -p meta-mylayer/recipes-helloworld/helloworld
     ```
   - The structure follows the convention: `recipes-<category>/<recipe-name>/`.

#### 3. **Create the Source File (`main.c`)**
   - Create a `files/` subdirectory to hold the source code:
     ```bash
     mkdir meta-mylayer/recipes-helloworld/helloworld/files
     ```
   - Create a simple `main.c` file:
     ```bash
     nano meta-mylayer/recipes-helloworld/helloworld/files/main.c
     ```
   - Add this content:
     ```c
     #include <stdio.h>
     int main() {
         printf("Hello World from Yocto!\n");
         return 0;
     }
     ```
   - Save and exit.

#### 4. **Create the Recipe File (`helloworld_0.1_r1.bb`)**
   - Create the recipe file:
     ```bash
     nano meta-mylayer/recipes-helloworld/helloworld/helloworld_0.1_r1.bb
     ```

     > Recipe Name = "PN_PV_PR.bb"
     > PN = Package Name
     > PV = Package Version
     > PR = Package ReVersion

    
   - Add the following content:
     ```bash
     SUMMARY = "Simple Hello World Application"
     DESCRIPTION = "A basic recipe to print Hello World"
     LICENSE = "MIT"
     LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

     SRC_URI = "file://main.c"

     do_compile() {
         ${CC} ${CFLAGS} ${LDFLAGS} ${WORKDIR}/main.c -o helloworld
     }

     do_install() {
         install -d ${D}${bindir}
         install -m 0755 ${WORKDIR}/helloworld ${D}${bindir}
     }
     ```
   - **Explanation**:
     - `SUMMARY` and `DESCRIPTION`: Metadata about the recipe.
     - `LICENSE`: Specifies the license (MIT is common for examples).
     - `LIC_FILES_CHKSUM`: Points to the license file and its checksum for verification.
     - 
     - `SRC_URI`: Specifies the local source file (`main.c`).
     - `do_compile`: Compiles `main.c` into an executable named `helloworld`.
     - `do_install`: Installs the executable into the target’s `/usr/bin/` directory (`${bindir}`).

#### 5. **Verify Directory Structure**
   - Your `meta-mylayer/` should now look like this:
     ```
     meta-mylayer/
     ├── conf/
     │   └── layer.conf
     ├── recipes-helloworld/
     │   └── helloworld/
     │       ├── helloworld.bb
     │       └── files/
     │           └── main.c
     └── README
     ```

#### 6. **Build the Recipe**
   - Return to your build directory:
     ```bash
     cd build_rpi
     ```
   - Build the recipe:
     ```bash
     bitbake helloworld
     ```
   - If successful, Bitbake will fetch `main.c`, compile it into `helloworld`, and package it. Output files will be in `tmp/work/.../helloworld/`.

#### 7. **Add the Recipe to an Image**
   - To include `helloworld` in a target image (e.g., `core-image-minimal`):
     - Edit `build_rpi/conf/local.conf` and append:
       ```bash
       IMAGE_INSTALL:append = " helloworld"
       ```
     - Build the image:
       ```bash
       bitbake core-image-minimal
       ```
   - The resulting image (in `tmp/deploy/images/`) will include the `helloworld` binary.

