# Gobo Eiffel Kernel Library

NICE (Nonprofit International Consortium for Eiffel) has provided us with
a kernel library standard that we can rely on for interoperability between
Eiffel compilers. This standard is made up of a set of classes, such as `ANY`,
`INTEGER` or `STRING`, and a set of features that all Eiffel compilers should
implement. A free implementation is provided in
[FreeELKS](https://github.com/EiffelSoftware/FreeELKS)
and is used by the ISE and Gobo Eiffel compilers.
However, some other compilers fail to support some of these classes or
features, making it difficult to write portable Eiffel code. Moreover, some
useful features are also missing in the standard. Some compilers may provide
implementation for these features, but some don't.

The *Gobo Eiffel Kernel Library* has been designed to make it possible to
write portable Eiffel classes using the adaptation techniques described
in `$GOBO/library/common/doc/portability`. Clusters of the form 
`spec/<compiler_name>`, where `<compiler_name>` is either `ise` or `ge`,
contain classes adapted from non-portable classes (filenames suffixed by
`.ge` instead of `.e`).

**Included in this library:**

* `src`: this folder contains the clusters and classes making up this library.
* `test`: this folder contains the unit tests for this library.

A more detailed documentation for this library will be provided in
future releases.

## Authors

Copyright (c) 1997-2017, Eric Bezault and others
