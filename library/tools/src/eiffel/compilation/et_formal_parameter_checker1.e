note

	description:

		"Eiffel formal parameter validity checkers, first pass"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2019, Eric Bezault and others"
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
			create all_base_types.make (20)
			create formal_dependencies.make (100)
			create base_type_dependencies.make (100)
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
				initalize_formal_dependencies (nb)
				all_base_types.wipe_out
				base_type_dependencies.wipe_out
					-- Add "detachable ANY" in `all_base_types' at index 1.
				all_base_types.force_last (current_universe.detachable_any_type)
				from i := 1 until i > nb loop
					base_type_dependencies.force_last (No_dependency)
					i := i + 1
				end
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
				set_constraint_base_types (a_parameters)
				formal_dependencies.wipe_out
				all_base_types.wipe_out
				base_type_dependencies.wipe_out
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
		local
			l_constraint: ET_CONSTRAINT
			l_type_constraint: ET_TYPE_CONSTRAINT
			i, nb: INTEGER
		do
			if attached {ET_CONSTRAINED_FORMAL_PARAMETER} a_formal as l_constrained_formal then
				current_formal := l_constrained_formal
				l_constraint := l_constrained_formal.constraint
				nb := l_constraint.count
				from i := 1 until i > nb loop
					l_type_constraint := l_constraint.type_constraint (i)
					current_type_constraint := l_type_constraint
					l_type_constraint.type.process (Current)
					i := i + 1
				end
				current_type_constraint := Void
				current_formal := Void
			else
					-- "detachable ANY" is at index 1 in `all_base_types'.
				base_type_dependencies.replace (Detachable_type_mark, a_formal.index)
			end
		end

	check_class_type_constraint (a_type: ET_CLASS_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Check whether `a_type' is valid when appearing in a constraint
			-- `a_type_constraint' of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_type_constraint_not_void: a_type_constraint /= Void
			a_formal_not_void: a_formal /= Void
		local
			i, nb: INTEGER
			a_class: ET_CLASS
			l_formal: ET_FORMAL_PARAMETER
			l_actual: ET_TYPE
			l_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT
			l_value: INTEGER
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
			if a_type_constraint.type = a_type then
					-- `a_type' is one of the constraints of `a_formal'.
					-- Set its base type if valid.
				if a_type.is_named_type then
						-- Add this base type to `all_base_types'.
					if attached a_type_constraint.renames as l_renames then
						create l_type_rename_constraint.make (a_type, l_renames)
						all_base_types.force_last (l_type_rename_constraint)
					else
						all_base_types.force_last (a_type)
					end
					nb := current_class.formal_parameter_count
					from i := 1 until i > nb loop
						base_type_dependencies.force_last (No_dependency)
						i := i + 1
					end
						-- Add constraint dependency between `a_formal'
						-- and this base type.
					if a_type.is_attached then
						l_value := Attached_type_mark
					else
						l_value := Detachable_type_mark
					end
					base_type_dependencies.replace (l_value, (all_base_types.count - 1) * nb + a_formal.index)
				else
					-- The constraint contains anchored types or other
					-- invalid types in its actual generic parameters.
					-- The error has already been reported in one of the
					-- corresponding `check_*_constraint' routines.
				end
			end
		end

	check_formal_parameter_type_constraint (a_type: ET_FORMAL_PARAMETER_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Check whether `a_type' is valid when appearing in a constraint
			-- `a_type_constraint' of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_type_constraint_not_void: a_type_constraint /= Void
			a_formal_not_void: a_formal /= Void
		local
			index1, index2: INTEGER
			a_parameters: detachable ET_FORMAL_PARAMETER_LIST
			other_formal: ET_FORMAL_PARAMETER
			l_value: INTEGER
		do
			index1 := a_type.index
			index2 := a_formal.index
			a_parameters := current_class.formal_parameters
			if a_type_constraint.type = a_type then
					-- Check validity when the constraint of `a_formal'
					-- parameter is itself a formal parameter.
				if a_parameters = Void or else index1 > a_parameters.count then
						-- Internal error.
					set_fatal_error
					error_handler.report_giaaa_error
				else
					if not attached a_type.type_mark as l_type_mark then
						l_value := No_type_mark
					elseif l_type_mark.is_attached_mark then
						l_value := Attached_type_mark
					elseif l_type_mark.is_detachable_mark then
						l_value := Detachable_type_mark
					else
						l_value := No_type_mark
					end
					formal_dependencies.replace (l_value, (index2 - 1) * a_parameters.count + index1)
					if index1 = index2 then
							-- The constraint of the formal parameter is
							-- itself (e.g. "A [G -> G]"). This is not
							-- considered as a fatal error by gelint. The
							-- base class of this formal parameter will be
							-- considered to be "detachable ANY".
						if system_processor.older_or_same_ise_version (ise_6_1_latest) then
							error_handler.report_vcfg3b_error (current_class, a_formal, a_type)
						end
						a_formal.set_has_constraint_cycle (True)
					elseif index1 < index2 then
							-- This formal is constrained by another formal
							-- parameter appearing before (e.g. "A [G, H -> G]").
							-- This is not considered as a fatal error by gelint.
							-- The base class of this formal parameter will be the
							-- base class of its constraint, or "detachable ANY"
							-- if there is a cycle (e.g. "A [G -> H, H -> G]").
						other_formal := a_parameters.formal_parameter (index1)
						if attached {ET_CONSTRAINED_FORMAL_PARAMETER} other_formal as l_other_constrained_formal then
							direct_formal_parameter_sorter.force_relation (l_other_constrained_formal, a_formal)
						end
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
						if attached {ET_CONSTRAINED_FORMAL_PARAMETER} other_formal as l_other_constrained_formal then
							direct_formal_parameter_sorter.force_relation (l_other_constrained_formal, a_formal)
						end
						formal_parameter_sorter.force_relation (other_formal, a_formal)
						if system_processor.older_or_same_ise_version (ise_6_1_latest) then
							error_handler.report_vcfg3d_error (current_class, a_formal, a_type)
						end
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

	check_like_type_constraint (a_type: ET_LIKE_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Check whether `a_type' is valid when appearing in a constraint
			-- `a_type_constraint' of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_type_constraint_not_void: a_type_constraint /= Void
			a_formal_not_void: a_formal /= Void
		do
				-- It is not valid to have anchored types in constraints.
			set_fatal_error
			error_handler.report_vcfg3a_error (current_class, a_type)
		end

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Check whether `a_type' is valid when appearing in a constraint
			-- `a_type_constraint' of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters to check for
			-- cycles later on. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_type_constraint_not_void: a_type_constraint /= Void
			a_formal_not_void: a_formal /= Void
		local
			i, nb: INTEGER
			l_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT
			l_value: INTEGER
		do
			if attached a_type.actual_parameters as a_parameters then
				nb := a_parameters.count
				from i := 1 until i > nb loop
					a_parameters.type (i).process (Current)
					i := i + 1
				end
			end
			if a_type_constraint.type = a_type then
					-- `a_type' is one of the constraints of `a_formal'.
					-- Set its base type if valid.
				if a_type.is_named_type then
						-- Add this base type to `all_base_types'.
					if attached a_type_constraint.renames as l_renames then
						create l_type_rename_constraint.make (a_type, l_renames)
						all_base_types.force_last (l_type_rename_constraint)
					else
						all_base_types.force_last (a_type)
					end
					nb := current_class.formal_parameter_count
					from i := 1 until i > nb loop
						base_type_dependencies.force_last (No_dependency)
						i := i + 1
					end
						-- Add constraint dependency between `a_formal'
						-- and this base type.
					if a_type.is_attached then
						l_value := Attached_type_mark
					else
						l_value := Detachable_type_mark
					end
					base_type_dependencies.replace (l_value, (all_base_types.count - 1) * nb + a_formal.index)
				else
					-- The constraint contains anchored types or other
					-- invalid types in its actual generic parameters.
					-- The error has already been reported in one of the
					-- corresponding `check_*_constraint' routines.
				end
			end
		end

	set_constraint_base_types (a_formal_parameters: ET_FORMAL_PARAMETER_LIST)
			-- Set 'constraint_base_types' of all formal generic
			-- parameters in `a_formal_parameters'.
			-- Resolve recursive constraint dependencies (such
			-- as "G -> H")if any.
		require
			a_formal_parameters_not_void: a_formal_parameters /= Void
		local
			i: INTEGER
			l_index_g: INTEGER
			l_index_h: INTEGER
			l_formal_count: INTEGER
			l_all_base_type_count: INTEGER
			l_formal_dependency: INTEGER
			l_value_g: INTEGER
			l_value_h: INTEGER
			l_done: BOOLEAN
			l_no_base_type_dependency: BOOLEAN
			l_type_constraint: ET_BASE_TYPE_CONSTRAINT
			l_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT
			l_base_type: ET_BASE_TYPE
			l_count: INTEGER
			l_base_type_list: ET_BASE_TYPE_CONSTRAINT_LIST
		do
			l_all_base_type_count := all_base_types.count
			l_formal_count := a_formal_parameters.count
			from
			until
				l_done
			loop
				l_done := True
					-- Follow formal dependencies "G -> H".
				from l_index_g := 1 until l_index_g > l_formal_count loop
					from l_index_h := 1 until l_index_h > l_formal_count loop
						l_formal_dependency := formal_dependencies.item ((l_index_g - 1) * l_formal_count + l_index_h)
						if l_formal_dependency /= No_dependency then
							from i := 1 until i > l_all_base_type_count loop
								l_value_g := base_type_dependencies.item ((i - 1) * l_formal_count + l_index_g)
								l_value_h := base_type_dependencies.item ((i - 1) * l_formal_count + l_index_h)
								if l_value_h /= No_dependency then
									if l_formal_dependency = Attached_type_mark then
										l_value_h := Attached_type_mark
									elseif l_formal_dependency = Detachable_type_mark then
										if not all_base_types.item (i).type.is_expanded then
											l_value_h := Detachable_type_mark
										end
									end
									if l_value_h > l_value_g then
										base_type_dependencies.replace (l_value_h, (i - 1) * l_formal_count + l_index_g)
										l_done := False
									end
								end
								i := i + 1
							end
						end
						l_index_h := l_index_h + 1
					end
					l_index_g := l_index_g + 1
				end
				if l_done then
						-- Try to find formal parameters with no entry in
						-- `base_type_dependencies' yet. This may happen
						-- in case of single constraints with cycles
						-- (e.g. "G -> H, H -> G", or "G -> G"). In that
						-- case, the base type will be "detachable ANY",
						-- which is a index 1 in `all_base_types'.
					from l_index_g := 1 until l_index_g > l_formal_count loop
						l_no_base_type_dependency := True
						from i := 1 until i > l_all_base_type_count loop
							if base_type_dependencies.item ((i - 1) * l_formal_count + l_index_g) /= No_dependency then
								l_no_base_type_dependency := False
								i := l_all_base_type_count -- Jump out of the loop.
							end
							i := i + 1
						end
						if l_no_base_type_dependency then
								-- "detachable ANY" is at index 1 in `all_base_types'.
							base_type_dependencies.replace (Detachable_type_mark, l_index_g)
							l_done := False
							l_index_g := l_formal_count -- Jump out of the loop.
						end
						l_index_g := l_index_g + 1
					end
				end
			end
			from l_index_g := 1 until l_index_g > l_formal_count loop
				if attached {ET_CONSTRAINED_FORMAL_PARAMETER} a_formal_parameters.formal_parameter (l_index_g) as l_constrained_formal then
					from i := 1 until i > l_all_base_type_count loop
						l_type_constraint := all_base_types.item (i)
						l_base_type := l_type_constraint.type
						l_value_g := base_type_dependencies.item ((i - 1) * l_formal_count + l_index_g)
						if l_value_g = Attached_type_mark then
							if l_base_type.is_attached then
								all_base_types.force_last (l_type_constraint)
							else
								l_base_type := l_base_type.type_with_type_mark (tokens.attached_keyword)
								if attached l_type_constraint.renames as l_renames then
									create l_type_rename_constraint.make (l_base_type, l_renames)
									all_base_types.force_last (l_type_rename_constraint)
								else
									all_base_types.force_last (l_base_type)
								end
							end
						elseif l_value_g = Detachable_type_mark then
							if l_base_type.is_attached then
								l_base_type := l_base_type.type_with_type_mark (tokens.detachable_keyword)
								if attached l_type_constraint.renames as l_renames then
									create l_type_rename_constraint.make (l_base_type, l_renames)
									all_base_types.force_last (l_type_rename_constraint)
								else
									all_base_types.force_last (l_base_type)
								end
							else
								all_base_types.force_last (l_type_constraint)
							end
						end
						i := i + 1
					end
					l_count := all_base_types.count - l_all_base_type_count
					if l_count = 0 then
						-- Should never happen.
					elseif l_count = 1 then
						l_constrained_formal.set_constraint_base_types (all_base_types.last)
					else
						from
							create l_base_type_list.make_with_capacity (all_base_types.item (l_count), l_count)
							l_count := l_count - 1
						until
							l_count = 0
						loop
							l_base_type_list.put_first (all_base_types.item (l_count))
							l_count := l_count - 1
						end
						l_constrained_formal.set_constraint_base_types (l_base_type_list)
					end
					all_base_types.keep_first (l_all_base_type_count)
				end
				l_index_g := l_index_g + 1
			end
		end

feature {NONE} -- Constraint cycles

	check_constraint_cycles
			-- Check for cycles in the constraints of the formal
			-- generic parameters of `current_class'.
			-- Set `has_fatal_error' if an error occurred.
		local
			has_cycle: BOOLEAN
			i, nb: INTEGER
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
					nb := l_cycle.count
					from i := 1 until i > nb loop
						l_cycle.item (i).set_has_constraint_cycle (True)
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

	direct_formal_parameter_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_CONSTRAINED_FORMAL_PARAMETER]
			-- Formal generic parameter sorter to detect cycles
			-- of the form "A [G -> H, H -> G]"

feature {NONE} -- Implementation

	initalize_formal_dependencies (a_formal_parameter_count: INTEGER)
			-- Initialize `formal_dependencies' for
			-- `a_formal_parameter_count' formal parameters.
		require
			a_formal_parameter_count_not_negative: a_formal_parameter_count >= 0
		local
			i, nb: INTEGER
		do
			formal_dependencies.wipe_out
			nb := a_formal_parameter_count * a_formal_parameter_count
			from i := 1 until i > nb loop
				formal_dependencies.force_last (No_dependency)
				i := i + 1
			end
		end

feature {ET_AST_NODE} -- Type dispatcher

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			process_class_type (a_class)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached current_formal as l_current_formal and attached current_type_constraint as l_current_type_constraint then
				check_class_type_constraint (a_type, l_current_type_constraint, l_current_formal)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		do
			if attached current_formal as l_current_formal and attached current_type_constraint as l_current_type_constraint then
				check_formal_parameter_type_constraint (a_type, l_current_type_constraint, l_current_formal)
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
			if attached current_formal as l_current_formal and attached current_type_constraint as l_current_type_constraint then
				check_like_type_constraint (a_type, l_current_type_constraint, l_current_formal)
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
			if attached current_formal as l_current_formal and attached current_type_constraint as l_current_type_constraint then
				check_tuple_type_constraint (a_type, l_current_type_constraint, l_current_formal)
			end
		end

feature {NONE} -- Access

	all_base_types: DS_ARRAYED_LIST [ET_BASE_TYPE_CONSTRAINT]
			-- List of all base types of all formal generic parameters
			-- of the class being processed

	formal_dependencies: DS_ARRAYED_LIST [INTEGER]
			-- Constraint dependencies between formal parameters
			-- (when we have something like that: "G -> H").
			-- Indexing: (index_of_G - 1) * number_of_formal_parameters + index_of_H
			-- Values:
			--   No_dependency: no dependency between "G" and "H"
			--   Attached_type_mark: "G -> attached H"
			--   Detachable_type_mark: "G -> detachable H"
			--   No_type_mark: "G -> H"

	base_type_dependencies: DS_ARRAYED_LIST [INTEGER]
			-- Constraint dependencies between a formal paramater
			-- and a base type (when we have something like "G -> FOO")
			-- Indexing: (index_of_FOO_in_all_base_types - 1) * number_of_formal_parameters + index_of_G
			-- Values:
			--   No_dependency: no dependency between "G" and "FOO"
			--   Attached_type_mark: "G -> attached FOO" (or just "G -> FOO" if "FOO" is attached)
			--   Detachable_type_mark: "G -> detachable FOO" (or just "G -> FOO" if "FOO" is detachable)	

	current_formal: detachable ET_CONSTRAINED_FORMAL_PARAMETER
			-- Formal generic parameter being processed

	current_type_constraint: detachable ET_TYPE_CONSTRAINT
			-- Type constraint being processed

feature {NONE} -- Constants

	No_dependency: INTEGER = 0
	Detachable_type_mark: INTEGER = 1
	Attached_type_mark: INTEGER = 2
	No_type_mark: INTEGER = 3

invariant

	formal_parameter_sorter_not_void: formal_parameter_sorter /= Void
	direct_formal_parameter_sorter_not_void: direct_formal_parameter_sorter /= Void
	all_base_types_not_void: all_base_types /= Void
	no_void_base_type: not all_base_types.has_void
	formal_dependencies_not_void: formal_dependencies /= Void
	base_type_dependencies_not_void: base_type_dependencies /= Void

end
