Gobo Eiffel Kernel Library

NICE (Nonprofit International Consortium for Eiffel) has provided us with
a kernel library standard that we can rely on for interoperability between
Eiffel compilers. This standard is made up of a set of classes, such as ANY,
INTEGER or STRING, and a set of features that all Eiffel compilers should
implement. However, some compilers fail to support some of these classes or
features, making it difficult to write portable Eiffel code. Moreover, some
useful features are also missing in the standard. Some compilers may provide
implementation for these features, but some don't.

The Gobo Eiffel Kernel Library has been designed to make it possible to
write portable Eiffel classes using the adaptation techniques described
in "$GOBO\doc\portability". Clusters of the form "spec\<compiler_name>",
where <compiler_name> is either "hact", "ise", "se" or "ve", contain
classes adapted from non-portable classes (filenames suffixed by ".ge"
instead of ".e").

A more detailed documentation for this library will be provided in
future releases.

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
