note

	description:

		"Eiffel formal parameter validity checkers, first pass"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FORMAL_PARAMETER_CHECKER1

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class,
			process_class_type,
			process_formal_parameter_type,
			process_like_current,
			process_like_feature,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_tuple_type
		end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new formal parameter first pass checker.
		do
			precursor (a_system_processor)
			create formal_parameter_sorter.make_default
			create direct_formal_parameter_sorter.make_default
		end

feature -- Validity checking

	check_formal_parameters_validity (a_class: ET_CLASS)
			-- First pass of the validity check of the formal generic
			-- parameters of `a_class'. Do not try to do any conformance
			-- checking (this is done after the ancestors have been built
			-- during the second pass) nor any checking of creation
			-- procedures of formal parameters (this is done only for
			-- parent types, creation types and expanded types).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			i, j, nb: INTEGER
			a_formal, other_formal: ET_FORMAL_PARAMETER
			a_name: ET_IDENTIFIER
			other_class: ET_CLASS
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			if attached current_class.formal_parameters as a_parameters then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_formal := a_parameters.formal_parameter (i)
					a_name := a_formal.name
					if current_universe.has_master_class (a_name) then
							-- The name of a formal parameter cannot be the
							-- name of a class in the universe.
						set_fatal_error
						other_class := current_universe.master_class (a_name).actual_class
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

	check_constraint_validity (a_formal: ET_FORMAL_PARAMETER)
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
		do
			if attached a_formal.constraint as a_constraint then
				current_formal := a_formal
				a_constraint.process (Current)
				current_formal := Void
			end
		end

	check_class_type_constraint (a_type: ET_CLASS_TYPE; a_formal: ET_FORMAL_PARAMETER)
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
			a_class: ET_CLASS
			l_formal: ET_FORMAL_PARAMETER
			l_actual: ET_TYPE
		do
			a_class := a_type.base_class
			a_class.process (system_processor.eiffel_parser)
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
			else
				a_type.resolve_unfolded_tuple_actual_parameters_1 (current_universe)
				if not a_type.is_generic then
					set_fatal_error
					error_handler.report_vtug2a_error (current_class, a_type)
				elseif not attached a_class.formal_parameters as a_formals then
						-- Internal error: `a_class' is generic.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif not attached a_type.actual_parameters as an_actuals then
						-- Internal error: `a_types' is generic.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif an_actuals.count /= a_formals.count then
					set_fatal_error
					error_handler.report_vtug2a_error (current_class, a_type)
				else
					nb := an_actuals.count
					from i := 1 until i > nb loop
						l_actual := an_actuals.type (i)
						l_actual.process (Current)
						l_formal := a_formals.formal_parameter (i)
						if l_formal.is_expanded then
							if not l_actual.is_type_expanded (current_class) then
								set_fatal_error
								error_handler.report_gvtcg5b_error (current_class, current_class, a_type, l_actual, l_formal)
							end
						elseif l_formal.is_reference then
							if not l_actual.is_type_reference (current_class) then
								set_fatal_error
								error_handler.report_gvtcg5a_error (current_class, current_class, a_type, l_actual, l_formal)
							end
						end
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

	check_formal_parameter_type_constraint (a_type: ET_FORMAL_PARAMETER_TYPE; a_formal: ET_FORMAL_PARAMETER)
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
			a_parameters: detachable ET_FORMAL_PARAMETER_LIST
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
						-- considered to be "detachable ANY".
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3b_error (current_class, a_formal, a_type)
					end
				elseif index1 < index2 then
						-- This formal is constrained by another formal
						-- parameter appearing before (e.g. "A [G, H -> G]").
						-- This is not considered as a fatal error by gelint.
						-- The base class of this formal parameter will be the
						-- base class of its constraint, or "detachable ANY"
						-- if there is a cycle (e.g. "A [G -> H, H -> G]").
					other_formal := a_parameters.formal_parameter (index1)
					direct_formal_parameter_sorter.force_relation (other_formal, a_formal)
					formal_parameter_sorter.force_relation (other_formal, a_formal)
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3c_error (current_class, a_formal, a_type)
					end
				else
					check last_case: index1 > index2 end
						-- This formal is constrained by another formal
						-- parameter appearing after (e.g. "A [G -> H, H]").
						-- This is not considered as a fatal error by gelint.
						-- The base class of this formal parameter will be the
						-- base class of its constraint, or "detachable ANY "
						-- if there is a cycle (e.g. "A [G -> H, H -> G]").
					other_formal := a_parameters.formal_parameter (index1)
					direct_formal_parameter_sorter.force_relation (other_formal, a_formal)
					formal_parameter_sorter.force_relation (other_formal, a_formal)
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3d_error (current_class, a_formal, a_type)
					end
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
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3f_error (current_class, a_formal, a_type)
					end
				elseif index1 > index2 then
						-- `a_formal' is constrained by another formal parameter
						-- appearing after (e.g. "A [G -> ARRAY [H], H]"). This is not
						-- considered as a fatal error by gelint. The base class of this
						-- formal parameter will be the base class of its constraint
						-- ("ARRAY" in the example above).
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3g_error (current_class, a_formal, a_type)
					end
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

	check_like_type_constraint (a_type: ET_LIKE_TYPE; a_formal: ET_FORMAL_PARAMETER)
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
			error_handler.report_vcfg3a_error (current_class, a_type)
		end

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE; a_formal: ET_FORMAL_PARAMETER)
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
		do
			if attached a_type.actual_parameters as a_parameters then
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

	check_constraint_cycles
			-- Check for cycles in the constraints of the formal
			-- generic parameters of `current_class'.
			-- Set `has_fatal_error' if an error occurred.
		local
			a_formal: ET_FORMAL_PARAMETER
			an_index: INTEGER
			a_parameters: detachable ET_FORMAL_PARAMETER_LIST
			a_parameters_count: INTEGER
			a_base_type: detachable ET_BASE_TYPE
			has_cycle: BOOLEAN
			i, nb: INTEGER
			l_detachable_any_type: ET_CLASS_TYPE
		do
			if direct_formal_parameter_sorter.count > 0 then
				direct_formal_parameter_sorter.sort
				if attached direct_formal_parameter_sorter.cycle as l_cycle then
					check has_cycle: attached direct_formal_parameter_sorter.has_cycle end
						-- There is a cycle in the formal generic parameter
						-- constraints (e.g. "A [G -> H, H -> G]"). This is
						-- not considered as a fatal error by gelint. The
						-- base class of the formal parameters involved in
						-- this cycle will be considered to be "detachable ANY".
					has_cycle := True
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3e_error (current_class, l_cycle)
					end
				end
				a_parameters := current_class.formal_parameters
				if a_parameters = Void then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				elseif not attached direct_formal_parameter_sorter.sorted_items as a_sorted_formals then
						-- Internal error: the postcondition of `sort' in DS_TOPOLOGICAL_SORTER
						-- says that `sorted_item' should nto be void.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					l_detachable_any_type := current_universe.detachable_any_type
					a_parameters_count := a_parameters.count
					nb := a_sorted_formals.count
					from i := 1 until i > nb loop
						a_formal := a_sorted_formals.item (i)
						if attached {ET_FORMAL_PARAMETER_TYPE} a_formal.constraint as a_constraint then
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
									a_formal.set_constraint_base_type (l_detachable_any_type)
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
				if attached formal_parameter_sorter.cycle as l_cycle and not has_cycle then
					check has_cycle: formal_parameter_sorter.has_cycle end
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
					if system_processor.older_or_same_ise_version (ise_6_1_latest) then
						error_handler.report_vcfg3h_error (current_class, l_cycle)
					end
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

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached current_formal as l_current_formal then
				check_class_type_constraint (a_type, l_current_formal)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		do
			if attached current_formal as l_current_formal then
				check_formal_parameter_type_constraint (a_type, l_current_formal)
			end
		end

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_like_type (a_type: ET_LIKE_TYPE)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			if attached current_formal as l_current_formal then
				check_like_type_constraint (a_type, l_current_formal)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_like_type (a_type)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached current_formal as l_current_formal then
				check_tuple_type_constraint (a_type, l_current_formal)
			end
		end

feature {NONE} -- Access

	current_formal: detachable ET_FORMAL_PARAMETER
			-- Formal generic parameter being processed

invariant

	formal_parameter_sorter_not_void: formal_parameter_sorter /= Void
	direct_formal_parameter_sorter_not_void: direct_formal_parameter_sorter /= Void

end
