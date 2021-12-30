note

	description:

		"ECF file printers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_PRINTER

inherit

	ET_ECF_CONFIG_PROCESSOR
		rename
			process_redirection_config as print_redirection,
			process_system_config as print_system
		end

	ET_ECF_SETTING_DEFAULTS
		export {NONE} all end

	ET_ECF_CAPABILITY_DEFAULTS
		export {NONE} all end

	ET_ECF_OPTION_DEFAULTS
		export {NONE} all end

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_SHARED_STREAMS
		export {NONE} all end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file)
			-- Create a new ECF printer, using `a_file' as output file.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			file := a_file
			ecf_version := ecf_last_known
		ensure
			file_set: file = a_file
		end

	make_null
			-- Create a new ECF printer, initialized with a null output stream.
		do
			make (null_output_stream)
		ensure then
			file_set: file = null_output_stream
		end

feature -- Access

	file: KI_TEXT_OUTPUT_STREAM
			-- Output file

	ecf_version: UT_VERSION
			-- Version of ECF used by the printer
			--
			-- Note that the printer will use the options/settings/capabilities
			-- held in the ECF system config to be printed as known in the most
			-- recent version of Eiffel, and then find their equivalents in the
			-- version `ecf_version'. If `ecf_version' is older than the ECF
			-- version of the ECF system config to be printed, then some
			-- options/settings/capabilities may be lost or replaced by their
			-- closest equilavents.

feature -- Setting

	set_file (a_file: like file)
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	set_null_file
			-- Set `file' to `null_output_stream'.
		do
			file := null_output_stream
		ensure
			file_set: file = null_output_stream
		end

	set_ecf_version (a_version: like ecf_version)
			-- Set `ecf_version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			ecf_version := a_version
		ensure
			ecf_version_set: ecf_version = a_version
		end

feature -- Indentation

	indentation: INTEGER
			-- Indentation in `file'

	indent
			-- Increment indentation.
		do
			indentation := indentation + 1
		ensure
			one_more: indentation = old indentation + 1
		end

	dedent
			-- Decrement indentation.
		do
			indentation := indentation - 1
		ensure
			one_less: indentation = old indentation - 1
		end

	reset_indentation
			-- Reset indentation.
		do
			indentation := 0
		ensure
			indentation_reset: indentation = 0
		end

