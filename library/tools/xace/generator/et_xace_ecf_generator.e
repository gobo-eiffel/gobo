indexing

	description:

		"ECF file generators from Xace files"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ECF_GENERATOR

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

	default_system_output_filename: STRING is
			-- Name of generated ECF file
		once
			Result := compiler + ".ecf"
		end

	default_library_output_filename: STRING is
			-- Name of generated library ECF file
		once
			Result := compiler + ".ecf"
		end

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new ECF file from `a_system'.
		do
			print_ecf_system_file (a_system, a_file)
		end

	generate_library (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Generate a new ECF file from `a_library'.
		do
			print_ecf_library_file (a_library, a_file)
		end

feature {NONE} -- Output

	print_ecf_system_file (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ECF version of `a_system' to `a_file'.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: a_system.system_name /= Void
			system_name_not_empty: a_system.system_name.count > 0
			root_class_name_not_void: a_system.root_class_name /= Void
			root_class_name_not_empty: a_system.root_class_name.count > 0
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
			creation_procedure_name_not_empty: a_system.creation_procedure_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_clusters: ET_XACE_CLUSTERS
			l_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES
			l_option: ET_XACE_OPTIONS
			l_external: ET_XACE_EXTERNALS
		do
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			a_file.put_string ("<system ")
			print_ecf_namespaces (a_file)
			a_file.put_string (" name=%"")
			print_quote_escaped_string (a_system.system_name, a_file)
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<target name=%"")
			print_quote_escaped_string (a_system.system_name, a_file)
			a_file.put_line ("%">")
			print_indentation (2, a_file)
			a_file.put_string ("<root class=%"")
			print_quote_escaped_string (a_system.root_class_name, a_file)
			a_file.put_string ("%" feature=%"")
			print_quote_escaped_string (a_system.creation_procedure_name, a_file)
			a_file.put_line ("%"/>")
				-- Options and settings.
			l_option := a_system.options
			if l_option /= Void then
					-- Default options for systems.
				if not l_option.is_warning_declared then
					l_option.set_warning (options.default_value)
				end
				if not l_option.is_trace_declared then
					l_option.set_trace (False)
				end
				if not l_option.is_profile_declared then
					l_option.set_profile (False)
				end
				if not l_option.is_debug_option_declared then
					l_option.set_debug_option (False)
				end
				print_options (l_option, 2, a_file)
				print_settings (l_option, 2, a_file)
			end
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
			l_mounted_libraries := a_system.libraries
			if l_mounted_libraries /= Void then
				print_mounted_libraries (l_mounted_libraries, 2, a_file)
			end
			l_clusters := a_system.clusters
			if l_clusters /= Void then
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

	print_ecf_library_file (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ECF version of `a_library' to `a_file'.
		require
			a_library_not_void: a_library /= Void
			a_library_name_not_void: a_library.name /= Void
			a_library_name_not_empty: a_library.name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_clusters: ET_XACE_CLUSTERS
			l_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES
			l_option: ET_XACE_OPTIONS
			l_external: ET_XACE_EXTERNALS
		do
			a_file.put_line ("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>")
			a_file.put_string ("<system ")
			print_ecf_namespaces (a_file)
			a_file.put_string (" name=%"")
			print_quote_escaped_string (a_library.name, a_file)
			a_file.put_string ("%" library_target=%"")
			a_file.put_line ("%">")
			print_indentation (1, a_file)
			a_file.put_string ("<target name=%"")
			print_quote_escaped_string (a_library.name, a_file)
			a_file.put_line ("%">")
			print_indentation (2, a_file)
			a_file.put_string ("<root all_classes=%"true%"/>")
				-- Options and settings.
			l_option := a_library.options
			if l_option /= Void then
				print_options (l_option, 2, a_file)
				print_settings (l_option, 2, a_file)
			end
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
			l_mounted_libraries := a_library.libraries
			if l_mounted_libraries /= Void then
				print_mounted_libraries (l_mounted_libraries, 2, a_file)
			end
			l_clusters := a_library.clusters
			if l_clusters /= Void then
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

	print_options (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ECF options found in `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_option_attribute_printed: BOOLEAN
			l_option_element_printed: BOOLEAN
			l_cursor: DS_HASH_SET_CURSOR [STRING]
			l_assertions: DS_HASH_SET [STRING]
			a_class_name: STRING
		do
				-- trace
			if an_option.is_trace_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					if a_class_name /= Void and then not a_class_name.is_empty then
						a_file.put_string ("<class_option class=%"")
						print_quote_escaped_string (a_class_name, a_file)
						a_file.put_character ('%"')
					else
						a_file.put_string ("<option")
					end
					l_option_attribute_printed := True
				end
				if an_option.trace then
					a_file.put_string (" trace=%"true%"")
				else
					a_file.put_string (" trace=%"false%"")
				end
			end
				-- profile
			if an_option.is_profile_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<option")
					l_option_attribute_printed := True
				end
				if an_option.profile then
					a_file.put_string (" profile=%"true%"")
				else
					a_file.put_string (" profile=%"false%"")
				end
			end
				-- optimize
-- TODO: Not supported yet.
				-- debug
			if an_option.is_debug_option_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<option")
					l_option_attribute_printed := True
				end
				if an_option.debug_option then
					a_file.put_string (" debug=%"true%"")
				else
					a_file.put_string (" debug=%"false%"")
				end
			end
				-- warning
			if an_option.is_warning_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<option")
					l_option_attribute_printed := True
				end
				if an_option.warning.same_string (options.none_value) then
					a_file.put_string (" warning=%"false%"")
				else
					a_file.put_string (" warning=%"true%"")
				end
			end
				-- namespace
			if an_option.is_namespace_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<option")
					l_option_attribute_printed := True
				end
				a_file.put_string (" namespace=%"")
				print_quote_escaped_string (an_option.declared_namespace, a_file)
				a_file.put_character ('%"')
			end
				-- msil_application_optimize
-- TODO: Not supported yet.
				-- full_class_checking
			if an_option.is_full_class_checking_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<option")
					l_option_attribute_printed := True
				end
				if an_option.full_class_checking then
					a_file.put_string (" full_class_checking=%"true%"")
				else
					a_file.put_string (" full_class_checking=%"false%"")
				end
			end
				-- is_attached_by_default
-- TODO: Not supported yet.
				-- is_void_safe
-- TODO: Not supported yet.
				-- debug
			if an_option.is_debug_tag_declared then
				l_cursor := an_option.debug_tag.new_cursor
				from l_cursor.start until l_cursor.after loop
					if not l_option_element_printed then
						if not l_option_attribute_printed then
							print_indentation (indent, a_file)
							a_file.put_line ("<option>")
						else
							a_file.put_line (">")
						end
						l_option_element_printed := True
					end
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<debug name=%"")
					print_quote_escaped_string (l_cursor.item, a_file)
					a_file.put_line ("%" enabled=%"true%"/>")
					l_cursor.forth
				end
			end
				-- assertions
			if an_option.is_assertion_declared then
				l_assertions := an_option.declared_assertion
				if not l_option_element_printed then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						a_file.put_line ("<option>")
					else
						a_file.put_line (">")
					end
					l_option_element_printed := True
				end
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<assertions")
					-- precondition
				if l_assertions.has (options.require_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" precondition=%"true%"")
				else
					a_file.put_string (" precondition=%"false%"")
				end
					-- supplier_precondition
				if l_assertions.has (options.supplier_precondition_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" supplier_precondition=%"true%"")
				end
					-- postcondition
				if l_assertions.has (options.ensure_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" postcondition=%"true%"")
				else
					a_file.put_string (" postcondition=%"false%"")
				end
					-- check
				if l_assertions.has (options.check_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" check=%"true%"")
				else
					a_file.put_string (" check=%"false%"")
				end
					-- invariant
				if l_assertions.has (options.invariant_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" invariant=%"true%"")
				else
					a_file.put_string (" invariant=%"false%"")
				end
					-- loop
				if l_assertions.has (options.loop_variant_value) or l_assertions.has (options.loop_invariant_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" loop=%"true%"")
				else
					a_file.put_string (" loop=%"false%"")
				end
				a_file.put_line ("/>")
			end
				-- warning
-- TODO: Not supported yet.
			if l_option_element_printed then
				print_indentation (indent, a_file)
				a_file.put_line ("</option>")
			elseif l_option_attribute_printed then
				a_file.put_line ("/>")
			end
		end

	print_settings (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ECF settings found in `an_option' to `a_file'.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_dead_code_removal: DS_HASH_SET [STRING]
			l_inlining: DS_HASH_SET [STRING]
			l_target: STRING
		do
				-- address_expression
			if an_option.is_address_expression_declared then
				print_indentation (indent, a_file)
				if an_option.address_expression then
					a_file.put_line ("<setting name=%"address_expression%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"address_expression%" value=%"false%"/>")
				end
			end
				-- array_optimisation
			if an_option.is_array_optimization_declared then
				print_indentation (indent, a_file)
				if an_option.array_optimization then
					a_file.put_line ("<setting name=%"array_optimization%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"array_optimization%" value=%"false%"/>")
				end
			end
				-- automatic_backup
			if an_option.is_automatic_backup_declared then
				print_indentation (indent, a_file)
				if an_option.automatic_backup then
					a_file.put_line ("<setting name=%"automatic_backup%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"automatic_backup%" value=%"false%"/>")
				end
			end
				-- check_generic_creation_constraint
			if an_option.is_check_generic_creation_constraint_declared then
				print_indentation (indent, a_file)
				if an_option.check_generic_creation_constraint then
					a_file.put_line ("<setting name=%"check_generic_creation_constraint%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"check_generic_creation_constraint%" value=%"false%"/>")
				end
			end
				-- check_vape
			if an_option.is_check_vape_declared then
				print_indentation (indent, a_file)
				if an_option.check_vape then
					a_file.put_line ("<setting name=%"check_vape%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"check_vape%" value=%"false%"/>")
				end
			end
				-- cls_compliant
			if an_option.is_cls_compliant_declared then
				print_indentation (indent, a_file)
				if an_option.cls_compliant then
					a_file.put_line ("<setting name=%"cls_compliant%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"cls_compliant%" value=%"false%"/>")
				end
			end
				-- console_application
				-- Note that contrary to Xace, the default value of 'console_application'
				-- in ECF is false.
			print_indentation (indent, a_file)
			if an_option.console_application then
				a_file.put_line ("<setting name=%"console_application%" value=%"true%"/>")
			else
				a_file.put_line ("<setting name=%"console_application%" value=%"false%"/>")
			end
				-- dead_code_removal
			if an_option.is_dead_code_removal_declared then
				print_indentation (indent, a_file)
				l_dead_code_removal := an_option.dead_code_removal
				if l_dead_code_removal.has (options.all_value) then
					a_file.put_line ("<setting name=%"dead_code_removal%" value=%"true%"/>")
				elseif l_dead_code_removal.has (options.feature_value) then
					a_file.put_line ("<setting name=%"dead_code_removal%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"dead_code_removal%" value=%"false%"/>")
				end
			end
				-- dotnet_naming_convention
			if an_option.is_dotnet_naming_convention_declared then
				print_indentation (indent, a_file)
				if an_option.dotnet_naming_convention then
					a_file.put_line ("<setting name=%"dotnet_naming_convention%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"dotnet_naming_convention%" value=%"false%"/>")
				end
			end
				-- dynamic_runtime
			if an_option.is_dynamic_runtime_declared then
				print_indentation (indent, a_file)
				if an_option.dynamic_runtime then
					a_file.put_line ("<setting name=%"dynamic_runtime%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"dynamic_runtime%" value=%"false%"/>")
				end
			end
				-- enforce_unique_class_names
			if an_option.is_enforce_unique_class_names_declared then
				print_indentation (indent, a_file)
				if an_option.enforce_unique_class_names then
					a_file.put_line ("<setting name=%"enforce_unique_class_names%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"enforce_unique_class_names%" value=%"false%"/>")
				end
			end
				-- exception_trace
			if an_option.is_exception_trace_declared then
				print_indentation (indent, a_file)
				if an_option.exception_trace then
					a_file.put_line ("<setting name=%"exception_trace%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"exception_trace%" value=%"false%"/>")
				end
			end
				-- external_runtime
			if an_option.is_external_runtime_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"external_runtime%" value=%"")
				print_quote_escaped_string (an_option.declared_external_runtime, a_file)
				a_file.put_line ("%"/>")
			end
				-- force_32bits
			if an_option.is_force_32bits_declared then
				print_indentation (indent, a_file)
				if an_option.force_32bits then
					a_file.put_line ("<setting name=%"force_32bits%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"force_32bits%" value=%"false%"/>")
				end
			end
				-- il_verifiable
			if an_option.is_il_verifiable_declared then
				print_indentation (indent, a_file)
				if an_option.il_verifiable then
					a_file.put_line ("<setting name=%"il_verifiable%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"il_verifiable%" value=%"false%"/>")
				end
			end
				-- inlining
			if an_option.is_inlining_declared then
				print_indentation (indent, a_file)
				l_inlining := an_option.inlining
				if l_inlining.has (options.all_value) then
					a_file.put_line ("<setting name=%"inlining%" value=%"true%"/>")
				elseif l_inlining.has (options.array_value) then
					a_file.put_line ("<setting name=%"inlining%" value=%"true%"/>")
				elseif l_inlining.has (options.constant_value) then
					a_file.put_line ("<setting name=%"inlining%" value=%"true%"/>")
				elseif l_inlining.has (options.once_value) then
					a_file.put_line ("<setting name=%"inlining%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"inlining%" value=%"false%"/>")
				end
			end
				-- inlining_size
			if an_option.is_inlining_size_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"inlining_size%" value=%"")
				a_file.put_integer (an_option.inlining_size)
				a_file.put_line ("%"/>")
			end
				-- line_generation
			if an_option.is_line_generation_declared then
				print_indentation (indent, a_file)
				if an_option.line_generation then
					a_file.put_line ("<setting name=%"line_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"line_generation%" value=%"false%"/>")
				end
			end
				-- metadata_cache_path
			if an_option.is_metadata_cache_path_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"metadata_cache_path%" value=%"")
				print_quote_escaped_string (an_option.declared_metadata_cache_path, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_assembly_compatibility
			if an_option.is_msil_assembly_compatibility_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_assembly_compatibility%" value=%"")
				print_quote_escaped_string (an_option.declared_msil_assembly_compatibility, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_classes_per_module
			if an_option.is_msil_classes_per_module_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_classes_per_module%" value=%"")
				a_file.put_integer (an_option.msil_classes_per_module)
				a_file.put_line ("%"/>")
			end
				-- msil_clr_version
			if an_option.is_msil_clr_version_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_clr_version%" value=%"")
				print_quote_escaped_string (an_option.declared_msil_clr_version, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_culture
			if an_option.is_msil_culture_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_culture%" value=%"")
				print_quote_escaped_string (an_option.declared_msil_culture, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_generation
			if an_option.is_msil_generation_declared then
				print_indentation (indent, a_file)
				if an_option.msil_generation then
					a_file.put_line ("<setting name=%"msil_generation%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"msil_generation%" value=%"false%"/>")
				end
			end
				-- msil_generation_type
			if an_option.is_target_declared then
				print_indentation (indent, a_file)
				l_target := an_option.target
				if STRING_.same_string (l_target, options.dll_value) then
					a_file.put_line ("<setting name=%"msil_generation_type%" value=%"dll%"/>")
				else
					a_file.put_line ("<setting name=%"msil_generation_type%" value=%"exe%"/>")
				end
			end
				-- msil_key_file_name
			if an_option.is_msil_key_file_name_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"msil_key_file_name%" value=%"")
				print_quote_escaped_string (an_option.declared_msil_key_file_name, a_file)
				a_file.put_line ("%"/>")
			end
				-- msil_use_optimized_precompile
			if an_option.is_msil_use_optimized_precompile_declared then
				print_indentation (indent, a_file)
				if an_option.msil_use_optimized_precompile then
					a_file.put_line ("<setting name=%"msil_use_optimized_precompile%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"msil_use_optimized_precompile%" value=%"false%"/>")
				end
			end
				-- multithreaded
			if an_option.is_multithreaded_declared then
				print_indentation (indent, a_file)
				if an_option.multithreaded then
					a_file.put_line ("<setting name=%"multithreaded%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"multithreaded%" value=%"false%"/>")
				end
			end
				-- old_verbatim_strings
			if an_option.is_old_verbatim_strings_declared then
				print_indentation (indent, a_file)
				if an_option.old_verbatim_strings then
					a_file.put_line ("<setting name=%"old_verbatim_strings%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"old_verbatim_strings%" value=%"false%"/>")
				end
			end
				-- shared_library_definition
			if an_option.is_shared_library_definition_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<setting name=%"shared_library_definition%" value=%"")
				print_quote_escaped_string (an_option.declared_shared_library_definition, a_file)
				a_file.put_line ("%"/>")
			end
				-- use_cluster_name_as_namespace
			if an_option.is_use_cluster_name_as_namespace_declared then
				print_indentation (indent, a_file)
				if an_option.use_cluster_name_as_namespace then
					a_file.put_line ("<setting name=%"use_cluster_name_as_namespace%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"use_cluster_name_as_namespace%" value=%"false%"/>")
				end
			end
				-- use_all_cluster_name_as_namespace
			if an_option.is_use_full_cluster_name_as_namespace_declared then
				print_indentation (indent, a_file)
				if an_option.use_full_cluster_name_as_namespace then
					a_file.put_line ("<setting name=%"use_all_cluster_name_as_namespace%" value=%"true%"/>")
				else
					a_file.put_line ("<setting name=%"use_all_cluster_name_as_namespace%" value=%"false%"/>")
				end
			end
		end

	print_file_rules (an_option: ET_XACE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' ECF file rules found in `an_option' if any.
		require
			an_option_not_void: an_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_cursor: DS_HASH_SET_CURSOR [STRING]
		do
			if an_option.is_include_declared or an_option.is_exclude_declared then
				print_indentation (indent, a_file)
				a_file.put_line ("<file_rule>")
				l_cursor := an_option.include.new_cursor
				from l_cursor.start until l_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<include>/")
					print_escaped_string (l_cursor.item, a_file)
					a_file.put_line ("$</include>")
					l_cursor.forth
				end
				l_cursor := an_option.exclude.new_cursor
				from l_cursor.start until l_cursor.after loop
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<exclude>/")
					print_escaped_string (l_cursor.item, a_file)
					a_file.put_line ("$</exclude>")
					l_cursor.forth
				end
				print_indentation (indent, a_file)
				a_file.put_line ("</file_rule>")
			end
		end

	print_external_includes (an_includes: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print include directories `an_includes' to `a_file'.
		require
			an_includes_not_void: an_includes /= Void
			no_void_include: not an_includes.has (Void)
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

	print_external_c_compiler_options (an_options: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print C compiler options `an_options' to `a_file'.
		require
			an_options_not_void: an_options /= Void
			no_void_option: not an_options.has (Void)
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_cursor: DS_LINKED_LIST_CURSOR [STRING]
			l_pathname: STRING
		do
			l_cursor := an_options.new_cursor
			from l_cursor.start until l_cursor.after loop
				print_indentation (indent, a_file)
				a_file.put_string ("<external_include location=%"some123/fake432/path567 ")
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

	print_external_libraries (a_libraries: DS_LINKED_LIST [STRING]; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print link libraries `a_link_libraries' to `a_file'.
		require
			a_libraries_not_void: a_libraries /= Void
			no_void_library: not a_libraries.has (Void)
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

	print_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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
				if not a_cluster.is_implicit then
						-- This cluster has been explicitly declared.
					print_cluster (a_cluster, indent, a_file)
				end
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_parent: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			subclusters: ET_XACE_CLUSTERS
			a_class_options: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
		do
			if (not is_shallow or else not a_cluster.is_mounted) and then not a_cluster.is_fully_ecf_abstract then
				print_indentation (indent, a_file)
				a_file.put_string ("<cluster name=%"")
				print_quote_escaped_string (a_cluster.prefixed_name, a_file)
				a_file.put_string ("%" location=%"")
				a_parent := a_cluster.parent
				if a_parent /= Void then
					if a_cluster.is_relative then
						a_file.put_string ("$|")
						if a_cluster.pathname /= Void then
							print_quote_escaped_string (a_cluster.pathname, a_file)
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
				a_class_options := a_cluster.class_options
				subclusters := a_cluster.subclusters
				if an_option = Void and a_class_options = Void and subclusters = Void then
					a_file.put_line ("/>")
				else
					if an_option /= Void and then an_option.is_prefix_option_declared then
						a_file.put_string (" prefix=%"")
						print_quote_escaped_string (an_option.declared_prefix_option, a_file)
						a_file.put_character ('%"')
					end
					a_file.put_line (">")
					if an_option /= Void then
						print_file_rules (an_option, indent + 1, a_file)
						print_options (an_option, indent + 1, a_file)
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

	print_ecf_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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
			l_option: ET_XACE_OPTIONS
		do
			create l_ecf_clusters.make
			a_clusters.merge_ecf_clusters (l_ecf_clusters)
			l_cursor := l_ecf_clusters.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_cluster := l_cursor.item
				l_option := l_cluster.options
				if l_option /= Void and then l_option.is_ecf_library_declared then
					print_indentation (indent, a_file)
					a_file.put_string ("<library name=%"")
					print_quote_escaped_string (l_cluster.name, a_file)
					a_file.put_string ("%" location=%"")
					print_quote_escaped_string (l_option.declared_ecf_library, a_file)
					a_file.put_character ('%"')
					if l_cluster.is_read_only then
						a_file.put_string (" readonly=%"true%"")
					end
					if l_option.is_prefix_option_declared then
						a_file.put_string (" prefix=%"")
						print_quote_escaped_string (l_option.declared_prefix_option, a_file)
						a_file.put_character ('%"')
					end
					a_file.put_line ("/>")
				end
				l_cursor.forth
			end
		end

	print_override_clusters (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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

	print_override_cluster (a_cluster: ET_XACE_CLUSTER; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print override cluster `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_parent: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			subclusters: ET_XACE_CLUSTERS
			a_class_options: DS_LINKED_LIST [ET_XACE_CLASS_OPTIONS]
		do
			if (not is_shallow or else not a_cluster.is_mounted) and then not a_cluster.is_fully_abstract then
				print_indentation (indent, a_file)
				a_file.put_string ("<override name=%"")
				print_quote_escaped_string (a_cluster.prefixed_name, a_file)
				a_file.put_string ("%" location=%"")
				a_parent := a_cluster.parent
				if a_parent /= Void then
					if a_cluster.is_relative then
						a_file.put_string ("$|")
						if a_cluster.pathname /= Void then
							print_quote_escaped_string (a_cluster.pathname, a_file)
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
				a_class_options := a_cluster.class_options
				subclusters := a_cluster.subclusters
				if an_option = Void and a_class_options = Void and subclusters = Void then
					a_file.put_line ("/>")
				else
					if an_option /= Void and then an_option.is_prefix_option_declared then
						a_file.put_string (" prefix=%"")
						print_quote_escaped_string (an_option.declared_prefix_option, a_file)
						a_file.put_character ('%"')
					end
					a_file.put_line (">")
					if an_option /= Void then
						print_file_rules (an_option, indent + 1, a_file)
						print_options (an_option, indent + 1, a_file)
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

	print_assemblies (a_clusters: ET_XACE_CLUSTERS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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
			a_pathname: STRING
			a_prefix: STRING
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

	print_class_options (a_class_option: ET_XACE_CLASS_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print ECF options found in `a_class_option' to `a_file'.
		require
			a_class_option_not_void: a_class_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_option_attribute_printed: BOOLEAN
			l_option_element_printed: BOOLEAN
			l_cursor: DS_HASH_SET_CURSOR [STRING]
			l_assertions: DS_HASH_SET [STRING]
			l_class_name: STRING
			l_option: ET_XACE_OPTIONS
		do
			l_class_name := a_class_option.class_name
			l_option := a_class_option.options
				-- trace
			if l_option.is_trace_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<class_option class=%"")
					print_quote_escaped_string (l_class_name, a_file)
					a_file.put_character ('%"')
					l_option_attribute_printed := True
				end
				if l_option.trace then
					a_file.put_string (" trace=%"true%"")
				else
					a_file.put_string (" trace=%"false%"")
				end
			end
				-- profile
			if l_option.is_profile_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<class_option class=%"")
					print_quote_escaped_string (l_class_name, a_file)
					a_file.put_character ('%"')
					l_option_attribute_printed := True
				end
				if l_option.profile then
					a_file.put_string (" profile=%"true%"")
				else
					a_file.put_string (" profile=%"false%"")
				end
			end
				-- optimize
-- TODO: Not supported yet.
				-- debug
			if l_option.is_debug_option_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<class_option class=%"")
					print_quote_escaped_string (l_class_name, a_file)
					a_file.put_character ('%"')
					l_option_attribute_printed := True
				end
				if l_option.debug_option then
					a_file.put_string (" debug=%"true%"")
				else
					a_file.put_string (" debug=%"false%"")
				end
			end
				-- warning
			if l_option.is_warning_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<class_option class=%"")
					print_quote_escaped_string (l_class_name, a_file)
					a_file.put_character ('%"')
					l_option_attribute_printed := True
				end
				if l_option.warning.same_string (options.none_value) then
					a_file.put_string (" warning=%"false%"")
				else
					a_file.put_string (" warning=%"true%"")
				end
			end
				-- namespace
			if l_option.is_namespace_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<class_option class=%"")
					print_quote_escaped_string (l_class_name, a_file)
					a_file.put_character ('%"')
					l_option_attribute_printed := True
				end
				a_file.put_string (" namespace=%"")
				print_quote_escaped_string (l_option.declared_namespace, a_file)
				a_file.put_character ('%"')
			end
				-- msil_application_optimize
-- TODO: Not supported yet.
				-- full_class_checking
			if l_option.is_full_class_checking_declared then
				if not l_option_attribute_printed then
					print_indentation (indent, a_file)
					a_file.put_string ("<class_option class=%"")
					print_quote_escaped_string (l_class_name, a_file)
					a_file.put_character ('%"')
					l_option_attribute_printed := True
				end
				if l_option.full_class_checking then
					a_file.put_string (" full_class_checking=%"true%"")
				else
					a_file.put_string (" full_class_checking=%"false%"")
				end
			end
				-- is_attached_by_default
-- TODO: Not supported yet.
				-- is_void_safe
-- TODO: Not supported yet.
				-- debug
			if l_option.is_debug_tag_declared then
				l_cursor := l_option.debug_tag.new_cursor
				from l_cursor.start until l_cursor.after loop
					if not l_option_element_printed then
						if not l_option_attribute_printed then
							print_indentation (indent, a_file)
							a_file.put_string ("<class_option class=%"")
							print_quote_escaped_string (l_class_name, a_file)
							a_file.put_line ("%">")
						else
							a_file.put_line (">")
						end
						l_option_element_printed := True
					end
					print_indentation (indent + 1, a_file)
					a_file.put_string ("<debug name=%"")
					print_quote_escaped_string (l_cursor.item, a_file)
					a_file.put_line ("%" enabled=%"true%"/>")
					l_cursor.forth
				end
			end
				-- assertions
			if l_option.is_assertion_declared then
				l_assertions := l_option.declared_assertion
				if not l_option_element_printed then
					if not l_option_attribute_printed then
						print_indentation (indent, a_file)
						a_file.put_string ("<class_option class=%"")
						print_quote_escaped_string (l_class_name, a_file)
						a_file.put_line ("%">")
					else
						a_file.put_line (">")
					end
					l_option_element_printed := True
				end
				print_indentation (indent + 1, a_file)
				a_file.put_string ("<assertions")
					-- precondition
				if l_assertions.has (options.require_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" precondition=%"true%"")
				else
					a_file.put_string (" precondition=%"false%"")
				end
					-- supplier_precondition
				if l_assertions.has (options.supplier_precondition_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" supplier_precondition=%"true%"")
				end
					-- postcondition
				if l_assertions.has (options.ensure_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" postcondition=%"true%"")
				else
					a_file.put_string (" postcondition=%"false%"")
				end
					-- check
				if l_assertions.has (options.check_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" check=%"true%"")
				else
					a_file.put_string (" check=%"false%"")
				end
					-- invariant
				if l_assertions.has (options.invariant_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" invariant=%"true%"")
				else
					a_file.put_string (" invariant=%"false%"")
				end
					-- loop
				if l_assertions.has (options.loop_variant_value) or l_assertions.has (options.loop_invariant_value) or l_assertions.has (options.all_value) then
					a_file.put_string (" loop=%"true%"")
				else
					a_file.put_string (" loop=%"false%"")
				end
				a_file.put_line ("/>")
			end
				-- warning
-- TODO: Not supported yet.
			if l_option_element_printed then
				print_indentation (indent, a_file)
				a_file.put_line ("</class_option>")
			elseif l_option_attribute_printed then
				a_file.put_line ("/>")
			end
		end

	print_class_visible (a_class_option: ET_XACE_CLASS_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print to `a_file' visible clause corresponding to the class
			-- represented by `a_class_option', and of its features.
		require
			a_class_option_not_void: a_class_option /= Void
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			l_feature_options: DS_LINKED_LIST [ET_XACE_FEATURE_OPTIONS]
			l_class_name: STRING
			l_external_name: STRING
		do
			l_class_name := a_class_option.class_name
			if a_class_option.options.is_export_option_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<visible class=%"")
				print_quote_escaped_string (l_class_name, a_file)
				l_external_name := a_class_option.options.export_option
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

	print_feature_visible (a_class_name: STRING; a_feature_option: ET_XACE_FEATURE_OPTIONS; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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
			l_external_name: STRING
		do
			if a_feature_option.options.is_export_option_declared then
				print_indentation (indent, a_file)
				a_file.put_string ("<visible class=%"")
				print_quote_escaped_string (a_class_name, a_file)
				a_file.put_string ("%" feature=%"")
				l_feature_name := a_feature_option.feature_name
				print_quote_escaped_string (l_feature_name, a_file)
				l_external_name := a_feature_option.options.export_option
				if not STRING_.same_string (l_external_name, l_feature_name) then
					a_file.put_string ("%" feature_rename=%"")
					print_quote_escaped_string (l_external_name, a_file)
				end
				a_file.put_line ("%"/>")
			end
		end

	print_mounted_libraries (a_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES; indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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
			if is_shallow then
				library_list := a_mounted_libraries.libraries
				nb := library_list.count
				from i := 1 until i > nb loop
					a_library := library_list.item (i)
					if a_library.is_root then
						a_pathname := STRING_.cloned_string (a_library.pathname)
						a_pathname.remove_tail (unix_file_system.extension (a_pathname).count)
						a_dirname := Execution_environment.interpreted_string (a_pathname)
						a_name := unix_file_system.basename (a_dirname)
						if a_name.same_string ("library") then
							a_dirname := unix_file_system.dirname (a_dirname)
							a_name := unix_file_system.basename (a_dirname)
							if a_name.is_empty then
								a_name := "unknown"
							end
						end
						print_indentation (indent, a_file)
						a_file.put_string ("<library name=%"")
						print_quote_escaped_string (a_name, a_file)
						a_file.put_string ("%" location=%"")
						print_quote_escaped_string (a_pathname + ".ecf", a_file)
						a_file.put_line ("%"/>")
					end
					i := i + 1
				end
			end
		end

	print_escaped_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
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

	print_quote_escaped_string (a_string: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
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

	print_escaped_character (a_char: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
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

	print_ecf_namespaces (a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print_ECF namespaces to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string ("xmlns=%"http://www.eiffel.com/developers/xml/configuration-1-3-0%" ")
			a_file.put_string ("xmlns:xsi=%"http://www.w3.org/2001/XMLSchema-instance%" ")
			a_file.put_string ("xsi:schemaLocation=%"http://www.eiffel.com/developers/xml/configuration-1-3-0 ")
			a_file.put_string ("http://www.eiffel.com/developers/xml/configuration-1-3-0.xsd%"")
		end

feature {NONE} -- Escaped

	is_escaped (a_char: INTEGER): BOOLEAN is
			-- Is this an escapable character?
		do
			Result := a_char = Lt_char.code
				or a_char = Gt_char.code
				or a_char = Amp_char.code
		end

end
