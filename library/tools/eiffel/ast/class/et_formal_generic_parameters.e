indexing

	description:

		"Eiffel formal generic parameter lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_GENERIC_PARAMETERS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_FORMAL_GENERIC_PARAMETER_ITEM]
		rename
			make as make_ast_list,
			make_with_capacity as make_ast_list_with_capacity,
			item as formal_generic_parameter_item
		redefine
			put_first
		end

creation

	make, make_with_capacity

feature {NONE} -- Initialization

	make (l: like left_bracket; r: like right_bracket) is
			-- Create an empty formal generic parameter list.
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
			-- Create an empty formal generic parameter list with capacity `nb'.
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

	item (i: INTEGER): ET_FORMAL_GENERIC_PARAMETER is
			-- Type of `i'-th formal generic parameter
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := formal_generic_parameter_item (i).formal_generic_parameter_item
		ensure
			item_not_void: Result /= Void
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

	generic_parameter (a_name: ET_IDENTIFIER): ET_FORMAL_GENERIC_PARAMETER is
			-- Generic parameter with name `a_name';
			-- Void if no such generic parameter
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			a_parameter: ET_FORMAL_GENERIC_PARAMETER
		do
			nb := count
			from i := 1 until i > nb loop
				a_parameter :=  item (i)
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

feature -- Status report

	has_generic_parameter (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if item (i).name.same_identifier (a_name) then
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
			i, j, nb: INTEGER
			a_formal: like item
			a_name: ET_IDENTIFIER
			a_universe: ET_UNIVERSE
			other_class: ET_CLASS
			a_constraint: ET_TYPE
			a_formal_constraint: ET_FORMAL_GENERIC_TYPE
			nb_constraints: INTEGER
			an_index: INTEGER
			a_sorter: DS_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]
		do
			Result := True
			a_universe := a_class.universe
			a_sorter := a_universe.formal_generic_parameter_sorter
			a_sorter.wipe_out
			nb := count
			from i := 1 until i > nb loop
				a_formal := item (i)
				a_name := a_formal.name
				if a_universe.has_class (a_name) then
					other_class := a_universe.eiffel_class (a_name)
					a_class.error_handler.report_vcfg1_error (a_class, a_formal, other_class)
					Result := False
				else
					from j := 1 until j >= i loop
						if item (j).name.same_identifier (a_name) then
							a_class.error_handler.report_vcfg2_error (a_class, item (j), a_formal)
							Result := False
							j := nb + 1 -- Jump out of the inner loop.
						end
						j := j + 1
					end
					a_constraint := a_formal.constraint
					if a_constraint /= Void then
						nb_constraints := nb_constraints + 1
						a_formal_constraint ?= a_constraint
						if a_formal_constraint /= Void then
							an_index := a_formal_constraint.index
							if an_index = i then
								a_class.error_handler.report_vcfg3a_error (a_class, a_formal, a_formal_constraint)
								Result := False
							elseif an_index < i then
								a_sorter.force_relation (item (an_index), a_formal)
								a_class.error_handler.report_vcfg3b_error (a_class, a_formal, a_formal_constraint)
							elseif an_index > i then
								a_sorter.force_relation (item (an_index), a_formal)
								a_class.error_handler.report_vcfg3c_error (a_class, a_formal, a_formal_constraint)
							end
						end
					end
				end
				i := i + 1
			end
			if a_sorter.count > 0 then
				if Result then
					a_sorter.sort
					if a_sorter.has_cycle then
						a_class.error_handler.report_vcfg3d_error (a_class, a_sorter.cycle)
						Result := False
					end
				end
				a_sorter.wipe_out
			end
			if Result and nb_constraints > 0 then
				if a_class.error_handler.is_se then
						-- The sorter is used to detect VCFG-3g, which is only useful
						-- for SmallEiffel. Create a new sorter to avoid sharing between
						-- recursive calls to `check_validity'.
					!DS_HASH_TOPOLOGICAL_SORTER [ET_FORMAL_GENERIC_PARAMETER]! a_sorter.make (nb)
				end
				from i := 1 until i > nb loop
					a_formal := item (i)
					a_constraint := a_formal.constraint
					if a_constraint /= Void then
						a_formal_constraint ?= a_constraint
						if a_formal_constraint = Void then
							if not a_constraint.check_constraint_validity (a_formal, a_class, a_sorter) then
									-- The error has already been reported
									-- in `check_constraint_validity'.
									-- Set `has_ancestors_error' to True to avoid
									-- recursive calls to `check_validity' with the
									-- same class `a_class'.
								a_class.set_ancestors_error
								Result := False
							end
						end
					end
					i := i + 1
				end
				if a_sorter.count > 0 then
					if Result then
						a_sorter.sort
						if a_sorter.has_cycle then
							a_class.error_handler.report_vcfg3g_error (a_class, a_sorter.cycle)
						end
					end
					a_sorter.wipe_out
				end
			end
		end

feature -- Type processing

	resolve_named_types (a_class: ET_CLASS; ast_factory: ET_AST_FACTORY) is
			-- Replace unresolved named types in constraints
			-- of current formal generic parameters of class
			-- `a_class' by corresponding class types or formal
			-- generic parameter name.
		require
			a_class_not_void: a_class /= Void
			ast_factory_not_void: ast_factory /= Void
		local
			i, nb: INTEGER
			a_constrained_formal: ET_CONSTRAINED_FORMAL_GENERIC_PARAMETER
			a_constraint: ET_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_constrained_formal ?= item (i)
				if a_constrained_formal /= Void then
					a_constraint := a_constrained_formal.constraint
					a_constrained_formal.set_constraint (a_constraint.resolved_named_types (a_class, ast_factory))
				end
				i := i + 1
			end
		end

feature -- System

	add_to_system is
			-- Recursively add to system classes that
			-- appear in the constraints.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				item (i).add_to_system
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

	put_first (an_item: like formal_generic_parameter_item) is
			-- Put `an_item' at first position in list.
		do
			precursor (an_item)
			an_item.formal_generic_parameter_item.set_index (capacity - count + 1)
		end

feature {NONE} -- Implementation

	fixed_array: KL_FIXED_ARRAY_ROUTINES [ET_FORMAL_GENERIC_PARAMETER_ITEM] is
			-- Fixed array routines
		once
			!! Result
		end

invariant

	left_bracket_not_void: left_bracket /= Void
	right_bracket_not_void: right_bracket /= Void

end -- class ET_FORMAL_GENERIC_PARAMETERS
