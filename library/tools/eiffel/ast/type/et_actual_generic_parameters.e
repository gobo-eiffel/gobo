indexing

	description:

		"Eiffel actual generic parameter lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001-2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ACTUAL_GENERIC_PARAMETERS

creation

	make, make_empty, make_with_capacity

feature {NONE} -- Initialization

	make_empty is
			-- Create an empty actual generic parameter list.
		do
			!! generic_parameters.make (1, 0)
		ensure
			empty: count = 0
		end

	make (a_type: ET_TYPE_ITEM) is
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

	make_with_capacity (a_type: ET_TYPE_ITEM; nb: INTEGER) is
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

	item (i: INTEGER): ET_TYPE_ITEM is
			-- `i'-th actual generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := generic_parameters.item (i)
		ensure
			parameter_not_void: Result /= Void
		end

	type (i: INTEGER): ET_TYPE is
			-- Type of `i'-th actual generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).type
		ensure
			parameter_not_void: Result /= Void
		end

	comma (i: INTEGER): ET_SYMBOL is
			-- Comma after the `i'-th actual generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).comma
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
			if other = Current then
				Result := True
			elseif other.count = count then
				nb := count
				Result := True
				from i := 1 until i > nb loop
					if not type (i).same_syntactical_type (other.type (i)) then
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
			if other = Current then
				Result := True
			elseif other.count /= count then
					-- Error VTUG-2 has already been reported
					-- in ET_CLASS_TYPE.check_*_validity.
				Result := False
			else
				nb := count
				Result := True
				from i := 1 until i > nb loop
					a_type := type (i)
					other_type := other.type (i)
					if not a_type.syntactically_conforms_to (other_type, a_class) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Validity

	check_parent_validity (formals: ET_FORMAL_GENERIC_PARAMETERS;
		formal_class, an_heir: ET_CLASS): BOOLEAN is
			-- Check whether current actual generic parameters
			-- are a valid generic derivation of `formals' when
			-- they appear in a constraint of a formal generic
			-- parameter of class `a_class'. `formal_class' is
			-- the class where `formals' are declared.
			-- Report errors if not valid.
		require
			formals_not_void: formals /= Void
			same_count: formals.count = count
			formal_class_not_void: formal_class /= Void
			ancestors_searched: formal_class.ancestors_searched
			no_ancestors_error: not formal_class.has_ancestors_error
			an_heir_not_void: an_heir /= Void
		local
			i, nb: INTEGER
			a_formal: ET_FORMAL_GENERIC_PARAMETER
			an_actual, a_constraint: ET_TYPE
		do
			nb := count
			Result := True
			from i := 1 until i > nb loop
				a_formal := formals.item (i)
				an_actual := type (i)
				if not an_actual.check_parent_validity (an_heir) then
						-- The error has already been reported
						-- in `check_parent_validity'.
					Result := False
				else
					a_constraint := a_formal.constraint
					if a_constraint /= Void then
						if has_derived_parameters then
							if a_constraint.has_formal_parameters (Current) then
								a_constraint := a_constraint.deep_cloned_type
								a_constraint := a_constraint.resolved_formal_parameters (Current)
							end
						end
						if not an_actual.syntactically_conforms_to (a_constraint, an_heir) then
							Result := False
							an_heir.error_handler.report_vtcg_error (an_heir, an_actual, a_constraint)
						end
					end
				end
				i := i + 1
			end
		end

	check_constraint_validity (formals: ET_FORMAL_GENERIC_PARAMETERS; formal_class: ET_CLASS;
		a_formal: ET_FORMAL_GENERIC_PARAMETER; a_class: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]): BOOLEAN is
			-- Check whether current actual generic parameters are
			-- a valid generic derivation of `formals' when they
			-- appear in a constraint of the formal generic parameter
			-- `a_formal' in class `a_class'. `formal_class' is the
			-- class where `formals' are declared. `a_sorter' is used
			-- to find possible cycle in formal generic parameter
			-- declaration. Report errors if not valid.
		require
			formals_not_void: formals /= Void
			same_count: formals.count = count
			formal_class_not_void: formal_class /= Void
			ancestors_searched: formal_class.ancestors_searched
			no_ancestors_error: not formal_class.has_ancestors_error
			a_formal_not_void: a_formal /= Void
			a_class_not_void: a_class /= Void
			a_sorter_not_void: a_sorter /= Void
		local
			i, nb: INTEGER
			an_actual, a_constraint: ET_TYPE
		do
			nb := count
			Result := True
			from i := 1 until i > nb loop
				an_actual := type (i)
				if not an_actual.check_constraint_validity (a_formal, a_class, a_sorter) then
						-- The error has already been reported
						-- in `check_constraint_validity'.
					Result := False
				else
					a_constraint := formals.item (i).constraint
					if a_constraint /= Void then
						if has_derived_parameters then
							if a_constraint.has_formal_parameters (Current) then
								a_constraint := a_constraint.deep_cloned_type
								a_constraint := a_constraint.resolved_formal_parameters (Current)
							end
						end
						if not an_actual.syntactically_conforms_to (a_constraint, a_class) then
							Result := False
							a_class.error_handler.report_vtcg_error (a_class, an_actual, a_constraint)
						end
					end
				end
				i := i + 1
			end
		end

feature -- Element change

	put (a_type: ET_TYPE_ITEM) is
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
			nb := count
			from i := 1 until i > nb loop
				type (i).add_to_system
				i := i + 1
			end
		end

feature -- Type processing

	has_derived_parameters: BOOLEAN is
			-- Are there actual parameters which are different
			-- from their corresponding formal parameters because
			-- of the generic derivation?
		local
			i, nb: INTEGER
			a_formal: ET_FORMAL_GENERIC_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_formal ?= type (i)
				if a_formal = Void or else a_formal.index /= i then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS): BOOLEAN is
			-- Does current types contain formal generic parameter
			-- types whose corresponding actual parameter in
			-- `actual_parameters' is different from the formal
			-- parameter?
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_type := type (i)
				if a_type.has_formal_parameters (actual_parameters) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	resolve_formal_parameters (actual_parameters: ET_ACTUAL_GENERIC_PARAMETERS) is
			-- Replace in current types the formal generic parameter
			-- types by those of `actual_parameters' when the 
			-- corresponding actual parameter is different from
			-- the formal parameter.
		require
			actual_parameters_not_void: actual_parameters /= Void
		local
			i, nb: INTEGER
			an_item: ET_TYPE_ITEM
		do
			nb := count
			from i := 1 until i > nb loop
				an_item := item (i)
				an_item.set_type (an_item.type.resolved_formal_parameters (actual_parameters))
				i := i + 1
			end
		end

	resolve_identifier_types (a_feature: ET_FEATURE; args: ET_FORMAL_ARGUMENTS; a_class: ET_CLASS) is
			-- Replace any 'like identifier' types that appear in the
			-- implementation of `a_feature in class `a_class' by
			-- the corresponding 'like feature' or 'like argument'.
			-- Also resolve 'BIT identifier' types. Set
			-- `a_class.has_flatten_error' to true if an error occurs.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			immediate_or_redeclared: a_feature.implementation_class = a_class
		local
			i, nb: INTEGER
			an_item: ET_TYPE_ITEM
		do
			nb := count
			from i := 1 until i > nb loop
				an_item := item (i)
				an_item.set_type (an_item.type.resolved_identifier_types (a_feature, args, a_class))
				i := i + 1
			end
		end

	resolve_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY) is
			-- Replace in current types unresolved named types
			-- by corresponding class types or formal generic
			-- parameter names. `a_class' is the class where
			-- current types appear in the source code.
		require
			a_class_not_void: a_class /= Void
			ast_factory_not_void: ast_factory /= Void
		local
			i, nb: INTEGER
			an_item: ET_TYPE_ITEM
		do
			nb := count
			from i := 1 until i > nb loop
				an_item := item (i)
				an_item.set_type (an_item.type.resolved_named_types (a_class, ast_factory))
				i := i + 1
			end
		end

feature -- Duplication

	deep_cloned_actuals: like Current is
			-- Duplicate recursively actual generic
			-- parameter types
		local
			i, nb: INTEGER
			an_item, a_cloned_item: ET_TYPE_ITEM
		do
			nb := count
			if nb = 0 then
			else
				an_item := item (1)
				!! a_cloned_item.make (an_item.type.deep_cloned_type)
				a_cloned_item.set_comma (an_item.comma)
				!! Result.make_with_capacity (a_cloned_item, nb)
				from i := 2 until i > nb loop
					an_item := item (i)
					!! a_cloned_item.make (an_item.type.deep_cloned_type)
					a_cloned_item.set_comma (an_item.comma)
					Result.put (a_cloned_item)
					i := i + 1
				end
			end
		ensure
			deep_cloned_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	generic_parameters: ARRAY [ET_TYPE_ITEM]
			-- Actual generic parameters

invariant

	not_empty: count >= 0
	generic_parameters_not_void: generic_parameters /= Void
	generic_parameters_lower: generic_parameters.lower = 1
	generic_parameters_upper: generic_parameters.upper >= count

end -- class ET_ACTUAL_GENERIC_PARAMETERS
