If you downloaded the source code of Gobo from subversion 
and don't have a previous version of Gobo already installed
on your computer, you will need to run this bootstrap
procedure in order to compile the tools which will be
placed in $GOBO/bin and generate other files in various
subdirectories of $GOBO.

The procedure is quite simple:

. Check out the source code from the Gobo SVN repository.
. Set the environment variable $GOBO.
. Add $GOBO/bin to your $PATH. Some Eiffel distributions
  such as Visual Eiffel provide older versions of the Gobo
  tools in their installation directories. Make sure that
  $GOBO/bin is listed before these directories in your $PATH.
. Make sure that your Eiffel and C compilers are in your $PATH.
. Depending on your platform, run either:

     bootstrap.bat [-v] <c_compiler> <eiffel_compiler>

  or:

     bootstrap.sh [-v] <c_compiler> <eiffel_compiler>
  
To find out about the already supported values for
<c_compiler> and <eiffel_compiler>, run the same command
but with the option '-help'. The optional command-line
option -v is used to run the bootstrap in verbose mode.
Since not all C compilers nor all platforms have been
tested, you are welcome to send patches and/or code to
support other C compilers.

After having run this bootstrap procedure, the Gobo package
should be fully installed on your computer and ready to be
used. Later on, if you check out new classes or clusters
from SVN, there is usually no need to redo a full bootstrap
again (unless incompatible changes have been applied to the
building tools such as 'geant', 'gexace', ...). Just run:

   geant install
   geant clean

in the root directory of the library these new classes or
clusters belong to. 'geant' actually finds its instructions
in the file 'build.eant'. In order to know the possible
command-line arguments provided by a given build file,
type:

   geant help

Finally, note that the version of the Gobo package in SVN
is a development version and not an official release. The
bootstrap procedure is meant to be used by the Gobo developers
and by those who are interested in experiencing with new
functionalities at their own risk. In particular, people
willing to do code/design review, to beta-test and/or to
submit patches/suggestions are welcome.

-- 
Copyright (c) 2001-2002, Eric Bezault and others
mailto:ericb@gobosoft.com
http://www.gobosoft.com