feature -- Output

	print_actions (a_actions: DS_ARRAYED_LIST [ET_ECF_ACTION]; a_xml_name: STRING)
			-- Print `a_actions' to `file'.
			-- `a_xml_name' indicates whether it's a pre-compile action
			-- or a post-compile action.
		require
			a_actions_not_void: a_actions /= Void
			no_void_action: not a_actions.has_void
			a_xml_name_not_void: a_xml_name /= Void
			a_xml_name_not_empty: not a_xml_name.is_empty
		local
			l_action: ET_ECF_ACTION
		do
			across a_actions as i_action loop
				l_action := i_action
				print_indentation
				file.put_character ('<')
				file.put_string (a_xml_name)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_command)
				file.put_character ('=')
				print_quoted_string (l_action.command_name)
				if attached l_action.working_directory as l_working_directory then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_working_directory)
					file.put_character ('=')
					print_quoted_string (l_working_directory)
				end
				if l_action.must_succeed then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_succeed)
					file.put_character ('=')
					print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
				end
				if
					l_action.description /= Void or
					l_action.conditions /= Void
				then
					file.put_character ('>')
					file.put_new_line
					indent
					if attached l_action.description as l_description then
						print_description (l_description)
					end
					if attached l_action.conditions as l_conditions then
						print_conditions (l_conditions)
					end
					dedent
					print_indentation
					file.put_character ('<')
					file.put_character ('/')
					file.put_string (a_xml_name)
					file.put_character ('>')
				else
					file.put_character ('/')
					file.put_character ('>')
				end
				file.put_new_line
			end
		end

	print_assembly (a_assembly: ET_ECF_ADAPTED_DOTNET_ASSEMBLY)
			-- Print `a_assembly' to `file'.
		require
			a_assembly_not_void: a_assembly /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_assembly.name)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			file.put_character ('=')
			print_quoted_string (a_assembly.pathname)
			if attached a_assembly.assembly_name as l_assembly_name then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_name)
				file.put_character ('=')
				print_quoted_string (l_assembly_name)
			end
			if attached a_assembly.assembly_version as l_assembly_version then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_version)
				file.put_character ('=')
				print_quoted_string (l_assembly_version)
			end
			if attached a_assembly.assembly_culture as l_assembly_culture then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_culture)
				file.put_character ('=')
				print_quoted_string (l_assembly_culture)
			end
			if attached a_assembly.assembly_key as l_assembly_key then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_key)
				file.put_character ('=')
				print_quoted_string (l_assembly_key)
			end
			if not a_assembly.is_read_only then
					-- Assemblies are read-only by default.
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value)
			end
			if attached a_assembly.classname_prefix as l_prefix then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				file.put_character ('=')
				print_quoted_string (l_prefix)
			end
			if
				a_assembly.description /= Void or
				(attached a_assembly.notes as l_notes and then not l_notes.is_empty) or
				a_assembly.options /= Void or
				a_assembly.class_renamings /= Void or
				(attached a_assembly.class_options as l_class_options and then not l_class_options.is_empty) or
				a_assembly.conditions /= Void
			then
				file.put_character ('>')
				file.put_new_line
				indent
				if attached a_assembly.description as l_description then
					print_description (l_description)
				end
				if attached a_assembly.notes as l_notes and then not l_notes.is_empty then
					l_notes.do_all (agent print_note_element)
				end
				if attached a_assembly.options as l_options then
					print_options (adapted_options (l_options), Void)
				end
				if attached a_assembly.class_renamings as l_renamings then
					print_renamings (l_renamings)
				end
				if attached a_assembly.class_options as l_class_options and then not l_class_options.is_empty then
					across l_class_options as i_options_by_class loop
						print_options (adapted_options (i_options_by_class), @i_options_by_class.key)
					end
				end
				if attached a_assembly.conditions as l_conditions then
					print_conditions (l_conditions)
				end
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly)
				file.put_character ('>')
			else
				file.put_character ('/')
				file.put_character ('>')
			end
			file.put_new_line
		end

	print_build_condition (a_condition: ET_ECF_BUILD_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_build)
			file.put_character (' ')
			if a_condition.is_excluded then
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			file.put_character ('=')
			print_quoted_string (a_condition.value)
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_capabilities (a_capabilities: ET_ECF_CAPABILITIES)
			-- Print `a_capabilities' to `file'.
		require
			a_capabilities_not_void: a_capabilities /= Void
		local
			l_capability_names: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			l_capability_name: STRING
			l_outer_printed: BOOLEAN
			l_inner_printed: BOOLEAN
		do
			l_capability_names := valid_capabilities (ecf_version)
			across l_capability_names as i_capability_name loop
				l_inner_printed := False
				l_capability_name := @i_capability_name.key
				if attached a_capabilities.primary_support_value (l_capability_name) as l_support then
					if not l_outer_printed then
						print_indentation
						file.put_character ('<')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_capability)
						file.put_character ('>')
						file.put_new_line
						l_outer_printed := True
					end
					indent
					print_indentation
					file.put_character ('<')
					file.put_string (l_capability_name)
					l_inner_printed := True
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_support)
					file.put_character ('=')
					print_quoted_string (l_support)
				end
				if attached a_capabilities.primary_use_value (l_capability_name) as l_use then
					if not l_outer_printed then
						print_indentation
						file.put_character ('<')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_capability)
						file.put_character ('>')
						file.put_new_line
						l_outer_printed := True
					end
					if not l_inner_printed then
						indent
						print_indentation
						file.put_character ('<')
						file.put_string (l_capability_name)
						l_inner_printed := True
					end
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_use)
					file.put_character ('=')
					print_quoted_string (l_use)
					l_inner_printed := True
				end
				if l_inner_printed then
					file.put_character ('/')
					file.put_character ('>')
					file.put_new_line
					dedent
				end
			end
			if l_outer_printed then
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_capability)
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_cluster (a_cluster: ET_ECF_CLUSTER)
			-- Print `a_cluster' to `file' .
		require
			a_cluster_not_void: a_cluster /= Void
		local
			l_is_override: BOOLEAN
		do
			l_is_override := a_cluster.is_override
			print_indentation
			file.put_character ('<')
			if l_is_override then
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_override)
			else
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_cluster)
			end
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_cluster.name)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			file.put_character ('=')
			print_quoted_string (a_cluster.pathname)
			if a_cluster.is_recursive then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_recursive)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			end
			if a_cluster.is_hidden then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_hidden)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			end
			if a_cluster.is_read_only then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			end
			if attached a_cluster.classname_prefix as l_prefix then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				file.put_character ('=')
				print_quoted_string (l_prefix)
			end
			if
				a_cluster.description /= Void or
				(attached a_cluster.notes as l_notes and then not l_notes.is_empty) or
				a_cluster.conditioned_file_rules /= Void or
				a_cluster.options /= Void or
				a_cluster.class_mappings /= Void or
				a_cluster.class_renamings /= Void or
				(attached a_cluster.class_options as l_class_options and then not l_class_options.is_empty) or
				a_cluster.visible_classes /= Void or
				a_cluster.provider_groups /= Void or
				a_cluster.conditions /= Void or
				(attached a_cluster.conditioned_subclusters as l_subclusters and then not l_subclusters.is_empty) or
				(l_is_override and then a_cluster.overridden_group /= Void)
			then
				file.put_character ('>')
				file.put_new_line
				indent
				if attached a_cluster.description as l_description then
					print_description (l_description)
				end
				if attached a_cluster.notes as l_notes and then not l_notes.is_empty then
					l_notes.do_all (agent print_note_element)
				end
				if attached a_cluster.conditioned_file_rules as l_file_rules then
					print_file_rules (l_file_rules)
				end
				if attached a_cluster.options as l_options then
					print_options (adapted_options (l_options), Void)
				end
				if attached a_cluster.class_mappings as l_mappings then
					print_mappings (l_mappings)
				end
				if attached a_cluster.class_renamings as l_renamings then
					print_renamings (l_renamings)
				end
				if attached a_cluster.class_options as l_class_options and then not l_class_options.is_empty then
					across l_class_options as i_options_by_class loop
						print_options (adapted_options (i_options_by_class), @i_options_by_class.key)
					end
				end
				if attached a_cluster.visible_classes as l_visibles then
					print_visibles (l_visibles)
				end
				if attached a_cluster.provider_groups as l_provider_groups then
					print_provider_groups (l_provider_groups)
				 end
				if attached a_cluster.conditions as l_conditions then
					print_conditions (l_conditions)
				end
				if attached a_cluster.conditioned_subclusters as l_subclusters and then not l_subclusters.is_empty then
					l_subclusters.do_all (agent print_cluster)
				end
				if l_is_override and then attached a_cluster.overridden_group as l_overridden_group then
					print_overridden_group (l_overridden_group)
				end
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				if l_is_override then
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_override)
				else
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_cluster)
				end
				file.put_character ('>')
			else
				file.put_character ('/')
				file.put_character ('>')
			end
			file.put_new_line
		end

	print_compiler_version_condition (a_condition: ET_ECF_COMPILER_VERSION_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_version)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_type)
			file.put_character ('=')
			print_quoted_string ({ET_ECF_ELEMENT_NAMES}.xml_compiler)
			if attached a_condition.min_value as l_min_value then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_min)
				file.put_character ('=')
				print_quoted_string (l_min_value.out)
			end
			if attached a_condition.max_value as l_max_value then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_max)
				file.put_character ('=')
				print_quoted_string (l_max_value.out)
			end
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_concurrency_condition (a_condition: ET_ECF_CONCURRENCY_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		local
			l_value: STRING
			l_expected_value: STRING
			l_multithreaded_value: STRING
			l_splitter: ST_SPLITTER
		do
			if ecf_version >= ecf_1_8_0 then
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_concurrency)
				file.put_character (' ')
				if a_condition.is_excluded then
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
				else
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
				end
				file.put_character ('=')
				print_quoted_string (a_condition.value)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			else
					-- The <concurrency> condition was introduced in ECF 1.8.0.
					-- It superseded the <multithreaded> condition.
				l_value := a_condition.value
				l_expected_value := {ET_ECF_CAPABILITY_NAMES}.thread_capability_value
				if a_condition.value.has ({ET_ECF_CAPABILITY_NAMES}.value_separator) then
					create l_splitter.make_with_separators ({ET_ECF_CAPABILITY_NAMES}.value_separators)
					if l_splitter.split (l_value).there_exists (agent STRING_.same_case_insensitive ({STRING_8} ?, l_expected_value)) = a_condition.is_excluded then
						l_multithreaded_value := {ET_ECF_SETTING_NAMES}.false_setting_value
					else
						l_multithreaded_value := {ET_ECF_SETTING_NAMES}.true_setting_value
					end
				else
					if STRING_.same_case_insensitive (l_value, l_expected_value) = a_condition.is_excluded then
						l_multithreaded_value := {ET_ECF_SETTING_NAMES}.false_setting_value
					else
						l_multithreaded_value := {ET_ECF_SETTING_NAMES}.true_setting_value
					end
				end
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_multithreaded)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
				file.put_character ('=')
				print_quoted_string (l_multithreaded_value)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_condition (a_condition: ET_ECF_CONDITION_ITEM)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			if attached {ET_ECF_BUILD_CONDITION} a_condition as l_build_condition then
				print_build_condition (l_build_condition)
			elseif attached {ET_ECF_COMPILER_VERSION_CONDITION} a_condition as l_compiler_version_condition then
				print_compiler_version_condition (l_compiler_version_condition)
			elseif attached {ET_ECF_CONCURRENCY_CONDITION} a_condition as l_concurrency_condition then
				print_concurrency_condition (l_concurrency_condition)
			elseif attached {ET_ECF_VOID_SAFETY_CONDITION} a_condition as l_void_safety_condition then
				print_void_safety_condition (l_void_safety_condition)
			elseif attached {ET_ECF_CUSTOM_CONDITION} a_condition as l_custom_condition then
				print_custom_condition (l_custom_condition)
			elseif attached {ET_ECF_DOTNET_CONDITION} a_condition as l_dotnet_condition then
				print_dotnet_condition (l_dotnet_condition)
			elseif attached {ET_ECF_DYNAMIC_RUNTIME_CONDITION} a_condition as l_dynamic_runtime_condition then
				print_dynamic_runtime_condition (l_dynamic_runtime_condition)
			elseif attached {ET_ECF_MSIL_CLR_VERSION_CONDITION} a_condition as l_msil_clr_version_condition then
				print_msil_clr_version_condition (l_msil_clr_version_condition)
			elseif attached {ET_ECF_PLATFORM_CONDITION} a_condition as l_platform_condition then
				print_platform_condition (l_platform_condition)
			end
		end

	print_conditions (a_conditions: ET_ECF_CONDITIONS)
			-- Print `a_conditions' to `file'.
		require
			a_conditions_not_void: a_conditions /= Void
		do
			if attached {ET_ECF_ORED_CONDITIONS} a_conditions as l_ored_conditions then
				l_ored_conditions.conditions.do_all (agent print_conditions ({ET_ECF_ANDED_CONDITIONS}?))
			elseif attached {ET_ECF_ANDED_CONDITIONS} a_conditions as l_anded_conditions then
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_condition)
				file.put_character ('>')
				file.put_new_line
				indent
				l_anded_conditions.conditions.do_all (agent print_condition)
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_condition)
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_custom_condition (a_condition: ET_ECF_CUSTOM_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_custom)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_condition.name)
			file.put_character (' ')
			if a_condition.is_excluded then
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			file.put_character ('=')
			print_quoted_string (a_condition.value)
			if ecf_version >= ecf_1_18_0 and then attached a_condition.match as l_match then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_match)
				file.put_character ('=')
				print_quoted_string (l_match)
			end
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_description (a_description: STRING)
			-- Print `a_description' to `file'.
		require
			a_description_not_void: a_description /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_description)
			file.put_character ('>')
			print_escaped_string (a_description)
			file.put_character ('<')
			file.put_character ('/')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_description)
			file.put_character ('>')
			file.put_new_line
		end

	print_dotnet_condition (a_condition: ET_ECF_DOTNET_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_dotnet)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			file.put_character ('=')
			if a_condition.value then
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			else
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value)
			end
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_dynamic_runtime_condition (a_condition: ET_ECF_DYNAMIC_RUNTIME_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_dynamic_runtime)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			file.put_character ('=')
			if a_condition.value then
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			else
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value)
			end
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_external_values (a_external_values: ET_ECF_EXTERNAL_VALUES; a_xml_name, a_xml_value: STRING)
			-- Print `a_external_values' to `file'.
		require
			a_external_values_not_void: a_external_values /= Void
			a_xml_name_not_void: a_xml_name /= Void
			a_xml_name_not_empty: not a_xml_name.is_empty
			a_xml_value_not_void: a_xml_value /= Void
			a_xml_value_not_empty: not a_xml_value.is_empty
		local
			l_external_value: ET_ECF_EXTERNAL_VALUE
		do
			across a_external_values.external_values as i_external_value loop
				l_external_value := i_external_value
				print_indentation
				file.put_character ('<')
				file.put_string (a_xml_name)
				file.put_character (' ')
				file.put_string (a_xml_value)
				file.put_character ('=')
				print_quoted_string (l_external_value.value)
				if
					l_external_value.description /= Void or
					l_external_value.conditions /= Void
				then
					file.put_character ('>')
					file.put_new_line
					indent
					if attached l_external_value.description as l_description then
						print_description (l_description)
					end
					if attached l_external_value.conditions as l_conditions then
						print_conditions (l_conditions)
					end
					dedent
					print_indentation
					file.put_character ('<')
					file.put_character ('/')
					file.put_string (a_xml_name)
					file.put_character ('>')
				else
					file.put_character ('/')
					file.put_character ('>')
				end
				file.put_new_line
			end
		end

	print_file_rules (a_file_rules: ET_ECF_FILE_RULES)
			-- Print `a_file_rules' to _file'.
		require
			a_file_rules_not_void: a_file_rules /= Void
		local
			l_file_rule: ET_ECF_FILE_RULE
		do
			across a_file_rules.file_rules as i_file_rule loop
				l_file_rule := i_file_rule
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_file_rule)
				file.put_character ('>')
				file.put_new_line
				indent
				if attached l_file_rule.description as l_description then
					print_description (l_description)
				end
				if attached l_file_rule.exclude as l_exclude then
					across l_exclude as i_regexp loop
						print_indentation
						file.put_character ('<')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_exclude)
						file.put_character ('>')
						print_escaped_string (i_regexp)
						file.put_character ('<')
						file.put_character ('/')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_exclude)
						file.put_character ('>')
						file.put_new_line
					end
				end
				if attached l_file_rule.include as l_include then
					across l_include as i_regexp loop
						print_indentation
						file.put_character ('<')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_include)
						file.put_character ('>')
						print_escaped_string (i_regexp)
						file.put_character ('<')
						file.put_character ('/')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_include)
						file.put_character ('>')
						file.put_new_line
					end
				end
				if attached l_file_rule.conditions as l_conditions then
					print_conditions (l_conditions)
				end
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_file_rule)
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_library (a_library: ET_ECF_ADAPTED_LIBRARY)
			-- Print `a_library' to `file'.
		require
			a_library_not_void: a_library /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_library)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_library.name)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			file.put_character ('=')
			print_quoted_string (a_library.pathname)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
			file.put_character ('=')
			if a_library.is_read_only then
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			else
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value)
			end
			if a_library.use_application_options then
				if ecf_version >= ecf_1_2_0 then
						-- The attribute "use_application_options" was introduced i n ECF 1.2.0.
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_use_application_options)
					file.put_character ('=')
					print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
				end
			end
			if attached a_library.classname_prefix as l_prefix then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				file.put_character ('=')
				print_quoted_string (l_prefix)
			end
			if
				a_library.description /= Void or
				(attached a_library.notes as l_notes and then not l_notes.is_empty) or
				a_library.options /= Void or
				a_library.class_renamings /= Void or
				(attached a_library.class_options as l_class_options and then not l_class_options.is_empty) or
				a_library.visible_classes /= Void or
				a_library.conditions /= Void
			then
				file.put_character ('>')
				file.put_new_line
				indent
				if attached a_library.description as l_description then
					print_description (l_description)
				end
				if attached a_library.notes as l_notes and then not l_notes.is_empty then
					l_notes.do_all (agent print_note_element)
				end
				if attached a_library.options as l_options then
					print_options (adapted_options (l_options), Void)
				end
				if attached a_library.class_renamings as l_renamings then
					print_renamings (l_renamings)
				end
				if attached a_library.class_options as l_class_options and then not l_class_options.is_empty then
					across l_class_options as i_options_by_class loop
						print_options (adapted_options (i_options_by_class), @i_options_by_class.key)
					end
				end
				if attached a_library.visible_classes as l_visibles then
					print_visibles (l_visibles)
				end
				if attached a_library.conditions as l_conditions then
					print_conditions (l_conditions)
				end
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_library)
				file.put_character ('>')
			else
				file.put_character ('/')
				file.put_character ('>')
			end
			file.put_new_line
		end

	print_mappings (a_mappings: DS_HASH_TABLE [STRING, STRING])
			-- Print `a_mappings' to `file'.
		require
			a_mappings_not_void: a_mappings /= Void
			no_void_new_mapping: not a_mappings.has_void
			no_void_old_mapping: not a_mappings.has_void_item
		do
			across a_mappings as i_mapping loop
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_mapping)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_old_name)
				file.put_character ('=')
				print_quoted_string (@i_mapping.key)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_new_name)
				file.put_character ('=')
				print_quoted_string (i_mapping)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_msil_clr_version_condition (a_condition: ET_ECF_MSIL_CLR_VERSION_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_version)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_type)
			file.put_character ('=')
			print_quoted_string ({ET_ECF_ELEMENT_NAMES}.xml_msil_clr)
			if attached a_condition.min_value as l_min_value then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_min)
				file.put_character ('=')
				print_quoted_string (l_min_value.out)
			end
			if attached a_condition.max_value as l_max_value then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_max)
				file.put_character ('=')
				print_quoted_string (l_max_value.out)
			end
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_note_element (a_note_element: ET_ECF_NOTE_ELEMENT)
			-- Print `a_note_element' to `file'.
		require
			a_note_element_not_void: a_note_element /= Void
		do
			if ecf_version >= ecf_1_4_0 then
					-- The <note> element was introducted in ECF 1.4.0.
				print_indentation
				file.put_character ('<')
				file.put_string (a_note_element.name)
				across a_note_element.attributes as i_attribute loop
					file.put_character (' ')
					file.put_string (@i_attribute.key)
					file.put_character ('=')
					print_quoted_string (i_attribute)
				end
				if
					not a_note_element.elements.is_empty or
					(attached a_note_element.content as l_content and then not l_content.is_empty)
				then
					file.put_character ('>')
					file.put_new_line
					indent
					a_note_element.elements.do_all (agent print_note_element)
					if attached a_note_element.content as l_content and then not l_content.is_empty then
						print_indentation
						print_escaped_string (l_content)
						file.put_new_line
					end
					dedent
					print_indentation
					file.put_character ('<')
					file.put_character ('/')
					file.put_string (a_note_element.name)
					file.put_character ('>')
				else
					file.put_character ('/')
					file.put_character ('>')
				end
				file.put_new_line
			end
		end

	print_options (a_options: ET_ECF_OPTIONS; a_class_name: detachable STRING)
			-- Print `a_options' to `file'.
			-- If `a_class_name' is not Void, then they should be considered as class options
		require
			a_options_not_void: a_options /= Void
		local
			l_option_names: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			l_assertion_names: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			l_warning_names: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			l_name: STRING
			l_start_printed: BOOLEAN
			l_end_printed: BOOLEAN
			l_assertions_printed: BOOLEAN
			l_xml_name: STRING
		do
			l_option_names := valid_options (ecf_version)
			l_assertion_names := valid_assertions (ecf_version)
			l_warning_names := valid_warnings (ecf_version)
			if a_class_name /= Void then
				l_xml_name := {ET_ECF_ELEMENT_NAMES}.xml_class_option
				print_indentation
				file.put_character ('<')
				file.put_string (l_xml_name)
				l_start_printed := True
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class)
				file.put_character ('=')
				print_quoted_string (a_class_name)
			else
				l_xml_name := {ET_ECF_ELEMENT_NAMES}.xml_option
			end
			across a_options.primary_options as i_option loop
				l_name := @i_option.key
				if l_option_names.has (l_name) then
					if not l_start_printed then
						print_indentation
						file.put_character ('<')
						file.put_string (l_xml_name)
						l_start_printed := True
					end
					file.put_character (' ')
					file.put_string (l_name)
					file.put_character ('=')
					print_quoted_string (i_option)
				end
			end
			if attached a_options.description as l_description then
				if not l_start_printed then
					print_indentation
					file.put_character ('<')
					file.put_string (l_xml_name)
					l_start_printed := True
				end
				if not l_end_printed then
					file.put_character ('>')
					file.put_new_line
					l_start_printed := True
					l_end_printed := True
				end
				indent
				print_description (l_description)
				dedent
			end
			across a_options.primary_debugs as i_debug loop
				if not l_start_printed then
					print_indentation
					file.put_character ('<')
					file.put_string (l_xml_name)
					l_start_printed := True
				end
				if not l_end_printed then
					file.put_character ('>')
					file.put_new_line
					l_start_printed := True
					l_end_printed := True
				end
				indent
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_debug)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
				file.put_character ('=')
				print_quoted_string (@i_debug.key)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_enabled)
				file.put_character ('=')
				print_quoted_string (i_debug)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
				dedent
			end
			across a_options.primary_assertions as i_assertion loop
				l_name := @i_assertion.key
				if l_assertion_names.has (l_name) then
					if not l_assertions_printed then
						if not l_start_printed then
							print_indentation
							file.put_character ('<')
							file.put_string (l_xml_name)
							l_start_printed := True
						end
						if not l_end_printed then
							file.put_character ('>')
							file.put_new_line
							l_start_printed := True
							l_end_printed := True
						end
						indent
						print_indentation
						file.put_character ('<')
						file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assertions)
						l_assertions_printed := True
					end
					file.put_character (' ')
					file.put_string (l_name)
					file.put_character ('=')
					print_quoted_string (i_assertion)
				end
			end
			if l_assertions_printed then
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
				dedent
			end
			across a_options.primary_warnings as i_warning loop
				l_name := @i_warning.key
				if l_warning_names.has (l_name) then
					if not l_start_printed then
						print_indentation
						file.put_character ('<')
						file.put_string (l_xml_name)
						l_start_printed := True
					end
					if not l_end_printed then
						file.put_character ('>')
						file.put_new_line
						l_start_printed := True
						l_end_printed := True
					end
					indent
					print_indentation
					file.put_character ('<')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_warning)
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
					file.put_character ('=')
					print_quoted_string (l_name)
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_enabled)
					file.put_character ('=')
					print_quoted_string (i_warning)
					file.put_character ('/')
					file.put_character ('>')
					file.put_new_line
					dedent
				end
			end
			if l_start_printed then
				if l_end_printed then
					print_indentation
					file.put_character ('<')
					file.put_character ('/')
					file.put_string (l_xml_name)
					file.put_character ('>')
				else
					file.put_character ('/')
					file.put_character ('>')
				end
				file.put_new_line
			end
		end

	print_overridden_group (a_overridden_group: STRING)
			-- Print `a_overridden_group' to `file'.
		require
			a_overridden_group_not_void: a_overridden_group /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_overrides)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_group)
			file.put_character ('=')
			print_quoted_string (a_overridden_group)
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_platform_condition (a_condition: ET_ECF_PLATFORM_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_platform)
			file.put_character (' ')
			if a_condition.is_excluded then
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			file.put_character ('=')
			print_quoted_string (a_condition.value)
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end

	print_precompile (a_precompiled_library: ET_ECF_ADAPTED_PRECOMPILED_LIBRARY)
			-- Print `a_precompiled_library' to `file'.
		require
			a_precompiled_library_not_void: a_precompiled_library /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_precompile)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_precompiled_library.name)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			file.put_character ('=')
			print_quoted_string (a_precompiled_library.pathname)
			if a_precompiled_library.is_read_only then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			end
			if a_precompiled_library.use_application_options then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_use_application_options)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			end
			if attached a_precompiled_library.classname_prefix as l_prefix then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				file.put_character ('=')
				print_quoted_string (l_prefix)
			end
			if attached a_precompiled_library.eifgens_location as l_eifgens_location then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_eifgens_location)
				file.put_character ('=')
				print_quoted_string (l_eifgens_location)
			end
			if
				a_precompiled_library.description /= Void or
				(attached a_precompiled_library.notes as l_notes and then not l_notes.is_empty) or
				a_precompiled_library.options /= Void or
				a_precompiled_library.class_renamings /= Void or
				(attached a_precompiled_library.class_options as l_class_options and then not l_class_options.is_empty) or
				a_precompiled_library.visible_classes /= Void or
				a_precompiled_library.conditions /= Void
			then
				file.put_character ('>')
				file.put_new_line
				indent
				if attached a_precompiled_library.description as l_description then
					print_description (l_description)
				end
				if attached a_precompiled_library.notes as l_notes and then not l_notes.is_empty then
					l_notes.do_all (agent print_note_element)
				end
				if attached a_precompiled_library.options as l_options then
					print_options (adapted_options (l_options), Void)
				end
				if attached a_precompiled_library.class_renamings as l_renamings then
					print_renamings (l_renamings)
				end
				if attached a_precompiled_library.class_options as l_class_options and then not l_class_options.is_empty then
					across l_class_options as i_options_by_class loop
						print_options (adapted_options (i_options_by_class), @i_options_by_class.key)
					end
				end
				if attached a_precompiled_library.visible_classes as l_visibles then
					print_visibles (l_visibles)
				end
				if attached a_precompiled_library.conditions as l_conditions then
					print_conditions (l_conditions)
				end
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_precompile)
				file.put_character ('>')
			else
				file.put_character ('/')
				file.put_character ('>')
			end
			file.put_new_line
		end

	print_provider_groups (a_provider_groups: DS_ARRAYED_LIST [STRING])
			-- Print `a_provider_groups' to `file'.
		require
			a_provider_groups_not_void: a_provider_groups /= Void
			no_void_provider_group: not a_provider_groups.has_void
		do
			across a_provider_groups as i_provider_group loop
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_uses)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_group)
				file.put_character ('=')
				print_quoted_string (i_provider_group)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_redirection (a_redirection: ET_ECF_REDIRECTION_CONFIG)
			-- Print `a_redirection' to `file'.
		do
			print_indentation
			file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_redirection)
			file.put_new_line
			indent
			print_indentation
			file.put_string ("xmlns=%"http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version
			file.put_character ('%"')
			file.put_new_line
			print_indentation
			file.put_string ("xmlns:xsi=%"http://www.w3.org/2001/XMLSchema-instance%"")
			file.put_new_line
			print_indentation
			file.put_string ("xsi:schemaLocation=%"http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version
			file.put_string (" http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version
			file.put_string (".xsd%"")
			file.put_new_line
			print_indentation
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			file.put_character ('=')
			print_quoted_string (a_redirection.location)
			file.put_new_line
			if attached a_redirection.uuid as l_uuid then
				print_indentation
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_uuid)
				file.put_character ('=')
				print_quoted_string (l_uuid)
				file.put_new_line
			end
			if attached a_redirection.message as l_message then
				print_indentation
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_message)
				file.put_character ('=')
				print_quoted_string (l_message)
				file.put_new_line
			end
			dedent
			print_indentation
			file.put_character ('>')
			file.put_new_line
			print_indentation
			file.put_character ('<')
			file.put_character ('/')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_redirection)
			file.put_character ('>')
			file.put_new_line
		end

	print_renamings (a_renamings: DS_HASH_TABLE [STRING, STRING])
			-- Print `a_renamings' to `file'.
		require
			a_renamings_not_void: a_renamings /= Void
			no_void_new_renaming: not a_renamings.has_void
			no_void_old_renaming: not a_renamings.has_void_item
		do
			across a_renamings as i_renaming loop
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_renaming)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_old_name)
				file.put_character ('=')
				print_quoted_string (@i_renaming.key)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_new_name)
				file.put_character ('=')
				print_quoted_string (i_renaming)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_root (a_root: ET_ECF_ROOT)
			-- Print `a_root' to `file'.
		require
			a_root_not_void: a_root /= Void
		do
			if attached {ET_ECF_ROOT_ALL_CLASSES} a_root as l_root_all_classes then
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_root)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_all_classes)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			elseif attached {ET_ECF_ROOT_CLASS} a_root as l_root_class then
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_root)
				if attached l_root_class.cluster_name as l_cluster_name then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_cluster)
					file.put_character ('=')
					print_quoted_string (l_cluster_name.name)
				end
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class)
				file.put_character ('=')
				print_quoted_string (l_root_class.class_name.name)
				if attached l_root_class.creation_procedure_name as l_feature_name then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_feature)
					file.put_character ('=')
					print_quoted_string (l_feature_name.name)
				end
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_settings (a_settings: ET_ECF_SETTINGS)
			-- Print `a_settings' to `file'.
		require
			a_settings_not_void: a_settings /= Void
		local
			l_setting_names: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]
			l_name: STRING
		do
			l_setting_names := valid_settings (ecf_version)
			across a_settings.primary_settings as i_setting loop
				l_name := @i_setting.key
				if l_setting_names.has (l_name) then
					print_indentation
					file.put_character ('<')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_setting)
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
					file.put_character ('=')
					print_quoted_string (l_name)
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
					file.put_character ('=')
					print_quoted_string (i_setting)
					file.put_character ('/')
					file.put_character ('>')
					file.put_new_line
				end
			end
		end

	print_system (a_system: ET_ECF_SYSTEM_CONFIG)
			-- Print `a_system' to `file'.
		do
			print_indentation
			file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_system)
			file.put_new_line
			indent
			print_indentation
			file.put_string ("xmlns=%"http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version
			file.put_character ('%"')
			file.put_new_line
			print_indentation
			file.put_string ("xmlns:xsi=%"http://www.w3.org/2001/XMLSchema-instance%"")
			file.put_new_line
			print_indentation
			file.put_string ("xsi:schemaLocation=%"http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version
			file.put_string (" http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version
			file.put_string (".xsd%"")
			file.put_new_line
			print_indentation
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_system.name)
			file.put_new_line
			if attached a_system.uuid as l_uuid then
				print_indentation
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_uuid)
				file.put_character ('=')
				print_quoted_string (l_uuid)
				file.put_new_line
			else
				if ecf_version < ecf_1_2_0 then
						-- The attribute "uuid" was required before ECF 1.2.0.
						-- Print some dummy uuid.
					print_indentation
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_uuid)
					file.put_character ('=')
					print_quoted_string ("5C1DCBEA-B051-4C4B-BA3D-03BB72306C8C")
					file.put_new_line
				end
			end
			if a_system.is_read_only then
				print_indentation
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
				file.put_new_line
			end
			if attached a_system.library_target as l_library_target then
				print_indentation
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_library_target)
				file.put_character ('=')
				print_quoted_string (l_library_target.name)
				file.put_new_line
			end
			dedent
			print_indentation
			file.put_character ('>')
			file.put_new_line
			if
				a_system.description /= Void or
				(attached a_system.notes as l_notes and then not l_notes.is_empty) or
				a_system.targets /= Void
			then
				indent
				if attached a_system.description as l_description then
					print_description (l_description)
				end
				if attached a_system.notes as l_notes and then not l_notes.is_empty then
					l_notes.do_all (agent print_note_element)
				end
				if attached a_system.targets as l_targets then
					l_targets.do_all (agent print_target)
				end
				dedent
			end
			print_indentation
			file.put_character ('<')
			file.put_character ('/')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_system)
			file.put_character ('>')
			file.put_new_line
		end

	print_target (a_target: ET_ECF_TARGET)
			-- Print `a_target' to `file'.
		require
			a_target_not_void: a_target /= Void
		local
			l_options: ET_ECF_OPTIONS
			l_settings: ET_ECF_SETTINGS
			l_capabilities: ET_ECF_CAPABILITIES
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_target)
			file.put_character (' ')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			file.put_character ('=')
			print_quoted_string (a_target.name)
			if a_target.is_abstract then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_abstract)
				file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value)
			end
			if attached a_target.parent as l_parent then
				if attached l_parent.name as l_parent_name then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_extends)
					file.put_character ('=')
					print_quoted_string (l_parent_name)
				end
				if attached l_parent.location as l_parent_location then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_extends_location)
					file.put_character ('=')
					print_quoted_string (l_parent_location)
				end
			end
			l_options := adapted_target_options (a_target)
			l_settings := adapted_settings (a_target)
			l_capabilities := adapted_capabilities (a_target)
			if
				a_target.description /= Void or
				(attached a_target.notes as l_notes and then not l_notes.is_empty) or
				a_target.version /= Void or
				a_target.root /= Void or
				(attached a_target.file_rules as l_file_rules and then not l_file_rules.is_empty) or
				not l_options.primary_options.is_empty or
				not l_options.primary_assertions.is_empty or
				not l_options.primary_warnings.is_empty or
				not l_options.primary_debugs.is_empty or
				not l_settings.primary_settings.is_empty or
				not l_capabilities.primary_use_capabilities.is_empty or
				not l_capabilities.primary_support_capabilities.is_empty or
				a_target.class_mappings /= Void or
				not a_target.variables.primary_variables.is_empty or
				(attached a_target.pre_compile_actions as l_pre_compile_actions and then not l_pre_compile_actions.is_empty) or
				(attached a_target.post_compile_actions as l_post_compile_actions and then not l_post_compile_actions.is_empty) or
				a_target.precompiled_library /= Void or
				(attached a_target.libraries as l_libraries and then not l_libraries.is_empty) or
				(attached a_target.dotnet_assemblies as l_assemblies and then not l_assemblies.is_empty) or
				(attached a_target.external_includes as l_external_includes and then not l_external_includes.is_empty) or
				(attached a_target.external_cflags as l_external_cflags and then not l_external_cflags.is_empty) or
				(attached a_target.external_objects as l_external_objects and then not l_external_objects.is_empty) or
				(attached a_target.external_libraries as l_external_libraries and then not l_external_libraries.is_empty) or
				(attached a_target.external_resources as l_external_resources and then not l_external_resources.is_empty) or
				(attached a_target.external_linker_flags as l_external_linker_flags and then not l_external_linker_flags.is_empty) or
				(attached a_target.external_makes as l_external_makes and then not l_external_makes.is_empty) or
				(attached a_target.clusters as l_clusters and then not l_clusters.is_empty)
			then
				file.put_character ('>')
				file.put_new_line
				indent
				if attached a_target.description as l_description then
					print_description (l_description)
				end
				if attached a_target.notes as l_notes and then not l_notes.is_empty then
					l_notes.do_all (agent print_note_element)
				end
				if attached a_target.version as l_version then
					print_version (l_version)
				end
				if attached a_target.root as l_root then
					print_root (l_root)
				end
				if attached a_target.file_rules as l_file_rules and then not l_file_rules.is_empty then
					print_file_rules (l_file_rules)
				end
				print_options (l_options, Void)
				print_settings (l_settings)
				print_capabilities (l_capabilities)
				if attached a_target.class_mappings as l_mappings then
					print_mappings (l_mappings)
				end
				print_variables (a_target.variables)
				if attached a_target.pre_compile_actions as l_pre_compile_actions and then not l_pre_compile_actions.is_empty then
					print_actions (l_pre_compile_actions, {ET_ECF_ELEMENT_NAMES}.xml_pre_compile_action)
				end
				if attached a_target.post_compile_actions as l_post_compile_actions and then not l_post_compile_actions.is_empty then
					print_actions (l_post_compile_actions, {ET_ECF_ELEMENT_NAMES}.xml_post_compile_action)
				end
				if attached a_target.precompiled_library as l_precompiled_library then
					print_precompile (l_precompiled_library)
				end
				if attached a_target.libraries as l_libraries and then not l_libraries.is_empty then
					l_libraries.do_adapted (agent print_library)
				end
				if attached a_target.dotnet_assemblies as l_assemblies and then not l_assemblies.is_empty then
					l_assemblies.do_adapted (agent print_assembly)
				end
				if attached a_target.external_includes as l_external_includes and then not l_external_includes.is_empty then
					print_external_values (l_external_includes, {ET_ECF_ELEMENT_NAMES}.xml_external_include, {ET_ECF_ELEMENT_NAMES}.xml_location)
				end
				if attached a_target.external_cflags as l_external_cflags and then not l_external_cflags.is_empty then
					if ecf_version >= ecf_1_10_0 then
						print_external_values (l_external_cflags, {ET_ECF_ELEMENT_NAMES}.xml_external_cflag, {ET_ECF_ELEMENT_NAMES}.xml_value)
					else
							-- <external_cflag> was introduced in ECF 1.10.0.
						print_external_values (l_external_cflags, {ET_ECF_ELEMENT_NAMES}.xml_external_object, {ET_ECF_ELEMENT_NAMES}.xml_location)
					end
				end
				if attached a_target.external_objects as l_external_objects and then not l_external_objects.is_empty then
					print_external_values (l_external_objects, {ET_ECF_ELEMENT_NAMES}.xml_external_object, {ET_ECF_ELEMENT_NAMES}.xml_location)
				end
				if attached a_target.external_libraries as l_external_libraries and then not l_external_libraries.is_empty then
					print_external_values (l_external_libraries, {ET_ECF_ELEMENT_NAMES}.xml_external_library, {ET_ECF_ELEMENT_NAMES}.xml_location)
				end
				if attached a_target.external_resources as l_external_resources and then not l_external_resources.is_empty then
					print_external_values (l_external_resources, {ET_ECF_ELEMENT_NAMES}.xml_external_resource, {ET_ECF_ELEMENT_NAMES}.xml_location)
				end
				if attached a_target.external_linker_flags as l_external_linker_flags and then not l_external_linker_flags.is_empty then
					if ecf_version >= ecf_1_10_0 then
						print_external_values (l_external_linker_flags, {ET_ECF_ELEMENT_NAMES}.xml_external_linker_flag, {ET_ECF_ELEMENT_NAMES}.xml_value)
					else
							-- <external_linker_flag> was introduced in ECF 1.10.0.
						print_external_values (l_external_linker_flags, {ET_ECF_ELEMENT_NAMES}.xml_external_library, {ET_ECF_ELEMENT_NAMES}.xml_location)
					end
				end
				if attached a_target.external_makes as l_external_makes and then not l_external_makes.is_empty then
					print_external_values (l_external_makes, {ET_ECF_ELEMENT_NAMES}.xml_external_make, {ET_ECF_ELEMENT_NAMES}.xml_location)
				end
				if attached a_target.clusters as l_clusters and then not l_clusters.is_empty then
					l_clusters.do_all (agent print_cluster)
				end
				dedent
				print_indentation
				file.put_character ('<')
				file.put_character ('/')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_target)
				file.put_character ('>')
			else
				file.put_character ('/')
				file.put_character ('>')
			end
			file.put_new_line
		end

	print_variables (a_variables: ET_ECF_VARIABLES)
			-- Print `a_variables' to `file'.
		require
			a_variables_not_void: a_variables /= Void
		do
			across a_variables.primary_variables as i_variable loop
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_variable)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
				file.put_character ('=')
				print_quoted_string (@i_variable.key)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
				file.put_character ('=')
				print_quoted_string (i_variable)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_version (a_version: ET_ECF_VERSION)
			-- Print `a_version' to `file'.
		require
			a_version_not_void: a_version /= Void
		do
			print_indentation
			file.put_character ('<')
			file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_version)
			if a_version.has_major then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_major)
				file.put_character ('=')
				file.put_character ('%"')
				file.put_integer (a_version.major)
				file.put_character ('%"')
			end
			if a_version.has_minor then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_minor)
				file.put_character ('=')
				file.put_character ('%"')
				file.put_integer (a_version.minor)
				file.put_character ('%"')
			end
			if a_version.has_release then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_release)
				file.put_character ('=')
				file.put_character ('%"')
				file.put_integer (a_version.release)
				file.put_character ('%"')
			end
			if a_version.has_build then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_build)
				file.put_character ('=')
				file.put_character ('%"')
				file.put_integer (a_version.build)
				file.put_character ('%"')
			end
			if attached a_version.product as l_product then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_product)
				file.put_character ('=')
				print_quoted_string (l_product)
			end
			if attached a_version.company as l_company then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_company)
				file.put_character ('=')
				print_quoted_string (l_company)
			end
			if attached a_version.copyright as l_copyright then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_copyright)
				file.put_character ('=')
				print_quoted_string (l_copyright)
			end
			if attached a_version.trademark as l_trademark then
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_trademark)
				file.put_character ('=')
				print_quoted_string (l_trademark)
			end
			file.put_character ('/')
			file.put_character ('>')
			file.put_new_line
		end


	print_visibles (a_visibles: DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS])
			-- Print `a_visibles' to `file'.
		require
			a_visibles_not_void: a_visibles /= Void
			no_void_visible: not a_visibles.has_void
		local
			l_visible: ET_ECF_VISIBLE_CLASS
		do
			across a_visibles as i_visible loop
				l_visible := i_visible
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_visible)
				file.put_character (' ')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class)
				file.put_character ('=')
				print_quoted_string (l_visible.class_name)
				if attached l_visible.feature_name as l_feature then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_feature)
					file.put_character ('=')
					print_quoted_string (l_feature)
				end
				if attached l_visible.new_class_name as l_class_rename then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class_rename)
					file.put_character ('=')
					print_quoted_string (l_class_rename)
				end
				if attached l_visible.new_feature_name as l_feature_rename then
					file.put_character (' ')
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_feature_rename)
					file.put_character ('=')
					print_quoted_string (l_feature_rename)
				end
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

	print_void_safety_condition (a_condition: ET_ECF_VOID_SAFETY_CONDITION)
			-- Print `a_condition' to `file'.
		require
			a_condition_not_void: a_condition /= Void
		do
			if ecf_version >= ecf_1_19_0 then
					-- The <void_sfety> condition was introduced in ECF 1.19.0.
				print_indentation
				file.put_character ('<')
				file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_void_safety)
				file.put_character (' ')
				if a_condition.is_excluded then
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
				else
					file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
				end
				file.put_character ('=')
				print_quoted_string (a_condition.value)
				file.put_character ('/')
				file.put_character ('>')
				file.put_new_line
			end
		end

