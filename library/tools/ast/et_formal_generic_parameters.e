indexing

	description:

		"Eiffel formal generic parameter lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_FORMAL_GENERIC_PARAMETERS

creation

	make

feature {NONE} -- Initialization

	make (a_parameter: ET_FORMAL_GENERIC_PARAMETER) is
			-- Create a new formal generic parameter list
			-- with initially one formal parameter `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		do
			!! generic_parameters.make (1, 1)
			put (a_parameter)
		ensure
			count_set: count = 1
			inserted: item (1) = a_parameter
			index_set: a_parameter.index = 1
		end

feature -- Access

	item (i: INTEGER): ET_FORMAL_GENERIC_PARAMETER is
			-- `i'-th formal generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := generic_parameters.item (i)
		ensure
			parameter_not_void: Result /= Void
		end

	generic_parameter (a_name: ET_IDENTIFIER): ET_FORMAL_GENERIC_PARAMETER is
			-- Generic parameter with name `a_name';
			-- Void if no such generic parameter
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_parameter: ET_FORMAL_GENERIC_PARAMETER
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_parameter :=  generic_parameters.item (i)
				if a_parameter.name.same_identifier (a_name) then
					Result := a_parameter
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

	is_valid: BOOLEAN
			-- Are current formal generic paramaters valid?

	validity_checked: BOOLEAN
			-- Has validity of current formal generic
			-- paramaters been checked?

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
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Validity

	check_validity (a_class: ET_CLASS): BOOLEAN is
			-- Check validity of current formal generic
			-- parameters of `a_class'. Report errors
			-- if not valid.
		require
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_formal: like item
			a_constraint: ET_TYPE
		do
			if not validity_checked then
				validity_checked := True
				Result := True
				nb := count
				from i := 1 until i > nb loop
					a_formal := item (i)
					a_constraint := a_formal.constraint
					if a_constraint /= Void then
						if not a_constraint.check_constraint_validity (a_class) then
								-- The error has already been reported
								-- in `check_constraint_validity'.
							Result := False
							i := nb + 1 -- Jump out of the loop.
						end
					end
					i := i + 1
				end
				is_valid := Result
			else
				Result := is_valid
			end
		ensure
			validity_checked: validity_checked
			is_valid_set: is_valid = Result
		end

feature -- Element change

	put (a_parameter: ET_FORMAL_GENERIC_PARAMETER) is
			-- Add formal generic parameter `a_parameter'
			-- to formal generic parameter list.
		require
			a_parameter_not_void: a_parameter /= Void
		do
			count := count + 1
			a_parameter.set_index (count)
			if generic_parameters.upper < count then
				generic_parameters.resize (1, count)
			end
			generic_parameters.put (a_parameter, count)
		ensure
			one_more: count = old count + 1
			inserted: item (count) = a_parameter
			index_set: a_parameter.index = count
		end

feature {NONE} -- Implementation

	generic_parameters: ARRAY [ET_FORMAL_GENERIC_PARAMETER]
			-- Formal generic parameters

invariant

	not_empty: count > 0
	generic_parameters_not_void: generic_parameters /= Void
	generic_parameters_lower: generic_parameters.lower = 1
	generic_parameters_upper: generic_parameters.upper >= count

end -- class ET_FORMAL_GENERIC_PARAMETERS
