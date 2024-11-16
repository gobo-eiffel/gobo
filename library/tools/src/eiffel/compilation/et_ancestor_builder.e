note

	description:

		"Eiffel class ancestor builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2017, Eric Bezault and others"
	license: "MIT License"

class ET_ANCESTOR_BUILDER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_class
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new ancestor builder for given classes.
		do
			precursor (a_system_processor)
			create class_sorter.make_default
			create ancestors.make_map (10)
			create conforming_ancestors.make_map (10)
			create parent_checker.make (a_system_processor)
			create formal_parameter_checker.make (a_system_processor)
			create parent_context.make_with_capacity (current_class, 1)
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Parse `a_class' if not already done. Then search for
			-- ancestors of `a_class'. Also process ancestors of
			-- `a_class' and detect possible inheritance graph cycles.
			-- And finally, run first pass of the formal generic
			-- parameters validity check of `a_class', and the first
			-- pass of the parent validity check.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				a_class.set_ancestors_built
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaaa_error
				create a_processor.make (system_processor)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
		ensure then
			ancestors_built: a_class.ancestors_built
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_ancestors_error
		ensure
			ancestors_built: a_class.ancestors_built
			has_ancestors_error: a_class.has_ancestors_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Parse `a_class' if not already done. Then search for
			-- ancestors of `a_class'. Also process ancestors of
			-- `a_class' and detect possible inheritance graph cycles.
			-- And finally, run first pass of the formal generic
			-- parameters validity check of `a_class', and the first
			-- pass of the parent validity check.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			old_class: ET_CLASS
			i, nb: INTEGER
			i2, nb2: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.ancestors_built then
				current_class.process (system_processor.eiffel_parser)
				if not current_class.is_parsed or else current_class.has_syntax_error then
					set_fatal_error (current_class)
				else
					add_class_to_sorter (current_class)
					class_sorter.sort
					check postcondition_of_sort: attached class_sorter.sorted_items as l_sorted_ancestors then
						nb := l_sorted_ancestors.count
						from i := 1 until i > nb loop
							current_class := l_sorted_ancestors.item (i)
							if not current_class.is_parsed or else current_class.has_syntax_error then
								set_fatal_error (current_class)
							else
								current_class.set_ancestors_built
								error_handler.report_compilation_status (Current, current_class, system_processor)
								set_ancestors
								if not current_class.is_dotnet then
										-- No need to check validity of .NET classes.
									check_formal_parameters_validity
									check_parents_validity
								end
							end
							i := i + 1
						end
						if attached class_sorter.cycle as a_cycle and then not a_cycle.is_empty then
							check has_cycle: class_sorter.has_cycle end
								-- There is a cycle in the inheritance graph.
							class_sorter.wipe_out
								-- Make sure that all classes involved in the
								-- cycle and their descendants are marked
								-- with `has_ancestors_error'.
							current_class := a_class
							set_fatal_error (current_class)
							nb2 := current_class.parents_count
							from i2 := 1 until i2 > nb2 loop
								set_parents_inheritance_error (current_class.parents (i2))
								i2 := i2 + 1
							end
								-- Report the validity error VHPR-1.
							current_class := a_cycle.first
							error_handler.report_compilation_status (Current, current_class, system_processor)
							error_handler.report_vhpr1a_error (current_class, a_cycle)
						else
							class_sorter.wipe_out
						end
					end
				end
			end
			current_class := old_class
		ensure
			ancestors_built: a_class.ancestors_built
		end

feature {NONE} -- Topological sort

	class_sorter: DS_HASH_TOPOLOGICAL_SORTER [ET_CLASS]
			-- Class sorter

	add_class_to_sorter (a_class: ET_CLASS)
			-- Add `a_class' and recursively its ancestors to
			-- `class_sorter' if not already done and if its
			-- `ancestors' has not been built yet.
		require
			a_class_not_void: a_class /= Void
		local
			l_any_class: ET_CLASS
			l_system_object_class: ET_CLASS
			old_class: ET_CLASS
			i, nb: INTEGER
			l_has_conforming_parent: BOOLEAN
			l_parent_list: ET_PARENT_LIST
		do
			if a_class.is_none then
				-- The validity error will be reported in `set_ancestors'.
			elseif not a_class.is_preparsed then
					-- Error: class not in universe (VTCT, ETL2 p.199).
					-- The validity error will be reported in `set_ancestors'.
				set_fatal_error (a_class)
			else
				old_class := current_class
				current_class := a_class
				if not current_class.ancestors_built then
					current_class.process (system_processor.eiffel_parser)
					if not current_class.is_parsed or else current_class.has_syntax_error then
							-- This error has already been reported
							-- somewhere else (during the parsing).
						set_fatal_error (current_class)
					elseif current_class.is_any_class then
							-- "ANY" has no implicit parents.
						current_class.set_ancestors_built
					elseif class_sorter.has (current_class) then
							-- Nothing to be done.
					else
						if attached current_class.parent_clauses as l_parent_clauses then
							class_sorter.force (current_class)
							nb := l_parent_clauses.count
							from i := 1 until i > nb loop
								l_parent_list := l_parent_clauses.item (i)
								l_has_conforming_parent := l_has_conforming_parent or l_parent_list.has_conforming_parent
								add_parents_to_sorter (current_class, l_parent_list)
								i := i + 1
							end
						end
						if not l_has_conforming_parent then
							if current_class.is_dotnet and not current_class.is_system_object_class then
								l_system_object_class := current_universe.system_object_type.base_class
								if not l_system_object_class.is_preparsed then
										-- Error: class "SYSTEM_OBJECT" not in universe (GVHSO-1, not in ETL2).
										-- The validity error will be reported in `set_ancestors'
										-- (for that to work we need to add `current_class' to the
										-- class sorter despite the error).
									set_fatal_error (l_system_object_class)
									class_sorter.force (current_class)
								elseif not l_system_object_class.is_dotnet then
										-- Error: class "SYSTEM_OBJECT" not a .NET class (GVHSO-2, not in ETL2).
										-- The validity error will be reported in `set_ancestors'
										-- (for that to work we need to add `current_class' to the
										-- class sorter despite the error).
									set_fatal_error (l_system_object_class)
									class_sorter.force (current_class)
								else
									class_sorter.force (current_class)
									add_parents_to_sorter (current_class, current_universe.system_object_parents)
								end
							else
								l_any_class := current_universe.any_type.base_class
								l_any_class.process (system_processor.eiffel_parser)
								if not l_any_class.is_preparsed then
										-- Error: class "ANY" not in universe (VHAY, ETL2 p.88).
										-- The validity error will be reported in `set_ancestors'
										-- (for that to work we need to add `current_class' to the
										-- class sorter despite the error).
									set_fatal_error (l_any_class)
									class_sorter.force (current_class)
								elseif not l_any_class.is_parsed or else l_any_class.has_syntax_error then
										-- This error has already been reported
										-- somewhere else (during the parsing).
									set_fatal_error (l_any_class)
								else
									class_sorter.force (current_class)
									add_parents_to_sorter (current_class, current_universe.any_parents)
								end
							end
						end
					end
				end
				current_class := old_class
			end
		end

	add_parents_to_sorter (an_heir: ET_CLASS; a_parents: ET_PARENT_LIST)
			-- Add `a_parents' and their ancestors to `class_sorter'
			-- if not already done and if their ancestors have not
			-- been built yet. `a_parents' are the parents of
			-- `an_heir'.
		require
			an_heir_not_void: an_heir /= Void
			an_heir_in_sorter: class_sorter.has (an_heir)
			a_parents_not_void: a_parents /= Void
		local
			i, nb: INTEGER
			a_class: ET_CLASS
		do
			nb := a_parents.count
			from i := 1 until i > nb loop
				a_class := a_parents.parent (i).type.base_class
				if not a_class.ancestors_built then
					add_class_to_sorter (a_class)
					if a_class.is_preparsed then
						class_sorter.force_relation (a_class, an_heir)
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Ancestors

	ancestors: DS_HASH_TABLE [ET_BASE_TYPE, ET_CLASS]
			-- Ancestors of `current_class'

	conforming_ancestors: DS_HASH_TABLE [ET_BASE_TYPE, ET_CLASS]
			-- Conforming ancestors of `current_class'

	set_ancestors
			-- Set the ancestors of `current_class' with its parents
			-- and their ancestors.
		local
			l_parent_clause: ET_PARENT_LIST
			a_parent_class: ET_CLASS
			a_type: ET_BASE_TYPE
			a_parent: ET_PARENT
			i1, nb1: INTEGER
			i2, nb2: INTEGER
			has_error: BOOLEAN
			l_ancestors, l_conforming_ancestors: ET_BASE_TYPE_LIST
			system_object_parents: ET_PARENT_LIST
			any_parents: ET_PARENT_LIST
			l_is_conforming: BOOLEAN
		do
			any_parents := current_system.any_parents
			system_object_parents := current_system.system_object_parents
			nb1 := current_class.parents_count
			from i1 := 1 until i1 > nb1 loop
				l_parent_clause := current_class.parents (i1)
				l_is_conforming := l_parent_clause.is_conforming
				nb2 := l_parent_clause.count
				from i2 := 1 until i2 > nb2 loop
					a_parent := l_parent_clause.parent (i2)
					a_type := a_parent.type
					a_parent_class := a_type.base_class
					if a_parent_class.is_none then
						set_fatal_error (current_class)
						error_handler.report_vhpr1b_error (current_class, a_type)
						has_error := True
					elseif not a_parent_class.is_preparsed then
						set_fatal_error (current_class)
						if l_parent_clause = any_parents then
								-- Error: class "ANY" not in universe (VHAY, ETL2 p.88).
							error_handler.report_vhay0a_error (current_class)
						elseif l_parent_clause = system_object_parents then
								-- Error: class "SYSTEM_OBJECT" not in universe (GVHSO-1, not in ETL2).
							error_handler.report_gvhso1a_error (current_class)
						else
								-- Error: class not in universe (VTCT, ETL2 p.199).
							error_handler.report_vtct0a_error (current_class, a_type)
						end
						has_error := True
					elseif a_parent_class.has_ancestors_error then
						set_fatal_error (current_class)
						if l_parent_clause = system_object_parents and not a_parent_class.is_dotnet then
								-- Error: class "SYSTEM_OBJECT" not a .NET class (GVHSO-2, not in ETL2).
							error_handler.report_gvhso2a_error (current_class)
						end
						has_error := True
					elseif a_parent_class.is_frozen and l_is_conforming then
							-- Error: cannot inherit from a frozen class.
						set_fatal_error (current_class)
						error_handler.report_vhpr2a_error (current_class, a_type)
						has_error := True
					elseif not has_error then
						add_parent_to_ancestors (a_parent, l_is_conforming)
						if current_class.has_ancestors_error then
							has_error := True
						end
					end
					i2 := i2 + 1
				end
				i1 := i1 + 1
			end
			create l_ancestors.make_with_capacity (ancestors.count)
			from ancestors.start until ancestors.after loop
				l_ancestors.put_last (ancestors.item_for_iteration)
				ancestors.forth
			end
			if conforming_ancestors.count = ancestors.count then
				l_conforming_ancestors := l_ancestors
			else
				create l_conforming_ancestors.make_with_capacity (conforming_ancestors.count)
				from conforming_ancestors.start until conforming_ancestors.after loop
					l_conforming_ancestors.put_last (conforming_ancestors.item_for_iteration)
					conforming_ancestors.forth
				end
			end
			ancestors.wipe_out
			conforming_ancestors.wipe_out
			current_class.set_ancestors (l_ancestors)
			current_class.set_conforming_ancestors (l_conforming_ancestors)
		end

	add_parent_to_ancestors (a_parent: ET_PARENT; a_is_conforming: BOOLEAN)
			-- Add `a_parent' and its ancestors to the end of `ancestors'
			-- in reverse topological order (parent, then grand-parents, etc.).
			-- `a_parent' is a parent of `current_class'.
			-- `a_is_conforming' means that `a_parent' is a conforming parent.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_class, a_parent_class: ET_CLASS
			a_parameters: detachable ET_ACTUAL_PARAMETERS
			a_parent_type: ET_BASE_TYPE
			a_type, l_ancestor_type, l_parent_ancestor_type: ET_BASE_TYPE
			i, nb: INTEGER
			anc: ET_BASE_TYPE_LIST
		do
				-- Add current parent to `ancestors'.
			a_parent_type := a_parent.type
			a_parent_class := a_parent_type.base_class
			ancestors.search (a_parent_class)
			if ancestors.found then
				l_ancestor_type := ancestors.found_item
					-- The context in which the current parent appears is
					-- `current_class', hence `current_class' appearing
					-- twice in the call to `same_syntactical_type' below.
				if not l_ancestor_type.same_syntactical_type (a_parent_type, current_class, current_class) then
					set_fatal_error (current_class)
					error_handler.report_gvagp0a_error (current_class, l_ancestor_type, a_parent_type)
				end
			else
				l_ancestor_type := a_parent_type
				ancestors.force_last_new (l_ancestor_type, a_parent_class)
					-- Add proper ancestors of current parent
					-- to the ancestors of `current_class'.
				a_parameters := a_parent.type.actual_parameters
				parent_context.set (a_parent_type, current_class)
				anc := a_parent_class.ancestors
				nb := anc.count
				from i := 1 until i > nb loop
					a_type := anc.item (i)
					a_class := a_type.base_class
					ancestors.search (a_class)
					if ancestors.found then
						l_parent_ancestor_type := ancestors.found_item
						if not l_parent_ancestor_type.same_syntactical_type (a_type, parent_context, current_class) then
								-- Compute actual generic derivation of `a_type' in
								-- `current_class' if needed before reporting the error.
							if a_parameters /= Void then
								a_type := a_type.resolved_formal_parameters (a_parameters)
							end
							set_fatal_error (current_class)
							error_handler.report_gvagp0a_error (current_class, l_parent_ancestor_type, a_type)
						end
					else
							-- Compute actual generic derivation of `a_type' in
							-- `current_class' if needed before inserting it in
							-- `ancestors'.
						if a_parameters /= Void then
							a_type := a_type.resolved_formal_parameters (a_parameters)
						end
						ancestors.force_last_new (a_type, a_class)
					end
					i := i + 1
				end
			end
			if a_is_conforming then
				conforming_ancestors.search (a_parent_class)
				if not conforming_ancestors.found then
					conforming_ancestors.force_last_new (l_ancestor_type, a_parent_class)
					anc := a_parent_class.conforming_ancestors
					nb := anc.count
					from i := 1 until i > nb loop
						a_type := anc.item (i)
						a_class := a_type.base_class
						conforming_ancestors.search (a_class)
						if not conforming_ancestors.found then
							ancestors.search (a_class)
							if not ancestors.found then
									-- Internal error: a conforming ancestor is an ancestor.
								set_fatal_error (current_class)
								error_handler.report_giaaa_error
							else
								l_parent_ancestor_type := ancestors.found_item
								conforming_ancestors.force_last_new (l_parent_ancestor_type, a_class)
							end
						end
						i := i + 1
					end
				end
			end
		end

	parent_context: ET_NESTED_TYPE_CONTEXT
			-- Parent context for type comparison

feature {NONE} -- Error handling

	set_parents_inheritance_error (a_parents: ET_PARENT_LIST)
			-- Set `has_ancestors_error' to true to `a_parents'
			-- (and recursively to their parents) whose ancestors
			-- has not been built yet.
		require
			a_parents_not_void: a_parents /= Void
		local
			i, nb: INTEGER
			i2, nb2: INTEGER
			a_class: ET_CLASS
		do
			nb := a_parents.count
			from i := 1 until i > nb loop
				a_class := a_parents.parent (i).type.base_class
				if not a_class.ancestors_built then
					set_fatal_error (a_class)
					nb2 := a_class.parents_count
					from i2 := 1 until i2 > nb2 loop
						set_parents_inheritance_error (a_class.parents (i2))
						i2 := i2 + 1
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Formal parameters validity

	check_formal_parameters_validity
			-- Check validity of formal parameters of `current_class'.
		do
			formal_parameter_checker.check_formal_parameters_validity (current_class)
			if formal_parameter_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	formal_parameter_checker: ET_FORMAL_PARAMETER_CHECKER1
			-- Formal parameter validity checker

feature {NONE} -- Parents validity

	check_parents_validity
			-- Check validity of parents of `current_class'.
		do
			parent_checker.check_parents_validity (current_class)
			if parent_checker.has_fatal_error then
				set_fatal_error (current_class)
			end
		end

	parent_checker: ET_PARENT_CHECKER1
			-- Parent validity checker

invariant

	class_sorter_not_void: class_sorter /= Void
	no_void_class_in_sorter: not class_sorter.has_void
	-- classes_in_sorter_preparsed: forall c in `class_sorter', c.is_preparsed
	ancestors_not_void: ancestors /= Void
	no_void_ancestor: not ancestors.has_void_item
	conforming_ancestors_not_void: conforming_ancestors /= Void
	no_void_conforming_ancestor: not conforming_ancestors.has_void_item
	parent_checker_not_void: parent_checker /= Void
	formal_parameter_checker_not_void: formal_parameter_checker /= Void
	parent_context_not_void: parent_context /= Void

end
