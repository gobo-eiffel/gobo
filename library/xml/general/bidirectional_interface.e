indexing

	description:

		""

	library:    "Gobo Eiffel ??? Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 200, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class
   
   BIDIRECTIONAL_INTERFACE

inherit  
   
   INTERFACE
      redefine
	 make_from_imp,
	 implementation
      end

feature {NONE} -- Initialisation
   
   make_from_imp (a_imp: like implementation) is
	 -- creates a new tag from from `a_imp'.
      do
	 implementation := a_imp
	 a_imp.set_interface (Current)
      end

feature {NONE} -- Implementation
   
   implementation: BIDIRECTIONAL_IMPLEMENTATION
	 -- Referenc to the implementation.

end -- class BIDIRECTIONAL_INTERFACE
