indexing

	description:

		"Eiffel actual generic parameter lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ACTUAL_GENERIC_PARAMETERS

inherit

	ANY
		redefine
			copy, is_equal
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (a_type: ET_TYPE) is
			-- Create a new actual generic parameter list
			-- with initially one actual parameter `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			make_with_capacity (a_type, 1)
		ensure
			count_set: count = 1
			inserted: item (1) = a_type
		end

	make_with_capacity (a_type: ET_TYPE; nb: INTEGER) is
			-- Create a new actual generic parameter list
			-- with initially one actual parameter `a_type'.
		require
			a_type_not_void: a_type /= Void
			nb_positive: nb >= 1
		do
			!! generic_parameters.make (1, nb)
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

feature -- Status report

	same_syntactical_types (other: like Current): BOOLEAN is
			-- Are current types and those of `other'
			-- syntactically the same types (e.g. do
			-- not try to resolve anchored types)?
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
		do
			if other.count = count then
				nb := count
				Result := True
				from i := 1 until i > nb loop
					if not item (i).same_syntactical_type (other.item (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	syntactically_conforms_to (other: like Current; a_class: ET_CLASS): BOOLEAN is
			-- Do current types syntactically conform to
			-- those of `other' when they appears in `a_class'
			-- (e.g. do not try to resolve anchored types)?
		require
			other_not_void: other /= Void
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_type, other_type: ET_TYPE
		do
			if other.count /= count then
					-- This error should occur if validity has
					-- been checked since `Current' and `other'
					-- are the generic parameters of a class type
					-- based on the same class and because both
					-- class types are valid they have the same
					-- number of actual generic parameters as the
					-- number of formal generic parameters of this
					-- base class.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					a_type := item (i)
					other_type := other.item (i)
					if not a_type.syntactically_conforms_to (other_type, a_class) then
							-- This is a conformance error detected in
							-- `syntactically_conforms_to'.
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Validity

	check_parent_validity1 (an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current types are valid when
			-- it appears in parent clause of `an_heir'.
			-- Do not check conformance to generic constraints.
			-- Report errors if not valid.
		require
			an_heir_not_void: an_heir /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).check_parent_validity1 (an_heir) then
					Result := False
				end
				i := i + 1
			end
		end

	check_parent_validity2 (formals: ET_FORMAL_GENERIC_PARAMETERS;
		formal_class, an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current actual generic parameters
			-- are a valid generic derivation of `formals' when
			-- they appear in a constraint of a formal generic
			-- parameter of class `a_class'. `formal_class' is
			-- the class where `formals' are declared. Report
			-- errors if not valid.
		require
			an_heir_not_void: an_heir /= Void
		local
			i, nb: INTEGER
			a_formal: ET_FORMAL_GENERIC_PARAMETER
			an_actual, a_constraint: ET_TYPE
		do
			Result := formals.check_validity (formal_class)
			if Result then
				nb := count
				from i := 1 until i > nb loop
					a_formal := formals.item (i)
					an_actual := item (i)
					if not an_actual.check_parent_validity2 (an_heir) then
							-- The error has already been reported
							-- in `check_parent_validity2'.
						Result := False
					else
						a_constraint := a_formal.constraint
						if a_constraint /= Void then
							if not a_constraint.check_constraint_validity (formal_class) then
									-- The error has already been reported
									-- in `check_constraint_validity'.
								Result := False
							elseif not an_actual.syntactically_conforms_to (a_constraint, an_heir) then
								Result := False
								an_heir.error_handler.report_vtcg_error (an_heir, an_actual, a_constraint)
							end
						end
					end
					i := i + 1
				end
			end
		end

	check_constraint_validity (formals: ET_FORMAL_GENERIC_PARAMETERS;
		formal_class, a_class: ET_CLASS): BOOLEAN is
			-- Check whether current actual generic parameters
			-- are a valid generic derivation of `formals' when
			-- they appear in a constraint of a formal generic
			-- parameter of class `a_class'. `formal_class' is
			-- the class where `formals' are declared. Report
			-- errors if not valid.
		require
			formals_not_void: formals /= Void
			same_count: formals.count = count
			formal_class_not_void: formal_class /= Void
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			a_formal: ET_FORMAL_GENERIC_PARAMETER
			an_actual, a_constraint: ET_TYPE
		do
			Result := formals.check_validity (formal_class)
			if Result then
				nb := count
				from i := 1 until i > nb loop
					a_formal := formals.item (i)
					an_actual := item (i)
					if not an_actual.check_constraint_validity (a_class) then
							-- The error has already been reported
							-- in `check_constraint_validity'.
						Result := False
					else
						a_constraint := a_formal.constraint
						if a_constraint /= Void then
							if not a_constraint.check_constraint_validity (formal_class) then
									-- The error has already been reported
									-- in `check_constraint_validity'.
								Result := False
							elseif not an_actual.syntactically_conforms_to (a_constraint, a_class) then
								Result := False
								a_class.error_handler.report_vtcg_error (a_class, an_actual, a_constraint)
							end
						end
					end
					i := i + 1
				end
			end
		end

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

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in current types.
		local
			i, nb: INTEGER
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				generic_parameters.item (i).add_to_system
				i := i + 1
			end
		end

feature -- Type processing

	has_formal_parameters (actual_parameters: ARRAY [ET_TYPE]): BOOLEAN is
			-- Does current types contain formal generic parameter
			-- types of index 'i' such that 'actual_parameters.item (i)'
			-- is not void?
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_type := generic_parameters.item (i)
				if a_type.has_formal_parameters (actual_parameters) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	resolve_formal_parameters (actual_parameters: ARRAY [ET_TYPE]) is
			-- Replace in current types the formal generic parameter
			-- types of index 'i' by 'actual_parameters.item (i)'
			-- when these new parameters are not void.
			-- (Warning: this is a side-effect function.)
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_type := generic_parameters.item (i)
				a_type := a_type.resolved_formal_parameters (actual_parameters)
				generic_parameters.put (a_type, i)
				i := i + 1
			end
		end

	resolve_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS;
		a_flattener: ET_FEATURE_FLATTENER) is
			-- Replace any 'like identifier' types that appear
			-- in the implementation of `a_feature' by the
			-- corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types.
		require
			a_feature_not_void: a_feature /= Void
			a_flattener_not_void: a_flattener /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_flattener.current_class
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			nb := generic_parameters.count
			from i := 1 until i > nb loop
				a_type := generic_parameters.item (i)
				a_type := a_type.resolved_identifier_types (a_feature, args, a_flattener)
				generic_parameters.put (a_type, i)
				i := i + 1
			end
		end

feature -- Duplication

	copy (other: like Current) is
			-- Duplicate recursively actual generic parameter types.
		local
			i, nb: INTEGER
			old_parameters: like generic_parameters
		do
			standard_copy (other)
			nb := count
			old_parameters := generic_parameters
			!! generic_parameters.make (1, nb)
			from i := 1 until i > nb loop
				generic_parameters.put (clone (old_parameters.item (i)), i)
				i := i + 1
			end
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Are current actual generic paramater types and
			-- `other' recursively equal?
		local
			i, nb: INTEGER
		do
			if same_type (other) and count = other.count then
				nb := count
				Result := True
				from i := 1 until i > nb loop
					if not item (i).is_equal (other.item (i)) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature {NONE} -- Implementation

	generic_parameters: ARRAY [ET_TYPE]
			-- Actual generic parameters

invariant

	not_empty: count > 0
	generic_parameters_not_void: generic_parameters /= Void
	generic_parameters_lower: generic_parameters.lower = 1
	generic_parameters_upper: generic_parameters.upper >= count

end -- class ET_ACTUAL_GENERIC_PARAMETERS
