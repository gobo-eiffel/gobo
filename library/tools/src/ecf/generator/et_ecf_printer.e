note

	description:

		"ECF file printers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_PRINTER

inherit

	ANY

	UT_SHARED_ECF_VERSIONS
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new ECF printer.
		do
			ecf_version := ecf_1_16_0
		end

feature -- Access

	ecf_version: UT_VERSION
			-- Version of ECF used by the printer

feature -- Output

	print_actions (a_actions: DS_ARRAYED_LIST [ET_ECF_ACTION]; a_xml_name: STRING; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_actions' to `a_file' indented by `a_indent' tab characters.
		require
			a_actions_not_void: a_actions /= Void
			no_void_action: not a_actions.has_void
			a_xml_name_not_void: a_xml_name /= Void
			a_xml_name_not_empty: not a_xml_name.is_empty
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
			l_action: ET_ECF_ACTION
		do
			across a_actions as l_actions loop
				l_action := l_actions.item
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string (a_xml_name)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_command)
				a_file.put_character ('=')
				print_quoted_string (l_action.command_name, a_file)
				if attached l_action.working_directory as l_working_directory then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_working_directory)
					a_file.put_character ('=')
					print_quoted_string (l_working_directory, a_file)
				end
				if l_action.must_succeed then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_succeed)
					a_file.put_character ('=')
					print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
				end
				l_end_printed := False
				if attached l_action.description as l_description then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
					print_description (l_description, a_indent + 1, a_file)
				end
				if attached l_action.conditions as l_conditions then
					if not l_end_printed then
						a_file.put_character ('>')
						a_file.put_new_line
						l_end_printed := True
					end
					print_conditions (l_conditions, a_indent + 1, a_file)
				end
				if l_end_printed then
					print_indentation (a_indent, a_file)
					a_file.put_character ('<')
					a_file.put_character ('/')
					a_file.put_string (a_xml_name)
					a_file.put_character ('>')
				else
					a_file.put_character ('/')
					a_file.put_character ('>')
				end
				a_file.put_new_line
			end
		end

	print_assembly (a_assembly: ET_ECF_ADAPTED_DOTNET_ASSEMBLY; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_assembly' to `a_file' indented by `a_indent' tab characters.
		require
			a_assembly_not_void: a_assembly /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_assembly.name, a_file)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			a_file.put_character ('=')
			print_quoted_string (a_assembly.pathname, a_file)
			if attached a_assembly.assembly_name as l_assembly_name then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_name)
				a_file.put_character ('=')
				print_quoted_string (l_assembly_name, a_file)
			end
			if attached a_assembly.assembly_version as l_assembly_version then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_version)
				a_file.put_character ('=')
				print_quoted_string (l_assembly_version, a_file)
			end
			if attached a_assembly.assembly_culture as l_assembly_culture then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_culture)
				a_file.put_character ('=')
				print_quoted_string (l_assembly_culture, a_file)
			end
			if attached a_assembly.assembly_key as l_assembly_key then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly_key)
				a_file.put_character ('=')
				print_quoted_string (l_assembly_key, a_file)
			end
			if a_assembly.is_read_only then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if attached a_assembly.classname_prefix as l_prefix then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				a_file.put_character ('=')
				print_quoted_string (l_prefix, a_file)
			end
			if attached a_assembly.description as l_description then
				a_file.put_character ('>')
				a_file.put_new_line
				l_end_printed := True
				print_description (l_description, a_indent + 1, a_file)
			end
			if attached a_assembly.options as l_options then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_options (l_options, Void, a_indent + 1, a_file)
			end
			if attached a_assembly.class_renamings as l_renamings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_renamings (l_renamings, a_indent + 1, a_file)
			end
			if attached a_assembly.class_options as l_class_options and then not l_class_options.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_class_options.do_all_with_key (agent print_options (?, {STRING}?, a_indent + 1, a_file))
			end
			if attached a_assembly.conditions as l_conditions then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_conditions (l_conditions, a_indent + 1, a_file)
			end
			if l_end_printed then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assembly)
				a_file.put_character ('>')
			else
				a_file.put_character ('/')
				a_file.put_character ('>')
			end
			a_file.put_new_line
		end

	print_build_condition (a_condition: ET_ECF_BUILD_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_build)
			a_file.put_character (' ')
			if a_condition.is_excluded then
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			a_file.put_character ('=')
			print_quoted_string (a_condition.value, a_file)
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_capabilities (a_capabilities: ET_ECF_CAPABILITIES; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_capabilities' to `a_file' indented by `a_indent' tab characters.
		require
			a_capabilities_not_void: a_capabilities /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_capability_names: DS_HASH_SET [STRING]
			l_capability_name: STRING
			l_outer_printed: BOOLEAN
			l_inner_printed: BOOLEAN
		do
			l_capability_names := a_capabilities.capability_names_1_16_0
			across l_capability_names as i_capability_names loop
				l_inner_printed := False
				l_capability_name := i_capability_names.item
				if attached a_capabilities.primary_use_value (l_capability_name) as l_use then
					if not l_outer_printed then
						print_indentation (a_indent, a_file)
						a_file.put_character ('<')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_capability)
						a_file.put_character ('>')
						a_file.put_new_line
						l_outer_printed := True
					end
					print_indentation (a_indent + 1, a_file)
					a_file.put_character ('<')
					a_file.put_string (l_capability_name)
					l_inner_printed := True
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_use)
					a_file.put_character ('=')
					print_quoted_string (l_use, a_file)
				end
				if attached a_capabilities.primary_support_value (l_capability_name) as l_support then
					if not l_outer_printed then
						print_indentation (a_indent, a_file)
						a_file.put_character ('<')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_capability)
						a_file.put_character ('>')
						a_file.put_new_line
						l_outer_printed := True
					end
					if not l_inner_printed then
						print_indentation (a_indent + 1, a_file)
						a_file.put_character ('<')
						a_file.put_string (l_capability_name)
						l_inner_printed := True
					end
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_support)
					a_file.put_character ('=')
					print_quoted_string (l_support, a_file)
					l_inner_printed := True
				end
				if l_inner_printed then
					a_file.put_character ('/')
					a_file.put_character ('>')
					a_file.put_new_line
				end
			end
			if l_outer_printed then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_capability)
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_cluster (a_cluster: ET_ECF_CLUSTER; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_cluster' to `a_file' indented by `a_indent' tab characters.
		require
			a_cluster_not_void: a_cluster /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
			l_is_override: BOOLEAN
		do
			l_is_override := a_cluster.is_override
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			if l_is_override then
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_override)
			else
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_cluster)
			end
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_cluster.name, a_file)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			a_file.put_character ('=')
			print_quoted_string (a_cluster.pathname, a_file)
			if a_cluster.is_recursive then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_recursive)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if a_cluster.is_hidden then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_hidden)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if a_cluster.is_read_only then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if attached a_cluster.classname_prefix as l_prefix then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				a_file.put_character ('=')
				print_quoted_string (l_prefix, a_file)
			end
			if attached a_cluster.description as l_description then
				a_file.put_character ('>')
				a_file.put_new_line
				l_end_printed := True
				print_description (l_description, a_indent + 1, a_file)
			end
			if attached a_cluster.conditioned_file_rules as l_file_rules then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_file_rules (l_file_rules, a_indent + 1, a_file)
			end
			if attached a_cluster.options as l_options then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_options (l_options, Void, a_indent + 1, a_file)
			end
			if attached a_cluster.class_mappings as l_mappings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_mappings (l_mappings, a_indent + 1, a_file)
			end
			if attached a_cluster.class_renamings as l_renamings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_renamings (l_renamings, a_indent + 1, a_file)
			end
			if attached a_cluster.class_options as l_class_options and then not l_class_options.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_class_options.do_all_with_key (agent print_options (?, {STRING}?, a_indent + 1, a_file))
			end
			if attached a_cluster.visible_classes as l_visibles then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_visibles (l_visibles, a_indent + 1, a_file)
			end
			if attached a_cluster.provider_groups as l_provider_groups then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_provider_groups (l_provider_groups, a_indent + 1, a_file)
			end
			if attached a_cluster.conditions as l_conditions then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_conditions (l_conditions, a_indent + 1, a_file)
			end
			if attached a_cluster.conditioned_subclusters as l_subclusters and then not l_subclusters.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_subclusters.do_all (agent print_cluster (?, a_indent + 1, a_file))
			end
			if l_is_override and then attached a_cluster.overridden_group as l_overridden_group then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_overridden_group (l_overridden_group, a_indent + 1, a_file)
			end
			if l_end_printed then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				if l_is_override then
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_override)
				else
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_cluster)
				end
				a_file.put_character ('>')
			else
				a_file.put_character ('/')
				a_file.put_character ('>')
			end
			a_file.put_new_line
		end

	print_compiler_version_condition (a_condition: ET_ECF_COMPILER_VERSION_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_version)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_type)
			a_file.put_character ('=')
			print_quoted_string ({ET_ECF_ELEMENT_NAMES}.xml_compiler, a_file)
			if attached a_condition.min_value as l_min_value then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_min)
				a_file.put_character ('=')
				print_quoted_string (l_min_value.out, a_file)
			end
			if attached a_condition.max_value as l_max_value then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_max)
				a_file.put_character ('=')
				print_quoted_string (l_max_value.out, a_file)
			end
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_concurrency_condition (a_condition: ET_ECF_CONCURRENCY_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_concurrency)
			a_file.put_character (' ')
			if a_condition.is_excluded then
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			a_file.put_character ('=')
			print_quoted_string (a_condition.value, a_file)
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_condition (a_condition: ET_ECF_CONDITION_ITEM; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if attached {ET_ECF_BUILD_CONDITION} a_condition as l_build_condition then
				print_build_condition (l_build_condition, a_indent, a_file)
			elseif attached {ET_ECF_COMPILER_VERSION_CONDITION} a_condition as l_compiler_version_condition then
				print_compiler_version_condition (l_compiler_version_condition, a_indent, a_file)
			elseif attached {ET_ECF_CONCURRENCY_CONDITION} a_condition as l_concurrency_condition then
				print_concurrency_condition (l_concurrency_condition, a_indent, a_file)
			elseif attached {ET_ECF_CUSTOM_CONDITION} a_condition as l_custom_condition then
				print_custom_condition (l_custom_condition, a_indent, a_file)
			elseif attached {ET_ECF_DOTNET_CONDITION} a_condition as l_dotnet_condition then
				print_dotnet_condition (l_dotnet_condition, a_indent, a_file)
			elseif attached {ET_ECF_DYNAMIC_RUNTIME_CONDITION} a_condition as l_dynamic_runtime_condition then
				print_dynamic_runtime_condition (l_dynamic_runtime_condition, a_indent, a_file)
			elseif attached {ET_ECF_MSIL_CLR_VERSION_CONDITION} a_condition as l_msil_clr_version_condition then
				print_msil_clr_version_condition (l_msil_clr_version_condition, a_indent, a_file)
			elseif attached {ET_ECF_PLATFORM_CONDITION} a_condition as l_platform_condition then
				print_platform_condition (l_platform_condition, a_indent, a_file)
			end
		end

	print_conditions (a_conditions: ET_ECF_CONDITIONS; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_conditions' to `a_file' indented by `a_indent' tab characters.
		require
			a_conditions_not_void: a_conditions /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if attached {ET_ECF_ORED_CONDITIONS} a_conditions as l_ored_conditions then
				l_ored_conditions.conditions.do_all (agent print_conditions ({ET_ECF_ANDED_CONDITIONS}?, a_indent, a_file))
			elseif attached {ET_ECF_ANDED_CONDITIONS} a_conditions as l_anded_conditions then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_condition)
				a_file.put_character ('>')
				a_file.put_new_line
				l_anded_conditions.conditions.do_all (agent print_condition (?, a_indent + 1, a_file))
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_condition)
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_custom_condition (a_condition: ET_ECF_CUSTOM_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_custom)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_condition.name, a_file)
			a_file.put_character (' ')
			if a_condition.is_excluded then
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			a_file.put_character ('=')
			print_quoted_string (a_condition.value, a_file)
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_description (a_description: STRING; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_description' to `a_file' indented by `a_indent' tab characters.
		require
			a_description_not_void: a_description /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_description)
			a_file.put_character ('>')
			print_escaped_string (a_description, a_file)
			a_file.put_character ('<')
			a_file.put_character ('/')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_description)
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_dotnet_condition (a_condition: ET_ECF_DOTNET_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_dotnet)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			a_file.put_character ('=')
			if a_condition.value then
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			else
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value, a_file)
			end
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_dynamic_runtime_condition (a_condition: ET_ECF_DYNAMIC_RUNTIME_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_dynamic_runtime)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			a_file.put_character ('=')
			if a_condition.value then
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			else
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value, a_file)
			end
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_external_values (a_external_values: ET_ECF_EXTERNAL_VALUES; a_xml_name, a_xml_value: STRING; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_external_values' to `a_file' indented by `a_indent' tab characters.
		require
			a_external_values_not_void: a_external_values /= Void
			a_xml_name_not_void: a_xml_name /= Void
			a_xml_name_not_empty: not a_xml_name.is_empty
			a_xml_value_not_void: a_xml_value /= Void
			a_xml_value_not_empty: not a_xml_value.is_empty
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
			l_external_value: ET_ECF_EXTERNAL_VALUE
		do
			across a_external_values.external_values as l_external_values loop
				l_external_value := l_external_values.item
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string (a_xml_name)
				a_file.put_character (' ')
				a_file.put_string (a_xml_value)
				a_file.put_character ('=')
				print_quoted_string (l_external_value.value, a_file)
				l_end_printed := False
				if attached l_external_value.description as l_description then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
					print_description (l_description, a_indent + 1, a_file)
				end
				if attached l_external_value.conditions as l_conditions then
					if not l_end_printed then
						a_file.put_character ('>')
						a_file.put_new_line
						l_end_printed := True
					end
					print_conditions (l_conditions, a_indent + 1, a_file)
				end
				if l_end_printed then
					print_indentation (a_indent, a_file)
					a_file.put_character ('<')
					a_file.put_character ('/')
					a_file.put_string (a_xml_name)
					a_file.put_character ('>')
				else
					a_file.put_character ('/')
					a_file.put_character ('>')
				end
				a_file.put_new_line
			end
		end

	print_file_rules (a_file_rules: ET_ECF_FILE_RULES; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_file_rules' to `a_file' indented by `a_indent' tab characters.
		require
			a_file_rules_not_void: a_file_rules /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_file_rule: ET_ECF_FILE_RULE
		do
			across a_file_rules.file_rules as l_file_rules loop
				l_file_rule := l_file_rules.item
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_file_rule)
				a_file.put_character ('>')
				a_file.put_new_line
				if attached l_file_rule.description as l_description then
					print_description (l_description, a_indent + 1, a_file)
				end
				if attached l_file_rule.exclude as l_exclude then
					across l_exclude as l_regexps loop
						print_indentation (a_indent + 1, a_file)
						a_file.put_character ('<')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_exclude)
						a_file.put_character ('>')
						print_escaped_string (l_regexps.item, a_file)
						a_file.put_character ('<')
						a_file.put_character ('/')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_exclude)
						a_file.put_character ('>')
						a_file.put_new_line
					end
				end
				if attached l_file_rule.include as l_include then
					across l_include as l_regexps loop
						print_indentation (a_indent + 1, a_file)
						a_file.put_character ('<')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_include)
						a_file.put_character ('>')
						print_escaped_string (l_regexps.item, a_file)
						a_file.put_character ('<')
						a_file.put_character ('/')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_include)
						a_file.put_character ('>')
						a_file.put_new_line
					end
				end
				if attached l_file_rule.conditions as l_conditions then
					print_conditions (l_conditions, a_indent + 1, a_file)
				end
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_file_rule)
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_library (a_library: ET_ECF_ADAPTED_LIBRARY; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_library' to `a_file' indented by `a_indent' tab characters.
		require
			a_library_not_void: a_library /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_library)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_library.name, a_file)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			a_file.put_character ('=')
			print_quoted_string (a_library.pathname, a_file)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
			a_file.put_character ('=')
			if a_library.is_read_only then
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			else
				print_quoted_string ({ET_ECF_SETTING_NAMES}.false_setting_value, a_file)
			end
			if a_library.use_application_options then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_use_application_options)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if attached a_library.classname_prefix as l_prefix then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				a_file.put_character ('=')
				print_quoted_string (l_prefix, a_file)
			end
			if attached a_library.description as l_description then
				a_file.put_character ('>')
				a_file.put_new_line
				l_end_printed := True
				print_description (l_description, a_indent + 1, a_file)
			end
			if attached a_library.options as l_options then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_options (l_options, Void, a_indent + 1, a_file)
			end
			if attached a_library.class_renamings as l_renamings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_renamings (l_renamings, a_indent + 1, a_file)
			end
			if attached a_library.class_options as l_class_options and then not l_class_options.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_class_options.do_all_with_key (agent print_options (?, {STRING}?, a_indent + 1, a_file))
			end
			if attached a_library.visible_classes as l_visibles then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_visibles (l_visibles, a_indent + 1, a_file)
			end
			if attached a_library.conditions as l_conditions then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_conditions (l_conditions, a_indent + 1, a_file)
			end
			if l_end_printed then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_library)
				a_file.put_character ('>')
			else
				a_file.put_character ('/')
				a_file.put_character ('>')
			end
			a_file.put_new_line
		end

	print_mappings (a_mappings: DS_HASH_TABLE [STRING, STRING]; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_mappings' to `a_file' indented by `a_indent' tab characters.
		require
			a_mappings_not_void: a_mappings /= Void
			no_void_new_mapping: not a_mappings.has_void
			no_void_old_mapping: not a_mappings.has_void_item
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			across a_mappings as l_mappings loop
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_mapping)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_old_name)
				a_file.put_character ('=')
				print_quoted_string (l_mappings.item, a_file)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_new_name)
				a_file.put_character ('=')
				print_quoted_string (l_mappings.key, a_file)
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_msil_clr_version_condition (a_condition: ET_ECF_MSIL_CLR_VERSION_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_version)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_type)
			a_file.put_character ('=')
			print_quoted_string ({ET_ECF_ELEMENT_NAMES}.xml_msil_clr, a_file)
			if attached a_condition.min_value as l_min_value then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_min)
				a_file.put_character ('=')
				print_quoted_string (l_min_value.out, a_file)
			end
			if attached a_condition.max_value as l_max_value then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_max)
				a_file.put_character ('=')
				print_quoted_string (l_max_value.out, a_file)
			end
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_options (a_options: ET_ECF_OPTIONS; a_class_name: detachable STRING; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_options' to `a_file' indented by `a_indent' tab characters.
			-- If `a_class_name' is not Void, then they should be considered as class options
		require
			a_options_not_void: a_options /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_option_names: DS_HASH_SET [STRING]
			l_assertion_names: DS_HASH_SET [STRING]
			l_warning_names: DS_HASH_SET [STRING]
			l_name: STRING
			l_start_printed: BOOLEAN
			l_end_printed: BOOLEAN
			l_assertions_printed: BOOLEAN
			l_xml_name: STRING
		do
			l_option_names := a_options.option_names_1_16_0
			l_assertion_names := a_options.assertion_names_1_16_0
			l_warning_names := a_options.warning_names_1_16_0
			if a_class_name /= Void then
				l_xml_name := {ET_ECF_ELEMENT_NAMES}.xml_class_option
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string (l_xml_name)
				l_start_printed := True
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class)
				a_file.put_character ('=')
				print_quoted_string (a_class_name, a_file)
			else
				l_xml_name := {ET_ECF_ELEMENT_NAMES}.xml_option
			end
			across a_options.primary_options as l_options loop
				l_name := l_options.key
				if l_option_names.has (l_name) then
					if not l_start_printed then
						print_indentation (a_indent, a_file)
						a_file.put_character ('<')
						a_file.put_string (l_xml_name)
						l_start_printed := True
					end
					a_file.put_character (' ')
					a_file.put_string (l_name)
					a_file.put_character ('=')
					print_quoted_string (l_options.item, a_file)
				end
			end
			if attached a_options.description as l_description then
				if not l_start_printed then
					print_indentation (a_indent, a_file)
					a_file.put_character ('<')
					a_file.put_string (l_xml_name)
					l_start_printed := True
				end
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_start_printed := True
					l_end_printed := True
				end
				print_description (l_description, a_indent + 1, a_file)
			end
			across a_options.primary_debugs as l_debugs loop
				if not l_start_printed then
					print_indentation (a_indent, a_file)
					a_file.put_character ('<')
					a_file.put_string (l_xml_name)
					l_start_printed := True
				end
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_start_printed := True
					l_end_printed := True
				end
				print_indentation (a_indent + 1, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_debug)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
				a_file.put_character ('=')
				print_quoted_string (l_debugs.key, a_file)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_enabled)
				a_file.put_character ('=')
				print_quoted_string (l_debugs.item, a_file)
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
			across a_options.primary_assertions as l_assertions loop
				l_name := l_assertions.key
				if l_assertion_names.has (l_name) then
					if not l_assertions_printed then
						if not l_start_printed then
							print_indentation (a_indent, a_file)
							a_file.put_character ('<')
							a_file.put_string (l_xml_name)
							l_start_printed := True
						end
						if not l_end_printed then
							a_file.put_character ('>')
							a_file.put_new_line
							l_start_printed := True
							l_end_printed := True
						end
						print_indentation (a_indent + 1, a_file)
						a_file.put_character ('<')
						a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_assertions)
						l_assertions_printed := True
					end
					a_file.put_character (' ')
					a_file.put_string (l_name)
					a_file.put_character ('=')
					print_quoted_string (l_assertions.item, a_file)
				end
			end
			if l_assertions_printed then
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
			across a_options.primary_warnings as l_warnings loop
				l_name := l_warnings.key
				if l_warning_names.has (l_name) then
					if not l_start_printed then
						print_indentation (a_indent, a_file)
						a_file.put_character ('<')
						a_file.put_string (l_xml_name)
						l_start_printed := True
					end
					if not l_end_printed then
						a_file.put_character ('>')
						a_file.put_new_line
						l_start_printed := True
						l_end_printed := True
					end
					print_indentation (a_indent + 1, a_file)
					a_file.put_character ('<')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_warning)
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
					a_file.put_character ('=')
					print_quoted_string (l_name, a_file)
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_enabled)
					a_file.put_character ('=')
					print_quoted_string (l_warnings.item, a_file)
					a_file.put_character ('/')
					a_file.put_character ('>')
					a_file.put_new_line
				end
			end
			if l_start_printed then
				if l_end_printed then
					print_indentation (a_indent, a_file)
					a_file.put_character ('<')
					a_file.put_character ('/')
					a_file.put_string (l_xml_name)
					a_file.put_character ('>')
				else
					a_file.put_character ('/')
					a_file.put_character ('>')
				end
				a_file.put_new_line
			end
		end

	print_overridden_group (a_overridden_group: STRING; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_overridden_group' to `a_file' indented by `a_indent' tab characters.
		require
			a_overridden_group_not_void: a_overridden_group /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
	do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_overrides)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_group)
			a_file.put_character ('=')
			print_quoted_string (a_overridden_group, a_file)
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_platform_condition (a_condition: ET_ECF_PLATFORM_CONDITION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_condition' to `a_file' indented by `a_indent' tab characters.
		require
			a_condition_not_void: a_condition /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_platform)
			a_file.put_character (' ')
			if a_condition.is_excluded then
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_excluded_value)
			else
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
			end
			a_file.put_character ('=')
			print_quoted_string (a_condition.value, a_file)
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_precompile (a_precompiled_library: ET_ECF_ADAPTED_PRECOMPILED_LIBRARY; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_precompiled_library' to `a_file' indented by `a_indent' tab characters.
		require
			a_precompiled_library_not_void: a_precompiled_library /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_precompile)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_precompiled_library.name, a_file)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_location)
			a_file.put_character ('=')
			print_quoted_string (a_precompiled_library.pathname, a_file)
			if a_precompiled_library.is_read_only then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if a_precompiled_library.use_application_options then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_use_application_options)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if attached a_precompiled_library.classname_prefix as l_prefix then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_prefix)
				a_file.put_character ('=')
				print_quoted_string (l_prefix, a_file)
			end
			if attached a_precompiled_library.eifgens_location as l_eifgens_location then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_eifgens_location)
				a_file.put_character ('=')
				print_quoted_string (l_eifgens_location, a_file)
			end
			if attached a_precompiled_library.description as l_description then
				a_file.put_character ('>')
				a_file.put_new_line
				l_end_printed := True
				print_description (l_description, a_indent + 1, a_file)
			end
			if attached a_precompiled_library.options as l_options then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_options (l_options, Void, a_indent + 1, a_file)
			end
			if attached a_precompiled_library.class_renamings as l_renamings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_renamings (l_renamings, a_indent + 1, a_file)
			end
			if attached a_precompiled_library.class_options as l_class_options and then not l_class_options.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_class_options.do_all_with_key (agent print_options (?, {STRING}?, a_indent + 1, a_file))
			end
			if attached a_precompiled_library.visible_classes as l_visibles then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_visibles (l_visibles, a_indent + 1, a_file)
			end
			if attached a_precompiled_library.conditions as l_conditions then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_conditions (l_conditions, a_indent + 1, a_file)
			end
			if l_end_printed then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_precompile)
				a_file.put_character ('>')
			else
				a_file.put_character ('/')
				a_file.put_character ('>')
			end
			a_file.put_new_line
		end

	print_provider_groups (a_provider_groups: DS_ARRAYED_LIST [STRING]; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_provider_groups' to `a_file' indented by `a_indent' tab characters.
		require
			a_provider_groups_not_void: a_provider_groups /= Void
			no_void_provider_group: not a_provider_groups.has_void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			across a_provider_groups as l_provider_groups loop
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_uses)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_group)
				a_file.put_character ('=')
				print_quoted_string (l_provider_groups.item, a_file)
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_renamings (a_renamings: DS_HASH_TABLE [STRING, STRING]; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_renamings' to `a_file' indented by `a_indent' tab characters.
		require
			a_renamings_not_void: a_renamings /= Void
			no_void_new_renaming: not a_renamings.has_void
			no_void_old_renaming: not a_renamings.has_void_item
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			across a_renamings as l_renamings loop
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_renaming)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_old_name)
				a_file.put_character ('=')
				print_quoted_string (l_renamings.key, a_file)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_new_name)
				a_file.put_character ('=')
				print_quoted_string (l_renamings.item, a_file)
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_root (a_root: ET_ECF_ROOT; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_root' to `a_file' indented by `a_indent' tab characters.
		require
			a_root_not_void: a_root /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if attached {ET_ECF_ROOT_ALL_CLASSES} a_root as l_root_all_classes then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_root)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_all_classes)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			elseif attached {ET_ECF_ROOT_CLASS} a_root as l_root_class then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_root)
				if attached l_root_class.cluster_name as l_cluster_name then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_cluster)
					a_file.put_character ('=')
					print_quoted_string (l_cluster_name.name, a_file)
				end
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class)
				a_file.put_character ('=')
				print_quoted_string (l_root_class.class_name.name, a_file)
				if attached l_root_class.creation_procedure_name as l_feature_name then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_feature)
					a_file.put_character ('=')
					print_quoted_string (l_feature_name.name, a_file)
				end
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_settings (a_settings: ET_ECF_SETTINGS; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_settings' to `a_file' indented by `a_indent' tab characters.
		require
			a_settings_not_void: a_settings /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_setting_names: DS_HASH_SET [STRING]
		do
			l_setting_names := a_settings.setting_names_1_16_0
			across a_settings.primary_settings as l_settings loop
				if l_setting_names.has (l_settings.key) then
					print_indentation (a_indent, a_file)
					a_file.put_character ('<')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_setting)
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
					a_file.put_character ('=')
					print_quoted_string (l_settings.key, a_file)
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
					a_file.put_character ('=')
					print_quoted_string (l_settings.item, a_file)
					a_file.put_character ('/')
					a_file.put_character ('>')
					a_file.put_new_line
				end
			end
		end

	print_system (a_system: ET_ECF_SYSTEM_CONFIG; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_system' to `a_file' indented by `a_indent' tab characters.
		require
			a_system_not_void: a_system /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_indentation (a_indent, a_file)
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_system)
			a_file.put_new_line
			print_indentation (a_indent + 1, a_file)
			a_file.put_string ("xmlns=%"http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version (a_file)
			a_file.put_character ('%"')
			a_file.put_new_line
			print_indentation (a_indent + 1, a_file)
			a_file.put_string ("xmlns:xsi=%"http://www.w3.org/2001/XMLSchema-instance%"")
			a_file.put_new_line
			print_indentation (a_indent + 1, a_file)
			a_file.put_string ("xsi:schemaLocation=%"http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version (a_file)
			a_file.put_string (" http://www.eiffel.com/developers/xml/configuration-")
			print_ecf_version (a_file)
			a_file.put_string (".xsd%"")
			a_file.put_new_line
			print_indentation (a_indent + 1, a_file)
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_system.name, a_file)
			a_file.put_new_line
			if attached a_system.uuid as l_uuid then
				print_indentation (a_indent + 1, a_file)
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_uuid)
				a_file.put_character ('=')
				print_quoted_string (l_uuid, a_file)
				a_file.put_new_line
			end
			if a_system.is_read_only then
				print_indentation (a_indent + 1, a_file)
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_readonly)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
				a_file.put_new_line
			end
			if attached a_system.library_target as l_library_target then
				print_indentation (a_indent + 1, a_file)
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_library_target)
				a_file.put_character ('=')
				print_quoted_string (l_library_target.name, a_file)
				a_file.put_new_line
			end
			print_indentation (a_indent, a_file)
			a_file.put_character ('>')
			a_file.put_new_line
			if attached a_system.description as l_description then
				print_description (l_description, a_indent + 1, a_file)
			end
			if attached a_system.targets as l_targets then
				l_targets.do_all (agent print_target (?, a_indent + 1, a_file))
			end
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_character ('/')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_system)
			a_file.put_character ('>')
			a_file.put_new_line
		end

	print_target (a_target: ET_ECF_TARGET; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_target' to `a_file' indented by `a_indent' tab characters.
		require
			a_target_not_void: a_target /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_end_printed: BOOLEAN
		do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_target)
			a_file.put_character (' ')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
			a_file.put_character ('=')
			print_quoted_string (a_target.name, a_file)
			if a_target.is_abstract then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_abstract)
				a_file.put_character ('=')
				print_quoted_string ({ET_ECF_SETTING_NAMES}.true_setting_value, a_file)
			end
			if attached a_target.parent as l_parent then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_extends)
				a_file.put_character ('=')
				print_quoted_string (l_parent.name, a_file)
			end
			if attached a_target.description as l_description then
				a_file.put_character ('>')
				a_file.put_new_line
				l_end_printed := True
				print_description (l_description, a_indent + 1, a_file)
			end
			if attached a_target.version as l_version then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_version (l_version, a_indent + 1, a_file)
			end
			if attached a_target.root as l_root then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_root (l_root, a_indent + 1, a_file)
			end
			if attached a_target.file_rules as l_file_rules and then not l_file_rules.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_file_rules (l_file_rules, a_indent + 1, a_file)
			end
			if attached a_target.options as l_options then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_options (l_options, Void, a_indent + 1, a_file)
			end
			if attached a_target.settings as l_settings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_settings (l_settings, a_indent + 1, a_file)
			end
			if attached a_target.capabilities as l_capabilities then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_capabilities (l_capabilities, a_indent + 1, a_file)
			end
			if attached a_target.class_mappings as l_mappings then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_mappings (l_mappings, a_indent + 1, a_file)
			end
			if attached a_target.variables as l_variables then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_variables (l_variables, a_indent + 1, a_file)
			end
			if attached a_target.pre_compile_actions as l_pre_compile_actions and then not l_pre_compile_actions.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_actions (l_pre_compile_actions, {ET_ECF_ELEMENT_NAMES}.xml_pre_compile_action, a_indent + 1, a_file)
			end
			if attached a_target.post_compile_actions as l_post_compile_actions and then not l_post_compile_actions.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_actions (l_post_compile_actions, {ET_ECF_ELEMENT_NAMES}.xml_post_compile_action, a_indent + 1, a_file)
			end
			if attached a_target.precompiled_library as l_precompiled_library then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_precompile (l_precompiled_library, a_indent + 1, a_file)
			end
			if attached a_target.libraries as l_libraries and then not l_libraries.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_libraries.do_adapted (agent print_library (?, a_indent + 1, a_file))
			end
			if attached a_target.dotnet_assemblies as l_assemblies and then not l_assemblies.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_assemblies.do_adapted (agent print_assembly (?, a_indent + 1, a_file))
			end
			if attached a_target.external_includes as l_external_includes and then not l_external_includes.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_includes, {ET_ECF_ELEMENT_NAMES}.xml_external_include, {ET_ECF_ELEMENT_NAMES}.xml_location, a_indent + 1, a_file)
			end
			if attached a_target.external_cflags as l_external_cflags and then not l_external_cflags.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_cflags, {ET_ECF_ELEMENT_NAMES}.xml_external_cflag, {ET_ECF_ELEMENT_NAMES}.xml_value, a_indent + 1, a_file)
			end
			if attached a_target.external_objects as l_external_objects and then not l_external_objects.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_objects, {ET_ECF_ELEMENT_NAMES}.xml_external_object, {ET_ECF_ELEMENT_NAMES}.xml_location, a_indent + 1, a_file)
			end
			if attached a_target.external_objects as l_external_libraries and then not l_external_libraries.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_libraries, {ET_ECF_ELEMENT_NAMES}.xml_external_library, {ET_ECF_ELEMENT_NAMES}.xml_location, a_indent + 1, a_file)
			end
			if attached a_target.external_resources as l_external_resources and then not l_external_resources.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_resources, {ET_ECF_ELEMENT_NAMES}.xml_external_resource, {ET_ECF_ELEMENT_NAMES}.xml_location, a_indent + 1, a_file)
			end
			if attached a_target.external_linker_flags as l_external_linker_flags and then not l_external_linker_flags.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_linker_flags, {ET_ECF_ELEMENT_NAMES}.xml_external_linker_flag, {ET_ECF_ELEMENT_NAMES}.xml_value, a_indent + 1, a_file)
			end
			if attached a_target.external_makes as l_external_makes and then not l_external_makes.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				print_external_values (l_external_makes, {ET_ECF_ELEMENT_NAMES}.xml_external_make, {ET_ECF_ELEMENT_NAMES}.xml_location, a_indent + 1, a_file)
			end
			if attached a_target.clusters as l_clusters and then not l_clusters.is_empty then
				if not l_end_printed then
					a_file.put_character ('>')
					a_file.put_new_line
					l_end_printed := True
				end
				l_clusters.do_all (agent print_cluster (?, a_indent + 1, a_file))
			end
			if l_end_printed then
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_character ('/')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_target)
				a_file.put_character ('>')
			else
				a_file.put_character ('/')
				a_file.put_character ('>')
			end
			a_file.put_new_line
		end

	print_variables (a_variables: ET_ECF_VARIABLES; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_variables' to `a_file' indented by `a_indent' tab characters.
		require
			a_variables_not_void: a_variables /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			across a_variables.primary_variables as l_variables loop
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_variable)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_name)
				a_file.put_character ('=')
				print_quoted_string (l_variables.key, a_file)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_value)
				a_file.put_character ('=')
				print_quoted_string (l_variables.item, a_file)
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

	print_version (a_version: ET_ECF_VERSION; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_version' to `a_file' indented by `a_indent' tab characters.
		require
			a_version_not_void: a_version /= Void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
	do
			print_indentation (a_indent, a_file)
			a_file.put_character ('<')
			a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_version)
			if a_version.has_major then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_major)
				a_file.put_character ('=')
				a_file.put_character ('%"')
				a_file.put_integer (a_version.major)
				a_file.put_character ('%"')
			end
			if a_version.has_minor then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_minor)
				a_file.put_character ('=')
				a_file.put_character ('%"')
				a_file.put_integer (a_version.minor)
				a_file.put_character ('%"')
			end
			if a_version.has_release then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_release)
				a_file.put_character ('=')
				a_file.put_character ('%"')
				a_file.put_integer (a_version.release)
				a_file.put_character ('%"')
			end
			if a_version.has_build then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_build)
				a_file.put_character ('=')
				a_file.put_character ('%"')
				a_file.put_integer (a_version.build)
				a_file.put_character ('%"')
			end
			if attached a_version.product as l_product then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_product)
				a_file.put_character ('=')
				print_quoted_string (l_product, a_file)
			end
			if attached a_version.company as l_company then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_company)
				a_file.put_character ('=')
				print_quoted_string (l_company, a_file)
			end
			if attached a_version.copyright as l_copyright then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_copyright)
				a_file.put_character ('=')
				print_quoted_string (l_copyright, a_file)
			end
			if attached a_version.trademark as l_trademark then
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_trademark)
				a_file.put_character ('=')
				print_quoted_string (l_trademark, a_file)
			end
			a_file.put_character ('/')
			a_file.put_character ('>')
			a_file.put_new_line
		end


	print_visibles (a_visibles: DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]; a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_visibles' to `a_file' indented by `a_indent' tab characters.
		require
			a_visibles_not_void: a_visibles /= Void
			no_void_visible: not a_visibles.has_void
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_visible: ET_ECF_VISIBLE_CLASS
		do
			across a_visibles as l_visibles loop
				l_visible := l_visibles.item
				print_indentation (a_indent, a_file)
				a_file.put_character ('<')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_visible)
				a_file.put_character (' ')
				a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class)
				a_file.put_character ('=')
				print_quoted_string (l_visible.class_name, a_file)
				if attached l_visible.feature_name as l_feature then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_feature)
					a_file.put_character ('=')
					print_quoted_string (l_feature, a_file)
				end
				if attached l_visible.new_class_name as l_class_rename then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_class_rename)
					a_file.put_character ('=')
					print_quoted_string (l_class_rename, a_file)
				end
				if attached l_visible.new_feature_name as l_feature_rename then
					a_file.put_character (' ')
					a_file.put_string ({ET_ECF_ELEMENT_NAMES}.xml_feature_rename)
					a_file.put_character ('=')
					print_quoted_string (l_feature_rename, a_file)
				end
				a_file.put_character ('/')
				a_file.put_character ('>')
				a_file.put_new_line
			end
		end

