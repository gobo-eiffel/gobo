note

	description:

		"Eiffel formal parameter validity checkers, first pass"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2023, Eric Bezault and others"
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
			create all_base_types.make (20)
			create base_types.make (10)
			create formal_dependencies.make (100)
			create base_type_dependencies.make (100)
			create recursive_formal_constraints.make (10)
			create recursive_formal_constraints_to_be_processed.make (10)
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
				initalize_base_type_dependencies (nb)
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
				propagate_recursive_formal_dependencies (a_parameters)
				set_recursive_formal_constraints (a_parameters)
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
			-- between formal parameters and base types for later use.
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
			-- any dependences between formal parameters and base types
			-- for later use. Do not check whether the actual generic
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
					add_base_type_dependency (a_type, a_type_constraint, a_formal)
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
			-- any dependences between formal parameters and base types
			-- for later use. Do not check whether the actual generic
			-- parameters of `a_type' conform to their corresponding
			-- formal parameters' constraints (this is done after the
			-- ancestors for the involved classes have been built).
			-- Set `has_fatal_error' if an error occurred.
		require
			a_type_not_void: a_type /= Void
			a_type_constraint_not_void: a_type_constraint /= Void
			a_formal_not_void: a_formal /= Void
		local
			l_index_g, l_index_h: INTEGER
			l_value: INTEGER
		do
			if a_type_constraint.type = a_type then
					-- Check validity when the constraint of `a_formal'
					-- parameter is itself a formal parameter.
					-- We have "G -> H".
				l_index_h := a_type.index
				l_index_g := a_formal.index
				if not attached a_type.type_mark as l_type_mark then
					l_value := No_type_mark
				elseif l_type_mark.is_attached_mark then
					l_value := Attached_type_mark
				elseif l_type_mark.is_detachable_mark then
					l_value := Detachable_type_mark
				else
					l_value := No_type_mark
				end
				formal_dependencies.replace (l_value, (l_index_g - 1) * current_class.formal_parameter_count + l_index_h)
			end
		end

	check_like_type_constraint (a_type: ET_LIKE_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Check whether `a_type' is valid when appearing in a constraint
			-- `a_type_constraint' of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters and base types
			-- for later use. Do not check whether the actual generic
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
			error_handler.report_vggc1a_error (current_class, a_type)
		end

	check_tuple_type_constraint (a_type: ET_TUPLE_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Check whether `a_type' is valid when appearing in a constraint
			-- `a_type_constraint' of `a_formal' in `current_class'. Record
			-- any dependences between formal parameters and base types
			-- for later use. Do not check whether the actual generic
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
					add_base_type_dependency (a_type, a_type_constraint, a_formal)
				else
					-- The constraint contains anchored types or other
					-- invalid types in its actual generic parameters.
					-- The error has already been reported in one of the
					-- corresponding `check_*_constraint' routines.
				end
			end
		end

feature {NONE} -- Base type constraints

	initalize_formal_dependencies (a_formal_parameter_count: INTEGER)
			-- Initialize `formal_dependencies' for
			-- `a_formal_parameter_count' formal parameters.
		require
			a_formal_parameter_count_not_negative: a_formal_parameter_count >= 0
		do
			formal_dependencies.wipe_out
			add_n_items_to_list (No_dependency, a_formal_parameter_count * a_formal_parameter_count, formal_dependencies)
		end

	initalize_base_type_dependencies (a_formal_parameter_count: INTEGER)
			-- Initialize `base_type_dependencies' for
			-- `a_formal_parameter_count' formal parameters.
		require
			a_formal_parameter_count_not_negative: a_formal_parameter_count >= 0
		do
			all_base_types.wipe_out
			base_type_dependencies.wipe_out
				-- Add "detachable ANY" in `all_base_types' at index 1.
			all_base_types.force_last (current_universe.detachable_separate_any_type)
			add_n_items_to_list (No_dependency, a_formal_parameter_count, base_type_dependencies)
		end

	add_base_type_dependency (a_base_type: ET_BASE_TYPE; a_type_constraint: ET_TYPE_CONSTRAINT; a_formal: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Record `a_base_type', appearing in a constraint `a_type_constraint'
			-- of `a_formal' in `current_class', in `all_base_types' and add
			-- dependency between `a_formal' and this base type.
		require
			a_base_type_not_void: a_base_type /= Void
			a_base_type_is_named_type: a_base_type.is_named_type
			a_type_constraint_not_void: a_type_constraint /= Void
			a_formal_not_void: a_formal /= Void
		local
			nb: INTEGER
			l_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT
			l_value: INTEGER
		do
				-- Add this base type to `all_base_types'.
			if attached a_type_constraint.renames as l_renames then
				create l_type_rename_constraint.make (a_base_type, l_renames)
				all_base_types.force_last (l_type_rename_constraint)
			else
				all_base_types.force_last (a_base_type)
			end
			nb := current_class.formal_parameter_count
			add_n_items_to_list (No_dependency, nb, base_type_dependencies)
				-- Add constraint dependency between `a_formal'
				-- and this base type.
			if a_base_type.is_attached then
				l_value := Attached_type_mark
			else
				l_value := Detachable_type_mark
			end
			base_type_dependencies.replace (l_value, (all_base_types.count - 1) * nb + a_formal.index)
		end

	propagate_recursive_formal_dependencies (a_formal_parameters: ET_FORMAL_PARAMETER_LIST)
			-- Recursively propagate constraint dependencies between formal parameters
			-- of `a_formal_parameters' if any (such as "[G -> H, H -> FOO]" where "FOO"
			-- becomes a base type constraint for "G").
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
						-- which is at index 1 in `all_base_types'.
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
		end

	set_recursive_formal_constraints (a_formal_parameters: ET_FORMAL_PARAMETER_LIST)
			-- Set 'recursive_formal_constraints' of all formal generic
			-- parameters in `a_formal_parameters'.
		require
			a_formal_parameters_not_void: a_formal_parameters /= Void
		local
			l_index_g: INTEGER
			l_index_h: INTEGER
			l_index_k: INTEGER
			l_formal_count: INTEGER
			l_value_h: NATURAL_32
			l_value_k: INTEGER
			l_done: BOOLEAN
			l_all_zeros: BOOLEAN
			l_dependencies: SPECIAL [NATURAL_32]
		do
			l_formal_count := a_formal_parameters.count
			from l_index_g := 1 until l_index_g > l_formal_count loop
				if attached {ET_CONSTRAINED_FORMAL_PARAMETER} a_formal_parameters.formal_parameter (l_index_g) as l_constrained_formal then
					recursive_formal_constraints.wipe_out
					add_n_flags_to_list (0, l_formal_count, recursive_formal_constraints)
					recursive_formal_constraints_to_be_processed.wipe_out
					add_n_flags_to_list (0, l_formal_count, recursive_formal_constraints_to_be_processed)
					recursive_formal_constraints_to_be_processed.replace ({ET_FORMAL_PARAMETER}.No_type_mark, l_index_g)
					from
						l_done := False
					until
						l_done
					loop
						l_done := True
						from l_index_h := 1 until l_index_h > l_formal_count loop
							l_value_h := recursive_formal_constraints_to_be_processed.item (l_index_h)
							if l_value_h /= 0 then
								from l_index_k := 1 until l_index_k > l_formal_count loop
									l_value_k := formal_dependencies.item ((l_index_h - 1) * l_formal_count + l_index_k)
									if l_value_h & {ET_FORMAL_PARAMETER}.No_type_mark = {ET_FORMAL_PARAMETER}.No_type_mark then
											-- No type mark.
										recursive_formal_constraints_to_be_processed.replace (l_value_h.bit_xor ({ET_FORMAL_PARAMETER}.No_type_mark), l_index_h)
										if l_value_k = No_type_mark then
											if recursive_formal_constraints.item (l_index_k) & {ET_FORMAL_PARAMETER}.No_type_mark /= {ET_FORMAL_PARAMETER}.No_type_mark then
												recursive_formal_constraints.replace (recursive_formal_constraints.item (l_index_k) | {ET_FORMAL_PARAMETER}.No_type_mark, l_index_k)
												recursive_formal_constraints_to_be_processed.replace (recursive_formal_constraints_to_be_processed.item (l_index_k) | {ET_FORMAL_PARAMETER}.No_type_mark, l_index_k)
												l_done := False
											end
										elseif l_value_k = Attached_type_mark then
											if recursive_formal_constraints.item (l_index_k) & {ET_FORMAL_PARAMETER}.Attached_mark /= {ET_FORMAL_PARAMETER}.Attached_mark then
												recursive_formal_constraints.replace (recursive_formal_constraints.item (l_index_k) | {ET_FORMAL_PARAMETER}.Attached_mark, l_index_k)
												recursive_formal_constraints_to_be_processed.replace (recursive_formal_constraints_to_be_processed.item (l_index_k) | {ET_FORMAL_PARAMETER}.Attached_mark, l_index_k)
												l_done := False
											end
										elseif l_value_k = Detachable_type_mark then
											if recursive_formal_constraints.item (l_index_k) & {ET_FORMAL_PARAMETER}.Detachable_mark /= {ET_FORMAL_PARAMETER}.Detachable_mark then
												recursive_formal_constraints.replace (recursive_formal_constraints.item (l_index_k) | {ET_FORMAL_PARAMETER}.Detachable_mark, l_index_k)
												recursive_formal_constraints_to_be_processed.replace (recursive_formal_constraints_to_be_processed.item (l_index_k) | {ET_FORMAL_PARAMETER}.Detachable_mark, l_index_k)
												l_done := False
											end
										end
									end
									if l_value_h & {ET_FORMAL_PARAMETER}.Attached_mark = {ET_FORMAL_PARAMETER}.Attached_mark then
											-- 'attached' type mark.
										recursive_formal_constraints_to_be_processed.replace (l_value_h.bit_xor ({ET_FORMAL_PARAMETER}.Attached_mark), l_index_h)
										if recursive_formal_constraints.item (l_index_k) & {ET_FORMAL_PARAMETER}.Attached_mark /= {ET_FORMAL_PARAMETER}.Attached_mark then
											recursive_formal_constraints.replace (recursive_formal_constraints.item (l_index_k) | {ET_FORMAL_PARAMETER}.Attached_mark, l_index_k)
											recursive_formal_constraints_to_be_processed.replace (recursive_formal_constraints_to_be_processed.item (l_index_k) | {ET_FORMAL_PARAMETER}.Attached_mark, l_index_k)
											l_done := False
										end
									end
									if l_value_h & {ET_FORMAL_PARAMETER}.Detachable_mark = {ET_FORMAL_PARAMETER}.Detachable_mark then
											-- 'detachable' type mark.
										recursive_formal_constraints_to_be_processed.replace (l_value_h.bit_xor ({ET_FORMAL_PARAMETER}.Detachable_mark), l_index_h)
										if recursive_formal_constraints.item (l_index_k) & {ET_FORMAL_PARAMETER}.Detachable_mark /= {ET_FORMAL_PARAMETER}.Detachable_mark then
											recursive_formal_constraints.replace (recursive_formal_constraints.item (l_index_k) | {ET_FORMAL_PARAMETER}.Detachable_mark, l_index_k)
											recursive_formal_constraints_to_be_processed.replace (recursive_formal_constraints_to_be_processed.item (l_index_k) | {ET_FORMAL_PARAMETER}.Detachable_mark, l_index_k)
											l_done := False
										end
									end
									l_index_k := l_index_k + 1
								end
							end
							l_index_h := l_index_h + 1
						end
					end
					l_all_zeros := True
					from l_index_h := 1 until l_index_h > l_formal_count loop
						if recursive_formal_constraints.item (l_index_h) /= 0 then
							l_all_zeros := False
							l_index_h := l_formal_count -- Jump out of the loop.
						end
						l_index_h := l_index_h + 1
					end
					if not l_all_zeros then
						create l_dependencies.make_filled (0, l_formal_count + 1)
						from l_index_h := 1 until l_index_h > l_formal_count loop
							l_dependencies.put (recursive_formal_constraints.item (l_index_h), l_index_h)
							l_index_h := l_index_h + 1
						end
						l_constrained_formal.set_recursive_formal_constraints (l_dependencies)
					end
				end
				l_index_g := l_index_g + 1
			end
			recursive_formal_constraints.wipe_out
			recursive_formal_constraints_to_be_processed.wipe_out
		end

	set_constraint_base_types (a_formal_parameters: ET_FORMAL_PARAMETER_LIST)
			-- Set 'constraint_base_types' of all formal generic
			-- parameters in `a_formal_parameters'.
		require
			a_formal_parameters_not_void: a_formal_parameters /= Void
		local
			i: INTEGER
			l_index_g: INTEGER
			l_formal_count: INTEGER
			l_all_base_type_count: INTEGER
			l_count: INTEGER
			l_base_type_list: ET_BASE_TYPE_CONSTRAINT_LIST
		do
			l_all_base_type_count := all_base_types.count
			l_formal_count := a_formal_parameters.count
			from l_index_g := 1 until l_index_g > l_formal_count loop
				if attached {ET_CONSTRAINED_FORMAL_PARAMETER} a_formal_parameters.formal_parameter (l_index_g) as l_constrained_formal then
					base_types.wipe_out
					from i := 1 until i > l_all_base_type_count loop
						if attached base_type_constraint (l_index_g, i, l_formal_count) as l_base_type_constraint then
							base_types.force_last (l_base_type_constraint)
						end
						i := i + 1
					end
					l_count := base_types.count
					if l_count = 0 then
						-- Should never happen.
					elseif l_count = 1 then
						l_constrained_formal.set_constraint_base_types (base_types.first)
					else
						from
							create l_base_type_list.make_with_capacity (base_types.item (l_count), l_count)
							l_count := l_count - 1
						until
							l_count = 0
						loop
							l_base_type_list.put_first (base_types.item (l_count))
							l_count := l_count - 1
						end
						l_constrained_formal.set_constraint_base_types (l_base_type_list)
					end
					base_types.wipe_out
				end
				l_index_g := l_index_g + 1
			end
		end

	base_type_constraint (a_formal_index, a_base_type_index, a_formal_count: INTEGER): detachable ET_BASE_TYPE_CONSTRAINT
			-- Base type constraint corresponding to the type at index `a_base_type_index'
			-- in `all_base_types' and associated with the formal parameter with index
			-- `a_formal_index' if any.
			-- `a_formal_count' is the number of formal generic parameters in `current_class'.
		require
			a_formal_index_valid: a_formal_index >= 1 and a_formal_index <= a_formal_count
			a_base_type_index_valid: a_base_type_index >= 1 and a_base_type_index <= all_base_types.count
			a_formal_count_definition: a_formal_count = current_class.formal_parameter_count
		local
			l_type_constraint: ET_BASE_TYPE_CONSTRAINT
			l_base_type: ET_BASE_TYPE
			l_value_g: INTEGER
			l_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT
		do
			l_type_constraint := all_base_types.item (a_base_type_index)
			l_base_type := l_type_constraint.type
			l_value_g := base_type_dependencies.item ((a_base_type_index - 1) * a_formal_count + a_formal_index)
			if l_value_g = Attached_type_mark then
				if l_base_type.is_attached then
					Result := l_type_constraint
				else
					l_base_type := l_base_type.type_with_type_mark (tokens.attached_keyword)
					if attached l_type_constraint.renames as l_renames then
						create l_type_rename_constraint.make (l_base_type, l_renames)
						Result := l_type_rename_constraint
					else
						Result := l_base_type
					end
				end
			elseif l_value_g = Detachable_type_mark then
				if l_base_type.is_attached then
					l_base_type := l_base_type.type_with_type_mark (tokens.detachable_keyword)
					if attached l_type_constraint.renames as l_renames then
						create l_type_rename_constraint.make (l_base_type, l_renames)
						Result := l_type_rename_constraint
					else
						Result := l_base_type
					end
				else
					Result := l_type_constraint
				end
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

	base_types: DS_ARRAYED_LIST [ET_BASE_TYPE_CONSTRAINT]
			-- List of base types for the formal generic parameter being processed

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

	recursive_formal_constraints: DS_ARRAYED_LIST [NATURAL_32]
			-- Used to build the 'recursive_formal_constraints'
			-- of the formal generic parameters being processed

	recursive_formal_constraints_to_be_processed: DS_ARRAYED_LIST [NATURAL_32]
			-- Used to build the 'recursive_formal_constraints'
			-- of the formal generic parameters being processed

	current_formal: detachable ET_CONSTRAINED_FORMAL_PARAMETER
			-- Formal generic parameter being processed

	current_type_constraint: detachable ET_TYPE_CONSTRAINT
			-- Type constraint being processed

