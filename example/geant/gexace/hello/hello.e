indexing

	description:

		"Gobo Eiffel Ant Example Class"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"


class HELLO

creation

	make

feature {NONE} -- Initialization

	make is
			-- Execute 'hello world'.
		do
			print ("Hello World%N")
		end

end -- class HELLO

