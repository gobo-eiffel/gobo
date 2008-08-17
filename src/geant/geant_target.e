indexing

	description:

		"Target of geant build file"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001-2005, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TARGET

inherit
	GEANT_GROUP
		redefine
			initialize, valid_xml_element,
			is_target, associated_target,
			prepare_variables_before_execution, execute, execute_element
		end

create

	make

feature {NONE} -- Initialization

	initialize is
			-- Initialize current Target
		local
			a_xml_element: XM_ELEMENT
			a_tester: UC_STRING_EQUALITY_TESTER
			a_obsolete_element: XM_ELEMENT
			a_exports: DS_ARRAYED_LIST [STRING]
			a_elements: DS_LINKED_LIST [XM_ELEMENT]
			a_name: STRING
			a_argument_element: GEANT_ARGUMENT_ELEMENT
			a_local_element: GEANT_LOCAL_ELEMENT
			a_global_element: GEANT_GLOBAL_ELEMENT
			cs: DS_LINKED_LIST_CURSOR [XM_ELEMENT]
		do
			a_xml_element := xml_element

				-- name:
			if not a_xml_element.has_attribute_by_name (Name_attribute_name) then
				exit_application (1, <<"Element 'target' without attribute 'name' found.",
					" Make sure each target has an associated attribute 'name'.">>)
			end
			set_name (xml_element.attribute_by_name (Name_attribute_name).value)
				-- obsolete:
			a_obsolete_element := a_xml_element.element_by_name (Obsolete_element_name)
			if a_obsolete_element /= Void then
				set_obsolete_message (a_obsolete_element.text)
			end

				-- export:
			if a_xml_element.has_attribute_by_name (Export_attribute_name) then
				a_exports := string_tokens (
					a_xml_element.attribute_by_name (Export_attribute_name).value, ',')
			else
				create a_exports.make (1)
				a_exports.put (Project_name_any, 1)
			end
			create a_tester
			a_exports.set_equality_tester (a_tester)
			set_exports (a_exports)

				-- once:
			if has_attribute (Once_attribute_name) then
				set_execute_once (boolean_value (Once_attribute_name))
			end

				-- formal arguments:
			formal_arguments := Empty_argument_variables
			a_elements := elements_by_name (Argument_element_name)
			if a_elements.count /= 0 then
				create formal_arguments.make
				cs := a_elements.new_cursor
				from cs.start until cs.after loop
					create a_argument_element.make (cs.item)
					if a_argument_element.has_name and then a_argument_element.name.count > 0 then
						a_name := a_argument_element.name
						formal_arguments.force_last ("dummy_value", a_name)
						project.trace_debug (<<"found formal argument '", a_name, "'%N">>)
					end
					cs.forth
				end
			end

				-- locals declaration:
			formal_locals := Empty_variables
			a_elements := elements_by_name (Local_element_name)
			if a_elements.count /= 0 then
				create formal_locals.make
				cs := a_elements.new_cursor
				from cs.start until cs.after loop
					create a_local_element.make (cs.item)
					if a_local_element.has_name and then a_local_element.name.count > 0 then
						a_name := a_local_element.name
						formal_locals.force_last (Void, a_name)	--| this is formal variable, the value is ignored at this point.
						project.trace_debug (<<"found local declaration '", a_name, "'%N">>)
						if formal_arguments.has (a_name) then
							project.log (<<"  [local] name=", a_name, " warning: conflict with arguments variable." >>)
						end
							--| if a_local_element.has_value, the value will be set, when the element is processed						
					end
					cs.forth
				end
			end

				-- globals declaration:
			formal_globals := Empty_variables
			a_elements := elements_by_name (Global_element_name)
			if a_elements.count /= 0 then
				create formal_globals.make
				cs := a_elements.new_cursor
				from cs.start until cs.after loop
					create a_global_element.make (cs.item)
					if a_global_element.has_name and then a_global_element.name.count > 0 then
						a_name := a_global_element.name
						formal_globals.force_last (Void, a_name) --| this is formal variable, the value is ignored at this point.
						--| if a_global_element.has_value, the value will be set, when the element is processed							
						project.trace_debug (<<"found global declaration '", a_name, "'%N">>)
						if formal_arguments.has (a_name) then
							project.log (<<"  [global] name=", a_name, " warning: conflict with arguments variable." >>)
						elseif formal_locals.has (a_name) then
							project.log (<<"  [global] name=", a_name, " warning: conflict with locals variable." >>)
						end
					end
					cs.forth
				end
			end

			Precursor {GEANT_GROUP}

		end