feature {NONE} -- Implementation

	print_indentation
			-- Print indentation to `file'.
		local
			i, nb: INTEGER
		do
			nb := indentation
			from i := 1 until i > nb loop
				file.put_character ('%T')
				i := i + 1
			end
		end

	print_escaped_string (a_string: STRING)
			-- Print escaped version of `a_string' to `file'.
		require
			a_string_not_void: a_string /= Void
		local
			last_escaped: INTEGER
			i: INTEGER
			cnt: INTEGER
			a_char: INTEGER
		do
			from
				last_escaped := 0
				i := 1
				cnt := a_string.count
			invariant
				last_escaped <= i
			until
				i > cnt
			loop
				a_char := a_string.item_code (i)
				if is_escaped (a_char) then
					if last_escaped < i - 1 then
						file.put_string (a_string.substring (last_escaped + 1, i - 1))
					end
					print_escaped_character (a_char)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				file.put_string (a_string)
			elseif last_escaped < i - 1 then
				file.put_string (a_string.substring (last_escaped + 1, i - 1))
			end
		end

	print_quoted_string (a_string: STRING)
			-- Print to `file' escaped version of `a_string' (with quotes
			-- also escaped) surrounded by quotes.
		require
			a_string_not_void: a_string /= Void
		do
			file.put_character ('%"')
			print_quote_escaped_string (a_string)
			file.put_character ('%"')
		end

	print_quote_escaped_string (a_string: STRING)
			-- Print escaped version of `a_string' (with quotes also
			-- escaped for attribute values) to `file'.
		require
			a_string_not_void: a_string /= Void
		local
			last_escaped: INTEGER
			i: INTEGER
			cnt: INTEGER
		do
			from
				last_escaped := 0
				i := 1
				cnt := a_string.count
			invariant
				last_escaped <= i
			until
				i > cnt
			loop
				if a_string.item_code (i) = Quot_char.code then
					if last_escaped < i - 1 then
						print_escaped_string (a_string.substring (last_escaped + 1, i - 1))
					end
					file.put_string (Quot_entity)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				print_escaped_string (a_string)
			elseif last_escaped < i - 1 then
				print_escaped_string (a_string.substring (last_escaped + 1, i - 1))
			end
		end

	print_escaped_character (a_char: INTEGER)
			-- Print escaped version of `a_char' to `file'.
		require
			is_escaped: is_escaped (a_char)
		do
			if a_char = Lt_char.code then
				file.put_string (Lt_entity)
			elseif a_char = Gt_char.code then
				file.put_string (Gt_entity)
			elseif a_char = Amp_char.code then
				file.put_string (Amp_entity)
			elseif a_char = Quot_char.code then
				file.put_string (Quot_entity)
			else
				file.put_string ("&#")
				file.put_integer (a_char)
				file.put_character (';')
			end
		end

	print_ecf_version
			-- Print `ecf_version' to `file' using the format N-N-N.
		do
			if ecf_version.has_major then
				file.put_integer (ecf_version.major)
			else
				file.put_character ('0')
			end
			file.put_character ('-')
			if ecf_version.has_minor then
				file.put_integer (ecf_version.minor)
			else
				file.put_character ('0')
			end
			file.put_character ('-')
			if ecf_version.has_revision then
				file.put_integer (ecf_version.revision)
			else
				file.put_character ('0')
			end
		end

