indexing

	description:

		"Eiffel formal generic parameter lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_GENERIC_TYPES

creation

	make

feature {NONE} -- Initialization

	make (a_type: ET_FORMAL_GENERIC_TYPE) is
			-- Create a new formal generic parameter list
			-- with initially one formal parameter `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			!! generic_parameters.make (1, 1)
			put (a_type)
		ensure
			count_set: count = 1
			inserted: item (1) = a_type
			position_set: a_type.position = 1
		end

feature -- Access

	item (i: INTEGER): ET_FORMAL_GENERIC_TYPE is
			-- `i'-th formal generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := generic_parameters.item (i)
		ensure
			parameter_not_void: Result /= Void
		end

	generic_parameter (a_name: ET_IDENTIFIER): ET_FORMAL_GENERIC_TYPE is
			-- Generic parameter with name `a_name';
			-- Void if no such generic parameter
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_type: ET_FORMAL_GENERIC_TYPE
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_type :=  generic_parameters.item (i)
				if a_type.name.same_identifier (a_name) then
					Result := a_type
					i := nb + 1  -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			has_generic_parameter: has_generic_parameter (a_name) = (Result /= Void)
			same_name: Result /= Void implies Result.name.same_identifier (a_name)
		end

feature -- Measurement

	count: INTEGER
			-- Number of generic parameters

feature -- Status report

	has_generic_parameter (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				if generic_parameters.item (i).name.same_identifier (a_name) then
					Result := True
					i := nb + 1  -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	put (a_type: ET_FORMAL_GENERIC_TYPE) is
			-- Add formal generic parameter `a_type'
			-- to formal generic parameter list.
		require
			a_type_not_void: a_type /= Void
		do
			count := count + 1
			a_type.set_position (count)
			if generic_parameters.upper < count then
				generic_parameters.resize (1, count)
			end
			generic_parameters.put (a_type, count)
		ensure
			one_more: count = old count + 1
			inserted: item (count) = a_type
			position_set: a_type.position = count
		end

feature {NONE} -- Implementation

	generic_parameters: ARRAY [ET_FORMAL_GENERIC_TYPE]
			-- Formal generic parameters

invariant

	not_empty: count > 0
	generic_parameters_not_void: generic_parameters /= Void
	generic_parameters_lower: generic_parameters.lower = 1
	generic_parameters_upper: generic_parameters.upper >= count

end -- class ET_FORMAL_GENERIC_TYPES
