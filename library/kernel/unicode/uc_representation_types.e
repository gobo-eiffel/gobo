indexing

   description:
   
   "representation types";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_REPRESENTATION_TYPES
   
feature -- types
   
   Representation_UTF8: INTEGER is 1
         -- representation as UTF8-String
   
   Representation_UTF32: INTEGER is 2
         -- representation as 32bit integer array
   
end -- class UC_REPRESENTATION_TYPES
