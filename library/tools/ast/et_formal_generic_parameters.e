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
								a_class.set_ancestors_error (True)
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
			a_formal: ET_FORMAL_GENERIC_PARAMETER
			a_constraint: ET_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				a_formal := item (i)
				a_constraint := a_formal.constraint
				if a_constraint /= Void then
					a_formal.set_constraint (a_constraint.resolved_named_types (a_class, ast_factory))
				end
				i := i + 1
			end
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