feature -- Access

	is_target: BOOLEAN is True
			-- Is Current a GEANT_TARGET ?

	dependencies: STRING is
			-- STRING representation of dependencies
		require
			has_dependencies: has_dependencies
		do
			Result := xml_element.attribute_by_name (Depend_attribute_name).value
		ensure
			dependencies_not_void: Result /= Void
		end

	name: STRING
			-- Name of target

	obsolete_message: STRING
			-- Obsolete message if any

	exports: DS_ARRAYED_LIST [STRING]
			-- Exports of target

	origin: GEANT_PROJECT is
			-- Origin of target (see ETL for definition)
		do
			Result := seed.project
		ensure
			origin_not_void: Result /= Void
		end

	associated_target: GEANT_TARGET is
			-- Associated target
		do
			Result := Current
		end

	full_name: STRING is
			-- `Name' prepended with (`project.name' + ".")
		do
			Result := STRING_.cloned_string (project.name)
			Result.append_character ('.')
			Result := STRING_.appended_string (Result, name)
		ensure
			full_name_not_void: Result /= Void
			definition: STRING_.same_string (Result, STRING_.concat (STRING_.concat (project.name, "."), name))
		end

	precursor_target: like Current
			-- Precursor of current target if this target
			-- was redefined

	redefining_target: like Current
			-- Redefining target of current target if present;
			-- Used for polymorphic calls

	seed: like Current is
			-- Original version of this target in most remote ancestor
		do
			from
				Result := Current
			until
				Result.precursor_target = Void
			loop
				Result := Result.precursor_target
			end

		ensure
			seed_not_void: Result /= Void
			current_if_no_precursor_target: precursor_target = Void implies Result = Current
			seed_has_no_precursor: Result.precursor_target = Void
		end

	final_target: like Current is
			-- Final target of this target in redefinition chain
		do
			from
				Result := Current
			until
				Result.redefining_target = Void
			loop
				Result := Result.redefining_target
			end

		ensure
			final_target_not_void: Result /= Void
			current_if_no_redefining_target: redefining_target = Void implies Result = Current
			final_target_has_no_redefining_target: Result.redefining_target = Void
		end

	formal_arguments: GEANT_ARGUMENT_VARIABLES
			-- Formal arguments of this target

	formal_locals: GEANT_VARIABLES
			-- Formal locals of this target	

	formal_globals: GEANT_VARIABLES
			-- Formal globals of this target

	prepared_arguments_from_formal_arguments (a_arguments: like formal_arguments): like formal_arguments is
			-- Prepared actual arguments arguments for `formal_arguments';
			-- Numbered arguments are replaced by their associated named arguments according
			-- to `formal_arguments';
			-- Application is terminated in case there is a mismatch between `a_arguments' and
			-- `formal_arguments'
		require
			a_arguments_not_void: a_arguments /= Void
			a_arguments_and_formals_have_same_count: a_arguments.count = formal_arguments.count
		do
				-- Default Result is `a_arguments' if nothing needs to be changed:
			Result := a_arguments
				-- Check that actual and formal arguments match:
			if a_arguments.count /= formal_arguments.count then
				exit_application (1, <<"  error: number of actual and formal arguments do not match for target '", name, "' (", a_arguments.count.out, " against ", formal_arguments.count.out, ")">>)
			end
			if a_arguments.has_numbered_keys then
				Result := named_from_numbered_arguments (a_arguments)
			end

			if not Result.has_same_keys (formal_arguments) then
				exit_application (1, <<"  error: actual and formal arguments do not match for target '", name, "'">>)
			end
		end

	named_from_numbered_arguments (a_arguments: like formal_arguments): like formal_arguments is
			-- Clone of `a_arguments' where number keys have been replaced by their
			-- corresponding names from `formal_arguments'
		require
			a_arguments_not_void: a_arguments /= Void
			a_arguments_and_formals_have_same_count: a_arguments.count = formal_arguments.count
			a_arguments_has_numbered_arguments: a_arguments.has_numbered_keys
		local
			csa: DS_HASH_TABLE_CURSOR [STRING, STRING]
			csf: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			create Result.make

			csa := a_arguments.new_cursor
			csf :=formal_arguments.new_cursor
			csa.start
			csf.start
			from until csa.after loop
				Result.force_last (csa.item, csf.key)
				csa.forth
				csf.forth
			end
		end

	prepared_locals_from_formal_locals (a_locals: like formal_locals): like formal_locals is
			-- Prepared actual locals for `formal_locals';
		require
			a_locals_not_void: a_locals /= Void
			formal_locals_not_void: formal_locals /= Void
		local
			cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			Result := a_locals
				-- Default Result is `a_arguments' if nothing needs to be changed:
			cursor := formal_locals.new_cursor
			from cursor.start until cursor.after loop
				Result.force_last (cursor.item, cursor.key)
				cursor.forth
			end
		end

feature -- Status report

	is_executed: BOOLEAN
			-- Was this target executed already?

	execute_once: BOOLEAN
			-- Is this target supposed to be executed only once?

	is_exported_to_any: BOOLEAN is
			-- Is this target exported to any project?
		do
			if exports /= Void then
				Result := exports.has (Project_name_any)
			end
		ensure
			definition: Result implies (exports /= Void and then exports.has (Project_name_any))
		end

	is_exported_to_project (a_project: GEANT_PROJECT): BOOLEAN is
			-- Is this target exported to project named `a_project_name'?
		require
			a_project_not_void: a_project /= Void
		local
			i, nb: INTEGER
			a_project_name: STRING
			an_export: STRING
		do
			if exports /= Void then
				a_project_name := a_project.name
				nb := exports.count
				from i := 1 until i > nb loop
					an_export := exports.item (i)
					if STRING_.same_string (a_project_name, an_export) then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					elseif a_project.has_parent_with_name (an_export) then
						Result := True
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	has_dependencies: BOOLEAN is
			-- Has current target dependent on other targets?
		do
			Result := xml_element.has_attribute_by_name (Depend_attribute_name)
		ensure
			definition: Result = xml_element.has_attribute_by_name (Depend_attribute_name)
		end

	valid_xml_element (an_xml_element: like xml_element): BOOLEAN is
			-- Is `an_xml_element' a valid xml element?
		do
			Result := an_xml_element.has_attribute_by_name (Name_attribute_name) and then
				an_xml_element.attribute_by_name (Name_attribute_name).value.count > 0
		ensure then
			has_name_attribute: Result implies an_xml_element.has_attribute_by_name (Name_attribute_name)
			has_non_empty_name_attribute: Result implies an_xml_element.attribute_by_name (Name_attribute_name).value.count > 0
		end

	conflicts_with (a_target: like Current): BOOLEAN is
			-- Does current target or one of it's precursors
			-- have a `full_name' which is equal to the `full_name'
			-- of `a_target' or one of it's precursors?
		require
			a_target_not_void: a_target /= Void
		do
			Result := STRING_.same_string (seed.full_name, a_target.seed.full_name)
		end

	formal_arguments_match (a_target: like Current): BOOLEAN is
			-- Does `formal_arguments' match `a_target.formal_arguments'?
		require
			a_target_not_void: a_target /= Void
		do
			Result := formal_arguments.has_same_keys (a_target.formal_arguments)
		end

	has_precursor_target (a_target: like Current): BOOLEAN is
			-- Is current target or one of it's precursors `a_target'?
		require
			a_target_not_void: a_target /= Void
		local
			a_precursor_target: like Current
		do
			from
				a_precursor_target := precursor_target
			until
				a_precursor_target = Void or else Result
			loop
				Result := a_precursor_target = a_target
				a_precursor_target := a_precursor_target.precursor_target
			end
		end

	has_redefining_target (a_target: like Current): BOOLEAN is
			-- Is current target or one of it's `redefining_target's `a_target'?
		require
			a_target_not_void: a_target /= Void
		local
			a_redefining_target: like Current
		do
			from
				a_redefining_target := redefining_target
			until
				a_redefining_target = Void or else Result
			loop
				Result := a_redefining_target = a_target
				a_redefining_target := a_redefining_target.redefining_target
			end
		end

feature -- Setting

	set_name (a_name: STRING) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_obsolete_message (a_obsolete_message: STRING) is
			-- Set `obsolete_message' to `a_obsolete_message'.
		require
			a_obsolete_message_not_void: a_obsolete_message /= Void
			a_obsolete_message_not_empty: a_obsolete_message.count > 0
		do
			obsolete_message := a_obsolete_message
		ensure
			obsolete_message_set: obsolete_message = a_obsolete_message
		end

	set_exports (a_exports: like exports) is
			-- Set `exports' to `a_exports'.
		require
			a_exports_not_void: a_exports /= Void
		do
			exports := a_exports
		ensure
			exports_set: exports = a_exports
		end

	set_executed (a_is_executed: BOOLEAN) is
			-- Set `is_executed' to `a_is_executed'.
		do
			is_executed := a_is_executed
		ensure
			is_executed_set: is_executed = a_is_executed
		end

	set_execute_once (a_execute_once: BOOLEAN) is
			-- Set `execute_once' to `a_execute_once'.
		do
			execute_once := a_execute_once
		ensure
			execute_once_set: execute_once = a_execute_once
		end

	set_precursor_target (a_precursor_target: GEANT_TARGET) is
			-- Set `precursor_target' to `a_precursor_target'.
		require
			a_precursor_target_not_void: a_precursor_target /= Void
			a_precursor_target_not_current: a_precursor_target /= Current
			no_circular_target_chain: not a_precursor_target.has_precursor_target (Current)
		do
			precursor_target := a_precursor_target
		ensure
			precursor_target_set: precursor_target = a_precursor_target
		end

	set_redefining_target (a_redefining_target: GEANT_TARGET) is
			-- Set `redefining_target' to `a_redefining_target'.
		require
			a_redefining_target_not_void: a_redefining_target /= Void
			a_redefining_target_not_current: a_redefining_target /= Current
			no_circular_target_chain: not a_redefining_target.has_redefining_target (Current)
		do
			redefining_target := a_redefining_target
		ensure
			redefining_target_set: redefining_target = a_redefining_target
		end

