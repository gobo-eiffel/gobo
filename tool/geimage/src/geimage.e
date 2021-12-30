note

	description:

		"[
			Gobo Eiffel Image.
			Generate Eiffel class embedding an image.
		]"

	copyright: "Copyright (c) 2020-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEIMAGE

inherit

	GEIMAGE_VERSION

	KL_SHARED_FILE_SYSTEM
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Execution

	execute
			-- Start 'geimage' execution, reading arguments from the command-line.
		do
			execute_with_arguments (Arguments.to_array)
			Exceptions.die (exit_code)
		rescue
			Exceptions.die (4)
		end

	execute_with_arguments (a_args: ARRAY [STRING])
			-- Start 'geimage' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_error_handler: UT_ERROR_HANDLER
		do
			create l_error_handler.make_standard
			execute_with_arguments_and_error_handler (a_args, l_error_handler)
		end

	execute_with_arguments_and_error_handler (a_args: ARRAY [STRING]; a_error_handler: UT_ERROR_HANDLER)
			-- Start 'geimage' execution with arguments `a_args'.
			-- Set `exit_code'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
			a_error_handler_not_void: a_error_handler /= Void
		local
			l_filename: STRING
			l_input_file: KL_BINARY_INPUT_FILE
			l_output_file: KL_TEXT_OUTPUT_FILE
			l_class_name: STRING_8
			l_bytes: STRING_8
			l_bytes_total: INTEGER
			l_chunk_count: INTEGER
			i, nb: INTEGER
		do
			Arguments.set_program_name ("geimage")
			error_handler := a_error_handler
			parse_arguments (a_args)
			if exit_code = 0 and then not version_flag.was_found then
				create l_input_file.make (image_filename)
				l_input_file.open_read
				if l_input_file.is_open_read then
					if attached class_option.parameter as l_parameter then
						l_class_name := l_parameter
					else
						l_class_name := file_system.basename (image_filename)
						nb := l_class_name.count
						from i := 1 until i > nb loop
							inspect l_class_name.item (i)
							when 'a' .. 'z', 'A' .. 'Z', '0' .. '9', '_' then
								i := i + 1
							else
								nb := i - 1
								l_class_name.keep_head (nb)
							end
						end
					end
					l_filename := l_class_name.as_lower + ".e"
					create l_output_file.make (l_filename)
					l_output_file.open_write
					if l_output_file.is_open_write then
						print_class_header (l_class_name, l_output_file)
						create l_bytes.make_filled ('%U', chunk_size)
						from
							nb := l_input_file.read_to_string (l_bytes, 1, chunk_size)
						until
							nb = 0
						loop
							l_chunk_count := l_chunk_count + 1
							print_build_image_data_routine (l_bytes, nb, l_chunk_count, l_output_file)
							l_bytes_total := l_bytes_total + nb
							nb := l_input_file.read_to_string (l_bytes, 1, chunk_size)
						end
						print_class_footer (l_bytes_total, l_chunk_count, l_output_file)
						l_output_file.close
					else
						report_cannot_write_error (l_filename)
						exit_code := 1
					end
					l_input_file.close
				else
					report_cannot_read_error (image_filename)
					exit_code := 1
				end
			end
		rescue
			exit_code := 4
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_cannot_read_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_cannot_write_error (a_filename: STRING)
			-- Report that `a_filename' cannot be
			-- opened in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create an_error.make (a_filename)
			error_handler.report_error (an_error)
		end

	report_version_number
			-- Report version number.
		local
			a_message: UT_VERSION_NUMBER
		do
			create a_message.make (Version_number)
			error_handler.report_info (a_message)
		end

	exit_code: INTEGER
			-- Exit code

feature -- Argument parsing

	image_filename: STRING
			-- Name of the file containing the image

	class_option: AP_STRING_OPTION
			-- Option for '--class=<class_name>'

	version_flag: AP_FLAG
			-- Flag for '--version'

	parse_arguments (a_args: ARRAY [STRING])
			-- Initialize options and parse arguments `a_args'.
		require
			a_args_not_void: a_args /= Void
			no_void_arg: across a_args as i_arg all i_arg /= Void end
		local
			l_parser: AP_PARSER
			l_list: AP_ALTERNATIVE_OPTIONS_LIST
		do
			create l_parser.make
			l_parser.set_application_description ("Gobo Eiffel Image, generate Eiffel class embedding an image.")
			l_parser.set_parameters_description ("image_filename")
				-- class
			create class_option.make_with_long_form ("class")
			class_option.set_description ("Name of the generated Eiffel class. (default: inferred from the image filename)")
			class_option.set_parameter_description ("class_name")
			l_parser.options.force_last (class_option)
				-- version
			create version_flag.make ('V', "version")
			version_flag.set_description ("Print the version number of geimage and exit.")
			create l_list.make (version_flag)
			l_parser.alternative_options_lists.force_last (l_list)
				-- Parsing.
			l_parser.parse_arguments
			if version_flag.was_found then
				report_version_number
				image_filename := ""
				exit_code := 0
			elseif l_parser.parameters.count /= 1 then
				error_handler.report_info_message (l_parser.help_option.full_usage_instruction (l_parser))
				image_filename := ""
				exit_code := 1
			else
				image_filename := l_parser.parameters.first
			end
		ensure
			image_filename_not_void: image_filename /= Void
			class_option_not_void: class_option /= Void
			version_flag_not_void: version_flag /= Void
		end