feature {NONE} -- Implementation

	print_indentation (a_indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_indent' tab characters to `a_file'.
		require
			a_indent_positive: a_indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i: INTEGER
		do
			from i := 1 until i > a_indent loop
				a_file.put_character ('%T')
				i := i + 1
			end
		end

	print_escaped_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_string' to `a_file'.
		require
			a_string_not_void: a_string /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
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
						a_file.put_string (a_string.substring (last_escaped + 1, i - 1))
					end
					print_escaped_character (a_char, a_file)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				a_file.put_string (a_string)
			elseif last_escaped < i - 1 then
				a_file.put_string (a_string.substring (last_escaped + 1, i - 1))
			end
		end

	print_quoted_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' escaped version of `a_string' (with quotes
			-- also escaped) surrounded by quotes.
		require
			a_string_not_void: a_string /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_character ('%"')
			print_quote_escaped_string (a_string, a_file)
			a_file.put_character ('%"')
		end

	print_quote_escaped_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_string' (with quotes also
			-- escaped for attribute values) to `a_file'.
		require
			a_string_not_void: a_string /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
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
						print_escaped_string (a_string.substring (last_escaped + 1, i - 1), a_file)
					end
					a_file.put_string (Quot_entity)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				print_escaped_string (a_string, a_file)
			elseif last_escaped < i - 1 then
				print_escaped_string (a_string.substring (last_escaped + 1, i - 1), a_file)
			end
		end

	print_escaped_character (a_char: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_char' to `a_file'.
		require
			is_escaped: is_escaped (a_char)
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if a_char = Lt_char.code then
				a_file.put_string (Lt_entity)
			elseif a_char = Gt_char.code then
				a_file.put_string (Gt_entity)
			elseif a_char = Amp_char.code then
				a_file.put_string (Amp_entity)
			elseif a_char = Quot_char.code then
				a_file.put_string (Quot_entity)
			else
				a_file.put_string ("&#")
				a_file.put_integer (a_char)
				a_file.put_character (';')
			end
		end

	print_ecf_version (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `ecf_version' to `a_file' using the format N-N-N.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			if ecf_version.has_major then
				a_file.put_integer (ecf_version.major)
			else
				a_file.put_character ('0')
			end
			a_file.put_character ('-')
			if ecf_version.has_minor then
				a_file.put_integer (ecf_version.minor)
			else
				a_file.put_character ('0')
			end
			a_file.put_character ('-')
			if ecf_version.has_revision then
				a_file.put_integer (ecf_version.revision)
			else
				a_file.put_character ('0')
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

	ecf_version_not_void: ecf_version /= Void

end
