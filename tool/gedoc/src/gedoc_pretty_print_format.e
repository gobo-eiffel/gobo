note

	description:

		"Gobo Eiffel Documentation Pretty-Print Format"

	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_PRETTY_PRINT_FORMAT

inherit

	GEDOC_FORMAT

create

	make

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM)
			-- Process `a_system'.
			-- Use `input_classes' as input classes if not Void.
			-- Otherwise use all classes in `a_system'.
		do
			if attached input_classes as l_input_classes then
				l_input_classes.do_all (agent {ET_CLASS}.process (system_processor.eiffel_parser))
				l_input_classes.do_all (agent pretty_print_class)
			else
				a_system.parse_all_recursive (system_processor)
				a_system.classes_do_unless_recursive (agent pretty_print_class, agent {ET_CLASS}.is_none)
			end
		end

	pretty_print_class (a_class: ET_CLASS)
			-- Pretty-print `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_printer: ET_AST_PRETTY_PRINTER
			l_file: like new_output_file
			l_filename: STRING
		do
			if not a_class.is_parsed then
				-- Do nothing.
			elseif a_class.has_syntax_error then
				-- This error should have already been reported.
			elseif not attached class_output_directory (a_class) as l_directory then
				report_no_output_directory_for_class_error (a_class)
			else
				l_filename := filename (l_directory, concat (class_lower_name (a_class), eiffel_file_extension))
				if not is_file_overwritable (l_filename) then
					report_file_already_exists_error (l_filename)
				else
					l_file := new_output_file (l_filename)
					l_file.recursive_open_write
					if l_file.is_open_write then
						create l_printer.make_null
						l_printer.set_file (l_file)
						a_class.process (l_printer)
						l_printer.set_null_file
						l_file.close
					else
						report_cannot_write_error (l_filename)
					end
				end
			end
		end

feature {NONE} -- Constants

	eiffel_file_extension: STRING = ".e"
			-- Extension for Eiffel files

end
