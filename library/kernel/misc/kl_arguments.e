indexing

	description:

		"Command-line arguments"

	usage:

		"This class should not be used directly through %
		%inheritance and client/supplier relationship. %
		%Inherit from KL_SHARED_ARGUMENTS instead."

	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_ARGUMENTS

inherit

	ARGUMENTS
		export
				-- Needed for SE 2.1b1:
			{ANY} argument, argument_count
		end

create {KL_SHARED_ARGUMENTS}

	make

feature {NONE} -- Initialization

	make is
			-- Create a new command-line argument holder.
		do
			program_name := argument (0)
		end

feature -- Access

	program_name: STRING
			-- Program name

feature -- Setting

	set_program_name (a_name: like program_name) is
			-- Set `program_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			program_name := a_name
		ensure
			program_name_set: program_name = a_name
		end

invariant

	program_name_not_void: program_name /= Void

end
