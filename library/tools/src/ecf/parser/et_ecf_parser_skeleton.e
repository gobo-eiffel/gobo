note

	description:

		"ECF parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_PARSER_SKELETON

inherit

	ANY

	ET_ECF_ELEMENT_NAMES
		export {NONE} all end

	ET_ECF_OPTION_DEFAULTS
		export {NONE} all end

	ET_ECF_SETTING_DEFAULTS
		export {NONE} all end

	ET_ECF_CAPABILITY_DEFAULTS
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

feature {NONE} -- Initialization

	make_standard
			-- Create a new ECF parser.
			-- Error messages will be sent to standard files.
		local
			a_handler: ET_ECF_ERROR_HANDLER
		do
			create a_handler.make_standard
			make (a_handler)
		ensure
			ise_version_set: ise_version = ise_latest
		end

	make (an_error_handler: like error_handler)
			-- Create a new ECF parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create ast_factory.make
			make_with_factory (ast_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
			ise_version_set: ise_version = ise_latest
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create a new ECF parser using `a_factory' as AST factory.
		require
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
			ast_factory := a_factory
			ise_version := ise_latest
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
			ise_version_set: ise_version = ise_latest
		end

feature -- Access

	ast_factory: ET_ECF_AST_FACTORY
			-- Abstract Syntax Tree factory

	error_handler: ET_ECF_ERROR_HANDLER
			-- Error handler

	ise_version: UT_VERSION
			-- ISE version to be used when evaluating version conditions

feature -- Setting

	set_ise_version (a_version: like ise_version)
			-- Set `ise_version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			ise_version := a_version
		ensure
			ise_version_set: ise_version = a_version
		end

feature {NONE} -- AST factory

	new_action (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_ACTION
			-- New action built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_action: STRING_.same_case_insensitive (a_element.name, xml_pre_compile_action) or STRING_.same_case_insensitive (a_element.name, xml_post_compile_action)
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_conditions: detachable ET_ECF_CONDITIONS
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_command) as l_command then
				error_handler.report_eatm_error (xml_command, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_command.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_command, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_action (l_command.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_succeed) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_must_succeed (True)
							elseif is_false (l_value) then
								Result.set_must_succeed (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_working_directory) then
							if l_child.value.is_empty then
								error_handler.report_eate_error (attribute_name (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							else
								Result.set_working_directory (l_child.value)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_actions (a_actions: detachable DS_ARRAYED_LIST [ET_ECF_ACTION]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable DS_ARRAYED_LIST [ET_ECF_ACTION]
			-- New actions (or `a_actions' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_action: STRING_.same_case_insensitive (a_element.name, xml_pre_compile_action) or STRING_.same_case_insensitive (a_element.name, xml_post_compile_action)
			a_target_not_void: a_target /= Void
		do
			Result := a_actions
			if attached new_action (a_element, a_position_table, a_target) as l_action then
				if Result = Void then
					Result := ast_factory.new_actions
				end
				Result.force_last (l_action)
			end
		end

	new_adapted_dotnet_assembly (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_ADAPTED_DOTNET_ASSEMBLY
			-- New .NET assembly built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_assembly: STRING_.same_case_insensitive (a_element.name, xml_assembly)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_conditions: detachable ET_ECF_CONDITIONS
			l_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			l_options: detachable ET_ECF_OPTIONS
			l_class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			l_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_location) as l_filename then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_filename.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_filename, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_adapted_dotnet_assembly (attribute_value (l_name, a_position_table), attribute_value (l_filename, a_position_table), a_target.system_config.universe, a_target)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_class_option) then
							l_class_options := new_class_options (l_class_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_note) then
							l_notes := new_notes (l_notes, l_child, a_position_table, a_target.system_config)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							l_options := new_options (l_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_renamings := new_renamings (l_renamings, l_child, a_position_table, a_target)
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_assembly_culture) then
							Result.set_assembly_culture (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_assembly_key) then
							Result.set_assembly_key (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_assembly_name) then
							Result.set_assembly_name (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_assembly_version) then
							Result.set_assembly_version (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_prefix) then
							Result.set_classname_prefix (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_readonly) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_read_only (True)
							elseif is_false (l_value) then
								Result.set_read_only (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						end
					end
					l_cursor.forth
				end
				if l_options /= Void then
					adapt_options (l_options)
					Result.set_options (l_options)
				end
				if l_class_options /= Void then
					l_class_options.do_all (agent adapt_options)
					Result.set_class_options (l_class_options)
				end
				Result.set_class_renamings (l_renamings)
				Result.set_conditions (l_conditions)
				Result.set_notes (l_notes)
			end
		end

	new_adapted_dotnet_assemblies (a_dotnet_assemblies: detachable ET_ECF_ADAPTED_DOTNET_ASSEMBLIES; a_element: XM_ELEMENT;
		a_position_table: detachable XM_POSITION_TABLE; a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_ADAPTED_DOTNET_ASSEMBLIES
			-- New .NET assemblies (or `a_dotnet_assemblies' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_assembly: STRING_.same_case_insensitive (a_element.name, xml_assembly)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		do
			Result := a_dotnet_assemblies
			if attached new_adapted_dotnet_assembly (a_element, a_position_table, a_default_options, a_target) as l_dotnet_assembly then
				if Result = Void then
					Result := ast_factory.new_adapted_dotnet_assemblies (l_dotnet_assembly)
				else
					Result.put_last (l_dotnet_assembly)
				end
			end
		end

	new_adapted_library (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_ADAPTED_LIBRARY
			-- New library built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_library: STRING_.same_case_insensitive (a_element.name, xml_library)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_conditions: detachable ET_ECF_CONDITIONS
			l_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			l_options: detachable ET_ECF_OPTIONS
			l_class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			l_visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			l_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_location) as l_filename then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_filename.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_filename, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_adapted_library (attribute_value (l_name, a_position_table), attribute_value (l_filename, a_position_table), a_target.system_config.universe, a_target)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_class_option) then
							l_class_options := new_class_options (l_class_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_note) then
							l_notes := new_notes (l_notes, l_child, a_position_table, a_target.system_config)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							l_options := new_options (l_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_renamings := new_renamings (l_renamings, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_visible) then
							l_visible_classes := new_visible_classes (l_visible_classes, l_child, a_position_table, a_target)
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_prefix) then
							Result.set_classname_prefix (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_readonly) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_read_only (True)
							elseif is_false (l_value) then
								Result.set_read_only (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_use_application_options) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_use_application_options (True)
							elseif is_false (l_value) then
								Result.set_use_application_options (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						end
					end
					l_cursor.forth
				end
				if l_options /= Void then
					adapt_options (l_options)
					Result.set_options (l_options)
				end
				if l_class_options /= Void then
					l_class_options.do_all (agent adapt_options)
					Result.set_class_options (l_class_options)
				end
				Result.set_class_renamings (l_renamings)
				Result.set_visible_classes (l_visible_classes)
				Result.set_conditions (l_conditions)
				Result.set_notes (l_notes)
			end
		end

	new_adapted_libraries (a_libraries: detachable ET_ECF_ADAPTED_LIBRARIES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_ADAPTED_LIBRARIES
			-- New libraries (or `a_libraries' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_library: STRING_.same_case_insensitive (a_element.name, xml_library)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		do
			Result := a_libraries
			if attached new_adapted_library (a_element, a_position_table, a_default_options, a_target) as l_library then
				if Result = Void then
					Result := ast_factory.new_adapted_libraries (l_library)
				else
					Result.put_last (l_library)
				end
			end
		end

	new_adapted_precompiled_library (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_ADAPTED_PRECOMPILED_LIBRARY
			-- New precompiled library built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_precompile: STRING_.same_case_insensitive (a_element.name, xml_precompile)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_conditions: detachable ET_ECF_CONDITIONS
			l_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			l_options: detachable ET_ECF_OPTIONS
			l_class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			l_visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			l_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_location) as l_filename then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_filename.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_filename, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_adapted_precompiled_library (attribute_value (l_name, a_position_table), attribute_value (l_filename, a_position_table), a_target.system_config.universe, a_target)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_class_option) then
							l_class_options := new_class_options (l_class_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_note) then
							l_notes := new_notes (l_notes, l_child, a_position_table, a_target.system_config)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							l_options := new_options (l_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_renamings := new_renamings (l_renamings, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_visible) then
							l_visible_classes := new_visible_classes (l_visible_classes, l_child, a_position_table, a_target)
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_eifgens_location) then
							Result.set_eifgens_location (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_prefix) then
							Result.set_classname_prefix (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_readonly) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_read_only (True)
							elseif is_false (l_value) then
								Result.set_read_only (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_use_application_options) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_use_application_options (True)
							elseif is_false (l_value) then
								Result.set_use_application_options (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						end
					end
					l_cursor.forth
				end
				if l_options /= Void then
					adapt_options (l_options)
					Result.set_options (l_options)
				end
				if l_class_options /= Void then
					l_class_options.do_all (agent adapt_options)
					Result.set_class_options (l_class_options)
				end
				Result.set_class_renamings (l_renamings)
				Result.set_visible_classes (l_visible_classes)
				Result.set_conditions (l_conditions)
			end
		end

	new_build_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_BUILD_CONDITION
			-- New build condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_build: STRING_.same_case_insensitive (a_element.name, xml_build)
			a_target_not_void: a_target /= Void
		do
			if attached a_element.attribute_by_name (xml_value) as l_value then
				if attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
					error_handler.report_eatx_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				elseif l_value.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				else
					Result := ast_factory.new_build_condition (l_value.value, False)
				end
			elseif not attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
				error_handler.report_eatn_error (xml_value, xml_excluded_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_build_condition (l_excluded_value.value, True)
			end
		end

	new_class_options (a_class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			-- New class options (or `a_class_options' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_class_option: STRING_.same_case_insensitive (a_element.name, xml_class_option)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_options: ET_ECF_OPTIONS
		do
			Result := a_class_options
			if not attached a_element.attribute_by_name (xml_class) as l_class then
				error_handler.report_eatm_error (xml_class, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_class.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_class, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				if Result = Void then
					Result := ast_factory.new_class_options
				end
				Result.search (l_class.value)
				if Result.found then
					l_options := Result.found_item
				else
					l_options := ast_factory.new_options
					Result.force_last (l_options, l_class.value.as_upper)
				end
				add_options (l_options, a_element, a_position_table, a_default_options, a_target)
			end
		end

	new_cluster (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_CLUSTER
			-- New cluster built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_cluster: STRING_.same_case_insensitive (a_element.name, xml_cluster)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_subclusters: detachable ET_ECF_CLUSTERS
			l_file_rules: detachable ET_ECF_FILE_RULES
			l_conditions: detachable ET_ECF_CONDITIONS
			l_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			l_mappings: detachable DS_HASH_TABLE [STRING, STRING]
			l_options: detachable ET_ECF_OPTIONS
			l_class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			l_visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			l_provider_groups: detachable DS_ARRAYED_LIST [STRING]
			l_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_cluster (l_name.value, l_pathname.value, a_target.system_config.universe, a_target)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_cluster) then
							l_subclusters := new_clusters (l_subclusters, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_class_option) then
							l_class_options := new_class_options (l_class_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_file_rule) then
							l_file_rules := new_file_rules (l_file_rules, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_mapping) then
							l_mappings := new_mappings (l_mappings, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_note) then
							l_notes := new_notes (l_notes, l_child, a_position_table, a_target.system_config)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							l_options := new_options (l_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_renamings := new_renamings (l_renamings, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_uses) then
							l_provider_groups := new_provider_groups (l_provider_groups, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_visible) then
							l_visible_classes := new_visible_classes (l_visible_classes, l_child, a_position_table, a_target)
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_hidden) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_hidden (True)
							elseif is_false (l_value) then
								Result.set_hidden (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_prefix) then
							Result.set_classname_prefix (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_readonly) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_read_only (True)
							elseif is_false (l_value) then
								Result.set_read_only (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_recursive) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_recursive (True)
							elseif is_false (l_value) then
								Result.set_recursive (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditioned_subclusters (l_subclusters)
				Result.set_conditioned_file_rules (l_file_rules)
				if l_options /= Void then
					adapt_options (l_options)
					Result.set_options (l_options)
				end
				if l_class_options /= Void then
					l_class_options.do_all (agent adapt_options)
					Result.set_class_options (l_class_options)
				end
				Result.set_class_renamings (l_renamings)
				Result.set_class_mappings (l_mappings)
				Result.set_visible_classes (l_visible_classes)
				Result.set_provider_groups (l_provider_groups)
				Result.set_conditions (l_conditions)
				Result.set_notes (l_notes)
			end
		end

	new_clusters (a_clusters: detachable ET_ECF_CLUSTERS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_CLUSTERS
			-- New clusters (or `a_clusters' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_cluster: STRING_.same_case_insensitive (a_element.name, xml_cluster)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		do
			Result := a_clusters
			if attached new_cluster (a_element, a_position_table, a_default_options, a_target) as l_cluster then
				if Result = Void then
					Result := ast_factory.new_clusters (l_cluster)
				else
					Result.put_last (l_cluster)
				end
			end
		end

	new_concurrency_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_CONCURRENCY_CONDITION
			-- New concurrency condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_concurrency: STRING_.same_case_insensitive (a_element.name, xml_concurrency)
			a_target_not_void: a_target /= Void
		do
			if attached a_element.attribute_by_name (xml_value) as l_value then
				if attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
					error_handler.report_eatx_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				elseif l_value.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				else
					Result := ast_factory.new_concurrency_condition (l_value.value, False)
				end
			elseif not attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
				error_handler.report_eatn_error (xml_value, xml_excluded_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_concurrency_condition (l_excluded_value.value, True)
			end
		end

	new_condition (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_ANDED_CONDITIONS
			-- New condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_condition: STRING_.same_case_insensitive (an_element.name, xml_condition)
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_condition: detachable ET_ECF_CONDITION_ITEM
		do
			Result := ast_factory.new_anded_conditions
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ELEMENT} l_cursor.item as l_child then
					if STRING_.same_case_insensitive (l_child.name, xml_build) then
						l_condition := new_build_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_concurrency) then
						l_condition := new_concurrency_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_void_safety) then
						l_condition := new_void_safety_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_custom) then
						l_condition := new_custom_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_dotnet) then
						l_condition := new_dotnet_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_dynamic_runtime) then
						l_condition := new_dynamic_runtime_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_multithreaded) then
						l_condition := new_multithreaded_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_platform) then
						l_condition := new_platform_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_version) then
						l_condition := new_version_condition (l_child, a_position_table, a_target)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					end
				end
				l_cursor.forth
			end
		end

	new_conditions (a_conditions: detachable ET_ECF_CONDITIONS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_CONDITIONS
			-- New conditions (or `a_conditions' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_condition: STRING_.same_case_insensitive (a_element.name, xml_condition)
			a_target_not_void: a_target /= Void
		local
			l_new_orded_conditions: ET_ECF_ORED_CONDITIONS
		do
			Result := a_conditions
			if attached new_condition (a_element, a_position_table, a_target) as l_condition then
				if Result = Void then
					Result := l_condition
				elseif attached {ET_ECF_ANDED_CONDITIONS} Result as l_anded_condition then
					l_new_orded_conditions := ast_factory.new_ored_conditions (l_anded_condition)
					l_new_orded_conditions.put_last (l_condition)
					Result := l_new_orded_conditions
				elseif attached {ET_ECF_ORED_CONDITIONS} Result as l_ored_conditions then
					l_ored_conditions.put_last (l_condition)
				else
					check conditions_are_either_ored_or_anded: False end
				end
			end
		end

	new_custom_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_CUSTOM_CONDITION
			-- New custom condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_custom: STRING_.same_case_insensitive (a_element.name, xml_custom)
			a_target_not_void: a_target /= Void
		local
			l_match: detachable STRING
		do
			if attached a_element.attribute_by_name (xml_match) as l_match_attribute then
				l_match := l_match_attribute.value
			end
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif attached a_element.attribute_by_name (xml_value) as l_value then
				if attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
					error_handler.report_eatx_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				elseif l_value.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				else
					Result := ast_factory.new_custom_condition (l_name.value, l_value.value, l_match, False)
				end
			elseif not attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
				error_handler.report_eatn_error (xml_value, xml_excluded_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_custom_condition (l_name.value, l_excluded_value.value, l_match, True)
			end
		end

	new_dotnet_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_DOTNET_CONDITION
			-- New dotnet condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_dotnet: STRING_.same_case_insensitive (a_element.name, xml_dotnet)
			a_target_not_void: a_target /= Void
		local
			l_bool: STRING
		do
			if not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_value, element_name (a_element, a_position_table), a_target.system_config)
			else
				l_bool := l_value.value
				if is_true (l_bool) then
					Result := ast_factory.new_dotnet_condition (True)
				elseif is_false (l_bool) then
					Result := ast_factory.new_dotnet_condition (False)
				else
					error_handler.report_eatb_error (attribute_name (l_value, a_position_table), attribute_value (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
			end
		end

	new_dynamic_runtime_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_DYNAMIC_RUNTIME_CONDITION
			-- New dynamic_runtime condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_dynamic_runtime: STRING_.same_case_insensitive (a_element.name, xml_dynamic_runtime)
			a_target_not_void: a_target /= Void
		local
			l_bool: STRING
		do
			if not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_value, element_name (a_element, a_position_table), a_target.system_config)
			else
				l_bool := l_value.value
				if is_true (l_bool) then
					Result := ast_factory.new_dynamic_runtime_condition (True)
				elseif is_false (l_bool) then
					Result := ast_factory.new_dynamic_runtime_condition (False)
				else
					error_handler.report_eatb_error (attribute_name (l_value, a_position_table), attribute_value (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
			end
		end

	new_external_cflag (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_CFLAG
			-- New external C flag built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_cflag: STRING_.same_case_insensitive (a_element.name, xml_external_cflag)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_cflag (l_value.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_cflags (a_external_cflags: detachable ET_ECF_EXTERNAL_CFLAGS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_CFLAGS
			-- New external C flags (or `a_external_cflags' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_cflag: STRING_.same_case_insensitive (a_element.name, xml_external_cflag)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_cflags
			if attached new_external_cflag (a_element, a_position_table, a_target) as l_external_cflag then
				if Result = Void then
					Result := ast_factory.new_external_cflags (l_external_cflag)
				else
					Result.put_last (l_external_cflag)
				end
			end
		end

	new_external_include (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_INCLUDE
			-- New external include built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_include: STRING_.same_case_insensitive (a_element.name, xml_external_include)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_include (l_pathname.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_includes (a_external_includes: detachable ET_ECF_EXTERNAL_INCLUDES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_INCLUDES
			-- New external includes (or `a_external_includes' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_include: STRING_.same_case_insensitive (a_element.name, xml_external_include)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_includes
			if attached new_external_include (a_element, a_position_table, a_target) as l_external_include then
				if Result = Void then
					Result := ast_factory.new_external_includes (l_external_include)
				else
					Result.put_last (l_external_include)
				end
			end
		end

	new_external_library (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_LIBRARY
			-- New external library built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_library: STRING_.same_case_insensitive (a_element.name, xml_external_library)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_library (l_pathname.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_libraries (a_external_libraries: detachable ET_ECF_EXTERNAL_LIBRARIES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_LIBRARIES
			-- New external libraries (or `a_external_libraries' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_library: STRING_.same_case_insensitive (a_element.name, xml_external_library)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_libraries
			if attached new_external_library (a_element, a_position_table, a_target) as l_external_library then
				if Result = Void then
					Result := ast_factory.new_external_libraries (l_external_library)
				else
					Result.put_last (l_external_library)
				end
			end
		end

	new_external_linker_flag (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_LINKER_FLAG
			-- New external linker flag built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_linker_flag: STRING_.same_case_insensitive (a_element.name, xml_external_linker_flag)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_linker_flag (l_value.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_linker_flags (a_external_linker_flags: detachable ET_ECF_EXTERNAL_LINKER_FLAGS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_LINKER_FLAGS
			-- New external linker flags (or `a_external_linker_flags' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_linker_flag: STRING_.same_case_insensitive (a_element.name, xml_external_linker_flag)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_linker_flags
			if attached new_external_linker_flag (a_element, a_position_table, a_target) as l_external_linker_flag then
				if Result = Void then
					Result := ast_factory.new_external_linker_flags (l_external_linker_flag)
				else
					Result.put_last (l_external_linker_flag)
				end
			end
		end

	new_external_make (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_MAKE
			-- New external make built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_make: STRING_.same_case_insensitive (a_element.name, xml_external_make)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_make (l_pathname.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_makes (a_external_makes: detachable ET_ECF_EXTERNAL_MAKES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_MAKES
			-- New external makes (or `a_external_makes' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_make: STRING_.same_case_insensitive (a_element.name, xml_external_make)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_makes
			if attached new_external_make (a_element, a_position_table, a_target) as l_external_make then
				if Result = Void then
					Result := ast_factory.new_external_makes (l_external_make)
				else
					Result.put_last (l_external_make)
				end
			end
		end

	new_external_object (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_OBJECT
			-- New external object built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_object: STRING_.same_case_insensitive (a_element.name, xml_external_object)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_object (l_pathname.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_objects (a_external_objects: detachable ET_ECF_EXTERNAL_OBJECTS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_OBJECTS
			-- New external objects (or `a_external_objects' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_object: STRING_.same_case_insensitive (a_element.name, xml_external_object)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_objects
			if attached new_external_object (a_element, a_position_table, a_target) as l_external_object then
				if Result = Void then
					Result := ast_factory.new_external_objects (l_external_object)
				else
					Result.put_last (l_external_object)
				end
			end
		end

	new_external_resource (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_RESOURCE
			-- New external resource built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_resource: STRING_.same_case_insensitive (a_element.name, xml_external_resource)
			a_target_not_void: a_target /= Void
		local
			l_conditions: detachable ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_external_resource (l_pathname.value)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditions (l_conditions)
			end
		end

	new_external_resources (a_external_resources: detachable ET_ECF_EXTERNAL_RESOURCES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_EXTERNAL_RESOURCES
			-- New external resources (or `a_external_resources' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_external_resource: STRING_.same_case_insensitive (a_element.name, xml_external_resource)
			a_target_not_void: a_target /= Void
		do
			Result := a_external_resources
			if attached new_external_resource (a_element, a_position_table, a_target) as l_external_resource then
				if Result = Void then
					Result := ast_factory.new_external_resources (l_external_resource)
				else
					Result.put_last (l_external_resource)
				end
			end
		end

	new_file_rule (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_FILE_RULE
			-- New file rule built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_file_rule: STRING_.same_case_insensitive (a_element.name, xml_file_rule)
			a_target_not_void: a_target /= Void
		local
			l_excluded: detachable DS_HASH_SET [STRING]
			l_included: detachable DS_HASH_SET [STRING]
			l_conditions: detachable ET_ECF_CONDITIONS
			l_description: detachable STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			l_cursor := a_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ELEMENT} l_cursor.item as l_child then
					if STRING_.same_case_insensitive (l_child.name, xml_exclude) then
						if attached l_child.text as l_text and then not l_text.is_empty then
							if l_excluded = Void then
								create l_excluded.make (10)
							end
							l_excluded.force_last (l_text)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_include) then
						if attached l_child.text as l_text and then not l_text.is_empty then
							if l_included = Void then
								create l_included.make (10)
							end
							l_included.force_last (l_text)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_condition) then
						l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
					elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
						if attached l_child.text as l_text and then not l_text.is_empty then
							l_description := l_text
						end
					end
				end
				l_cursor.forth
			end
			Result := ast_factory.new_file_rule (l_excluded, l_included)
			Result.set_conditions (l_conditions)
			Result.set_description (l_description)
		end

	new_file_rules (a_file_rules: detachable ET_ECF_FILE_RULES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_FILE_RULES
			-- New file rules (or `a_file_rules' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_file_rule: STRING_.same_case_insensitive (a_element.name, xml_file_rule)
			a_target_not_void: a_target /= Void
		do
			Result := a_file_rules
			if attached new_file_rule (a_element, a_position_table, a_target) as l_file_rule then
				if Result = Void then
					Result := ast_factory.new_file_rules (l_file_rule)
				else
					Result.put_last (l_file_rule)
				end
			end
		end

	new_library (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_adapted_library: ET_ECF_ADAPTED_LIBRARY): detachable ET_ECF_LIBRARY
			-- New library built from `an_element'
		require
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
			a_filename_not_void: a_filename /= Void
			a_adapted_library_not_void: a_adapted_library /= Void
		local
			l_unknown_library: ET_ECF_LIBRARY
			l_parsed_libraries: like parsed_libraries
			l_system: ET_SYSTEM
		do
			l_system := a_adapted_library.universe.current_system
			if not attached a_element.attribute_by_name (xml_uuid) as l_uuid then
				if not attached a_element.attribute_by_name (xml_name) as l_name or else l_name.value.is_empty then
					l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
				else
					l_unknown_library := ast_factory.new_library (l_name.value, a_filename, l_system)
				end
				a_adapted_library.set_library (l_unknown_library)
				error_handler.report_eatm_error (xml_uuid, element_name (a_element, a_position_table), l_unknown_library)
			else
				l_parsed_libraries := parsed_libraries
				l_parsed_libraries.search (l_uuid.value)
				if l_parsed_libraries.found then
						-- Already parsed.
					Result := l_parsed_libraries.found_item
					a_adapted_library.set_library (Result)
				else
					if not attached a_element.attribute_by_name (xml_name) as l_name then
						l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
						a_adapted_library.set_library (l_unknown_library)
						error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), l_unknown_library)
					elseif l_name.value.is_empty then
						l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
						a_adapted_library.set_library (l_unknown_library)
						error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), l_unknown_library)
					else
						Result := ast_factory.new_library (l_name.value, a_filename, l_system)
						a_adapted_library.set_library (Result)
						fill_system_config (Result, a_element, a_position_table)
						l_parsed_libraries.force_last_new (Result, l_uuid.value)
					end
				end
			end
		end

	new_mappings (a_mappings: detachable DS_HASH_TABLE [STRING, STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable DS_HASH_TABLE [STRING, STRING]
			-- New class mappings (or `a_mappings' if not Void) built from `a_element'
		require
			no_void_old_class_mapping: a_mappings /= Void implies not a_mappings.has_void
			no_void_new_class_mapping: a_mappings /= Void implies not a_mappings.has_void_item
			a_element_not_void: a_element /= Void
			is_mapping: STRING_.same_case_insensitive (a_element.name, xml_mapping)
			a_target_not_void: a_target /= Void
		do
			if a_mappings /= Void then
				Result := a_mappings
			else
				Result := ast_factory.new_class_mappings
			end
			add_mapping (Result, a_element, a_position_table, a_target)
		ensure
			no_void_old_class_mapping: Result /= Void implies not Result.has_void
			no_void_new_class_mapping: Result /= Void implies not Result.has_void_item
		end

	new_multithreaded_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_CONCURRENCY_CONDITION
			-- New multithreaded condition built from `an_element'
			--
			-- Note: condition "multithreaded" was superseded by condition "concurrency" in ECF 1.8.0.
		require
			a_element_not_void: a_element /= Void
			is_multithreaded: STRING_.same_case_insensitive (a_element.name, xml_multithreaded)
			a_target_not_void: a_target /= Void
		local
			l_bool: STRING
		do
			if not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_value, element_name (a_element, a_position_table), a_target.system_config)
			else
				l_bool := l_value.value
				if is_true (l_bool) then
					Result := ast_factory.new_concurrency_condition ({ET_ECF_CAPABILITY_NAMES}.thread_capability_value, False)
				elseif is_false (l_bool) then
					Result := ast_factory.new_concurrency_condition ({ET_ECF_CAPABILITY_NAMES}.thread_capability_value, True)
				else
					error_handler.report_eatb_error (attribute_name (l_value, a_position_table), attribute_value (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
			end
		end

	new_note_element (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_system_config: ET_ECF_SYSTEM_CONFIG): detachable ET_ECF_NOTE_ELEMENT
			-- New note element built from `a_element'
		require
			a_element_not_void: a_element /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			Result := ast_factory.new_note (a_element.name)
			l_cursor := a_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ATTRIBUTE} l_cursor.item as l_child then
					Result.add_attribute (l_child.name, l_child.value)
				elseif attached {XM_ELEMENT} l_cursor.item as l_child then
					if attached new_note_element (l_child, a_position_table, a_system_config) as l_note_element then
						Result.add_element (l_note_element)
					end
				end
				l_cursor.forth
			end
			if attached a_element.text as l_text and then not l_text.is_empty then
				Result.set_content (l_text)
			end
		end

	new_notes (a_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_system_config: ET_ECF_SYSTEM_CONFIG): detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- New notes (or `a_notes' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_note: STRING_.same_case_insensitive (a_element.name, xml_note)
			a_system_config_not_void: a_system_config /= Void
		do
			Result := a_notes
			if attached new_note_element (a_element, a_position_table, a_system_config) as l_note then
				if Result = Void then
					Result := ast_factory.new_notes
				end
				Result.force_last (l_note)
			end
		end

	new_options (a_options: detachable ET_ECF_OPTIONS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_OPTIONS
			-- New options (or `a_options' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_option: STRING_.same_case_insensitive (a_element.name, xml_option)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		do
			if a_options /= Void then
				Result := a_options
			else
				Result := ast_factory.new_options
			end
			add_options (Result, a_element, a_position_table, a_default_options, a_target)
		end

	new_overridden_group (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable STRING
			-- New overridden group built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_overrides: STRING_.same_case_insensitive (a_element.name, xml_overrides)
			a_target_not_void: a_target /= Void
		do
			if not attached a_element.attribute_by_name (xml_group) as l_group then
				error_handler.report_eatm_error (xml_group, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_group.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_group, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := l_group.value
			end
		end

	new_override_cluster (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_CLUSTER
			-- New override cluster built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_cluster: STRING_.same_case_insensitive (a_element.name, xml_cluster)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_subclusters: detachable ET_ECF_CLUSTERS
			l_file_rules: detachable ET_ECF_FILE_RULES
			l_conditions: detachable ET_ECF_CONDITIONS
			l_renamings: detachable DS_HASH_TABLE [STRING, STRING]
			l_mappings: detachable DS_HASH_TABLE [STRING, STRING]
			l_options: detachable ET_ECF_OPTIONS
			l_class_options: detachable DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			l_visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			l_provider_groups: detachable DS_ARRAYED_LIST [STRING]
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_location) as l_pathname then
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_pathname.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_pathname, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_cluster (l_name.value, l_pathname.value, a_target.system_config.universe, a_target)
				Result.set_override (True)
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_conditions := new_conditions (l_conditions, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_class_option) then
							l_class_options := new_class_options (l_class_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_file_rule) then
							l_file_rules := new_file_rules (l_file_rules, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_mapping) then
							l_mappings := new_mappings (l_mappings, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							l_options := new_options (l_options, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_override) then
							l_subclusters := new_override_clusters (l_subclusters, l_child, a_position_table, a_default_options, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_overrides) then
							if attached new_overridden_group (l_child, a_position_table, a_target) as l_overridden_group then
								Result.set_overridden_group (l_overridden_group)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_renamings := new_renamings (l_renamings, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_uses) then
							l_provider_groups := new_provider_groups (l_provider_groups, l_child, a_position_table, a_target)
						elseif STRING_.same_case_insensitive (l_child.name, xml_visible) then
							l_visible_classes := new_visible_classes (l_visible_classes, l_child, a_position_table, a_target)
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_hidden) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_hidden (True)
							elseif is_false (l_value) then
								Result.set_hidden (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_prefix) then
							Result.set_classname_prefix (l_child.value)
						elseif STRING_.same_case_insensitive (l_child.name, xml_readonly) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_read_only (True)
							elseif is_false (l_value) then
								Result.set_read_only (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_recursive) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_recursive (True)
							elseif is_false (l_value) then
								Result.set_recursive (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_conditioned_subclusters (l_subclusters)
				Result.set_conditioned_file_rules (l_file_rules)
				if l_options /= Void then
					adapt_options (l_options)
					Result.set_options (l_options)
				end
				if l_class_options /= Void then
					l_class_options.do_all (agent adapt_options)
					Result.set_class_options (l_class_options)
				end
				Result.set_class_renamings (l_renamings)
				Result.set_class_mappings (l_mappings)
				Result.set_visible_classes (l_visible_classes)
				Result.set_provider_groups (l_provider_groups)
				Result.set_conditions (l_conditions)
			end
		end

	new_override_clusters (a_overrides: detachable ET_ECF_CLUSTERS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET): detachable ET_ECF_CLUSTERS
			-- New override clusters (or `a_overrides' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_override: STRING_.same_case_insensitive (a_element.name, xml_override)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		do
			Result := a_overrides
			if attached new_override_cluster (a_element, a_position_table, a_default_options, a_target) as l_override then
				if Result = Void then
					Result := ast_factory.new_clusters (l_override)
				else
					Result.put_last (l_override)
				end
			end
		end

	new_platform_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_PLATFORM_CONDITION
			-- New platform condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_platform: STRING_.same_case_insensitive (a_element.name, xml_platform)
			a_target_not_void: a_target /= Void
		do
			if attached a_element.attribute_by_name (xml_value) as l_value then
				if attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
					error_handler.report_eatx_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				elseif l_value.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				else
					Result := ast_factory.new_platform_condition (l_value.value, False)
				end
			elseif not attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
				error_handler.report_eatn_error (xml_value, xml_excluded_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_platform_condition (l_excluded_value.value, True)
			end
		end

	new_provider_groups (a_provider_groups: detachable DS_ARRAYED_LIST [STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable DS_ARRAYED_LIST [STRING]
			-- New provider groups (or `a_provider_groups' if not Void) built from `a_element'
		require
			no_void_group: a_provider_groups /= Void implies not a_provider_groups.has_void
			a_element_not_void: a_element /= Void
			is_uses: STRING_.same_case_insensitive (a_element.name, xml_uses)
			a_target_not_void: a_target /= Void
		do
			if a_provider_groups /= Void then
				Result := a_provider_groups
			else
				Result := ast_factory.new_provider_groups
			end
			add_provider_group (Result, a_element, a_position_table, a_target)
		ensure
			no_void_group: Result /= Void implies not Result.has_void
		end

	new_redirection_config (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE): detachable ET_ECF_REDIRECTION_CONFIG
			-- New redirection config built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_redirection: STRING_.same_case_insensitive (a_element.name, xml_redirection)
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_unknown_system_config: ET_ECF_SYSTEM_CONFIG
			l_namespace_uri: STRING
		do
			if not attached a_element.attribute_by_name (xml_location) as l_location then
				l_unknown_system_config := ast_factory.new_system_config ("*unknown*", a_filename, a_universe)
				error_handler.report_eatm_error (xml_location, element_name (a_element, a_position_table), l_unknown_system_config)
			else
				Result := ast_factory.new_redirection_config (l_location.value, a_filename, a_universe)
				if attached a_element.attribute_by_name (xml_uuid) as l_uuid then
					Result.set_uuid (l_uuid.value)
				end
				if attached a_element.attribute_by_name (xml_message) as l_message then
					Result.set_message (l_message.value)
				end
				l_namespace_uri := a_element.namespace.uri
				Result.set_ecf_namespace (l_namespace_uri)
				Result.set_ecf_version (ecf_version (l_namespace_uri))
			end
		end

	new_renamings (a_renamings: detachable DS_HASH_TABLE [STRING, STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable DS_HASH_TABLE [STRING, STRING]
			-- New class renamings (or `a_renamings' if not Void) built from `a_element'
		require
			no_void_old_class_renaming: a_renamings /= Void implies not a_renamings.has_void
			no_void_new_class_renaming: a_renamings /= Void implies not a_renamings.has_void_item
			a_element_not_void: a_element /= Void
			is_renaming: STRING_.same_case_insensitive (a_element.name, xml_renaming)
			a_target_not_void: a_target /= Void
		do
			if a_renamings /= Void then
				Result := a_renamings
			else
				Result := ast_factory.new_class_renamings
			end
			add_renaming (Result, a_element, a_position_table, a_target)
		ensure
			no_void_old_class_renaming: Result /= Void implies not Result.has_void
			no_void_new_class_renaming: Result /= Void implies not Result.has_void_item
		end

	new_root (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_ROOT
			-- New root built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_root: STRING_.same_case_insensitive (a_element.name, xml_root)
			a_position_table_not_void: a_position_table /= Void
			a_target_not_void: a_target /= Void
		local
			l_root_class: detachable ET_ECF_ROOT_CLASS
			l_all_classes_true: BOOLEAN
			l_bool: STRING
		do
			if attached a_element.attribute_by_name (xml_all_classes) as l_all_classes then
				l_bool := l_all_classes.value
				if is_true (l_bool) then
					l_all_classes_true := True
				elseif not is_false (l_bool) then
					error_handler.report_eatb_error (attribute_name (l_all_classes, a_position_table), attribute_value (l_all_classes, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
			end
			if l_all_classes_true then
				Result := ast_factory.new_root_all_classes
			elseif not attached a_element.attribute_by_name (xml_class) as l_class_name then
				error_handler.report_eatm_error (xml_class, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_class_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_class_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				l_root_class := ast_factory.new_root_class (attribute_value (l_class_name, a_position_table))
				Result := l_root_class
				if attached a_element.attribute_by_name (xml_feature) as l_feature then
					if l_feature.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_feature, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					else
						l_root_class.set_creation_procedure_name (attribute_value (l_feature, a_position_table))
					end
				end
				if attached a_element.attribute_by_name (xml_cluster) as l_cluster then
					if l_cluster.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_cluster, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					else
						l_root_class.set_cluster_name (attribute_value (l_cluster, a_position_table))
					end
				end
			end
		end

	new_system (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING): detachable ET_ECF_SYSTEM
			-- New system built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
			a_filename_not_void: a_filename /= Void
		local
			l_unknown_universe: ET_ECF_SYSTEM
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				l_unknown_universe := ast_factory.new_system ("*unknown*", a_filename)
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), l_unknown_universe)
			elseif l_name.value.is_empty then
				l_unknown_universe := ast_factory.new_system ("*unknown*", a_filename)
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), l_unknown_universe)
			else
				Result := ast_factory.new_system (l_name.value, a_filename)
				fill_system_config (Result, a_element, a_position_table)
			end
		end

	new_system_config (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE): detachable ET_ECF_SYSTEM_CONFIG
			-- New system config built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_unknown_system_config: ET_ECF_SYSTEM_CONFIG
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				l_unknown_system_config := ast_factory.new_system_config ("*unknown*", a_filename, a_universe)
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), l_unknown_system_config)
			elseif l_name.value.is_empty then
				l_unknown_system_config := ast_factory.new_system_config ("*unknown*", a_filename, a_universe)
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), l_unknown_system_config)
			else
				Result := ast_factory.new_system_config (l_name.value, a_filename, a_universe)
				fill_system_config (Result, a_element, a_position_table)
			end
		end

	new_target (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_ecf_version: UT_VERSION; a_default_settings: ET_ECF_SETTINGS; a_default_capabilities: ET_ECF_CAPABILITIES;
		a_default_options: ET_ECF_OPTIONS; a_system_config: ET_ECF_SYSTEM_CONFIG): detachable ET_ECF_TARGET
			-- New target built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_target: STRING_.same_case_insensitive (a_element.name, xml_target)
			a_ecf_version_not_void: a_ecf_version /= Void
			a_default_settings_not_void: a_default_settings /= Void
			a_default_capabilities_not_void: a_default_capabilities /= Void
			a_default_options_not_void: a_default_options /= Void
			a_system_config_not_void: a_system_config /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_clusters: detachable ET_ECF_CLUSTERS
			l_libraries: detachable ET_ECF_ADAPTED_LIBRARIES
			l_dotnet_assemblies: detachable ET_ECF_ADAPTED_DOTNET_ASSEMBLIES
			l_file_rules: detachable ET_ECF_FILE_RULES
			l_external_cflags: detachable ET_ECF_EXTERNAL_CFLAGS
			l_external_includes: detachable ET_ECF_EXTERNAL_INCLUDES
			l_external_libraries: detachable ET_ECF_EXTERNAL_LIBRARIES
			l_external_linker_flags: detachable ET_ECF_EXTERNAL_LINKER_FLAGS
			l_external_makes: detachable ET_ECF_EXTERNAL_MAKES
			l_external_objects: detachable ET_ECF_EXTERNAL_OBJECTS
			l_external_resources: detachable ET_ECF_EXTERNAL_RESOURCES
			l_mappings: detachable DS_HASH_TABLE [STRING, STRING]
			l_pre_compile_actions: detachable DS_ARRAYED_LIST [ET_ECF_ACTION]
			l_post_compile_actions: detachable DS_ARRAYED_LIST [ET_ECF_ACTION]
			l_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			l_parent_name: detachable ET_IDENTIFIER
			l_parent_location: detachable ET_IDENTIFIER
			l_parent: ET_ECF_TARGET_PARENT
			l_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_system_config)
			else
				Result := ast_factory.new_target (l_name.value, a_system_config)
				Result.settings.set_secondary_settings (a_default_settings)
				Result.capabilities.set_secondary_capabilities (a_default_capabilities)
				Result.options.set_secondary_options (a_default_options)
				if attached a_element.attribute_by_name (xml_extends) as l_extends then
					if l_extends.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_extends, a_position_table), element_name (a_element, a_position_table), a_system_config)
					else
						l_parent_name := attribute_value (l_extends, a_position_table)
					end
				end
				if attached a_element.attribute_by_name (xml_extends_location) as l_extends_location then
					if l_extends_location.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_extends_location, a_position_table), element_name (a_element, a_position_table), a_system_config)
					else
						l_parent_location := attribute_value (l_extends_location, a_position_table)
					end
				end
				if l_parent_name /= Void or l_parent_location /= Void then
					create l_parent.make (l_parent_name, l_parent_location)
					Result.set_parent (l_parent)
				end
				l_cursor := a_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					if attached {XM_ELEMENT} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_assembly) then
							l_dotnet_assemblies := new_adapted_dotnet_assemblies (l_dotnet_assemblies, l_child, a_position_table, a_default_options, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_capability) then
							add_capabilities (Result.capabilities, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_cluster) then
							l_clusters := new_clusters (l_clusters, l_child, a_position_table, a_default_options, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
							if attached l_child.text as l_text and then not l_text.is_empty then
								Result.set_description (l_text)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_cflag) then
							l_external_cflags := new_external_cflags (l_external_cflags, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_include) then
							l_external_includes := new_external_includes (l_external_includes, l_child, a_position_table,Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_library) then
							l_external_libraries := new_external_libraries (l_external_libraries, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_linker_flag) then
							l_external_linker_flags := new_external_linker_flags (l_external_linker_flags, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_make) then
							l_external_makes := new_external_makes (l_external_makes, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_object) then
							l_external_objects := new_external_objects (l_external_objects, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_resource) then
							l_external_resources := new_external_resources (l_external_resources, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_file_rule) then
							l_file_rules := new_file_rules (l_file_rules, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_override) then
							l_clusters := new_override_clusters (l_clusters, l_child, a_position_table, a_default_options, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_library) then
							l_libraries := new_adapted_libraries (l_libraries, l_child, a_position_table, a_default_options, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_mapping) then
							l_mappings := new_mappings (l_mappings, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_note) then
							l_notes := new_notes (l_notes, l_child, a_position_table, a_system_config)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							add_options (Result.options, l_child, a_position_table, a_default_options, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_post_compile_action) then
							l_post_compile_actions := new_actions (l_post_compile_actions, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_pre_compile_action) then
							l_pre_compile_actions := new_actions (l_pre_compile_actions, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_precompile) then
							if attached new_adapted_precompiled_library (l_child, a_position_table, a_default_options, Result) as l_precompiled_library then
								Result.set_precompiled_library (l_precompiled_library)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_root) then
							if Result.root /= Void then
-- TODO: warning: several roots specified.
							end
							if attached new_root (l_child, a_position_table, Result) as l_root then
								Result.set_root (l_root)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_setting) then
							add_setting (Result.settings, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_variable) then
							add_variable (Result.variables, l_child, a_position_table, Result)
						elseif STRING_.same_case_insensitive (l_child.name, xml_version) then
							if attached new_version (l_child, a_position_table, Result) as l_version then
								Result.set_version (l_version)
							end
						end
					elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
						if STRING_.same_case_insensitive (l_child.name, xml_abstract) then
							l_value := l_child.value
							if is_true (l_value) then
								Result.set_abstract (True)
							elseif is_false (l_value) then
								Result.set_abstract (False)
							else
								error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_system_config)
							end
						end
					end
					l_cursor.forth
				end
					-- Conversions from old ECF versions.
				adapt_capabilities (Result, a_ecf_version)
				adapt_target_options (Result)
				Result.set_clusters (l_clusters)
				Result.set_libraries (l_libraries)
				Result.set_dotnet_assemblies (l_dotnet_assemblies)
				Result.set_file_rules (l_file_rules)
				Result.set_class_mappings (l_mappings)
				Result.set_external_cflags (l_external_cflags)
				Result.set_external_includes (l_external_includes)
				Result.set_external_libraries (l_external_libraries)
				Result.set_external_linker_flags (l_external_linker_flags)
				Result.set_external_makes (l_external_makes)
				Result.set_external_objects (l_external_objects)
				Result.set_external_resources (l_external_resources)
				Result.set_pre_compile_actions (l_pre_compile_actions)
				Result.set_post_compile_actions (l_post_compile_actions)
				Result.set_notes (l_notes)
			end
		end

	new_targets (a_targets: detachable ET_ECF_TARGETS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_ecf_version: UT_VERSION; a_default_settings: ET_ECF_SETTINGS; a_default_capabilities: ET_ECF_CAPABILITIES;
		a_default_options: ET_ECF_OPTIONS; a_system_config: ET_ECF_SYSTEM_CONFIG): detachable ET_ECF_TARGETS
			-- New targets (or `a_targets' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_target: STRING_.same_case_insensitive (a_element.name, xml_target)
			a_ecf_version_not_void: a_ecf_version /= Void
			a_default_settings_not_void: a_default_settings /= Void
			a_default_capabilities_not_void: a_default_capabilities /= Void
			a_default_options_not_void: a_default_options /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			Result := a_targets
			if attached new_target (a_element, a_position_table, a_ecf_version, a_default_settings, a_default_capabilities, a_default_options, a_system_config) as l_target then
				if Result = Void then
					Result := ast_factory.new_targets (l_target)
				else
					Result.put_last (l_target)
				end
			end
		end

	new_version (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_VERSION
			-- New version built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_version: STRING_.same_case_insensitive (a_element.name, xml_version)
			a_position_table_not_void: a_position_table /= Void
			a_target_not_void: a_target /= Void
		do
			if attached a_element.attribute_by_name (xml_major) as l_major then
				if not l_major.value.is_integer or else l_major.value.to_integer < 0 then
					error_handler.report_eati_error (attribute_name (l_major, a_position_table), attribute_value (l_major, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				elseif attached a_element.attribute_by_name (xml_minor) as l_minor then
					if not l_minor.value.is_integer or else l_minor.value.to_integer < 0 then
						error_handler.report_eati_error (attribute_name (l_minor, a_position_table), attribute_value (l_minor, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					elseif attached a_element.attribute_by_name (xml_release) as l_release then
						if not l_release.value.is_integer or else l_release.value.to_integer < 0 then
							error_handler.report_eati_error (attribute_name (l_release, a_position_table), attribute_value (l_release, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
						elseif attached a_element.attribute_by_name (xml_build) as l_build then
							if not l_build.value.is_integer or else l_build.value.to_integer < 0 then
								error_handler.report_eati_error (attribute_name (l_build, a_position_table), attribute_value (l_build, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
							else
								create Result.make (l_major.value.to_integer, l_minor.value.to_integer, l_release.value.to_integer, l_build.value.to_integer)
							end
						else
							create Result.make_major_minor_release (l_major.value.to_integer, l_minor.value.to_integer, l_release.value.to_integer)
						end
					else
						if attached a_element.attribute_by_name (xml_build) as l_build then
							error_handler.report_eats_error (xml_release, attribute_name (l_build, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
						end
						create Result.make_major_minor (l_major.value.to_integer, l_minor.value.to_integer)
					end
				else
					if attached a_element.attribute_by_name (xml_release) as l_release then
						error_handler.report_eats_error (xml_minor, attribute_name (l_release, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					end
				 	if attached a_element.attribute_by_name (xml_build) as l_build then
						error_handler.report_eats_error (xml_minor, attribute_name (l_build, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					end
					create Result.make_major (l_major.value.to_integer)
				end
				if Result /= Void then
					if attached a_element.attribute_by_name (xml_product) as l_product then
						Result.set_product (l_product.value)
					end
					if attached a_element.attribute_by_name (xml_company) as l_company then
						Result.set_company (l_company.value)
					end
					if attached a_element.attribute_by_name (xml_copyright) as l_copyright then
						Result.set_copyright (l_copyright.value)
					end
					if attached a_element.attribute_by_name (xml_trademark) as l_trademark then
						Result.set_company (l_trademark.value)
					end
				end
			else
				if attached a_element.attribute_by_name (xml_minor) as l_minor then
					error_handler.report_eats_error (xml_major, attribute_name (l_minor, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				if attached a_element.attribute_by_name (xml_release) as l_release then
					error_handler.report_eats_error (xml_major, attribute_name (l_release, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
			 	if attached a_element.attribute_by_name (xml_build) as l_build then
					error_handler.report_eats_error (xml_major, attribute_name (l_build, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				if attached a_element.attribute_by_name (xml_product) as l_product then
					error_handler.report_eats_error (xml_major, attribute_name (l_product, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				if attached a_element.attribute_by_name (xml_company) as l_company then
					error_handler.report_eats_error (xml_major, attribute_name (l_company, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				if attached a_element.attribute_by_name (xml_copyright) as l_copyright then
					error_handler.report_eats_error (xml_major, attribute_name (l_copyright, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				if attached a_element.attribute_by_name (xml_trademark) as l_trademark then
					error_handler.report_eats_error (xml_major, attribute_name (l_trademark, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
			end
		end

	new_version_condition (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_VERSION_CONDITION
			-- New version condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_version: STRING_.same_case_insensitive (an_element.name, xml_version)
			a_target_not_void: a_target /= Void
		local
			l_type: detachable XM_ATTRIBUTE
			l_min: detachable XM_ATTRIBUTE
			l_max: detachable XM_ATTRIBUTE
			l_min_version: detachable UT_VERSION
			l_max_version: detachable UT_VERSION
			l_version_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			l_min := an_element.attribute_by_name (xml_min)
			if l_min /= Void then
				create l_version_regexp.make
				l_version_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_version_regexp.recognizes (l_min.value) then
					inspect l_version_regexp.match_count
					when 2 then
						create l_min_version.make_major (l_version_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_min_version.make_major_minor (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_min_version.make_major_minor_revision (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer)
					when 8 then
						create l_min_version.make (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer, l_version_regexp.captured_substring (7).to_integer)
					else
						error_handler.report_eabf_error (attribute_name (l_min, a_position_table), l_min.value, a_target.system_config)
					end
				end
			end
			l_max := an_element.attribute_by_name (xml_max)
			if l_max /= Void then
				create l_version_regexp.make
				l_version_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_version_regexp.recognizes (l_max.value) then
					inspect l_version_regexp.match_count
					when 2 then
						create l_max_version.make_major (l_version_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_max_version.make_major_minor (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_max_version.make_major_minor_revision (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer)
					when 8 then
						create l_max_version.make (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer, l_version_regexp.captured_substring (7).to_integer)
					else
						error_handler.report_eabg_error (attribute_name (l_max, a_position_table), l_max.value, a_target.system_config)
					end
				end
			end
			if (l_min /= Void and l_max /= Void) and then (l_min_version /= Void and l_max_version /= Void) and then l_max_version < l_min_version then
				error_handler.report_eabh_error (attribute_name (l_min, a_position_table), l_min.value, attribute_name (l_max, a_position_table), l_max.value, a_target.system_config)
			end
			l_type := an_element.attribute_by_name (xml_type)
			if l_type = Void then
				error_handler.report_eabi_error (element_name (an_element, a_position_table), a_target.system_config)
			elseif STRING_.same_case_insensitive (l_type.value, xml_compiler) then
				create {ET_ECF_COMPILER_VERSION_CONDITION} Result.make (l_min_version, l_max_version)
			elseif STRING_.same_case_insensitive (l_type.value, xml_msil_clr) then
				create {ET_ECF_MSIL_CLR_VERSION_CONDITION} Result.make (l_min_version, l_max_version)
			else
				error_handler.report_eabj_error (attribute_name (l_type, a_position_table), l_type.value, a_target.system_config)
			end
		end

	new_visible_class (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_VISIBLE_CLASS
			-- New visible class built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_visible: STRING_.same_case_insensitive (a_element.name, xml_visible)
			a_target_not_void: a_target /= Void
		do
			if not attached a_element.attribute_by_name (xml_class) as l_class then
				error_handler.report_eatm_error (xml_class, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_class.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_class, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_visible_class (l_class.value)
				if attached a_element.attribute_by_name (xml_feature) as l_feature then
					if l_feature.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_feature, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					else
						Result.set_feature_name (l_feature.value)
					end
				end
				if attached a_element.attribute_by_name (xml_class_rename) as l_class_rename then
					if l_class_rename.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_class_rename, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					else
						Result.set_new_class_name (l_class_rename.value)
					end
				end
				if attached a_element.attribute_by_name (xml_feature_rename) as l_feature_rename then
					if l_feature_rename.value.is_empty then
						error_handler.report_eate_error (attribute_name (l_feature_rename, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
					else
						Result.set_new_feature_name (l_feature_rename.value)
					end
				end
			end
		end

	new_visible_classes (a_visible_classes: detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			-- New visible classes (or `a_visible_classes' if not Void) built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_visible: STRING_.same_case_insensitive (a_element.name, xml_visible)
			a_target_not_void: a_target /= Void
		do
			Result := a_visible_classes
			if attached new_visible_class (a_element, a_position_table, a_target) as l_visible_class then
				if Result = Void then
					Result := ast_factory.new_visible_classes
				end
				Result.force_last (l_visible_class)
			end
		end

	new_void_safety_condition (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET): detachable ET_ECF_VOID_SAFETY_CONDITION
			-- New void-safety condition built from `a_element'
		require
			a_element_not_void: a_element /= Void
			is_concurrency: STRING_.same_case_insensitive (a_element.name, xml_void_safety)
			a_target_not_void: a_target /= Void
		do
			if attached a_element.attribute_by_name (xml_value) as l_value then
				if attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
					error_handler.report_eatx_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				elseif l_value.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				else
					Result := ast_factory.new_void_safety_condition (l_value.value, False)
				end
			elseif not attached a_element.attribute_by_name (xml_excluded_value) as l_excluded_value then
				error_handler.report_eatn_error (xml_value, xml_excluded_value, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_excluded_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				Result := ast_factory.new_void_safety_condition (l_excluded_value.value, True)
			end
		end

feature {NONE} -- Element change

	fill_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Build system `a_system_config' from `a_element'.
		require
			a_system_config_not_void: a_system_config /= Void
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
		local
			l_namespace_uri: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_targets: detachable ET_ECF_TARGETS
			l_library_target: detachable XM_ATTRIBUTE
			l_ecf_version: detachable UT_VERSION
			l_default_settings: ET_ECF_SETTINGS
			l_default_capabilities: ET_ECF_CAPABILITIES
			l_default_options: ET_ECF_OPTIONS
			l_value: STRING
			l_notes: detachable DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
		do
			l_namespace_uri := a_element.namespace.uri
			a_system_config.set_ecf_namespace (l_namespace_uri)
			l_ecf_version := ecf_version (l_namespace_uri)
			a_system_config.set_ecf_version (l_ecf_version)
			if l_ecf_version = Void then
				l_ecf_version := ecf_latest
			end
			l_default_settings := default_settings (l_ecf_version)
			l_default_capabilities := default_capabilities (l_ecf_version)
			l_default_options := default_options (l_ecf_version)
			l_cursor := a_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ELEMENT} l_cursor.item as l_child then
					if STRING_.same_case_insensitive (l_child.name, xml_description) then
						if attached l_child.text as l_text and then not l_text.is_empty then
							a_system_config.set_description (l_text)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_note) then
						l_notes := new_notes (l_notes, l_child, a_position_table, a_system_config)
						a_system_config.set_notes (l_notes)
					elseif STRING_.same_case_insensitive (l_child.name, xml_target) then
						l_targets := new_targets (l_targets, l_child, a_position_table, l_ecf_version, l_default_settings, l_default_capabilities, l_default_options, a_system_config)
						a_system_config.set_targets (l_targets)
					end
				elseif attached {XM_ATTRIBUTE} l_cursor.item as l_child then
					if STRING_.same_case_insensitive (l_child.name, xml_library_target) then
						l_library_target := l_child
					elseif STRING_.same_case_insensitive (l_child.name, xml_readonly) then
						l_value := l_child.value
						if is_true (l_value) then
							a_system_config.set_read_only (True)
						elseif is_false (l_value) then
							a_system_config.set_read_only (False)
						else
							error_handler.report_eatb_error (attribute_name (l_child, a_position_table), attribute_value (l_child, a_position_table), element_name (a_element, a_position_table), a_system_config)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_uuid) then
						a_system_config.set_uuid (l_child.value)
					end
				end
				l_cursor.forth
			end
			if l_targets = Void or else l_targets.is_empty then
					-- No target found in the ECF file.
				error_handler.report_etam_error (element_name (a_element, a_position_table), a_system_config)
			end
			if l_library_target /= Void then
				if l_library_target.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_library_target, a_position_table), element_name (a_element, a_position_table), a_system_config)
				elseif l_targets = Void or else not attached l_targets.target_by_name (l_library_target.value) as l_target then
					error_handler.report_eltm_error (attribute_name (l_library_target, a_position_table), attribute_value (l_library_target, a_position_table), a_system_config)
				else
					a_system_config.set_library_target (l_target)
				end
			end
		end

	add_assertions (a_options: ET_ECF_OPTIONS; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET)
			-- Add to `a_options' the assertions held in `an_element'.
		require
			a_options_not_void: a_options /= Void
			an_element_not_void: an_element /= Void
			is_option: STRING_.same_case_insensitive (an_element.name, xml_assertions)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_name: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ATTRIBUTE} l_cursor.item as l_attribute then
					l_name := l_attribute.name
					if attached a_options.primary_assertion_value (l_name) then
-- TODO: warning: several assertions with the same name! (not reported by ISE: use the last one.)
					end
					a_options.set_primary_assertion_value (l_name, l_attribute.value)
				end
				l_cursor.forth
			end
				-- When <assertions> is provided but no value is provided, then it's
				-- as if the default value had explicitly been specified.
				-- At least that's the way in works in ISE 17.05.
			across a_default_options.primary_assertions as i_default_assertion loop
				l_name := @i_default_assertion.key
				if not attached a_options.primary_assertion_value (l_name) then
					a_options.set_primary_assertion_value (l_name, i_default_assertion)
				end
			end
		end

	add_capabilities (a_capabilities: ET_ECF_CAPABILITIES; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_capabilities' the capabilities held in `an_element'.
		require
			a_capabilities_not_void: a_capabilities /= Void
			an_element_not_void: an_element /= Void
			is_capability: STRING_.same_case_insensitive (an_element.name, xml_capability)
			a_target_not_void: a_target /= Void
		local
			l_name: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ELEMENT} l_cursor.item as l_child then
					l_name := l_child.name
					if attached l_child.attribute_by_name (xml_support) as l_support and then not l_support.value.is_empty then
						if attached a_capabilities.primary_support_value (l_name) then
-- TODO: warning: several capabilities with the same name! (not reported by ISE: use the last one.)
						end
						a_capabilities.set_primary_support_value (l_name, l_support.value)
					end
					if attached l_child.attribute_by_name (xml_use) as l_use and then not l_use.value.is_empty then
						if attached a_capabilities.primary_use_value (l_name) then
-- TODO: warning: several capabilities with the same name! (not reported by ISE: use the last one.)
						end
						a_capabilities.set_primary_use_value_id (l_name, attribute_value (l_use, a_position_table))
					end
				end
				l_cursor.forth
			end
		end

	add_debug (a_options: ET_ECF_OPTIONS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_options' the debug held in `a_element'.
		require
			a_options_not_void: a_options /= Void
			a_element_not_void: a_element /= Void
			is_option: STRING_.same_case_insensitive (a_element.name, xml_debug)
			a_target_not_void: a_target /= Void
		local
			l_debug_name: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_enabled) as l_enabled then
				error_handler.report_eatm_error (xml_enabled, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_enabled.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_enabled, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				l_debug_name := l_name.value
				if attached a_options.primary_debug_value (l_debug_name) then
-- TODO: warning: several debugs with the same name! (not reported by ISE: use the last one.)
				end
				a_options.set_primary_debug_value (l_debug_name, l_enabled.value)
			end
		end

	add_mapping (a_mappings: DS_HASH_TABLE [STRING, STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_mappings' the class mapping held in `a_element'.
		require
			a_mappings_not_void: a_mappings /= Void
			no_void_new_class_mapping: not a_mappings.has_void
			no_void_old_class_mapping: not a_mappings.has_void_item
			a_element_not_void: a_element /= Void
			is_mapping: STRING_.same_case_insensitive (a_element.name, xml_mapping)
			a_target_not_void: a_target /= Void
		do
			if not attached a_element.attribute_by_name (xml_old_name) as l_old_name then
				error_handler.report_eatm_error (xml_old_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_old_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_old_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_new_name) as l_new_name then
				error_handler.report_eatm_error (xml_new_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_new_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_new_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				a_mappings.search (l_old_name.value)
				if a_mappings.found then
					error_handler.report_eatd_error (attribute_name (l_old_name, a_position_table), attribute_value (l_old_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				a_mappings.force_last (l_new_name.value.as_upper, l_old_name.value.as_upper)
			end
		ensure
			no_void_old_class_mapping: not a_mappings.has_void
			no_void_new_class_mapping: not a_mappings.has_void_item
		end

	add_options (a_options: ET_ECF_OPTIONS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE;
		a_default_options: ET_ECF_OPTIONS; a_target: ET_ECF_TARGET)
			-- Add to `a_options' the options held in `a_element'.
		require
			a_options_not_void: a_options /= Void
			a_element_not_void: a_element /= Void
			is_option: STRING_.same_case_insensitive (a_element.name, xml_option) or STRING_.same_case_insensitive (a_element.name, xml_class_option)
			a_default_options_not_void: a_default_options /= Void
			a_target_not_void: a_target /= Void
		local
			l_option_name: STRING
			l_option_value: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			l_cursor := a_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				if attached {XM_ELEMENT} l_cursor.item as l_child then
					if STRING_.same_case_insensitive (l_child.name, xml_assertions) then
						add_assertions (a_options, l_child, a_position_table, a_default_options, a_target)
					elseif STRING_.same_case_insensitive (l_child.name, xml_debug) then
						add_debug (a_options, l_child, a_position_table, a_target)
					elseif STRING_.same_case_insensitive (l_child.name, xml_warning) then
						add_warning (a_options, l_child, a_position_table, a_target)
					elseif STRING_.same_case_insensitive (l_child.name, xml_description) then
						if attached l_child.text as l_text and then not l_text.is_empty then
							a_options.set_description (l_text)
						end
					end
				elseif attached {XM_ATTRIBUTE} l_cursor.item as l_attribute then
					l_option_name := l_attribute.name
					if attached a_options.primary_value (l_option_name) then
-- TODO: warning: several options with the same name! (not reported by ISE: use the last one.)
					end
					l_option_value := l_attribute.value
					if STRING_.same_case_insensitive (l_option_name, {ET_ECF_OPTION_NAMES}.warning_option_name) then
							-- Values of option "warning" have changed in ECF 1.21.0.
						if STRING_.same_case_insensitive (l_option_value, {ET_ECF_OPTION_NAMES}.false_option_value) then
							l_option_value := {ET_ECF_OPTION_NAMES}.none_option_value
						elseif STRING_.same_case_insensitive (l_option_value, {ET_ECF_OPTION_NAMES}.true_option_value) then
							l_option_value := {ET_ECF_OPTION_NAMES}.warning_option_value
						end
					end
					a_options.set_primary_value (l_option_name, l_option_value)
				end
				l_cursor.forth
			end
		end

	add_provider_group (a_provider_groups: DS_ARRAYED_LIST [STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_provider_groups' the provider group held in `a_element'.
		require
			a_provider_groups_not_void: a_provider_groups /= Void
			no_void_group: not a_provider_groups.has_void
			a_element_not_void: a_element /= Void
			is_uses: STRING_.same_case_insensitive (a_element.name, xml_uses)
			a_target_not_void: a_target /= Void
		do
			if not attached a_element.attribute_by_name (xml_group) as l_group then
				error_handler.report_eatm_error (xml_group, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_group.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_group, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				a_provider_groups.force_last (l_group.value)
			end
		ensure
			no_void_group: not a_provider_groups.has_void
		end

	add_renaming (a_renamings: DS_HASH_TABLE [STRING, STRING]; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_renamings' the class renaming held in `a_element'.
		require
			a_renamings_not_void: a_renamings /= Void
			no_void_old_class_renaming: not a_renamings.has_void
			no_void_new_class_renaming: not a_renamings.has_void_item
			a_element_not_void: a_element /= Void
			is_renaming: STRING_.same_case_insensitive (a_element.name, xml_renaming)
			a_target_not_void: a_target /= Void
		do
			if not attached a_element.attribute_by_name (xml_old_name) as l_old_name then
				error_handler.report_eatm_error (xml_old_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_old_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_old_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_new_name) as l_new_name then
				error_handler.report_eatm_error (xml_new_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_new_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_new_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				a_renamings.search (l_old_name.value)
				if a_renamings.found then
					error_handler.report_eatd_error (attribute_name (l_old_name, a_position_table), attribute_value (l_old_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				end
				a_renamings.force_last (l_new_name.value.as_upper, l_old_name.value.as_upper)
			end
		ensure
			no_void_old_class_renaming: not a_renamings.has_void
			no_void_new_class_renaming: not a_renamings.has_void_item
		end

	add_setting (a_settings: ET_ECF_SETTINGS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_settings' the setting held in `a_element'.
		require
			a_settings_not_void: a_settings /= Void
			a_element_not_void: a_element /= Void
			is_setting: STRING_.same_case_insensitive (a_element.name, xml_setting)
			a_target_not_void: a_target /= Void
		local
			l_setting_name: STRING
			l_setting_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_value.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				l_setting_name := l_name.value
				if attached a_settings.primary_value (l_setting_name) then
-- TODO: warning: several settings with the same name! (not reported by ISE: use the last one.)
				end
				l_setting_value := l_value.value
				if STRING_.same_case_insensitive (l_setting_name, {ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name) then
						-- Values of setting "dead_code_removal" have changed in ECF 1.20.0.
					if STRING_.same_case_insensitive (l_setting_value, {ET_ECF_SETTING_NAMES}.false_setting_value) then
						l_setting_value := {ET_ECF_SETTING_NAMES}.none_setting_value
					elseif STRING_.same_case_insensitive (l_setting_value, {ET_ECF_SETTING_NAMES}.true_setting_value) then
						l_setting_value := {ET_ECF_SETTING_NAMES}.feature_setting_value
					end
				end
				a_settings.set_primary_value (l_setting_name, l_setting_value)
			end
		end

	add_variable (a_variables: ET_ECF_VARIABLES; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_variables' the variable held in `a_element'.
		require
			a_variables_not_void: a_variables /= Void
			a_element_not_void: a_element /= Void
			is_variable: STRING_.same_case_insensitive (a_element.name, xml_variable)
			a_target_not_void: a_target /= Void
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif not attached a_element.attribute_by_name (xml_value) as l_value then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			else
				if attached a_variables.primary_value (l_name.value) then
-- TODO: warning: several variables with the same name! (not reported by ISE: use the last one.)
				end
				a_variables.set_primary_value (l_name.value, l_value.value)
			end
		end

	add_warning (a_options: ET_ECF_OPTIONS; a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_target: ET_ECF_TARGET)
			-- Add to `a_options' the warning held in `a_element'.
		require
			a_options_not_void: a_options /= Void
			a_element_not_void: a_element /= Void
			is_option: STRING_.same_case_insensitive (a_element.name, xml_warning)
			a_target_not_void: a_target /= Void
		local
			l_warning_name: STRING
			l_warning_value: STRING
		do
			if not attached a_element.attribute_by_name (xml_name) as l_name then
				error_handler.report_eatm_error (xml_name, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_name.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_name, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			elseif STRING_.same_case_insensitive (l_name.value, {ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name) and then (not attached a_target.system_config.ecf_version as l_ecf_version or else l_ecf_version >= ecf_1_21_0) then
				if not attached a_element.attribute_by_name (xml_value) as l_value then
					error_handler.report_eatm_error (xml_value, element_name (a_element, a_position_table), a_target.system_config)
				elseif l_value.value.is_empty then
					error_handler.report_eate_error (attribute_name (l_value, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
				else
					l_warning_name := l_name.value
					if attached a_options.primary_warning_value (l_warning_name) then
-- TODO: warning: several warnings with the same name! (not reported by ISE: use the last one.)
					end
					a_options.set_primary_warning_value (l_warning_name, l_value.value)
				end
			elseif not attached a_element.attribute_by_name (xml_enabled) as l_enabled then
				error_handler.report_eatm_error (xml_enabled, element_name (a_element, a_position_table), a_target.system_config)
			elseif l_enabled.value.is_empty then
				error_handler.report_eate_error (attribute_name (l_enabled, a_position_table), element_name (a_element, a_position_table), a_target.system_config)
			else
				l_warning_name := l_name.value
				if attached a_options.primary_warning_value (l_warning_name) then
-- TODO: warning: several warnings with the same name! (not reported by ISE: use the last one.)
				end
				l_warning_value := l_enabled.value
				if STRING_.same_case_insensitive (l_warning_name, {ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name) then
						-- Values of "warning" option "obsolete_feature" have changed in ECF 1.21.0.
					if STRING_.same_case_insensitive (l_warning_value, {ET_ECF_OPTION_NAMES}.false_option_value) then
						l_warning_value := {ET_ECF_OPTION_NAMES}.none_option_value
					elseif STRING_.same_case_insensitive (l_warning_value, {ET_ECF_OPTION_NAMES}.true_option_value) then
						l_warning_value := {ET_ECF_OPTION_NAMES}.current_option_value
					end
				end
				a_options.set_primary_warning_value (l_warning_name, l_warning_value)
			end
		end

	adapt_capabilities (a_target: ET_ECF_TARGET; a_ecf_version: UT_VERSION)
			-- Adapt capabilities of `a_target' so that capabilities as known in most recent version of ECF
			-- are populated with the equivalent values of those as found in the ECF file.
		require
			a_target_not_void: a_target /= Void
			a_ecf_version_not_void: a_ecf_version /= Void
		local
			l_multithreaded_capability: STRING
			l_void_safety_capability: STRING
			l_catcall_detection_capability: STRING
		do
				-- Option "void_safety" superseded by capability "void_safety" in ECF 1.16.0.
			if attached a_target.options.primary_value ({ET_ECF_OPTION_NAMES}.void_safety_option_name) as l_void_safety then
				if
					not attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) and
					not attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
				then
					if a_ecf_version < ecf_1_11_0 and then STRING_.same_case_insensitive (l_void_safety, {ET_ECF_OPTION_NAMES}.all_option_value) then
							-- Until ECF 1.10.0 included, "all" had the meaning of "transitional" introduced in ECF 1.11.0.
						l_void_safety_capability := {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value
					else
						l_void_safety_capability := l_void_safety
					end
					a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, l_void_safety_capability)
					a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, l_void_safety_capability)
				end
			end
				-- Option "is_void_safe" superseded by option "void_safety" in ECF 1.5.0 and again in ECF 1.11.0,
				-- and then by capability "void_safety" in ECF 1.16.0.
			if attached a_target.options.primary_value ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name) as l_is_void_safe then
				if
					not attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) and
					not attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name)
				then
					if a_ecf_version < ecf_1_5_0 then
						if is_true (l_is_void_safe) then
							l_void_safety_capability := {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value
						else
							l_void_safety_capability := {ET_ECF_CAPABILITY_NAMES}.none_capability_value
						end
						a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, l_void_safety_capability)
						a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, l_void_safety_capability)
					else
						if is_true (l_is_void_safe) then
							l_void_safety_capability := {ET_ECF_CAPABILITY_NAMES}.all_capability_value
							a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, l_void_safety_capability)
							a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name, l_void_safety_capability)
						end
					end
				end
			end
				-- Option "cat_call_detection" superseded by capability "catcall_detection" in ECF 1.16.0.
			if attached a_target.options.primary_value ({ET_ECF_OPTION_NAMES}.cat_call_detection_option_name) as l_catcall_detection then
				if
					not attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) and
					not attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name)
				then
					if l_catcall_detection.is_boolean then
							-- Values were true|false until ECF 1.13.0 included.
						if is_true (l_catcall_detection) then
							l_catcall_detection_capability := {ET_ECF_CAPABILITY_NAMES}.all_capability_value
						else
							l_catcall_detection_capability := {ET_ECF_CAPABILITY_NAMES}.none_capability_value
						end
						a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name, l_catcall_detection_capability)
						a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name, l_catcall_detection_capability)
					else
						a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name, l_catcall_detection)
						a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name, l_catcall_detection)
					end
				end
			end
				-- Setting "concurrency" superseded by the capability "concurrency" in ECF 1.16.0.
			if attached a_target.settings.primary_value ({ET_ECF_SETTING_NAMES}.concurrency_setting_name) as l_concurrency then
				if
					not attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) and
					not attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
				then
					a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, l_concurrency)
					a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, l_concurrency)
				end
			end
				-- Setting "multithreaded" superseded by setting "concurrency" in ECF 1.7.0,
				-- and then by the capability "concurrency" in ECF 1.16.0.
			if attached a_target.settings.primary_value ({ET_ECF_SETTING_NAMES}.multithreaded_setting_name) as l_multithreaded_option then
				if
					not attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) and
					not attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name)
				then
					if is_true (l_multithreaded_option) then
						l_multithreaded_capability := {ET_ECF_CAPABILITY_NAMES}.thread_capability_value
					else
						l_multithreaded_capability := {ET_ECF_CAPABILITY_NAMES}.none_capability_value
					end
					a_target.capabilities.set_primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, l_multithreaded_capability)
					a_target.capabilities.set_primary_use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name, l_multithreaded_capability)
				end
			end
		end

	adapt_options (a_options: ET_ECF_OPTIONS)
			-- Adapt `a_options' so that options as known in most recent version of ECF
			-- are populated with the equivalent values of those as found in the ECF file.
		require
			a_options_not_void: a_options /= Void
		do
				-- Option "syntax_level" superseded by option "syntax" in ECF 1.5.0.
			if attached a_options.primary_value ({ET_ECF_OPTION_NAMES}.syntax_level_option_name) as l_syntax_level then
				if not attached a_options.primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name) then
					if l_syntax_level.is_integer then
						inspect l_syntax_level.to_integer
						when 0 then
							a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.obsolete_option_value)
						when 1 then
							a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.transitional_option_value)
						when 2 then
							a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name, {ET_ECF_OPTION_NAMES}.standard_option_value)
						else
							-- Unsupported syntax level.
						end
					end
				end
			end
		end

	adapt_target_options (a_target: ET_ECF_TARGET)
			-- Adapt options of `a_target' so that options as known in most recent version of ECF
			-- are populated with the equivalent values of those as found in the ECF file.
		require
			a_target_not_void: a_target /= Void
		do
				-- Setting "full_type_checking" superseded by option "full_class_checking" in ECF 1.2.0.
			if attached a_target.settings.primary_value ({ET_ECF_SETTING_NAMES}.full_type_checking_setting_name) as l_full_type_checking then
				if not attached a_target.options.primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name) then
					a_target.options.set_primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name, l_full_type_checking)
				end
			end
			adapt_options (a_target.options)
		end

feature {NONE} -- Implementation

	parsed_libraries: DS_HASH_TABLE [ET_ECF_LIBRARY, STRING]
			-- Already parsed ECF libraries, indexed by UUID
		deferred
		ensure
			parsed_libraries_not_void: Result /= Void
			no_void_library: not Result.has_void_item
		end

	parsed_dotnet_assemblies: DS_HASH_TABLE [ET_ECF_DOTNET_ASSEMBLY, STRING]
			-- Already parsed .NET assemblies, indexed by filenames
		deferred
		ensure
			parsed_dotnet_assemblies_not_void: Result /= Void
			no_void_dotnet_assembly: not Result.has_void_item
		end

	element_name (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): ET_IDENTIFIER
			-- Element name
		require
			a_element_not_void: a_element /= Void
		local
			l_position: XM_POSITION
		do
			create Result.make (a_element.name)
			if a_position_table /= Void and then a_position_table.has (a_element) then
				l_position := a_position_table.item (a_element)
				Result.set_position (l_position.row, l_position.column)
			end
		ensure
			element_name_not_void: Result /= Void
		end

	attribute_name (a_attribute: XM_ATTRIBUTE; a_position_table: detachable XM_POSITION_TABLE): ET_IDENTIFIER
			-- Attribute name
		require
			a_attribute_not_void: a_attribute /= Void
		local
			l_position: XM_POSITION
		do
			create Result.make (a_attribute.name)
			if a_position_table /= Void and then a_position_table.has (a_attribute) then
				l_position := a_position_table.item (a_attribute)
				Result.set_position (l_position.row, l_position.column)
			end
		ensure
			attribute_name_not_void: Result /= Void
		end

	attribute_value (a_attribute: XM_ATTRIBUTE; a_position_table: detachable XM_POSITION_TABLE): ET_IDENTIFIER
			-- Attribute value
		require
			a_attribute_not_void: a_attribute /= Void
			a_value_not_empty: not a_attribute.value.is_empty
			a_position_table_not_void: a_position_table /= Void
		local
			l_position: XM_POSITION
		do
			create Result.make (a_attribute.value)
			if a_position_table /= Void and then a_position_table.has (a_attribute) then
				l_position := a_position_table.item (a_attribute)
				Result.set_position (l_position.row, l_position.column)
			end
		ensure
			attribute_value_not_void: Result /= Void
		end

	is_true (a_string: STRING): BOOLEAN
			-- Is `a_string' equal to "true" (case-insensitive)?
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.same_case_insensitive (a_string, True_constant)
		end

	is_false (a_string: STRING): BOOLEAN
			-- Is `a_string' equal to "false" (case-insensitive)?
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.same_case_insensitive (a_string, False_constant)
		end

	ecf_version (a_namespace: STRING): detachable UT_VERSION
			-- ECF version corresponding to `a_namespace', or void if not recognized
		require
			a_namespace_not_void: a_namespace /= Void
		local
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile ("[^0-9]-([0-9]+)(-([0-9]+))?(-([0-9]+))?(-([0-9]+))?$")
			if l_regexp.matches (a_namespace) then
				inspect l_regexp.match_count
				when 2 then
					create Result.make_major (l_regexp.captured_substring (1).to_integer)
				when 4 then
					create Result.make_major_minor (l_regexp.captured_substring (1).to_integer, l_regexp.captured_substring (3).to_integer)
				when 6 then
					create Result.make (l_regexp.captured_substring (1).to_integer, l_regexp.captured_substring (3).to_integer, l_regexp.captured_substring (5).to_integer, 0)
				when 8 then
					create Result.make (l_regexp.captured_substring (1).to_integer, l_regexp.captured_substring (3).to_integer, l_regexp.captured_substring (5).to_integer, l_regexp.captured_substring (7).to_integer)
				else
				end
			end
		end

feature {NONE} -- Constant

	True_constant: STRING = "true"
			-- True constant

	False_constant: STRING = "false"
			-- False constant

invariant

	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void
	ise_version_not_void: ise_version /= Void

end
