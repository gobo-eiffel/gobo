indexing

	description:

		"Eiffel client lists of the form {}"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_NONE_CLIENTS

inherit

	ET_CLIENTS
		rename
			make as make_clients
		end

creation

	make

feature {NONE} -- Initialization

	make (a_left: like left_brace; a_right: like right_brace) is
			-- Create a new client list of the form.
		require
			a_left_not_void: a_left /= Void
			a_right_not_void: a_right /= Void
		local
			a_name: ET_IDENTIFIER
		do
			make_with_capacity (a_left, a_right, 1)
			!! a_name.make_with_position (none_class_name.name, a_left.line, a_right.column)
			put_first (a_name)
		ensure
			left_brace_set: left_brace = a_left
			right_brace_set: right_brace = a_right
		end

end -- class ET_NONE_CLIENTS
