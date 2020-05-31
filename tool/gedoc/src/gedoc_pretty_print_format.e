note

	description:

		"Gobo Eiffel Documentation Pretty-Print Format"

	copyright: "Copyright (c) 2017-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_PRETTY_PRINT_FORMAT

inherit

	GEDOC_FORMAT
		redefine
			make
		end

create

	make

create {GEDOC_PRETTY_PRINT_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- Create a new documentation format with `a_input_filename'.
		do
			create pretty_printer.make_null
			precursor (a_input_filename, a_system_processor)
		end

feature {NONE} -- Processing

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		local
			l_input_classes: like input_classes
			l_formats: DS_ARRAYED_LIST [like Current]
			l_processor_count: INTEGER
		do
			l_input_classes := input_classes
			system_processor.parse_classes (l_input_classes)
			l_processor_count := system_processor.processor_count
			if l_processor_count > 1 then
					-- Make sure that output directories exist
					-- before having several threads trying to create
					-- them at the same time.
				create_class_output_directories (l_input_classes)
			end
			create l_formats.make (l_processor_count)
			system_processor.do_all (agent add_format (?, l_formats))
			l_input_classes.do_all (agent {ET_CLASS}.set_marked (False))
			system_processor.process_custom (l_input_classes)
			has_error := l_formats.there_exists (agent {like Current}.has_error)
		end

feature {GEDOC_PRETTY_PRINT_FORMAT} -- Processing

	pretty_print_class (a_class: ET_CLASS)
			-- Pretty-print `a_class' if it has not been marked yet.
		require
			a_class_not_void: a_class /= Void
		local
			l_printer: ET_AST_PRETTY_PRINTER
			l_file: like new_output_file
			l_filename: STRING
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.is_marked then
					if a_class.is_none then
						-- Do nothing.
					elseif not a_class.is_parsed then
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
								l_printer := pretty_printer
								l_printer.reset
								l_printer.set_file (l_file)
								a_class.process (l_printer)
								l_printer.set_null_file
								l_file.close
							else
								report_cannot_write_error (l_filename)
							end
						end
					end
					system_processor.report_class_processed (a_class)
					a_class.set_marked (True)
				end
				a_class.processing_mutex.unlock
			end
		end

feature {NONE} -- Implementation

	add_format (a_system_processor: ET_SYSTEM_PROCESSOR; a_formats: DS_ARRAYED_LIST [like Current])
			-- Add format associated with `a_system_processor' to `a_formats'.
		require
			a_system_processor_not_void: a_system_processor /= Void
			a_formats_not_void: a_formats /= Void
			no_void_format: not a_formats.has_void
		local
			l_format: like Current
		do
			if a_system_processor = system_processor then
				l_format := Current
			else
				create l_format.make_from_format (Current, a_system_processor)
			end
			a_system_processor.set_custom_processor (agent l_format.pretty_print_class)
			a_formats.force_last (l_format)
		ensure
			no_void_format: not a_formats.has_void
			one_more: a_formats.count = old a_formats.count + 1
			system_processor_set: a_formats.last.system_processor = a_system_processor
		end

	pretty_printer: ET_AST_PRETTY_PRINTER
			-- Pretty-printer

feature {NONE} -- Constants

	eiffel_file_extension: STRING = ".e"
			-- Extension for Eiffel files

invariant

	pretty_printer_not_void: pretty_printer /= Void

end
