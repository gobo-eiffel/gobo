This directory contains the source code for the reverse polish notation
calculator used as an example in Geyacc documentation.
Please refer to $GOBO\doc\geyacc\examples.html for details.

To compile this example:

1. Use the script 'make_parser.bat' to generate class RPCALC if necessary.
2. Use your favorite Eiffel compiler to compile the Eiffel system using
   the Ace file (ISE Eiffel: ise*.ace, Halstenbach: hact*.ace,
   TowerEiffel: tower*.ace), the ESD file (Visual Eiffel: ve*.esd) or
   just execute the script (SmallEiffel: se*.bat).
5. Run the calcultor:
       rpcalc
   and enter reverse polish notation expressions to be evaluated, one
   per line.

--
Eric Bezault <ericb@gobo.demon.co.uk>