feature -- Processing

	show_precursors is
			-- Show list of precursors.
		local
			a_precursor_target: like Current
			a_message: ARRAY [STRING]
		do
			from
				a_precursor_target := Current
				create a_message.make (1, 1)
				a_message.put ("    precursor list: ", 1)
			until
				a_precursor_target = Void
			loop
				a_message.force ("'", a_message.count + 1)
				a_message.force (a_precursor_target.full_name, a_message.count + 1)
				a_message.force ("'", a_message.count + 1)
				a_precursor_target := a_precursor_target.precursor_target
				if a_precursor_target /= Void then
					a_message.force (", ", a_message.count + 1)
				end
			end
			project.trace_debug (a_message)
		end

	execute is
			-- Execute all tasks of `a_target' in sequential order.
		do
			if not execute_once or else not is_executed then
				if is_enabled then
					if project.options.verbose then
						project.trace (<<"">>)
						project.trace (<<project.name, ".", project.target_name (Current), ":">>)
						project.trace (<<"">>)
					end
					if obsolete_message /= Void then
						project.log (<<"target `", project.name, ".", project.target_name (Current), "%' is obsolete. ", obsolete_message>>)
					end

					Precursor {GEANT_GROUP}

						-- Mark target as already executed:
					set_executed (True)
				end
			end
		end

