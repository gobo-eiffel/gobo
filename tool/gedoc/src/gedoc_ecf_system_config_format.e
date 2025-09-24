note

	description:

		"Gobo Eiffel ECF Documentation Format"

	copyright: "Copyright (c) 2018-2025, Eric Bezault and others"
	license: "MIT License"

deferred class GEDOC_ECF_SYSTEM_CONFIG_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			execute,
			parse_input_file,
			parse_ecf_file
		end

feature -- Execution

	execute
			-- Execute ECF documentation format.
		local
			dt1: detachable DT_DATE_TIME
		do
			system_processor.set_benchmark_shown (benchmark_flag and not silent_flag)
			dt1 := system_processor.benchmark_start_time
			parse_input_file (input_filename)
			if not has_error and attached last_system_config as l_last_system_config then
				process_system_config (l_last_system_config)
				if system_processor.error_handler.has_fatal_error then
					has_error := True
				end
			end
			system_processor.record_end_time (dt1, "Total Time")
		end

feature {NONE} -- Eiffel config file parsing

	parse_input_file (a_input_filename: STRING)
			-- Read `a_input_filename' which is expected to be an ECF file.
			-- Put result in `last_system_config' if no error occurred.
		local
			l_file: KL_TEXT_INPUT_FILE
		do
			last_system_config := Void
			create l_file.make (a_input_filename)
			l_file.open_read
			if l_file.is_open_read then
				parse_ecf_file (l_file)
				l_file.close
			else
				report_cannot_read_error (a_input_filename)
			end
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `last_system_config' if no error occurred.
		local
			l_ecf_parser: ET_ECF_SYSTEM_CONFIG_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
		do
			last_system_config := Void
			if silent_flag then
				create l_ecf_error_handler.make_null
			else
				create l_ecf_error_handler.make_standard
			end
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_ise_version (ise_version)
			l_ecf_parser.parse_file (a_file)
			if l_ecf_error_handler.has_error then
				has_error := True
			elseif not attached l_ecf_parser.last_system_config as l_last_system_config then
				report_no_system_found_error (a_file.name)
			else
				last_system_config := l_last_system_config
			end
		end

feature {NONE} -- Processing

	process_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Process `a_system_config'.
		require
			a_system_config_not_void: a_system_config /= Void
		deferred
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		do
		end

feature {GEDOC_ECF_SYSTEM_CONFIG_FORMAT} -- Processing

	last_system_config: detachable ET_ECF_SYSTEM_CONFIG
			-- Last ECF system config parsed, if any

end
