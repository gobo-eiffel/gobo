indexing

   description:
   
   "global settings, eg. for representation";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_SETTINGS

inherit
   UC_REPRESENTATION_TYPES

feature -- representation
   
   set_default_representation (type: INTEGER) is
	 -- set default representation to the one given in `type'
      do
         factory.set_default_representation(type)
      end
   
   create_representation: UC_REPRESENTATION is
         -- create a new instance of the default representation
      do
         Result := factory.create_representation
      end
   
feature {UC_SETTINGS} -- Implementation

   factory: UC_REPRESENTATION_FACTORY is
	 -- the representation factory
      once
         !!Result.make
      end
   
end -- class UC_SETTINGS
