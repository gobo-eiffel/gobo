indexing

   description:
   
   "representation factory";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_REPRESENTATION_FACTORY

inherit
   UC_REPRESENTATION_TYPES
      end
   
creation
   make
   
feature {NONE} -- Creation
   
   make is
      do
         set_default_representation(Representation_UTF8)
      end
   
feature
   
   set_default_representation (t: INTEGER) is
	 -- set default representation to `t'
      require
         -- valid representation type
      do
         type := t
      end
   
   create_representation: UC_REPRESENTATION is
	 -- create new representation from default type
      do
         inspect type
         when Representation_UTF8 then
            !UC_REPRESENTATION_UTF8!Result.make
         when Representation_UTF32 then
            !UC_REPRESENTATION_UTF32!Result.make
         end
      end
   
   type: INTEGER
         -- current representation type
   
end
