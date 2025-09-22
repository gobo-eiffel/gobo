note

	description:
	"[
		Gobo Eiffel Documentation Executable-name Format.
		Print the executable name of the Eiffel system described by the ECF input file.
		Report an error if there is no target in the ECF file or if `target_name' is
		specified but is not the name of a target in the ECF file.
	]"

	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GEDOC_EXECUTABLE_NAME_FORMAT

inherit

	GEDOC_ECF_SYSTEM_CONFIG_FORMAT
		redefine
			parse_input_file,
			parse_eiffel_file
		end

create

	make

create {GEDOC_EXECUTABLE_NAME_FORMAT}

	make_from_format

feature {NONE} -- Eiffel config file parsing

	parse_input_file (a_input_filename: STRING)
			-- Read `a_input_filename'. It can be
			-- an ECF file or an Eiffel class file.
			-- Put result in `last_system_config' if no error occurred.
		local
			l_file: KL_TEXT_INPUT_FILE
		do
			last_system_config := Void
			if file_system.has_extension (a_input_filename, file_system.eiffel_extension) then
				create l_file.make (a_input_filename)
				l_file.open_read
				if l_file.is_open_read then
					parse_eiffel_file (l_file)
					l_file.close
				else
					report_cannot_read_error (a_input_filename)
				end
			else
				precursor (a_input_filename)
			end
		end

	parse_eiffel_file (a_file: KL_TEXT_INPUT_FILE)
			-- Read Eiffel file `a_file' containing the root class.
			-- Print the lower-name of the first Eiffel class found.
		local
			l_system: ET_SYSTEM
			l_cluster: ET_CLUSTER
			l_time_stamp: INTEGER
			l_parser: ET_EIFFEL_PARSER
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_class: ET_CLASS
			l_root_cluster_pathname: STRING
			l_executable_name: STRING
		do
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
					l_executable_name := l_class.lower_name
					error_handler.report_info_message (l_executable_name)
				end
			else
				has_error := True
			end
		end

feature {NONE} -- Processing

	process_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Print the executable name of the Eiffel system described in `a_system_config'.
			-- Report an error if there is no target in `a_system_config' or if `target_name'
			-- is specified but is not the name of a target in the ECF file.
		do
			if not attached  a_system_config.target_with_name (target_name) as l_target then
				if attached target_name as l_target_name then
					report_target_not_found_error (l_target_name)
				else
					report_no_target_found_error
				end
			else
				if attached l_target.settings.value ({ET_ECF_SETTING_NAMES}.executable_name_setting_name) as l_executable_name then
					error_handler.report_info_message (l_executable_name)
				else
					error_handler.report_info_message (a_system_config.name)
				end
			end
		end

end
