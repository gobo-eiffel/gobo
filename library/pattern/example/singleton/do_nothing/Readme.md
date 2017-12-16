# Gobo Eiffel Pattern Example: singleton

This foler contains the source code for a program which does
nothing, but uses the Singleton Pattern to achieve that! If one
wants to implement the Singleton Pattern in one's program, one can
copy/paste the classes `NULL_SINGLETON` and `SHARED_NULL_SINGLETON`,
give them better names and add domain specific attributes and
routines to the singleton class as if it was a regular class.

**To compile and run this example:**

1. Use your favorite Eiffel compiler to compile the Eiffel system using
   the provided Xace or ECF file (e.g. `<compiler>.ecf`). Alternatively
   you can use `geant` to launch the compilation:
   
        geant compile_<compiler>
       
    where `<compiler>` is either `ise` or `ge`.


2. Run the program using:

        do_nothing

    It will display the following messages:

        Used singleton
        Singleton created
        Used singleton again

## Authors

Copyright (c) 2003-2017, Eric Bezault and others
