Gobo Eiffel Kernel Library

NICE (Nonprofit International Consortium for Eiffel) has provided us with
a kernel library standard that we can rely on for interoperability between
Eiffel compilers. This standard is made up of a set of classes, such as ANY,
INTEGER or STRING, and a set of features that all Eiffel compilers should
implement. However, some compilers fail to support some these classes or
features, making it difficult to write portable Eiffel code. Moreover, some
useful features are also missing in the standard. Some compilers may provide
implementation for these features, but some don't.

The Gobo Eiffel Kernel Library has been designed to make it possible to
write portable Eiffel classes using the adaptation techniques described
in "$GOBO\doc\portability". Clusters of the form "spec\<compiler_name>",
where <compiler_name> is either "hact", "ise", "se", "tower" or "ve",
contain classes adapted from non-portable classes (filenames suffixed
by ".ge" instead of ".e").

A more detailed documentation for this library will be provided in
future releases.

The cluster `obsolete' contains classes named KL_SHARED_*_ROUTINES in
previous releases and which have been renamed as KL_IMPORTED_*_ROUTINES.
This new class name convention has been adopted after reading an article
from Richie Bielak which appeared in Eiffel Outlook in May 1994
(volume 3, number 5, page 6).

--
Copyright (c) 1998, Eric Bezault
mailto:ericb@gobo.demon.co.uk
http://www.gobo.demon.co.uk