feature {NONE} -- Adaptation

	adapted_settings (a_target: ET_ECF_TARGET): ET_ECF_SETTINGS
			-- Settings from `a_target', adapted so that old settings as
			-- known in `ecf_version' are populated with the equivalent
			-- values of those as known in the most recent version of ECF.
			-- Also promote to primary values the settings whose default
			-- value was different in `ecf_version'.
		require
			a_target_not_void: a_target /= Void
		local
			l_original_settings: ET_ECF_SETTINGS
			l_default_settings: ET_ECF_SETTINGS
			l_default_capabilities: ET_ECF_CAPABILITIES
			l_default_options: ET_ECF_OPTIONS
			l_concurrency_value: detachable STRING
			l_multithreaded_value: STRING
		do
			l_default_settings := default_settings (ecf_version)
			l_original_settings := a_target.settings
			if a_target.parent /= Void or l_original_settings.secondary_settings = l_default_settings then
				if ecf_version >= ecf_1_20_0 then
					Result := l_original_settings
				else
					create Result.make
					across l_original_settings.primary_settings as i_primary_setting loop
						Result.set_primary_value (@i_primary_setting.key, i_primary_setting)
					end
				end
			else
				Result := explicit_settings (l_original_settings, l_default_settings)
			end
			if ecf_version < ecf_1_20_0 then
					-- Values of setting "dead_code_removal" have changed in ECF 1.20.0.
				if attached a_target.settings.primary_value ({ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name) as l_value then
					if STRING_.same_case_insensitive (l_value, {ET_ECF_SETTING_NAMES}.none_setting_value) then
						Result.set_primary_value ({ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name, {ET_ECF_SETTING_NAMES}.false_setting_value)
					else
						Result.set_primary_value ({ET_ECF_SETTING_NAMES}.dead_code_removal_setting_name, {ET_ECF_SETTING_NAMES}.true_setting_value)
					end
				end
			end
			if ecf_version < ecf_1_16_0 then
					-- Setting "multithreaded" has been superseded by setting "concurrency" in ECF 1.7.0,
					-- Setting "concurrency" has been superseded by capability "concurrency" in ECF 1.16.0.
				Result.primary_settings.remove ({ET_ECF_SETTING_NAMES}.multithreaded_setting_name)
				Result.primary_settings.remove ({ET_ECF_SETTING_NAMES}.concurrency_setting_name)
				if attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) as l_value then
					l_concurrency_value := l_value
				elseif attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) as l_value then
					l_concurrency_value := l_value
				elseif a_target.parent = Void then
					l_default_capabilities := default_capabilities (ecf_version)
					if attached a_target.capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) as l_value then
						if attached l_default_capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) as l_default_value then
							if not STRING_.same_case_insensitive (l_value, l_default_value) then
								l_concurrency_value := l_value
							end
						end
					elseif attached a_target.capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) as l_value then
						if attached l_default_capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.concurrency_capability_name) as l_default_value then
							if not STRING_.same_case_insensitive (l_value, l_default_value) then
								l_concurrency_value := l_value
							end
						end
					end
				end
				if l_concurrency_value /= Void then
					if ecf_version >= ecf_1_7_0 then
						Result.set_primary_value ({ET_ECF_SETTING_NAMES}.concurrency_setting_name, l_concurrency_value)
					else
						if STRING_.same_case_insensitive (l_concurrency_value, {ET_ECF_CAPABILITY_NAMES}.none_capability_value) then
							l_multithreaded_value := {ET_ECF_SETTING_NAMES}.false_setting_value
						else
							l_multithreaded_value := {ET_ECF_SETTING_NAMES}.true_setting_value
						end
						Result.set_primary_value ({ET_ECF_SETTING_NAMES}.multithreaded_setting_name, l_multithreaded_value)
					end
				end
			end
			if ecf_version < ecf_1_2_0 then
					-- Setting "full_type_checking" has been superseded
					-- by option "full_class_checking" in ECF 1.2.0.
				Result.primary_settings.remove ({ET_ECF_SETTING_NAMES}.full_type_checking_setting_name)
				if attached a_target.options.primary_value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name) as l_value then
					Result.set_primary_value ({ET_ECF_SETTING_NAMES}.full_type_checking_setting_name, l_value)
				elseif a_target.parent = Void then
					l_default_options := default_options (ecf_version)
					if attached a_target.options.value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name) as l_value then
						if attached l_default_options.value ({ET_ECF_OPTION_NAMES}.full_class_checking_option_name) as l_default_value then
							if not STRING_.same_case_insensitive (l_value, l_default_value) then
								Result.set_primary_value ({ET_ECF_SETTING_NAMES}.full_type_checking_setting_name, l_value)
							end
						end
					end
				end
			end
		ensure
			adapted_settings_not_void: Result /= Void
		end

	explicit_settings (a_original_settings, a_default_settings: ET_ECF_SETTINGS): ET_ECF_SETTINGS
			-- New settings object with the same primary values as in
			-- `a_original_settings', plus secondary values which are
			-- promoted to primary when they have a different value
			-- from the one in `a_default_settings'.
			--
			-- Only consider settings as known in the most recent version of ECF.
		require
			a_original_settings_not_void: a_original_settings /= Void
			a_default_settings_not_void: a_default_settings /= Void
		local
			l_name: STRING
		do
			create Result.make
			across valid_settings_latest as i_setting_name loop
				l_name := @i_setting_name.key
				if attached a_original_settings.primary_value (l_name) as l_value then
					Result.set_primary_value (l_name, l_value)
				elseif attached a_default_settings.value (l_name) as l_default_value then
					if attached a_original_settings.value (l_name) as l_value then
						if not STRING_.same_case_insensitive (l_value, l_default_value) then
							Result.set_primary_value (l_name, l_value)
						end
					end
				end
			end
		ensure
			explicit_settings_not_void: Result /= Void
			new_object: Result /= a_original_settings
		end

	adapted_capabilities (a_target: ET_ECF_TARGET): ET_ECF_CAPABILITIES
			-- Capabilities from `a_target', adapted so that old capabilities
			-- as known in `ecf_version' are populated with the equivalent
			-- values of those as known in the most recent version of ECF.
			-- Also promote to primary values the capabilities whose default
			-- value was different in `ecf_version'.
		require
			a_target_not_void: a_target /= Void
		local
			l_original_capabilities: ET_ECF_CAPABILITIES
			l_default_capabilities: ET_ECF_CAPABILITIES
		do
			l_default_capabilities := default_capabilities (ecf_version)
			l_original_capabilities := a_target.capabilities
			if a_target.parent /= Void or l_original_capabilities.secondary_capabilities = l_default_capabilities then
				Result := l_original_capabilities
			else
				Result := explicit_capabilities (l_original_capabilities, l_default_capabilities)
			end
		end

	explicit_capabilities (a_original_capabilities, a_default_capabilities: ET_ECF_CAPABILITIES): ET_ECF_CAPABILITIES
			-- New capabilities object with the same primary values as in
			-- `a_original_capabilities', plus secondary values which are
			-- promoted to primary when they have a different value
			-- from the one in `a_default_capabilities'.
			--
			-- Only consider capabilities as known in the most recent version of ECF.
		require
			a_original_capabilities_not_void: a_original_capabilities /= Void
			a_default_capabilities_not_void: a_default_capabilities /= Void
		local
			l_name: STRING
		do
			create Result.make
			across valid_capabilities_latest as i_capability_name loop
				l_name := @i_capability_name.key
				if attached a_original_capabilities.primary_support_value (l_name) as l_value then
					Result.set_primary_support_value (l_name, l_value)
				elseif attached a_default_capabilities.support_value (l_name) as l_default_value then
					if attached a_original_capabilities.support_value (l_name) as l_value then
						if not STRING_.same_case_insensitive (l_value, l_default_value) then
							Result.set_primary_support_value (l_name, l_value)
						end
					end
				end
				if attached a_original_capabilities.primary_use_value (l_name) as l_value then
					Result.set_primary_use_value (l_name, l_value)
				elseif attached a_default_capabilities.use_value (l_name) as l_default_value then
					if attached a_original_capabilities.use_value (l_name) as l_value then
						if not STRING_.same_case_insensitive (l_value, l_default_value) then
							Result.set_primary_use_value (l_name, l_value)
						end
					end
				end
			end
		ensure
			explicit_capabilities_not_void: Result /= Void
			new_object: Result /= a_original_capabilities
		end

	adapted_target_options (a_target: ET_ECF_TARGET): ET_ECF_OPTIONS
			-- Options from `a_target', adapted so that old options as
			-- known in `ecf_version' are populated with the equivalent
			-- values of those as known in the most recent version of ECF.
			-- Also promote to primary values the options whose default
			-- value was different in `ecf_version'.
		require
			a_target_not_void: a_target /= Void
		local
			l_original_options: ET_ECF_OPTIONS
			l_default_options: ET_ECF_OPTIONS
			l_default_capabilities: ET_ECF_CAPABILITIES
			l_catcall_detection_value: detachable STRING
			l_catcall_detection_boolean_value: STRING
			l_void_safety_value: detachable STRING
			l_void_safety_boolean_value: STRING
		do
			l_default_options := default_options (ecf_version)
			l_original_options := a_target.options
			if a_target.parent /= Void or l_original_options.secondary_options = l_default_options then
				if ecf_version >= ecf_1_22_0 then
					Result := l_original_options
				else
					create Result.make
					across l_original_options.primary_options as i_primary_option loop
						Result.set_primary_value (@i_primary_option.key, i_primary_option)
					end
					across l_original_options.primary_assertions as i_primary_assertion loop
						Result.set_primary_assertion_value (@i_primary_assertion.key, i_primary_assertion)
					end
					across l_original_options.primary_debugs as i_primary_debug loop
						Result.set_primary_debug_value (@i_primary_debug.key, i_primary_debug)
					end
					across l_original_options.primary_warnings as i_primary_warning loop
						Result.set_primary_warning_value (@i_primary_warning.key, i_primary_warning)
					end
				end
			else
				Result := explicit_options (l_original_options, l_default_options)
			end
			if ecf_version < ecf_1_22_0 then
				if ecf_version < ecf_1_16_0 then
						-- Option "cat_call_detection" has been superseded by capability "catcall_detection" in ECF 1.16.0.
					Result.primary_options.remove ({ET_ECF_OPTION_NAMES}.cat_call_detection_option_name)
					if ecf_version >= ecf_1_10_0 then
						if attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) as l_value then
							l_catcall_detection_value := l_value
						elseif attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) as l_value then
							l_catcall_detection_value := l_value
						elseif a_target.parent = Void then
							l_default_capabilities := default_capabilities (ecf_version)
							if attached a_target.capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) as l_value then
								if attached l_default_capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) as l_default_value then
									if not STRING_.same_case_insensitive (l_value, l_default_value) then
										l_catcall_detection_value := l_value
									end
								end
							elseif attached a_target.capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) as l_value then
								if attached l_default_capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.catcall_detection_capability_name) as l_default_value then
									if not STRING_.same_case_insensitive (l_value, l_default_value) then
										l_catcall_detection_value := l_value
									end
								end
							end
						end
						if l_catcall_detection_value /= Void then
							if ecf_version >= ecf_1_14_0 then
								Result.set_primary_value ({ET_ECF_OPTION_NAMES}.cat_call_detection_option_name, l_catcall_detection_value)
							else
								if STRING_.same_case_insensitive (l_catcall_detection_value, {ET_ECF_CAPABILITY_NAMES}.none_capability_value) then
									l_catcall_detection_boolean_value := {ET_ECF_OPTION_NAMES}.false_option_value
								else
									l_catcall_detection_boolean_value := {ET_ECF_OPTION_NAMES}.true_option_value
								end
								Result.set_primary_value ({ET_ECF_OPTION_NAMES}.cat_call_detection_option_name, l_catcall_detection_boolean_value)
							end
						end
					end
						-- Option "void_safety" has been superseded by capability "void_safety" in ECF 1.16.0.
						-- Option "is_void_safe" has been superseded by option "void_safety" in ECF 1.5.0 and again in ECF 1.11.0.
					Result.primary_options.remove ({ET_ECF_OPTION_NAMES}.void_safety_option_name)
					Result.primary_options.remove ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name)
					if ecf_version >= ecf_1_3_0 then
						if attached a_target.capabilities.primary_use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) as l_value then
							l_void_safety_value := l_value
						elseif attached a_target.capabilities.primary_support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) as l_value then
							l_void_safety_value := l_value
						elseif a_target.parent = Void then
							l_default_capabilities := default_capabilities (ecf_version)
							if attached a_target.capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) as l_value then
								if attached l_default_capabilities.use_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) as l_default_value then
									if not STRING_.same_case_insensitive (l_value, l_default_value) then
										l_void_safety_value := l_value
									end
								end
							elseif attached a_target.capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) as l_value then
								if attached l_default_capabilities.support_value ({ET_ECF_CAPABILITY_NAMES}.void_safety_capability_name) as l_default_value then
									if not STRING_.same_case_insensitive (l_value, l_default_value) then
										l_void_safety_value := l_value
									end
								end
							end
						end
						if l_void_safety_value /= Void then
							if ecf_version < ecf_1_5_0 then
								if STRING_.same_case_insensitive (l_void_safety_value, {ET_ECF_CAPABILITY_NAMES}.none_capability_value) then
									l_void_safety_boolean_value := {ET_ECF_OPTION_NAMES}.false_option_value
								else
									l_void_safety_boolean_value := {ET_ECF_OPTION_NAMES}.true_option_value
								end
								Result.set_primary_value ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name, l_void_safety_boolean_value)
							elseif ecf_version < ecf_1_11_0 then
								if STRING_.same_case_insensitive (l_void_safety_value, {ET_ECF_CAPABILITY_NAMES}.all_capability_value) then
									if ecf_version < ecf_1_9_0 then
										Result.set_primary_value ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
									else
										Result.set_primary_value ({ET_ECF_OPTION_NAMES}.void_safety_option_name, l_void_safety_value)
									end
								elseif STRING_.same_case_insensitive (l_void_safety_value, {ET_ECF_CAPABILITY_NAMES}.transitional_capability_value) then
									Result.set_primary_value ({ET_ECF_OPTION_NAMES}.void_safety_option_name, {ET_ECF_OPTION_NAMES}.all_option_value)
								elseif STRING_.same_case_insensitive (l_void_safety_value, {ET_ECF_CAPABILITY_NAMES}.none_capability_value) then
									Result.set_primary_value ({ET_ECF_OPTION_NAMES}.void_safety_option_name, l_void_safety_value)
								else
									Result.set_primary_value ({ET_ECF_OPTION_NAMES}.void_safety_option_name, {ET_ECF_OPTION_NAMES}.initialization_option_value)
								end
							else
								Result.set_primary_value ({ET_ECF_OPTION_NAMES}.void_safety_option_name, l_void_safety_value)
							end
						end
					end
				end
				adapt_options (Result)
			end
		ensure
			adapted_target_options_not_void: Result /= Void
		end

	adapted_options (a_options: ET_ECF_OPTIONS): ET_ECF_OPTIONS
			-- Options `a_options', adapted so that old options as
			-- known in `ecf_version' are populated with the equivalent
			-- values of those as known in the most recent version of ECF.
		require
			a_options_not_void: a_options /= Void
		local
			l_default_options: ET_ECF_OPTIONS
		do
			l_default_options := default_options (ecf_version)
			if ecf_version >= ecf_1_22_0 then
				Result := a_options
			else
				create Result.make
				across a_options.primary_options as i_primary_option loop
					Result.set_primary_value (@i_primary_option.key, i_primary_option)
				end
				across a_options.primary_assertions as i_primary_assertion loop
					Result.set_primary_assertion_value (@i_primary_assertion.key, i_primary_assertion)
				end
				across a_options.primary_debugs as i_primary_debug loop
					Result.set_primary_debug_value (@i_primary_debug.key, i_primary_debug)
				end
				across a_options.primary_warnings as i_primary_warning loop
					Result.set_primary_warning_value (@i_primary_warning.key, i_primary_warning)
				end
			end
			if ecf_version < ecf_1_22_0 then
				if ecf_version < ecf_1_16_0 then
						-- Option "cat_call_detection" has been superseded by capability "catcall_detection" in ECF 1.16.0.
					Result.primary_options.remove ({ET_ECF_OPTION_NAMES}.cat_call_detection_option_name)
						-- Option "void_safety" has been superseded by capability "void_safety" in ECF 1.16.0.
						-- Option "is_void_safe" has been superseded by option "void_safety" in ECF 1.5.0 and again in ECF 1.11.0.
					Result.primary_options.remove ({ET_ECF_OPTION_NAMES}.void_safety_option_name)
					Result.primary_options.remove ({ET_ECF_OPTION_NAMES}.is_void_safe_option_name)
				end
				adapt_options (Result)
			end
		ensure
			adapted_options_not_void: Result /= Void
		end

	explicit_options (a_original_options, a_default_options: ET_ECF_OPTIONS): ET_ECF_OPTIONS
			-- New options object with the same primary values as in
			-- `a_original_options', plus secondary values which are
			-- promoted to primary when they have a different value
			-- from the one in `a_default_options'.
			--
			-- Only consider options as known in the most recent version of ECF.
		require
			a_original_options_not_void: a_original_options /= Void
			a_default_options_not_void: a_default_options /= Void
		local
			l_name: STRING
		do
			create Result.make
			across valid_options_latest as i_option_name loop
				l_name := @i_option_name.key
				if attached a_original_options.primary_value (l_name) as l_value then
					Result.set_primary_value (l_name, l_value)
				elseif attached a_default_options.value (l_name) as l_default_value then
					if attached a_original_options.value (l_name) as l_value then
						if not STRING_.same_case_insensitive (l_value, l_default_value) then
							Result.set_primary_value (l_name, l_value)
						end
					end
				end
			end
			across valid_assertions_latest as i_assertion_name loop
				l_name := @i_assertion_name.key
				if attached a_original_options.primary_assertion_value (l_name) as l_value then
					Result.set_primary_assertion_value (l_name, l_value)
				elseif attached a_default_options.assertion_value (l_name) as l_default_value then
					if attached a_original_options.assertion_value (l_name) as l_value then
						if not STRING_.same_case_insensitive (l_value, l_default_value) then
							Result.set_primary_assertion_value (l_name, l_value)
						end
					end
				end
			end
			across valid_warnings_latest as i_warning_name loop
				l_name := @i_warning_name.key
				if attached a_original_options.primary_warning_value (l_name) as l_value then
					Result.set_primary_warning_value (l_name, l_value)
				elseif attached a_default_options.warning_value (l_name) as l_default_value then
					if attached a_original_options.warning_value (l_name) as l_value then
						if not STRING_.same_case_insensitive (l_value, l_default_value) then
							Result.set_primary_warning_value (l_name, l_value)
						end
					end
				end
			end
			across a_original_options.primary_debugs as i_primary_debug loop
				Result.set_primary_debug_value (@i_primary_debug.key, i_primary_debug)
			end
		ensure
			explicit_options_not_void: Result /= Void
			new_object: Result /= a_original_options
		end

	adapt_options (a_options: ET_ECF_OPTIONS)
			-- Adapt `a_options' so that old options as known in `ecf_version'
			-- are populated with the equivalent values of those as known in the
			-- most recent version of ECF.
		require
			a_options_not_void: a_options /= Void
		do
			if ecf_version < ecf_1_21_0 then
				if attached a_options.primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name) as l_value then
						-- Values of option "warning" have changed in ECF 1.21.0.
					if STRING_.same_case_insensitive (l_value, {ET_ECF_OPTION_NAMES}.none_option_value) then
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
					else
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
					end
				end
				if attached a_options.primary_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name) as l_value then
						-- Values of "warning" option "obsolete_feature" have changed in ECF 1.21.0.
					if STRING_.same_case_insensitive (l_value, {ET_ECF_OPTION_NAMES}.none_option_value) then
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name, {ET_ECF_OPTION_NAMES}.false_option_value)
					else
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.warning_obsolete_feature_option_name, {ET_ECF_OPTION_NAMES}.true_option_value)
					end
				end
			end
			if ecf_version >= ecf_1_4_0 and ecf_version < ecf_1_5_0 then
					-- Option "syntax_level" has been superseded by option "syntax" in ECF 1.5.0.
				a_options.primary_options.remove ({ET_ECF_OPTION_NAMES}.syntax_level_option_name)
				if attached a_options.primary_value ({ET_ECF_OPTION_NAMES}.syntax_option_name) as l_value then
					if STRING_.same_case_insensitive (l_value, {ET_ECF_OPTION_NAMES}.obsolete_option_value) then
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_level_option_name, "0")
					elseif STRING_.same_case_insensitive (l_value, {ET_ECF_OPTION_NAMES}.transitional_option_value) then
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_level_option_name, "1")
					else
						a_options.set_primary_value ({ET_ECF_OPTION_NAMES}.syntax_level_option_name, "2")
					end
				end
			end
		end

feature {NONE} -- Escaped

	is_escaped (a_char: INTEGER): BOOLEAN
			-- Is this an escapable character?
		do
			Result := a_char = Lt_char.code
				or a_char = Gt_char.code
				or a_char = Amp_char.code
		end

invariant

	file_not_void: file /= Void
	file_is_open_write: file.is_open_write
	ecf_version_not_void: ecf_version /= Void

end
