indexing

	description:

		"Eiffel actual generic parameter lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ACTUAL_GENERIC_TYPES

creation

	make

feature {NONE} -- Initialization

	make (a_type: ET_TYPE) is
			-- Create a new actual generic parameter list
			-- with initially one actual parameter `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			!! generic_parameters.make (1, 1)
			put (a_type)
		ensure
			count_set: count = 1
			inserted: item (1) = a_type
		end

feature -- Access

	item (i: INTEGER): ET_TYPE is
			-- `i'-th actual generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := generic_parameters.item (i)
		ensure
			parameter_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of generic parameters

feature -- Element change

	put (a_type: ET_TYPE) is
			-- Add actual generic parameter `a_type'
			-- to actual generic parameter list.
		require
			a_type_not_void: a_type /= Void
		do
			count := count + 1
			if generic_parameters.upper < count then
				generic_parameters.resize (1, count)
			end
			generic_parameters.put (a_type, count)
		ensure
			one_more: count = old count + 1
			inserted: item (count) = a_type
		end

feature {NONE} -- Implementation

	generic_parameters: ARRAY [ET_TYPE]
			-- Actual generic parameters

invariant

	not_empty: count > 0
	generic_parameters_not_void: generic_parameters /= Void
	generic_parameters_lower: generic_parameters.lower = 1
	generic_parameters_upper: generic_parameters.upper >= count

end -- class ET_ACTUAL_GENERIC_TYPES