feature {NONE} -- Implementation

	add_n_items_to_list (a_value: INTEGER; n: INTEGER; a_list: DS_ARRAYED_LIST [INTEGER])
			-- Add `n' times `a_value' to the end of `a_list'.
		require
			a_list_not_void: a_list /= Void
			n_not_negative: n >= 0
		local
			i: INTEGER
		do
			from i := 1 until i > n loop
				a_list.force_last (a_value)
				i := i + 1
			end
		ensure
			new_count: a_list.count = old a_list.count + n
		end

	add_n_flags_to_list (a_value: NATURAL; n: INTEGER; a_list: DS_ARRAYED_LIST [NATURAL_32])
			-- Add `n' times `a_value' to the end of `a_list'.
		require
			a_list_not_void: a_list /= Void
			n_not_negative: n >= 0
		local
			i: INTEGER
		do
			from i := 1 until i > n loop
				a_list.force_last (a_value)
				i := i + 1
			end
		ensure
			new_count: a_list.count = old a_list.count + n
		end

feature {NONE} -- Constants

	No_dependency: INTEGER = 0
	Detachable_type_mark: INTEGER = 1
	Attached_type_mark: INTEGER = 2
	No_type_mark: INTEGER = 3
	Visited_mark: INTEGER = -1
	Traversed_mark: INTEGER = -2

invariant

	all_base_types_not_void: all_base_types /= Void
	no_void_all_base_type: not all_base_types.has_void
	base_types_not_void: base_types /= Void
	no_void_base_type: not base_types.has_void
	formal_dependencies_not_void: formal_dependencies /= Void
	base_type_dependencies_not_void: base_type_dependencies /= Void
	recursive_formal_constraints_not_void: recursive_formal_constraints /= Void
	recursive_formal_constraints_to_be_processed_not_void: recursive_formal_constraints_to_be_processed /= Void

end
