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
   
   INTERFACE

feature {NONE} -- Initialisation

   make_from_imp (a_imp: like implementation) is
	 -- creates a new tag from from `a_imp'
      require
	 a_imp_not_void: a_imp /= Void
      do
	 implementation := a_imp
      end

feature {NONE} -- Implementation

   implementation: IMPLEMENTATION
	 -- Referenc to the implementation.

end -- class INTERFACE
