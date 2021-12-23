note

	description:

		"Command-line arguments"

	usage: "[
		This class should not be used directly through
		inheritance and client/supplier relationship.
		Inherit from KL_SHARED_ARGUMENTS instead.
	]"
	pattern: "Singleton"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_ARGUMENTS

inherit

	ARGUMENTS

create {KL_SHARED_ARGUMENTS}

	make

feature {NONE} -- Initialization

	make
			-- Create a new command-line argument holder.
		do
			program_name := argument (0)
		end

feature -- Access

	program_name: STRING
			-- Program name

	to_array: ARRAY [STRING]
			-- Array representation of command-line arguments
		local
			j, nb: INTEGER
		do
			nb := argument_count
			create Result.make_filled ("", 1, nb)
			from j := 1 until j > nb loop
				Result.put (argument (j), j)
				j := j + 1
			end
		ensure
			to_array_not_void: Result /= Void
			lower: Result.lower = 1
			upper: Result.upper = argument_count
			definition: across (1 |..| argument_count) as i all Result [i.item] = argument (i.item) end
		end

feature -- Setting

	set_program_name (a_name: like program_name)
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
