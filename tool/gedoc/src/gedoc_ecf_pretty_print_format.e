note

	description:

		"Gobo Eiffel Documentation ECF Pretty-Print Format"

	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_ECF_PRETTY_PRINT_FORMAT

inherit

	GEDOC_ECF_SYSTEM_CONFIG_FORMAT

create

	make

create {GEDOC_ECF_PRETTY_PRINT_FORMAT}

	make_from_format

feature {NONE} -- Processing

	process_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG)
			-- Pretty-print ECF config `a_system_config'.
		local
			l_printer: ET_ECF_PRINTER
			l_file: KL_TEXT_OUTPUT_FILE
			l_filename: STRING
		do
			if override_settings /= Void or override_capabilities /= Void or override_variables /= Void then
				if attached a_system_config.target_with_name (target_name) as l_target then
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
			if not is_file_overwritable (l_filename) then
				report_file_already_exists_error (l_filename)
			else
				create l_file.make (l_filename)
				l_file.recursive_open_write
				if l_file.is_open_write then
					create l_printer.make (l_file)
					if attached ecf_version as l_ecf_version then
						l_printer.set_ecf_version (l_ecf_version)
					elseif attached a_system_config.ecf_version as l_ecf_version then
						l_printer.set_ecf_version (l_ecf_version)
					end
					l_printer.print_system (a_system_config)
					l_printer.set_null_file
					l_file.close
				else
					report_cannot_write_error (l_filename)
				end
			end
		end

end
