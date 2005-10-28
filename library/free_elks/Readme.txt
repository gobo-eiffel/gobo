FreeELKS Library

FreeELKS is an attempt to provide a free compiler-independent implementation
of ELKS (Eiffel Kernel Library Standard) from NICE (Nonprofit International
Consortium for Eiffel):

    http://www.gobosoft.com/eiffel/nice/elks01/index.html

FreeELKS has been initially contributed by ISE and is hosted at SourceForge:

    https://sourceforge.net/projects/freeelks

The Gobo Eiffel Compiler uses FreeELKS as its Kernel Library implementation
in order to ensure source code compatibility with ISE Eiffel. The directory
$GOBO/library/free_elks is included in the Gobo package for convenience
but modifications to its classes should first be made to the original
version in the FreeELKS SourceForge project (see URL above) and effort
should be made to keep the version in Gobo synchronized with this master
copy.

The directory $GOBO/library/free_elks/fake is a transitional cluster
containing classes for which the FreeELKS version is not yet supported
by the Gobo Eiffel Compiler.

--
Copyright (c) 2005, Eric Bezault and others
