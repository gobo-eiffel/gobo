note

	description:

		"ECF file generators from Xace files"

	remark: "Generate ECF version 1.15"
	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ECF_GENERATOR

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_GENERATOR

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	UT_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

create

	make

feature -- Access

	default_system_output_filename: STRING
			-- Name of generated ECF file
		once
			Result := compiler + ".ecf"
		end

	default_library_output_filename: STRING
			-- Name of generated library ECF file
		once
			Result := compiler + ".ecf"
		end

feature -- Status report

	default_values_ignored: BOOLEAN = True
			-- Do not print values when they are the default value?

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Generate a new ECF file from `a_system'.
		do
			print_ecf_system_file (a_system, a_file)
		end

	generate_library (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Generate a new ECF file from `a_library'.
		do
			print_ecf_library_file (a_library, a_file)
		end

feature {NONE} -- Output

	print_ecf_system_file (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print ECF version of `a_system' to `a_file'.
		require
			a_system_not_void: a_system /= Void
			root_class_name_not_void: attached a_system.root_class_name as l_root_class_name
			root_class_name_not_empty: l_root_class_name.count > 0
			creation_procedure_name_not_void: attached a_system.creation_procedure_name as l_creation_procedure_name
			creation_procedure_name_not_empty: l_creation_procedure_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_clusters: detachable ET_XACE_CLUSTERS
			l_option: detachable ET_XACE_OPTIONS
			l_external: ET_XACE_EXTERNALS
			l_target: ET_XACE_TARGET
		do
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			a_file.put_string ("<system ")
			print_ecf_namespaces (a_file)
			a_file.put_string (" name=%"")
			print_quote_escaped_string (a_system.name, a_file)
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<target name=%"")
			print_quote_escaped_string (a_system.name, a_file)
			a_file.put_line ("%">")
			print_indentation (2, a_file)
			a_file.put_string ("<root class=%"")
			if attached a_system.root_class_name as l_root_class_name then
				print_quote_escaped_string (l_root_class_name, a_file)
			else
					-- Should never happen according to the precondition.
				check precondition: False end
			end
			a_file.put_string ("%" feature=%"")
			if attached a_system.creation_procedure_name as l_creation_procedure_name then
				print_quote_escaped_string (l_creation_procedure_name, a_file)
			else
					-- Should never happen according to the precondition.
				check precondition: False end
			end
			a_file.put_line ("%"/>")
			if is_shallow then
				l_target := a_system.selected_target
					-- Options and settings.
				l_option := l_target.options
				print_options (l_option, Void, 2, a_file)
				print_settings (l_option, 2, a_file)
					-- Externals.
				create l_external.make
				a_system.merge_externals (l_external)
				if l_external.has_include_directories then
					print_external_includes (l_external.include_directories, 2, a_file)
				end
				if l_external.has_c_compiler_options then
					print_external_c_compiler_options (l_external.c_compiler_options, 2, a_file)
				end
				if l_external.has_link_libraries then
					print_external_libraries (l_external.link_libraries, 2, a_file)
				end
					-- Libraries.
				print_mounted_libraries (l_target.libraries, 2, a_file)
				l_clusters := l_target.clusters
					-- Libraries.
				print_ecf_clusters (l_clusters, 2, a_file)
					-- Assemblies.
				print_assemblies (l_clusters, 2, a_file)
					-- Clusters.
				print_clusters (l_clusters, 2, a_file)
					-- Override clusters.
				print_override_clusters (l_clusters, 2, a_file)
			else
					-- Options and settings.
				l_option := a_system.options
				print_options (l_option, Void, 2, a_file)
				print_settings (l_option, 2, a_file)
					-- Externals.
				create l_external.make
				a_system.merge_externals (l_external)
				if l_external.has_include_directories then
					print_external_includes (l_external.include_directories, 2, a_file)
				end
				if l_external.has_c_compiler_options then
					print_external_c_compiler_options (l_external.c_compiler_options, 2, a_file)
				end
				if l_external.has_link_libraries then
					print_external_libraries (l_external.link_libraries, 2, a_file)
				end
				l_clusters := a_system.clusters
					-- Libraries.
				print_ecf_clusters (l_clusters, 2, a_file)
					-- Assemblies.
				print_assemblies (l_clusters, 2, a_file)
					-- Clusters.
				print_clusters (l_clusters, 2, a_file)
					-- Override clusters.
				print_override_clusters (l_clusters, 2, a_file)
			end
			print_indentation (1, a_file)
			a_file.put_line ("</target>")
			a_file.put_line ("</system>")
		end

	print_ecf_library_file (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print ECF version of `a_library' to `a_file'.
		require
			a_library_not_void: a_library /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_clusters: detachable ET_XACE_CLUSTERS
			l_option: detachable ET_XACE_OPTIONS
			l_external: ET_XACE_EXTERNALS
			l_target: ET_XACE_TARGET
		do
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			a_file.put_string ("<system ")
			print_ecf_namespaces (a_file)
			a_file.put_string (" name=%"")
			print_quote_escaped_string (a_library.name, a_file)
			a_file.put_string ("%" library_target=%"")
			print_quote_escaped_string (a_library.name, a_file)
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<target name=%"")
			print_quote_escaped_string (a_library.name, a_file)
			a_file.put_line ("%">")
			print_indentation (2, a_file)
			a_file.put_line ("<root all_classes=%"true%"/>")
			if is_shallow then
				l_target := a_library.selected_target
					-- Options and settings.
				l_option := l_target.options
				print_options (l_option, Void, 2, a_file)
				print_settings (l_option, 2, a_file)
					-- Externals.
				create l_external.make
				a_library.merge_externals (l_external)
				if l_external.has_include_directories then
					print_external_includes (l_external.include_directories, 2, a_file)
				end
				if l_external.has_c_compiler_options then
					print_external_c_compiler_options (l_external.c_compiler_options, 2, a_file)
				end
				if l_external.has_link_libraries then
					print_external_libraries (l_external.link_libraries, 2, a_file)
				end
					-- Libraries.
				print_mounted_libraries (a_library.libraries, 2, a_file)
				l_clusters := a_library.clusters
					-- Libraries.
				print_ecf_clusters (l_clusters, 2, a_file)
					-- Assemblies.
				print_assemblies (l_clusters, 2, a_file)
					-- Clusters.
				print_clusters (l_clusters, 2, a_file)
					-- Override clusters.
				print_override_clusters (l_clusters, 2, a_file)
			else
					-- Options and settings.
				l_option := a_library.options
				print_options (l_option, Void, 2, a_file)
				print_settings (l_option, 2, a_file)
					-- Externals.
				create l_external.make
				a_library.merge_externals (l_external)
				if l_external.has_include_directories then
					print_external_includes (l_external.include_directories, 2, a_file)
				end
				if l_external.has_c_compiler_options then
					print_external_c_compiler_options (l_external.c_compiler_options, 2, a_file)
				end
				if l_external.has_link_libraries then
					print_external_libraries (l_external.link_libraries, 2, a_file)
				end
				l_clusters := a_library.clusters
					-- Libraries.
				print_ecf_clusters (l_clusters, 2, a_file)
					-- Assemblies.
				print_assemblies (l_clusters, 2, a_file)
					-- Clusters.
				print_clusters (l_clusters, 2, a_file)
					-- Override clusters.
				print_override_clusters (l_clusters, 2, a_file)
			end
			print_indentation (1, a_file)
			a_file.put_line ("</target>")
			a_file.put_line ("</system>")
		end

	print_options (an_option: ET_XACE_OPTIONS; a_class_name: detachable STRING; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print ECF options found in `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_option_attribute_printed: BOOLEAN
			l_option_element_printed: BOOLEAN
			l_name: STRING
			l_default: STRING
		do
				-- is_attached_by_default
			l_name := {ET_XACE_OPTION_NAMES}.attached_by_default_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" is_attached_by_default=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_string ("%"")
				end
			end
				-- debug
			l_name := {ET_XACE_OPTION_NAMES}.debug_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" debug=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_string ("%"")
				end
			end
				-- full_class_checking
			l_name := {ET_XACE_OPTION_NAMES}.full_class_checking_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" full_class_checking=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_string ("%"")
				end
			end
				-- namespace
			l_name := {ET_XACE_OPTION_NAMES}.namespace_option_name
			if attached an_option.primary_value (l_name) as l_value then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					if a_class_name /= Void then
						a_file.put_string ("<class_option class=%"")
						print_quote_escaped_string (a_class_name, a_file)
						a_file.put_character ('%"')
					else
						a_file.put_string ("<option")
					end
					l_option_attribute_printed := True
				end
				a_file.put_string (" namespace=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_string ("%"")
			end
				-- profile
			l_name := {ET_XACE_OPTION_NAMES}.profile_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" profile=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_string ("%"")
				end
			end
				-- syntax
			l_name := {ET_XACE_OPTION_NAMES}.syntax_option_name
			l_default := {ET_XACE_OPTION_NAMES}.standard_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" syntax=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_string ("%"")
				end
			end
				-- trace
			l_name := {ET_XACE_OPTION_NAMES}.trace_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" trace=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_string ("%"")
				end
			end
				-- void_safety
			l_name := {ET_XACE_OPTION_NAMES}.void_safety_option_name
			l_default := {ET_XACE_OPTION_NAMES}.complete_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" void_safety=%"")
					if STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.on_demand_option_value) then
						print_quote_escaped_string ("initialization", a_file)
					elseif STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.complete_option_value) then
						print_quote_escaped_string ("all", a_file)
					else
						print_quote_escaped_string (l_value, a_file)
					end
					a_file.put_string ("%"")
				end
			end
				-- warning
			l_name := {ET_XACE_OPTION_NAMES}.warning_option_name
			l_default := {ET_XACE_OPTION_NAMES}.none_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_character ('%"')
						else
							a_file.put_string ("<option")
						end
						l_option_attribute_printed := True
					end
					a_file.put_string (" warning=%"")
					if STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.none_option_value) then
						print_quote_escaped_string ("false", a_file)
					else
						print_quote_escaped_string ("true", a_file)
					end
					a_file.put_string ("%"")
				end
			end
				-- assertions
			if attached an_option.multivalue ({ET_XACE_OPTION_NAMES}.assertion_option_name) as l_assertions and then not l_assertions.is_empty then
				if not l_option_element_printed then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_string ("%">")
						else
							a_file.put_string ("<option>")
						end
					else
						a_file.put_line (">")
					end
					l_option_element_printed := True
				end
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<assertions")
					-- precondition
				if l_assertions.has ({ET_XACE_OPTION_NAMES}.require_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					a_file.put_string (" precondition=%"true%"")
				end
					-- supplier_precondition
				if l_assertions.has ({ET_XACE_OPTION_NAMES}.supplier_precondition_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					a_file.put_string (" supplier_precondition=%"true%"")
				end
					-- postcondition
				if l_assertions.has ({ET_XACE_OPTION_NAMES}.ensure_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					a_file.put_string (" postcondition=%"true%"")
				end
					-- check
				if l_assertions.has ({ET_XACE_OPTION_NAMES}.check_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					a_file.put_string (" check=%"true%"")
				end
					-- invariant
				if l_assertions.has ({ET_XACE_OPTION_NAMES}.invariant_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					a_file.put_string (" invariant=%"true%"")
				end
					-- loop
				if l_assertions.has ({ET_XACE_OPTION_NAMES}.loop_variant_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.loop_invariant_option_value) or l_assertions.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					a_file.put_string (" loop=%"true%"")
				end
				a_file.put_line ("/>")
			end
				-- debug
			if attached an_option.multivalue ({ET_XACE_OPTION_NAMES}.debug_tag_option_name) as l_debug_tags and then not l_debug_tags.is_empty then
				if not l_option_element_printed then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						if a_class_name /= Void then
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (a_class_name, a_file)
							a_file.put_string ("%">")
						else
							a_file.put_string ("<option>")
						end
					else
						a_file.put_line (">")
					end
					l_option_element_printed := True
				end
				across l_debug_tags as i_debug_tag loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<debug name=%"")
					print_quote_escaped_string (i_debug_tag, a_file)
					a_file.put_line ("%" enabled=%"true%"/>")
				end
			end
			if l_option_element_printed then
				print_indentation (indent, a_file)
				if a_class_name /= Void then
					a_file.put_line ("</class_option>")
				else
					a_file.put_line ("</option>")
				end
			elseif l_option_attribute_printed then
				a_file.put_line ("/>")
			end
		end

	print_settings (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print ECF settings found in `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_name: STRING
			l_default: STRING
		do
				-- address_expression
			l_name := {ET_XACE_OPTION_NAMES}.address_expression_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"address_expression%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- array_optimization
			l_name := {ET_XACE_OPTION_NAMES}.array_optimization_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"array_optimization%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- automatic_backup
			l_name := {ET_XACE_OPTION_NAMES}.automatic_backup_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"automatic_backup%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- check_generic_creation_constraint
			l_name := {ET_XACE_OPTION_NAMES}.check_generic_creation_constraint_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"check_generic_creation_constraint%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- check_vape
			l_name := {ET_XACE_OPTION_NAMES}.check_vape_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"check_vape%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- cls_compliant
			l_name := {ET_XACE_OPTION_NAMES}.cls_compliant_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"cls_compliant%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- console_application
			l_name := {ET_XACE_OPTION_NAMES}.console_application_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"console_application%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- dead_code_removal
			l_name := {ET_XACE_OPTION_NAMES}.dead_code_removal_option_name
			if attached an_option.multivalue (l_name) as l_multivalue and then not l_multivalue.is_empty then
				if l_multivalue.has ({ET_XACE_OPTION_NAMES}.all_option_value) or l_multivalue.has ({ET_XACE_OPTION_NAMES}.feature_option_value) then
					if not default_values_ignored and attached an_option.primary_multivalue (l_name) then
						print_indentation (indent, a_file)
						a_file.put_line ("<setting name=%"dead_code_removal%" value=%"true%"/>")
					end
				else
					print_indentation (indent, a_file)
					a_file.put_line ("<setting name=%"dead_code_removal%" value=%"false%"/>")
				end
			end
				-- dotnet_naming_convention
			l_name := {ET_XACE_OPTION_NAMES}.dotnet_naming_convention_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"dotnet_naming_convention%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- dynamic_runtime
			l_name := {ET_XACE_OPTION_NAMES}.dynamic_runtime_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"dynamic_runtime%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- enforce_unique_class_names
			l_name := {ET_XACE_OPTION_NAMES}.enforce_unique_class_names_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"enforce_unique_class_names%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- exception_trace
			l_name := {ET_XACE_OPTION_NAMES}.exception_trace_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"exception_trace%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- external_runtime
			l_name := {ET_XACE_OPTION_NAMES}.external_runtime_option_name
			if attached an_option.primary_value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"external_runtime%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- force_32bits
			l_name := {ET_XACE_OPTION_NAMES}.force_32bits_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"force_32bits%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- il_verifiable
			l_name := {ET_XACE_OPTION_NAMES}.il_verifiable_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"il_verifiable%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- inlining
			l_name := {ET_XACE_OPTION_NAMES}.inlining_option_name
			if attached an_option.multivalue (l_name) as l_multivalue and then not l_multivalue.is_empty then
				if l_multivalue.has ({ET_XACE_OPTION_NAMES}.array_option_value) or l_multivalue.has ({ET_XACE_OPTION_NAMES}.constant_option_value) or l_multivalue.has ({ET_XACE_OPTION_NAMES}.once_option_value) or l_multivalue.has ({ET_XACE_OPTION_NAMES}.all_option_value) then
					if not default_values_ignored and attached an_option.primary_multivalue (l_name) then
						print_indentation (indent, a_file)
						a_file.put_line ("<setting name=%"inlining%" value=%"true%"/>")
					end
				else
					print_indentation (indent, a_file)
					a_file.put_line ("<setting name=%"inlining%" value=%"false%"/>")
				end
			end
				-- inlining_size
			l_name := {ET_XACE_OPTION_NAMES}.inlining_size_option_name
			l_default := "4"
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"inlining_size%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- line_generation
			l_name := {ET_XACE_OPTION_NAMES}.line_generation_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"line_generation%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- metadata_cache_path
			l_name := {ET_XACE_OPTION_NAMES}.metadata_cache_path_option_name
			if attached an_option.primary_value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"metadata_cache_path%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_classes_per_module
			l_name := {ET_XACE_OPTION_NAMES}.msil_classes_per_module_option_name
			if attached an_option.value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_classes_per_module%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_clr_version
			l_name := {ET_XACE_OPTION_NAMES}.msil_clr_version_option_name
			if attached an_option.primary_value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_clr_version%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_culture
			l_name := {ET_XACE_OPTION_NAMES}.msil_culture_option_name
			if attached an_option.primary_value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_culture%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_generation
			l_name := {ET_XACE_OPTION_NAMES}.msil_generation_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"msil_generation%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- msil_generation_type
			l_name := {ET_XACE_OPTION_NAMES}.target_option_name
			l_default := {ET_XACE_OPTION_NAMES}.exe_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"msil_generation_type%" value=%"")
					if STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.dll_option_value) then
						print_quote_escaped_string ({ET_XACE_OPTION_NAMES}.dll_option_value, a_file)
					else
						print_quote_escaped_string ({ET_XACE_OPTION_NAMES}.exe_option_value, a_file)
					end
					a_file.put_line ("%"/>")
				end
			end
				-- msil_key_file_name
			l_name := {ET_XACE_OPTION_NAMES}.msil_key_file_name_option_name
			if attached an_option.primary_value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_key_file_name%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_use_optimized_precompile
			l_name := {ET_XACE_OPTION_NAMES}.msil_use_optimized_precompile_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"msil_use_optimized_precompile%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- multithreaded
			l_name := {ET_XACE_OPTION_NAMES}.multithreaded_option_name
			if attached an_option.value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"concurrency%" value=%"")
				if STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value) then
					print_quote_escaped_string ("thread", a_file)
				else
					print_quote_escaped_string ({ET_XACE_OPTION_NAMES}.none_option_value, a_file)
				end
				a_file.put_line ("%"/>")
			end
				-- old_verbatim_strings
			l_name := {ET_XACE_OPTION_NAMES}.old_verbatim_strings_option_name
			l_default := {ET_XACE_OPTION_NAMES}.false_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"old_verbatim_strings%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- shared_library_definition
			l_name := {ET_XACE_OPTION_NAMES}.shared_library_definition_option_name
			if attached an_option.primary_value (l_name) as l_value then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"shared_library_definition%" value=%"")
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
			end
				-- use_cluster_name_as_namespace
			l_name := {ET_XACE_OPTION_NAMES}.use_cluster_name_as_namespace_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"use_cluster_name_as_namespace%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
				-- use_all_cluster_name_as_namespace
			l_name := {ET_XACE_OPTION_NAMES}.use_full_cluster_name_as_namespace_option_name
			l_default := {ET_XACE_OPTION_NAMES}.true_option_value
			if attached an_option.value (l_name) as l_value then
				if not STRING_.same_case_insensitive (l_value, l_default) or (not default_values_ignored and attached an_option.primary_value (l_name)) then
					print_indentation (indent, a_file)
					a_file.put_string ("<setting name=%"use_all_cluster_name_as_namespace%" value=%"")
					print_quote_escaped_string (l_value, a_file)
					a_file.put_line ("%"/>")
				end
			end
		end

	print_file_rules (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' ECF file rules found in `an_option' if any.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_includes: detachable DS_HASH_SET [STRING]
			l_excludes: detachable DS_HASH_SET [STRING]
		do
			l_includes := an_option.multivalue ({ET_XACE_OPTION_NAMES}.include_option_name)
			l_excludes := an_option.multivalue ({ET_XACE_OPTION_NAMES}.exclude_option_name)
			if l_includes /= Void and then not l_includes.is_empty or l_excludes /= Void and then not l_excludes.is_empty then
				print_indentation (indent, a_file)
				a_file.put_line ("<file_rule>")
				if l_includes /= Void and then not l_includes.is_empty then
					across l_includes as i_include loop
						print_indentation (indent + 1, a_file)
						a_file.put_string ("<include>/")
						print_escaped_string (i_include, a_file)
						a_file.put_line ("$</include>")
					end
				end
				if l_excludes /= Void and then not l_excludes.is_empty then
					across l_excludes as i_exclude loop
						print_indentation (indent + 1, a_file)
						a_file.put_string ("<exclude>/")
						print_escaped_string (i_exclude, a_file)
						a_file.put_line ("$</exclude>")
					end
				end
				print_indentation (indent, a_file)
				a_file.put_line ("</file_rule>")
			end
		end

	print_external_includes (an_includes: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print include directories `an_includes' to `a_file'.
		require
			an_includes_not_void: an_includes /= Void
			no_void_include: not an_includes.has_void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_cursor: DS_LINKED_LIST_CURSOR [STRING]
			l_pathname: STRING
		do
			l_cursor := an_includes.new_cursor
			from l_cursor.start until l_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("<external_include location=%"")
				l_pathname := l_cursor.item
				if is_windows then
					l_pathname := replace_all_characters (l_pathname, '{', '(')
					l_pathname := replace_all_characters (l_pathname, '}', ')')
				end
				print_quote_escaped_string (l_pathname, a_file)
				a_file.put_line ("%"/>")
				l_cursor.forth
			end
		end

	print_external_c_compiler_options (an_options: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print C compiler options `an_options' to `a_file'.
		require
			an_options_not_void: an_options /= Void
			no_void_option: not an_options.has_void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_cursor: DS_LINKED_LIST_CURSOR [STRING]
			l_value: STRING
		do
			l_cursor := an_options.new_cursor
			from l_cursor.start until l_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("<external_cflags value=%"")
				l_value := l_cursor.item
				if is_windows then
					l_value := replace_all_characters (l_value, '{', '(')
					l_value := replace_all_characters (l_value, '}', ')')
				end
				print_quote_escaped_string (l_value, a_file)
				a_file.put_line ("%"/>")
				l_cursor.forth
			end
		end

	print_external_libraries (a_libraries: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print link libraries `a_link_libraries' to `a_file'.
		require
			a_libraries_not_void: a_libraries /= Void
			no_void_library: not a_libraries.has_void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_cursor: DS_LINKED_LIST_CURSOR [STRING]
			l_pathname: STRING
		do
			l_cursor := a_libraries.new_cursor
			from l_cursor.start until l_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("<external_library location=%"")
				l_pathname := l_cursor.item
				if is_windows then
					l_pathname := replace_all_characters (l_pathname, '{', '(')
					l_pathname := replace_all_characters (l_pathname, '}', ')')
				end
				print_quote_escaped_string (l_pathname, a_file)
				a_file.put_line ("%"/>")
				l_cursor.forth
			end
		end

	print_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_clusters' to `a_file'.
		require
			a_clusters_not_void: a_clusters /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
			a_cluster: ET_XACE_CLUSTER
		do
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				a_cluster := cluster_list.item (i)
				if not a_cluster.is_implicit and not a_cluster.is_override then
						-- This cluster has been explicitly declared.
					print_cluster (a_cluster, indent, a_file)
				end
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_parent: detachable ET_XACE_CLUSTER
			an_option: detachable ET_XACE_OPTIONS
			subclusters: detachable ET_XACE_CLUSTERS
			a_class_options: detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
		do
			if not a_cluster.is_fully_ecf_abstract then
				print_indentation (indent, a_file)
				a_file.put_string ("<cluster name=%"")
				print_quote_escaped_string (a_cluster.prefixed_name, a_file)
				a_file.put_string ("%" location=%"")
				a_parent := a_cluster.parent
				if a_parent /= Void then
					if a_cluster.is_relative then
						a_file.put_string ("$|")
						if attached a_cluster.pathname as l_cluster_pathname then
							print_quote_escaped_string (l_cluster_pathname, a_file)
						else
							print_quote_escaped_string (a_cluster.name, a_file)
						end
					else
						print_quote_escaped_string (a_cluster.full_pathname, a_file)
					end
				else
					print_quote_escaped_string (a_cluster.full_pathname, a_file)
				end
				a_file.put_character ('%"')
				if a_cluster.is_recursive then
					a_file.put_string (" recursive=%"true%"")
				end
				if a_cluster.is_read_only then
					a_file.put_string (" readonly=%"true%"")
				end
				an_option := a_cluster.options
				if an_option = Void then
					create an_option.make
				end
				a_class_options := a_cluster.class_options
				subclusters := a_cluster.subclusters
				if an_option = Void and a_class_options = Void and subclusters = Void then
					a_file.put_line ("/>")
				else
					if an_option /= Void and then attached an_option.value ({ET_XACE_OPTION_NAMES}.prefix_option_name) as l_prefix then
						a_file.put_string (" prefix=%"")
						print_quote_escaped_string (l_prefix, a_file)
						a_file.put_character ('%"')
					end
					a_file.put_line (">")
					if an_option /= Void then
						print_file_rules (an_option, indent + 1, a_file)
						print_options (an_option, Void, indent + 1, a_file)
					end
					if a_class_options /= Void then
						a_class_options.do_all (agent print_class_options (?, indent + 1, a_file))
						a_class_options.do_all (agent print_class_visible (?, indent + 1, a_file))
					end
					if subclusters /= Void then
						print_clusters (subclusters, indent + 1, a_file)
					end
					print_indentation (indent, a_file)
					a_file.put_line ("</cluster>")
				end
			end
		end

	print_ecf_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' the ECF libraries of which `a_clusters' or
			-- recursively their subclusters are the root clusters and which
			-- are otherwise described in other ECF files.
		require
			a_clusters_not_void: a_clusters /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_ecf_clusters: DS_LINKED_LIST [ET_XACE_CLUSTER]
			l_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER]
			l_cluster: ET_XACE_CLUSTER
			l_option: detachable ET_XACE_OPTIONS
		do
			create l_ecf_clusters.make
			a_clusters.merge_ecf_clusters (l_ecf_clusters)
			l_cursor := l_ecf_clusters.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_cluster := l_cursor.item
				l_option := l_cluster.options
				if l_option /= Void and then attached l_option.value ({ET_XACE_OPTION_NAMES}.ecf_library_option_name) as l_ecf_library then
					print_indentation (indent, a_file)
					a_file.put_string ("<library name=%"")
					print_quote_escaped_string (l_cluster.name, a_file)
					a_file.put_string ("%" location=%"")
					print_quote_escaped_string (l_ecf_library, a_file)
					a_file.put_character ('%"')
					if l_cluster.is_read_only then
						a_file.put_string (" readonly=%"true%"")
					else
						a_file.put_string (" readonly=%"false%"")
					end
					if attached l_option.value ({ET_XACE_OPTION_NAMES}.prefix_option_name) as l_prefix then
						a_file.put_string (" prefix=%"")
						print_quote_escaped_string (l_prefix, a_file)
						a_file.put_character ('%"')
					end
					a_file.put_line ("/>")
				end
				l_cursor.forth
			end
		end

	print_override_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' the override clusters and their subclusters
			-- found in `a_clusters'.
		require
			a_clusters_not_void: a_clusters /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_override_clusters: DS_LINKED_LIST [ET_XACE_CLUSTER]
			l_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_CLUSTER]
			l_cluster: ET_XACE_CLUSTER
		do
			create l_override_clusters.make
			a_clusters.merge_override_clusters (l_override_clusters)
			l_cursor := l_override_clusters.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_cluster := l_cursor.item
				if l_cluster.is_override then
					print_override_cluster (l_cluster, indent, a_file)
				end
				l_cursor.forth
			end
		end

	print_override_cluster (a_cluster: ET_XACE_CLUSTER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print override cluster `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_parent: detachable ET_XACE_CLUSTER
			an_option: detachable ET_XACE_OPTIONS
			subclusters: detachable ET_XACE_CLUSTERS
			a_class_options: detachable DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
		do
			if not a_cluster.is_fully_abstract then
				print_indentation (indent, a_file)
				a_file.put_string ("<override name=%"")
				print_quote_escaped_string (a_cluster.prefixed_name, a_file)
				a_file.put_string ("%" location=%"")
				a_parent := a_cluster.parent
				if a_parent /= Void then
					if a_cluster.is_relative then
						a_file.put_string ("$|")
						if attached a_cluster.pathname as l_cluster_pathname then
							print_quote_escaped_string (l_cluster_pathname, a_file)
						else
							print_quote_escaped_string (a_cluster.name, a_file)
						end
					else
						print_quote_escaped_string (a_cluster.full_pathname, a_file)
					end
				else
					print_quote_escaped_string (a_cluster.full_pathname, a_file)
				end
				a_file.put_character ('%"')
				if a_cluster.is_recursive then
					a_file.put_string (" recursive=%"true%"")
				end
				if a_cluster.is_read_only then
					a_file.put_string (" readonly=%"true%"")
				end
				an_option := a_cluster.options
				if an_option = Void then
					create an_option.make
				end
				a_class_options := a_cluster.class_options
				subclusters := a_cluster.subclusters
				if an_option = Void and a_class_options = Void and subclusters = Void then
					a_file.put_line ("/>")
				else
					if an_option /= Void and then attached an_option.value ({ET_XACE_OPTION_NAMES}.prefix_option_name) as l_prefix then
						a_file.put_string (" prefix=%"")
						print_quote_escaped_string (l_prefix, a_file)
						a_file.put_character ('%"')
					end
					a_file.put_line (">")
					if an_option /= Void then
						print_file_rules (an_option, indent + 1, a_file)
						print_options (an_option, Void, indent + 1, a_file)
					end
					if a_class_options /= Void then
						a_class_options.do_all (agent print_class_options (?, indent + 1, a_file))
						a_class_options.do_all (agent print_class_visible (?, indent + 1, a_file))
					end
					if subclusters /= Void then
						print_override_clusters (subclusters, indent + 1, a_file)
					end
					print_indentation (indent, a_file)
					a_file.put_line ("</override>")
				end
			end
		end

	print_assemblies (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' the assembly clause for
			-- `a_clusters' and recursively their subclusters.
		require
			a_clusters_not_void: a_clusters /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			an_assemblies: DS_LINKED_LIST [ET_XACE_ASSEMBLY]
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_ASSEMBLY]
			an_assembly: ET_XACE_ASSEMBLY
			a_pathname: detachable STRING
			a_prefix: detachable STRING
		do
			create an_assemblies.make
			a_clusters.merge_assemblies (an_assemblies)
			a_cursor := an_assemblies.new_cursor
			from a_cursor.start until a_cursor.after loop
				an_assembly := a_cursor.item
				print_indentation (indent, a_file)
				a_file.put_string ("<assembly name=%"")
				print_escaped_name (an_assembly.tag, a_file)
				a_file.put_string ("%" location=%"")
				a_pathname := an_assembly.assembly_pathname
				if a_pathname /= Void and then not a_pathname.is_empty then
					print_quote_escaped_string (a_pathname, a_file)
					a_file.put_character ('%"')
				else
					a_file.put_string ("none%"")
					a_file.put_string (" assembly_name=%"")
					print_quote_escaped_string (an_assembly.assembly_name, a_file)
					a_file.put_character ('%"')
					a_file.put_string (" assembly_version=%"")
					print_quote_escaped_string (an_assembly.version, a_file)
					a_file.put_character ('%"')
					a_file.put_string (" assembly_culture=%"")
					print_quote_escaped_string (an_assembly.culture, a_file)
					a_file.put_character ('%"')
					a_file.put_string (" assembly_key=%"")
					print_quote_escaped_string (an_assembly.public_key_token, a_file)
					a_file.put_character ('%"')
				end
				a_prefix := an_assembly.class_prefix
				if a_prefix /= Void then
					a_file.put_string (" prefix=%"")
					print_quote_escaped_string (a_prefix, a_file)
					a_file.put_character ('%"')
				end
				a_file.put_line ("/>")
				a_cursor.forth
			end
		end

	print_class_options (a_class_option: ET_XACE_CLASS_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print ECF options found in `a_class_option' to `a_file'.
		require
			a_class_option_not_void: a_class_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			print_options (a_class_option.options, a_class_option.class_name, indent, a_file)
		end

	print_class_visible (a_class_option: ET_XACE_CLASS_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' visible clause corresponding to the class
			-- represented by `a_class_option', and of its features.
		require
			a_class_option_not_void: a_class_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_feature_options: detachable DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS]
			l_class_name: STRING
		do
			l_class_name := a_class_option.class_name
			if attached a_class_option.options.value ({ET_XACE_OPTION_NAMES}.export_option_name) as l_external_name then
				print_indentation (indent, a_file)
				a_file.put_string ("<visible class=%"")
				print_quote_escaped_string (l_class_name, a_file)
				if not STRING_.same_string (l_external_name, l_class_name) then
					a_file.put_string ("%" class_rename=%"")
					print_quote_escaped_string (l_external_name, a_file)
				end
				a_file.put_line ("%"/>")
			end
			l_feature_options := a_class_option.feature_options
			if l_feature_options /= Void then
				l_feature_options.do_all (agent print_feature_visible (l_class_name, ?, indent, a_file))
			end
		end

	print_feature_visible (a_class_name: STRING; a_feature_option: ET_XACE_FEATURE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print to `a_file' visible clause corresponding to the feature
			-- represented by `a_feature_option' in class `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
			a_class_name_not_empty: not a_class_name.is_empty
			a_feature_option_not_void: a_feature_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_feature_name: STRING
		do
			if attached a_feature_option.options.value ({ET_XACE_OPTION_NAMES}.export_option_name) as l_external_name then
				print_indentation (indent, a_file)
				a_file.put_string ("<visible class=%"")
				print_quote_escaped_string (a_class_name, a_file)
				a_file.put_string ("%" feature=%"")
				l_feature_name := a_feature_option.feature_name
				print_quote_escaped_string (l_feature_name, a_file)
				if not STRING_.same_string (l_external_name, l_feature_name) then
					a_file.put_string ("%" feature_rename=%"")
					print_quote_escaped_string (l_external_name, a_file)
				end
				a_file.put_line ("%"/>")
			end
		end

	print_mounted_libraries (a_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print `a_mounted_libraries' to `a_file'.
		require
			a_mounted_libraries_not_void: a_mounted_libraries /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			library_list: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
			a_library: ET_XACE_MOUNTED_LIBRARY
			a_pathname: STRING
			a_dirname: STRING
			a_name: STRING
		do
			library_list := a_mounted_libraries.libraries
			nb := a_mounted_libraries.count
			from i := 1 until i > nb loop
				a_library := library_list.item (i)
				a_pathname := STRING_.cloned_string (a_library.pathname)
				a_pathname.remove_tail (unix_file_system.extension (a_pathname).count)
				a_dirname := Execution_environment.interpreted_string (a_pathname)
				a_name := a_library.library.name
				if a_name.starts_with ("name_") then
					a_name := unix_file_system.basename (a_dirname)
					if a_name.same_string ("library") then
						a_dirname := unix_file_system.dirname (a_dirname)
						a_name := unix_file_system.basename (a_dirname)
						if a_name.is_empty then
							a_name := a_library.library.name
						end
					end
				end
				print_indentation (indent, a_file)
				a_file.put_string ("<library name=%"")
				print_quote_escaped_string (a_name, a_file)
				a_file.put_string ("%" location=%"")
				print_quote_escaped_string (a_pathname + ".ecf", a_file)
				a_file.put_line ("%"/>")
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

	print_ecf_namespaces (a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print_ECF namespaces to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("xmlns=%"http://www.eiffel.com/developers/xml/configuration-1-15-0%" ")
			a_file.put_string ("xmlns:xsi=%"http://www.w3.org/2001/XMLSchema-instance%" ")
			a_file.put_string ("xsi:schemaLocation=%"http://www.eiffel.com/developers/xml/configuration-1-15-0 ")
			a_file.put_string ("http://www.eiffel.com/developers/xml/configuration-1-15-0.xsd%"")
		end

feature {NONE} -- Escaped

	is_escaped (a_char: INTEGER): BOOLEAN
			-- Is this an escapable character?
		do
			Result := a_char = Lt_char.code
				or a_char = Gt_char.code
				or a_char = Amp_char.code
		end

end
