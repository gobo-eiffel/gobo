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
   
   BIDIRECTIONAL_IMPLEMENTATION

inherit
   
   IMPLEMENTATION

feature {BIDIRECTIONAL_INTERFACE} -- Initialisation
   
   set_interface (a_interface: like interface) is
	 -- sets `interface' to `a_interface'
      require
	 a_interface_not_void: a_interface /= Void
      do
	 interface := a_interface
      end

feature {NONE} -- Implementation
   
   interface: BIDIRECTIONAL_INTERFACE
	 -- reference to interface

end -- class BIDIRECTIONAL_IMPLEMENTATION
