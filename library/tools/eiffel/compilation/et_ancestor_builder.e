note

	description:

		"Eiffel class ancestor builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ANCESTOR_BUILDER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_class
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new ancestor builder for given classes.
		do
			precursor {ET_CLASS_PROCESSOR}
			create class_sorter.make_default
			create ancestors.make_map (10)
			create parent_checker.make
			create formal_parameter_checker.make
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
				create a_processor.make
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
			a_class.set_ancestors_built
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
			sorted_ancestors: DS_ARRAYED_LIST [ET_CLASS]
			a_parents: ET_PARENT_LIST
			a_cycle: DS_ARRAYED_LIST [ET_CLASS]
			i, nb: INTEGER
		do
			old_class := current_class
			current_class := a_class
			if not current_class.ancestors_built then
				current_class.process (current_system.eiffel_parser)
				if not current_class.is_parsed or else current_class.has_syntax_error then
					set_fatal_error (current_class)
				else
					add_class_to_sorter (current_class)
					class_sorter.sort
					sorted_ancestors := class_sorter.sorted_items
					nb := sorted_ancestors.count
					from i := 1 until i > nb loop
						current_class := sorted_ancestors.item (i)
						if not current_class.is_parsed or else current_class.has_syntax_error then
							set_fatal_error (current_class)
						else
							current_class.set_ancestors_built
							error_handler.report_compilation_status (Current, current_class)
							a_parents := current_class.parents
							if a_parents /= Void then
								set_ancestors (a_parents)
							end
							if not current_class.is_dotnet then
									-- No need to check validity of .NET classes.
								check_formal_parameters_validity
								check_parents_validity
							end
						end
						i := i + 1
					end
					if class_sorter.has_cycle then
							-- There is a cycle in the inheritance graph.
						a_cycle := class_sorter.cycle
						class_sorter.wipe_out
							-- Make sure that all classes involved in the
							-- cycle and their descendants are marked
							-- with `has_inheritance_error'.
						current_class := a_class
						set_fatal_error (current_class)
						a_parents := current_class.parents
						if a_parents /= Void then
							set_parents_inheritance_error (a_parents)
						end
							-- Report the validity error VHPR-1.
						current_class := a_cycle.first
						error_handler.report_compilation_status (Current, current_class)
						error_handler.report_vhpr1a_error (current_class, a_cycle)
					else
						class_sorter.wipe_out
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
			l_parent_clause: ET_PARENT_LIST
			old_class: ET_CLASS
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
					current_class.process (current_system.eiffel_parser)
					l_parent_clause := current_class.parent_clause
					if not current_class.is_parsed or else current_class.has_syntax_error then
							-- This error has already been reported
							-- somewhere else (during the parsing).
						set_fatal_error (current_class)
					elseif l_parent_clause = Void or else l_parent_clause.is_empty then
						if current_class.is_any_class then
								-- "ANY" has no implicit parents.
							current_class.set_ancestors_built
						elseif not class_sorter.has (current_class) then
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
								l_any_class.process (current_system.eiffel_parser)
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
					elseif not class_sorter.has (current_class) then
						class_sorter.force (current_class)
						add_parents_to_sorter (current_class, l_parent_clause)
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

	set_ancestors (a_parents: ET_PARENT_LIST)
			-- Set the ancestors of `current_class' with `a_parents'
			-- and their ancestors. `a_parents' are the parents of
			-- `current_class'.
		require
			a_parents_not_void: a_parents /= Void
		local
			a_class: ET_CLASS
			a_type: ET_BASE_TYPE
			a_parent: ET_PARENT
			i, nb: INTEGER
			has_error: BOOLEAN
			a_cursor: DS_HASH_TABLE_CURSOR [ET_BASE_TYPE, ET_CLASS]
			anc: ET_BASE_TYPE_LIST
			system_object_parents: ET_PARENT_LIST
			any_parents: ET_PARENT_LIST
		do
			any_parents := current_system.any_parents
			system_object_parents := current_system.system_object_parents
			nb := a_parents.count
			from i := 1 until i > nb loop
				a_parent := a_parents.parent (i)
				a_type := a_parent.type
				a_class := a_type.base_class
				if a_class.is_none then
					set_fatal_error (current_class)
					error_handler.report_vhpr1b_error (current_class, a_type)
					has_error := True
				elseif not a_class.is_preparsed then
					set_fatal_error (current_class)
					if a_parents = any_parents then
							-- Error: class "ANY" not in universe (VHAY, ETL2 p.88).
						error_handler.report_vhay0a_error (current_class)
					elseif a_parents = system_object_parents then
							-- Error: class "SYSTEM_OBJECT" not in universe (GVHSO-1, not in ETL2).
						error_handler.report_gvhso1a_error (current_class)
					else
							-- Error: class not in universe (VTCT, ETL2 p.199).
						error_handler.report_vtct0a_error (current_class, a_type)
					end
					has_error := True
				elseif a_class.has_ancestors_error then
					set_fatal_error (current_class)
					if a_parents = system_object_parents and not a_class.is_dotnet then
							-- Error: class "SYSTEM_OBJECT" not a .NET class (GVHSO-2, not in ETL2).
						error_handler.report_gvhso2a_error (current_class)
					end
					has_error := True
				elseif not has_error then
					add_parent_to_ancestors (a_parent)
					if current_class.has_ancestors_error then
						has_error := True
					end
				end
				i := i + 1
			end
			create anc.make_with_capacity (ancestors.count)
			a_cursor := ancestors.new_cursor
			from a_cursor.start until a_cursor.after loop
				anc.put_last (a_cursor.item)
				a_cursor.forth
			end
			ancestors.wipe_out
			current_class.set_ancestors (anc)
		end

	add_parent_to_ancestors (a_parent: ET_PARENT)
			-- Add `a_parent' and its ancestors to `ancestors'.
			-- `a_parent' is a parent of `current_class'.
		require
			a_parent_not_void: a_parent /= Void
		local
			a_class: ET_CLASS
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			a_parent_type: ET_BASE_TYPE
			a_type, l_ancestor_type: ET_BASE_TYPE
			i, nb: INTEGER
			anc: ET_BASE_TYPE_LIST
		do
				-- Add current parent to `ancestors'.
			a_parent_type := a_parent.type
			a_class := a_parent_type.base_class
			ancestors.search (a_class)
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
				a_parameters := a_parent.type.actual_parameters
				ancestors.force_new (a_parent_type, a_class)
					-- Add proper ancestors of current parent
					-- to the ancestors of `an_heir'.
				parent_context.set (a_parent_type, current_class)
				anc := a_class.ancestors
				nb := anc.count
				from i := 1 until i > nb loop
					a_type := anc.item (i)
					a_class := a_type.base_class
					ancestors.search (a_class)
					if ancestors.found then
						l_ancestor_type := ancestors.found_item
						if not l_ancestor_type.same_syntactical_type (a_type, parent_context, current_class) then
								-- Compute actual generic derivation of `a_type' in
								-- `current_class' if needed before reporting the error.
							if a_parameters /= Void then
								a_type := a_type.resolved_formal_parameters (a_parameters)
							end
							set_fatal_error (current_class)
							error_handler.report_gvagp0a_error (current_class, l_ancestor_type, a_type)
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					else
							-- Compute actual generic derivation of `a_type' in
							-- `current_class' if needed before inserting it in
							-- `ancestors'.
						if a_parameters /= Void then
							a_type := a_type.resolved_formal_parameters (a_parameters)
						end
						ancestors.force_new (a_type, a_class)
						i := i + 1
					end
				end
			end
		end

	parent_context: ET_NESTED_TYPE_CONTEXT
			-- Parent context for type comparison

feature {NONE} -- Error handling

	set_parents_inheritance_error (a_parents: ET_PARENT_LIST)
			-- Set `has_inheritance_error' to true to `a_parents'
			-- (and recursively to their parents) whose ancestors
			-- has not been built yet.
		require
			a_parents_not_void: a_parents /= Void
		local
			i, nb: INTEGER
			a_class: ET_CLASS
			grand_parents: ET_PARENT_LIST
		do
			nb := a_parents.count
			from i := 1 until i > nb loop
				a_class := a_parents.parent (i).type.base_class
				if not a_class.ancestors_built then
					set_fatal_error (a_class)
					grand_parents := a_class.parents
					if grand_parents /= Void then
						set_parents_inheritance_error (grand_parents)
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
	parent_checker_not_void: parent_checker /= Void
	formal_parameter_checker_not_void: formal_parameter_checker /= Void
	parent_context_not_void: parent_context /= Void

end
