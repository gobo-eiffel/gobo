# Gobo Eiffel Image

This folder contains the source code of *Gobo Eiffel Image*
(`geimage`). `geimage` is a tool which is able to embed an image
into an Eiffel class which can then be used in applications
using `EiffelVision2`.
The image will then be compiled into the executable, so that there
is no need to deploy the image file along side the executable
anymore.

**Included in this folder:**

* `doc`: this folder contains the documentation for this tool,
  in HTML format. Start with `index.html`.
* `src`: this folder contains the classes necessary to compile this tool.
* `test`: this folder contains tests to exercise this tool.

**To compile and run this tool:**

1. Go to folder `src`.

2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided ECF file. Alternatively you can use `geant` to launch
   the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.

3. Run `geimage` using:

        geimage <image_filename>

    where `<image_filename>` is the name of the file containing the
    image to be embedded in an Eiffel class (e.g. `my_image.png`).

## Authors

Copyright (c) 2020, Eric Bezault and others
