indexing

	description:

		"Eiffel actual generic parameter lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACTUAL_GENERIC_PARAMETERS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_TYPE_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (l: like left_bracket; r: like right_bracket) is
			-- Create an empty actual generic parameter list.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
		do
			left_bracket := l
			right_bracket := r
			make_ast_list
		ensure
			left_bracket_set: left_bracket = l
			right_bracket_set: right_bracket = r
			is_empty: is_empty
			capacity_set: capacity = 0
		end

	make_with_capacity (l: like left_bracket; r: like right_bracket; nb: INTEGER) is
			-- Create an empty actual generic parameter list with capacity `nb'.
		require
			l_not_void: l /= Void
			r_not_void: r /= Void
			nb_positive: nb >= 0
		do
			left_bracket := l
			right_bracket := r
			make_ast_list_with_capacity (nb)
		ensure
			left_bracket_set: left_bracket = l
			right_bracket_set: right_bracket = r
			is_empty: is_empty
			capacity_set: capacity = nb
		end

feature -- Access

	left_bracket: ET_SYMBOL
			-- Left bracket

	right_bracket: ET_SYMBOL
			-- Right bracket

	type (i: INTEGER): ET_TYPE is
			-- Type of `i'-th actual generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).type_item
		ensure
			type_not_void: Result /= Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := left_bracket.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := right_bracket.break
		end

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
		do
			nb := count
			from i := 1 until i > nb loop
				put (item (i).resolved_formal_parameters (actual_parameters), i)
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
		do
			nb := count
			from i := 1 until i > nb loop
				put (item (i).resolved_identifier_types (a_feature, args, a_class), i)
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
		do
			nb := count
			from i := 1 until i > nb loop
				put (item (i).resolved_named_types (a_class, ast_factory), i)
				i := i + 1
			end
		end

feature -- Setting

	set_left_bracket (l: like left_bracket) is
			-- Set `left_bracket' to `l'.
		require
			l_not_void: l /= Void
		do
			left_bracket := l
		ensure
			left_bracket_set: left_bracket = l
		end

	set_right_bracket (r: like right_bracket) is
			-- Set `right_bracket' to `r'.
		require
			r_not_void: r /= Void
		do
			right_bracket := r
		ensure
			right_bracket_set: right_bracket = r
		end

feature -- Element change

	put (an_item: like item; i: INTEGER) is
			-- Put `an_item' at index `i' in list.
		require
			an_item_not_void: an_item /= Void
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			storage.put (an_item, count - i)
		ensure
			same_count: count = old count
			inserted: item (i) = an_item
		end

feature -- Duplication

	deep_cloned_actuals: like Current is
			-- Duplicate recursively actual generic parameter types
		local
			i: INTEGER
		do
			i := count
			if i /= 0 then
				!! Result.make_with_capacity (left_bracket, right_bracket, i)
				from until i < 1 loop
					Result.put_first (item (i).deep_cloned_type)
					i := i - 1
				end
			else
				Result := Current
			end
		ensure
			deep_cloned_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_TYPE_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	left_bracket_not_void: left_bracket /= Void
	right_bracket_not_void: right_bracket /= Void

end
