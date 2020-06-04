note

	description:

		"Gobo Eiffel Documentation Format: make explicit some implicit conversions"

	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEDOC_EXPLICIT_CONVERTS_FORMAT

inherit

	GEDOC_IMPLICIT_CONVERTS_FORMAT
		redefine
			make,
			set_ast_factory,
			process_system,
			process_implicit_converts
		end

create

	make

create {GEDOC_EXPLICIT_CONVERTS_FORMAT}

	make_from_format

feature {NONE} -- Initialization

	make (a_input_filename: STRING; a_system_processor: like system_processor)
			-- <Precursor>
		do
			create ast_printer.make_null
			precursor (a_input_filename, a_system_processor)
		end

feature {NONE} -- Processing

	set_ast_factory
			-- Configure the AST factory as needed.
		local
			l_ast_factory: ET_DECORATED_AST_FACTORY
		do
			create l_ast_factory.make
			l_ast_factory.set_keep_all_breaks (True)
			set_explicit_convert_class_names (l_ast_factory)
			system_processor.set_ast_factory (l_ast_factory)
		end

	process_system (a_system: ET_SYSTEM)
			-- Process `input_classes' from `a_system'.
		do
			if system_processor.processor_count > 1 then
					-- Make sure that output directories exist
					-- before having several threads trying to create
					-- them at the same time.
				create_class_output_directories (input_classes)
			end
			precursor (a_system)
		end

feature {GEDOC_EXPLICIT_CONVERTS_FORMAT} -- Processing

	process_implicit_converts (a_class: ET_CLASS)
			-- Process implicit conversions in `a_class' if it has not been marked yet.
		local
			l_printer: ET_AST_PRINTER
			l_file: like new_output_file
			l_filename: STRING
			i, nb: INTEGER
			l_expression: ET_EXPLICIT_CONVERT_EXPRESSION
			l_position: ET_POSITION
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
						explicit_convert_expressions.wipe_out
						explicit_convert_expression_finder.find_explicit_convert_expressions (a_class, explicit_convert_expressions)
						nb := explicit_convert_expressions.count
						if nb > 0 then
							l_filename := filename (l_directory, concat (class_lower_name (a_class), eiffel_file_extension))
							if not is_file_overwritable (l_filename) then
								report_file_already_exists_error (l_filename)
							else
								l_file := new_output_file (l_filename)
								l_file.recursive_open_write
								if l_file.is_open_write then
									l_printer := ast_printer
									l_printer.set_file (l_file)
									a_class.process (l_printer)
									l_printer.set_null_file
									l_file.close
									from i := 1 until i > nb loop
										l_expression := explicit_convert_expressions.item (i)
										l_position := l_expression.position
										error_handler.report_info_message ("[CONVERT] " + a_class.upper_name + " (" + l_position.line.out + "," + l_position.column.out + "): conversion from '" + l_expression.source_type.to_text + "' to '" + l_expression.target_type.to_text + "' using feature `" + l_expression.convert_feature.name.lower_name + "`.%N----")
										i := i + 1
									end
									explicit_convert_expressions.wipe_out
								else
									report_cannot_write_error (l_filename)
								end
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

	ast_printer: ET_AST_PRINTER
			-- Printer for Eiffel code

feature {NONE} -- Constants

	eiffel_file_extension: STRING = ".e"
			-- Extension for Eiffel files

invariant

	ast_printer_not_void: ast_printer /= Void

end