feature {NONE} -- Execution implementation

	prepare_variables_before_execution is
			-- Prepare variables before tasks execution
		local
			a_arguments: GEANT_ARGUMENT_VARIABLES
			a_locals: GEANT_VARIABLES
			cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
				-- Prepare arguments:
			a_arguments := target_arguments_stack.item
			target_arguments_stack.remove
			a_arguments := prepared_arguments_from_formal_arguments (a_arguments)
			target_arguments_stack.force (a_arguments)

				--| Prepare locals:
				--| to be sure local variable ${foo} does not return a globals variable's value
				--| the locals stack needs to have an entry for each locals.
			a_locals := target_locals_stack.item
			check no_locals: a_locals.count = 0 end
			if formal_locals.count > 0 then
				from
					cursor := formal_locals.new_cursor
					cursor.start
				until
					cursor.after
				loop
					if cursor.item = Void then
						a_locals.force_last (create {STRING}.make_empty, cursor.key)
							--| we can not set Void, otherwise the interpreter
							--| will look in the global variables
							--| Suggestion: fixed the interpreter to allow Void value.
					else
						a_locals.force_last (cursor.item, cursor.key)
					end
					cursor.forth
				end
			end

			--| No need to prepare globals, since the container already exists  `project.variables'

			Precursor {GEANT_GROUP}
		end

	execute_element (a_xml_element: XM_ELEMENT) is
			-- Execute  command defined through `a_xml_element'.
		local
			var_decl: GEANT_NAME_VALUE_ELEMENT
			conv_xml_element: XM_ELEMENT
		do
			if
				STRING_.same_string (a_xml_element.name, Local_element_name) or
				STRING_.same_string (a_xml_element.name, Global_element_name)
			then
				create var_decl.make (a_xml_element)
				if var_decl.has_value then
					conv_xml_element := a_xml_element.cloned_object
					conv_xml_element.set_name (Set_attribute_name)
					execute_task (conv_xml_element)
				end
			elseif
				not STRING_.same_string (a_xml_element.name, Description_element_name) and
				not STRING_.same_string (a_xml_element.name, Argument_element_name) and
				not STRING_.same_string (a_xml_element.name, Obsolete_element_name)
			then
				execute_task (a_xml_element)
			end
		end

