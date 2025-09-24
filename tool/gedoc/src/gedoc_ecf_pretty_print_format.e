note

	description:

		"Gobo Eiffel Documentation ECF Pretty-Print Format"

	copyright: "Copyright (c) 2018-2019, Eric Bezault and others"
	license: "MIT License"

class GEDOC_ECF_PRETTY_PRINT_FORMAT

inherit

	GEDOC_ECF_CONFIG_FORMAT
		redefine
			parse_input_file,
			parse_eiffel_file
		end

create

	make

create {GEDOC_ECF_PRETTY_PRINT_FORMAT}

	make_from_format

feature {NONE} -- Eiffel config file parsing

	parse_input_file (a_input_filename: STRING)
			-- Read `a_input_filename' which is expected to be an ECF file.
			-- Put result in `last_config' if no error occurred.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_ecf_filename: STRING
		do
			last_config := Void
			l_ecf_filename := a_input_filename
			if file_system.has_extension (a_input_filename, file_system.eiffel_extension) then
				create l_file.make (a_input_filename)
				l_file.open_read
				if l_file.is_open_read then
					parse_eiffel_file (l_file)
					l_file.close
				else
					report_cannot_read_error (a_input_filename)
				end
				l_ecf_filename := file_system.nested_pathname ("${GOBO}", <<"library", "common", "config", "ecf", "default.ecf">>)
				l_ecf_filename := Execution_environment.interpreted_string (l_ecf_filename)
			end
			if not has_error then
				create l_file.make (l_ecf_filename)
				l_file.open_read
				if l_file.is_open_read then
					parse_ecf_file (l_file)
					l_file.close
				else
					report_cannot_read_error (l_ecf_filename)
				end
			end
		end

	parse_eiffel_file (a_file: KL_TEXT_INPUT_FILE)
			-- Read Eiffel file `a_file' containing the root class.
			-- Put result in `override_root_cluster_pathname',
			-- `override_root_type' and `override_root_creation'
			-- if no error occurred.
		local
			l_system: ET_SYSTEM
			l_cluster: ET_CLUSTER
			l_time_stamp: INTEGER
			l_parser: ET_EIFFEL_PARSER
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_class: ET_CLASS
			l_root_cluster_pathname: STRING
			l_override_settings: detachable ET_ECF_SETTINGS
			l_executable_name: STRING
		do
			override_root_cluster_pathname := Void
			override_root_type := Void
			override_root_creation := Void
			create l_system.make ("system_name")
			l_root_cluster_pathname := file_system.absolute_pathname (file_system.dirname (a_file.name))
			create l_cluster.make ("root_cluster", l_root_cluster_pathname, l_system)
			create l_parser.make (system_processor)
			l_time_stamp := a_file.time_stamp
			l_parser.parse_file (a_file, a_file.name, l_time_stamp, l_cluster)
			if not l_parser.syntax_error then
				create l_classes.make (1)
				l_system.classes_do_if_recursive (agent l_classes.force_last, agent {ET_CLASS}.is_parsed)
				if l_classes.is_empty then
						-- Internal error: No class found.
						-- At syntax error should already have been reported.
					has_error := True
				else
						-- Use the first class in the file.
					l_class := l_classes.first
					override_root_cluster_pathname := l_root_cluster_pathname
					create override_root_type.make (l_class.upper_name)
					if not attached l_class.creators as l_creators or else l_creators.is_empty then
						override_root_creation := tokens.default_create_feature_name
					elseif l_creators.first.is_empty then
						override_root_creation := tokens.default_create_feature_name
					else
							-- Use the first creation procedure.
						override_root_creation := l_creators.first.feature_name (1)
					end
					l_executable_name := l_class.lower_name
					l_override_settings := override_settings
					if l_override_settings = Void then
						create l_override_settings.make
						override_settings := l_override_settings
					end
					l_override_settings.set_primary_value ({ET_ECF_SETTING_NAMES}.executable_name_setting_name, l_executable_name)
				end
			else
				has_error := True
			end
		end

feature {NONE} -- Processing

	process_config (a_config: ET_ECF_CONFIG)
			-- Pretty-print ECF config `a_config'.
		local
			l_printer: ET_ECF_PRINTER
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
			l_clusters: ET_ECF_CLUSTERS
			l_root_cluster: ET_ECF_CLUSTER
			l_unknown_system: ET_ECF_SYSTEM
			l_root: ET_ECF_ROOT_CLASS
			l_pathname: STRING
			l_name: STRING
		do
			if (override_settings /= Void or override_capabilities /= Void or override_variables /= Void or override_root_type /= Void) and attached {ET_ECF_SYSTEM_CONFIG} a_config as l_system_config then
				if attached l_system_config.target_with_name (target_name) as l_target then
					if attached override_root_type as l_override_root_type then
							-- Generating an ECF file when `input_filename' is an Eiffel file.
						l_name := l_override_root_type.lower_name
						l_system_config.set_name (l_name)
						l_target.set_name (l_name)
						l_clusters := l_target.clusters
						if l_clusters = Void then
							create l_clusters.make_empty
							l_target.set_clusters (l_clusters)
						end
						if output_directory /= Void and attached override_root_cluster_pathname as l_override_root_cluster_pathname then
							l_pathname := l_override_root_cluster_pathname
						else
							l_pathname := "./"
						end
						create l_unknown_system.make (l_system_config.name, l_system_config.filename)
						create l_root_cluster.make (l_name, l_pathname, l_unknown_system, l_target)
						l_clusters.put_last (l_root_cluster)
						create l_root.make (l_override_root_type)
						if attached {ET_IDENTIFIER} override_root_creation as l_override_root_creation then
							l_root.set_creation_procedure_name (l_override_root_creation)
						end
						l_target.set_root (l_root)
					end
					if attached override_settings as l_override_settings then
						l_target.override_settings (l_override_settings)
					end
					if attached override_capabilities as l_override_capabilities then
						l_target.override_capabilities (l_override_capabilities)
					end
					if attached override_variables as l_override_variables then
						l_target.override_variables (l_override_variables)
					end
				elseif attached target_name as l_target_name then
					report_target_not_found_error (l_target_name)
				end
			end
			if attached output_directory as l_output_directory then
				l_filename := file_system.pathname (l_output_directory, file_system.basename (input_filename))
			else
				l_filename := input_filename
			end
			if file_system.has_extension (l_filename, file_system.eiffel_extension) then
				l_filename := l_filename.twin
				l_filename.remove_tail (file_system.eiffel_extension.count)
				l_filename.append_string (file_system.ecf_extension)
			end
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				create l_file.make (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					create l_printer.make (l_file)
					if attached ecf_version as l_ecf_version then
						l_printer.set_ecf_version (l_ecf_version)
					elseif attached a_config.ecf_version as l_ecf_version then
						l_printer.set_ecf_version (l_ecf_version)
					end
					a_config.process (l_printer)
					l_printer.set_null_file
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

feature {NONE} -- Access

	override_root_type: detachable ET_IDENTIFIER
			-- Root type to be used instead of the one specified in the selected ECF target

	override_root_creation: detachable ET_FEATURE_NAME
			-- Root creation to be used instead of the one specified in the selected ECF target

	override_root_cluster_pathname: detachable STRING
			-- Pathname of cluster containing `override_root_type'

end