feature {NONE} -- Processing

	print_class_header (a_class_name: STRING_8; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Write header of class `a_class_name` to `a_file`.
		require
			a_class_name_not_void: a_class_name /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_line ("note")
			a_file.put_new_line
			a_file.put_string ("%Tdescription: %"Pixel buffer embedding image '")
			a_file.put_string (file_system.basename (image_filename))
			a_file.put_line ("'%"")
			a_file.put_line ("%Tgenerator: %"geimage%"")
			a_file.put_new_line
			a_file.put_string ("class ")
			a_file.put_line (a_class_name.as_upper)
			a_file.put_new_line
			a_file.put_line ("inherit")
			a_file.put_new_line
			a_file.put_line ("%TEV_PIXEL_BUFFER")
			a_file.put_new_line
			a_file.put_line ("create")
			a_file.put_new_line
			a_file.put_line ("%Tmake")
			a_file.put_new_line
			a_file.put_line ("feature {NONE} -- Initialization")
			a_file.put_new_line
			a_file.put_line ("%Tmake")
			a_file.put_line ("%T%T%T-- Initialization")
			a_file.put_line ("%T%Tdo")
			a_file.put_line ("%T%T%Tdefault_create")
			a_file.put_line ("%T%T%Tload_image")
			a_file.put_line ("%T%Tend")
			a_file.put_new_line
			a_file.put_line ("feature {NONE} -- Image data")
			a_file.put_new_line
		end

	print_build_image_data_routine (a_bytes: STRING_8; a_byte_size, a_chunk_count: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Write routine 'build_image_data' to `a_file`.
		require
			a_bytes_not_void: a_bytes /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i: INTEGER
		do
			a_file.put_string ("%Tbuild_image_data_")
			a_file.put_integer (a_chunk_count)
			a_file.put_line (" (a_ptr: POINTER; a_offset: INTEGER)")
			a_file.put_line ("%T%T%T-- Fill `a_ptr` with image bytes, starting at `a_offset`.")
			a_file.put_line ("%T%Texternal")
			a_file.put_line ("%T%T%T%"C inline%"")
			a_file.put_line ("%T%Talias")
			a_file.put_line ("%T%T%T%"[")
			a_file.put_line ("%T%T%T%T{")
			a_file.put_line ("%T%T%T%T#define A(x) \")
			a_file.put_line ("%T%T%T%T%T#x")
			a_file.put_line ("%T%T%T%T#define B(x) A(\x##x)")
			a_file.put_string ("%T%T%T%Tchar l_data[] =")
			from i := 1 until i > a_byte_size loop
				if (i - 1) \\ 20 = 0 then
					a_file.put_new_line
					a_file.put_string ("%T%T%T%T%T")
				end
				a_file.put_character ('B')
				a_file.put_character ('(')
				a_file.put_string (a_bytes.item (i).natural_32_code.to_natural_8.to_hex_string)
				a_file.put_character (')')
				i := i + 1
			end
			a_file.put_line (";")
			a_file.put_string ("%T%T%T%Tmemcpy ((char *)$a_ptr + $a_offset, &l_data, ")
			a_file.put_integer (a_byte_size)
			a_file.put_line (");")
			a_file.put_line ("%T%T%T%T}")
			a_file.put_line ("%T%T%T]%"")
			a_file.put_line ("%T%Tend")
			a_file.put_new_line
		end

	print_class_footer (a_pointer_size, a_chunk_count: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Write footer of class to `a_file`.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i: INTEGER
		do
			a_file.put_line ("%Tload_image")
			a_file.put_line ("%T%T%T-- Load image in memory.")
			a_file.put_line ("%T%Tlocal")
			a_file.put_line ("%T%T%Tl_pointer: POINTER")
			a_file.put_line ("%T%Tdo")
			a_file.put_string ("%T%T%Tl_pointer := l_pointer.memory_alloc (")
			a_file.put_integer (a_pointer_size)
			a_file.put_line (")")
			a_file.put_line ("%T%T%Tif not l_pointer.is_default_pointer then")
			from i := 1 until i > a_chunk_count loop
				a_file.put_string ("%T%T%T%Tbuild_image_data_")
				a_file.put_integer (i)
				a_file.put_string (" (l_pointer, ")
				a_file.put_integer ((i - 1) * chunk_size)
				a_file.put_line (")")
				i := i + 1
			end
			a_file.put_string ("%T%T%T%Tset_with_pointer (l_pointer, ")
			a_file.put_integer (a_pointer_size)
			a_file.put_line (")")
			a_file.put_line ("%T%T%T%Tl_pointer.memory_free")
			a_file.put_line ("%T%T%Tend")
			a_file.put_line ("%T%Tend")
			a_file.put_new_line
			a_file.put_line ("end")
		end

feature {NONE} -- Constants

	chunk_size: INTEGER = 5000
			-- Number of bytes per chunk of memory

invariant

	error_handler_not_void: error_handler /= Void
	image_filename_not_void: image_filename /= Void
	class_option_not_void: class_option /= Void
	version_flag_not_void: version_flag /= Void

end