feature -- Dependencies

	dependent_targets: DS_ARRAYED_STACK [GEANT_TARGET] is
			-- All dependent targets
		local
			a_dependent_target: GEANT_TARGET
			a_value: STRING
			a_dependent_targets: DS_ARRAYED_LIST [STRING]
			i: INTEGER
		do
			create Result.make (10)
			if has_dependencies then
					-- Check for targets separated by commas:
				a_dependent_targets := string_tokens (dependencies, ',')
				if project.options.debug_mode then
					show_dependent_targets (a_dependent_targets)
				end
					-- Find all targets.
				from i := 1 until i > a_dependent_targets.count loop
					a_value := a_dependent_targets.item (i)
					if project.targets.has (a_value) then
						a_dependent_target := project.targets.item (a_value).final_target
						Result.force (a_dependent_target)
					else
						exit_application (1, <<"geant error: unknown dependent target '", a_value, "%'">>)
					end
					i := i + 1
				end
			end
		ensure
			dependent_targets_not_void: Result /= Void
		end

	show_dependent_targets (a_dependent_targets: DS_ARRAYED_LIST [STRING]) is
			-- Show dependent targets.
		local
			i: INTEGER
		do
			std.output.put_line ("======= DEPENDENCIES ==========")
			from i := 1 until i > a_dependent_targets.count loop
				std.output.put_line (a_dependent_targets.item (i))
				i := i + 1
			end
			std.output.put_line ("=================")
		end

feature {NONE} -- Constants

	Obsolete_element_name: STRING is
			-- Name of xml subelement for obsolete
		once
			Result := "obsolete"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Argument_element_name: STRING is
			-- Name of xml subelement for arguments
		once
			Result := "argument"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Name_attribute_name: STRING is
			-- "name" attribute name
		once
			Result := "name"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Set_attribute_name: STRING is
			-- "set" attribute name
		once
			Result := "set"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Depend_attribute_name: STRING is
			-- "depend" attribute name
		once
			Result := "depend"
		ensure
			attribute_name_not_void: Result /= Void
			attribute_name_not_empty: Result.count > 0
		end

	Export_attribute_name: STRING is
			-- "export" attribute name
		once
			Result := "export"
		ensure
			export_name_not_void: Result /= Void
			export_name_not_empty: Result.count > 0
		end

	Once_attribute_name: STRING is
			-- "once" attribute name
		once
			Result := "once"
		ensure
			once_name_not_void: Result /= Void
			once_name_not_empty: Result.count > 0
		end

	Project_name_any: STRING is
			-- Project name "ANY"
		once
			Result := "ANY"
		ensure
			Project_name_any_not_void: Result /= Void
			Project_name_any_not_empty: Result.count > 0
		end

invariant

	no_void_export: exports /= Void implies not exports.has (Void)

end
