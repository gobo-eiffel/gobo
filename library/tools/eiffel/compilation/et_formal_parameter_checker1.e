indexing

	description:

		"Eiffel formal parameter validity checkers, first pass"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_CHECKER1

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			make,
			process_bit_feature,
			process_bit_n,
			process_class,
			process_class_type,
			process_formal_parameter_type,
			process_generic_class_type,
			process_like_current,
			process_like_feature,
			process_tuple_type
		end

create

	make

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new formal parameter first pass checker.
		do
			precursor (a_universe)
			current_class := a_universe.unknown_class
			create formal_parameter_sorter.make_default
			create direct_formal_parameter_sorter.make_default
		end

feature -- Status report

	has_fatal_error: BOOLEAN
			-- Has a fatal error occurred?

feature -- Validity checking

	check_formal_parameters_validity (a_class: ET_CLASS) is
			-- First pass of the validity check of the formal generic
			-- parameters of `a_class'. Do not try to do any conformance
			-- checking (this is done after the ancestors have been built
			-- during the second pass) nor any checking of creation
			-- procedures of formal parameters (this is done only for
			-- parent types, creation types and expanded types).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
		local
			i, j, nb: INTEGER
			a_parameters: ET_FORMAL_PARAMETER_LIST
			a_formal, other_formal: ET_FORMAL_PARAMETER
			a_name: ET_IDENTIFIER
			other_class: ET_CLASS
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			a_parameters := current_class.formal_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_formal := a_parameters.formal_parameter (i)
					a_name := a_formal.name
					if universe.has_class (a_name) then
							-- The name of a formal parameter cannot be the
							-- name of a class in the universe.
						set_fatal_error
						other_class := universe.eiffel_class (a_name)
						error_handler.report_vcfg1a_error (current_class, a_formal, other_class)
					else
						from j := 1 until j >= i loop
							other_formal := a_parameters.formal_parameter (j)
							if other_formal.name.same_identifier (a_name) then
									-- There are two formal parameters with the same name.
								set_fatal_error
								error_handler.report_vcfg2a_error (current_class, other_formal, a_formal)
							end
							j := j + 1
						end
					end
					check_constraint_validity (a_formal)
					i := i + 1
				end
				check_constraint_cycles
			end
			current_class := old_class
		end

feature {NONE} -- Constraint validity

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether the constraint of `a_formal' is a valid
			-- constraint in `current_class'. Record any dependences
			-- between formal parameters to check for cycles later on.
			-- Do not check whether the actual generic parameters of
			-- the constraint of `a_formal' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_formal_not_void: a_formal /= Void
		local
			a_constraint: ET_TYPE
		do
			a_constraint := a_formal.constraint
			if a_constraint /= Void then
				current_formal := a_formal
				a_constraint.process (Current)
				current_formal := Void
			end
		end

	check_bit_feature_constraint (a_type: ET_BIT_FEATURE; a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_formal_not_void: a_formal /= Void
		do
				-- It is not valid to have "BIT name" in constraints.
			set_fatal_error
			error_handler.report_vcfg3a_error (current_class, a_type)
		end

	check_bit_n_constraint (a_type: ET_BIT_N; a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_formal_not_void: a_formal /= Void
		do
				-- Not considered as a fatal error by gelint.
			error_handler.report_vcfg3b_error (current_class, a_type)
			if a_formal.constraint = a_type then
					-- `a_type' is the constraint of `a_formal'.
					-- Set its base type if valid.
				check bit_types_are_named: a_type.is_named_type end
				a_formal.set_constraint_base_type (a_type)
			end
		end

	check_class_type_constraint (a_type: ET_CLASS_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_formal_not_void: a_formal /= Void
		local
			i, nb: INTEGER
			a_formals: ET_FORMAL_PARAMETER_LIST
			an_actuals: ET_ACTUAL_PARAMETER_LIST
			a_class: ET_CLASS
			l_formal: ET_FORMAL_PARAMETER
			l_actual: ET_TYPE
		do
			a_class := a_type.direct_base_class (universe)
			a_class.process (universe.eiffel_parser)
			if not a_class.is_preparsed then
				set_fatal_error
				error_handler.report_vtct0a_error (current_class, a_type)
			elseif not a_class.is_parsed or else a_class.has_syntax_error then
					-- Error should already have been
					-- reported somewhere else.
				set_fatal_error
			elseif not a_class.is_generic then
				if a_type.is_generic then
					set_fatal_error
					error_handler.report_vtug1a_error (current_class, a_type)
				end
			elseif not a_type.is_generic then
				set_fatal_error
				error_handler.report_vtug2a_error (current_class, a_type)
			else
				a_formals := a_class.formal_parameters
				an_actuals := a_type.actual_parameters
				check
					a_class_generic: a_formals /= Void
					a_type_generic: an_actuals /= Void
				end
				if an_actuals.count /= a_formals.count then
					set_fatal_error
					error_handler.report_vtug2a_error (current_class, a_type)
				else
					nb := an_actuals.count
					from i := 1 until i > nb loop
						l_actual := an_actuals.type (i)
						l_formal := a_formals.formal_parameter (i)
						if l_formal.is_expanded then
							if not l_actual.is_type_expanded (current_class, universe) then
								error_handler.report_gvtcg5b_error (current_class, a_type, l_actual, l_formal)
								set_fatal_error
							end
						elseif l_formal.is_reference then
							if not l_actual.is_type_reference (current_class, universe) then
								error_handler.report_gvtcg5a_error (current_class, a_type, l_actual, l_formal)
								set_fatal_error
							end
						end
						l_actual.process (Current)
						i := i + 1
					end
				end
			end
			if a_formal.constraint = a_type then
					-- `a_type' is the constraint of `a_formal'.
					-- Set its base type if valid.
				if a_type.is_named_type then
					a_formal.set_constraint_base_type (a_type)
				else
					-- The constraint contains anchored types or other
					-- invalid types in its actual generic parameters.
					-- The error has already been reported in one of the
					-- corresponding `check_*_constraint' routines.
				end
			end
		end

	check_formal_parameter_type_constraint (a_type: ET_FORMAL_PARAMETER_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_formal_not_void: a_formal /= Void
		local
			index1, index2: INTEGER
			a_parameters: ET_FORMAL_PARAMETER_LIST
			other_formal: ET_FORMAL_PARAMETER
		do
			index1 := a_type.index
			index2 := a_formal.index
			a_parameters := current_class.formal_parameters
			if a_formal.constraint = a_type then
					-- Check validity when the constraint of `a_formal'
					-- parameter is itself a formal parameter.
				if a_parameters = Void or else index1 > a_parameters.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif index1 = index2 then
						-- The constraint of the formal parameter is
						-- itself (e.g. "A [G -> G]"). This is not
						-- considered as a fatal error by gelint. The
						-- base class of this formal parameter will be
						-- considered to be ANY.
					error_handler.report_vcfg3d_error (current_class, a_formal, a_type)
				elseif index1 < index2 then
						-- This formal is constrained by another formal
						-- parameter appearing before (e.g. "A [G, H -> G]").
						-- This is not considered as a fatal error by gelint.
						-- The base class of this formal parameter will be the
						-- base class of its constraint, or ANY if there is
						-- a cycle (e.g. "A [G -> H, H -> G]").
					other_formal := a_parameters.formal_parameter (index1)
					direct_formal_parameter_sorter.force_relation (other_formal, a_formal)
					formal_parameter_sorter.force_relation (other_formal, a_formal)
					error_handler.report_vcfg3e_error (current_class, a_formal, a_type)
				else
					check last_case: index1 > index2 end
						-- This formal is constrained by another formal
						-- parameter appearing after (e.g. "A [G -> H, H]").
						-- This is not considered as a fatal error by gelint.
						-- The base class of this formal parameter will be the
						-- base class of its constraint, or ANY if there is
						-- a cycle (e.g. "A [G -> H, H -> G]").
					other_formal := a_parameters.formal_parameter (index1)
					direct_formal_parameter_sorter.force_relation (other_formal, a_formal)
					formal_parameter_sorter.force_relation (other_formal, a_formal)
					error_handler.report_vcfg3f_error (current_class, a_formal, a_type)
				end
			else
				if a_parameters = Void or else index1 > a_parameters.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif index1 = index2 then
						-- The constraint of the formal parameter is itself
						-- (e.g. "A [G -> ARRAY [G]]"). This is not considered
						-- as a fatal error by gelint. The base class of this
						-- formal parameter will be the base class of its
						-- constraint ("ARRAY" in the example above).
					error_handler.report_vcfg3h_error (current_class, a_formal, a_type)
				elseif index1 > index2 then
						-- `a_formal' is constrained by another formal parameter
						-- appearing after (e.g. "A [G -> ARRAY [H], H]"). This is not
						-- considered as a fatal error by gelint. The base class of this
						-- formal parameter will be the base class of its constraint
						-- ("ARRAY" in the example above).
					error_handler.report_vcfg3i_error (current_class, a_formal, a_type)
						-- Check for cycles (e.g. "A [G -> ARRAY [H], H -> LIST [G]").
					other_formal := a_parameters.formal_parameter (index1)
					formal_parameter_sorter.force_relation (other_formal, a_formal)
				else
					check last_case: index1 < index2 end
						-- `a_formal' is constrained by another formal parameter
						-- appearing after (e.g. "A [G, H -> LIST [G]]").
						-- Check for cycles (e.g. "A [G -> ARRAY [H], H -> LIST [G]").
					other_formal := a_parameters.formal_parameter (index1)
					formal_parameter_sorter.force_relation (other_formal, a_formal)
				end
			end
		end

	check_like_type_constraint (a_type: ET_LIKE_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_formal_not_void: a_formal /= Void
		do
				-- It is not valid to have anchored types in constraints.
			set_fatal_error
			error_handler.report_vcfg3c_error (current_class, a_type)
		end

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE; a_formal: ET_FORMAL_PARAMETER) is
			-- Check whether `a_type' is valid when appearing in a
			-- constraint of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_formal_not_void: a_formal /= Void
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			i, nb: INTEGER
		do
			a_parameters := a_type.actual_parameters
			if a_parameters /= Void then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_parameters.type (i).process (Current)
					i := i + 1
				end
			end
			if a_formal.constraint = a_type then
					-- `a_type' is the constraint of `a_formal'.
					-- Set its base type if valid.
				if a_type.is_named_type then
					a_formal.set_constraint_base_type (a_type)
				else
					-- The constraint contains anchored types or other
					-- invalid types in its actual generic parameters.
					-- The error has already been reported in one of the
					-- corresponding `check_*_constraint' routines.
				end
			end
		end

feature {NONE} -- Constraint cycles

	check_constraint_cycles is
			-- Check for cycles in the constraints of the formal
			-- generic parameters of `current_class'.
			-- Set `has_fatal_error' if an error occurred.
		local
			a_sorted_formals: DS_ARRAYED_LIST [ET_FORMAL_PARAMETER]
			a_formal: ET_FORMAL_PARAMETER
			a_constraint: ET_FORMAL_PARAMETER_TYPE
			an_index: INTEGER
			a_parameters: ET_FORMAL_PARAMETER_LIST
			a_parameters_count: INTEGER
			a_base_type: ET_BASE_TYPE
			has_cycle: BOOLEAN
			i, nb: INTEGER
			any_type: ET_CLASS_TYPE
		do
			if direct_formal_parameter_sorter.count > 0 then
				direct_formal_parameter_sorter.sort
				if direct_formal_parameter_sorter.has_cycle then
						-- There is a cycle in the formal generic parameter
						-- constraints (e.g. "A [G -> H, H -> G]"). This is
						-- not considered as a fatal error by gelint. The
						-- base class of the formal parameters involved in
						-- this cycle will be considered to be ANY.
					has_cycle := True
					error_handler.report_vcfg3g_error (current_class, direct_formal_parameter_sorter.cycle)
				end
				a_parameters := current_class.formal_parameters
				if a_parameters = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					any_type := universe.any_class
					a_parameters_count := a_parameters.count
					a_sorted_formals := direct_formal_parameter_sorter.sorted_items
					nb := a_sorted_formals.count
					from i := 1 until i > nb loop
						a_formal := a_sorted_formals.item (i)
						a_constraint ?= a_formal.constraint
						if a_constraint /= Void then
							an_index := a_constraint.index
							if an_index > a_parameters_count then
									-- Internal error.
								set_fatal_error
								error_handler.report_giaaa_error
							else
									-- We have "G -> H" and the base type of
									-- H has already been processed (thanks to
									-- the topological sort). So the base type
									-- of G is the base type of H.
								a_base_type := a_parameters.formal_parameter (an_index).constraint_base_type
								if a_base_type /= Void then
									a_formal.set_constraint_base_type (a_base_type)
								else
									a_formal.set_constraint_base_type (any_type)
								end
							end
						end
						i := i + 1
					end
				end
				direct_formal_parameter_sorter.wipe_out
			end
			if formal_parameter_sorter.count > 0 then
				formal_parameter_sorter.sort
				if formal_parameter_sorter.has_cycle and not has_cycle then
						-- There is a cycle in the formal generic parameter
						-- constraints (e.g. "A [G -> ARRAY [H], H -> LIST [G]]"
						-- or "B [G -> ARRAY [H], H -> G]"). This is not considered
						-- as a fatal error by gelint. The base class of the formal
						-- parameters involved in this cycle will be the base class
						-- of the constraint if it is not a formal parameter, or
						-- recursively (there is no infinite loop because we already
						-- took care of the case were the cycle only involves formal
						-- parameters) the base class of its constraint if the
						-- constraint is itself a formal parameter.
					error_handler.report_vcfg3j_error (current_class, formal_parameter_sorter.cycle)
				end
				formal_parameter_sorter.wipe_out
			end
		end

	formal_parameter_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER]
			-- Formal generic parameter sorter to detect cycles
			-- of the form "A [G -> ARRAY [H], H -> LIST [G]]"

	direct_formal_parameter_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_FORMAL_PARAMETER]
			-- Formal generic parameter sorter to detect cycles
			-- of the form "A [G -> H, H -> G]"

feature {ET_AST_NODE} -- Type dispatcher

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			if current_formal /= Void then
				check_bit_feature_constraint (a_type, current_formal)
			end
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		do
			if current_formal /= Void then
				check_bit_n_constraint (a_type, current_formal)
			end
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			if current_formal /= Void then
				check_class_type_constraint (a_type, current_formal)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Process `a_type'.
		do
			if current_formal /= Void then
				check_formal_parameter_type_constraint (a_type, current_formal)
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_type (a_type: ET_LIKE_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			if current_formal /= Void then
				check_like_type_constraint (a_type, current_formal)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			if current_formal /= Void then
				check_tuple_type_constraint (a_type, current_formal)
			end
		end

feature {NONE} -- Error handling

	set_fatal_error is
			-- Report a fatal error.
		do
			has_fatal_error := True
		ensure
			has_fatal_error: has_fatal_error
		end

feature {NONE} -- Access

	current_class: ET_CLASS
			-- Class being processed

	current_formal: ET_FORMAL_PARAMETER
			-- Formal generic parameter being processed

invariant

	current_class_not_void: current_class /= Void
	formal_parameter_sorter_not_void: formal_parameter_sorter /= Void
	direct_formal_parameter_sorter_not_void: direct_formal_parameter_sorter /= Void

end
