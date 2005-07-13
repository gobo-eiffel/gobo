indexing

	description:

		"Gobo Eiffel Ant Example Class"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class HELLO

create

	make

feature {NONE} -- Initialization

	make is
			-- Execute 'hello world'.
		do
			print ("Hello World%N")
		end

end
