indexing

	description:

		"Ace file generators from Xace systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_XACE_GENERATOR

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_OPERATING_SYSTEM
	ET_SHARED_XACE_OPTION_NAMES

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler) is
			-- Create a new generator.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	output_filename: STRING
			-- Output filename

	variables: ET_XACE_VARIABLES
			-- Defined variables

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_output_filename (a_filename: like output_filename) is
			-- Set `output_filename' to `a_filename'.
		do
			output_filename := a_filename
		ensure
			output_filename_set: output_filename = a_filename
		end

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM) is
			-- Generate a new Ace file from `a_system'.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: a_system.system_name /= Void
			system_name_not_empty: a_system.system_name.count > 0
			root_class_name_not_void: a_system.root_class_name /= Void
			root_class_name_not_empty: a_system.root_class_name.count > 0
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
			creation_procedure_name_not_empty: a_system.creation_procedure_name.count > 0
		deferred
		end

	generate_library (a_library: ET_XACE_LIBRARY) is
			-- Generate a new Ace file from `a_library'.
		require
			a_library_not_void: a_library /= Void
			a_library_name_not_void: a_library.name /= Void
			a_library_name_not_empty: a_library.name.count > 0
		deferred
		end

feature {NONE} -- Output

	print_indentation (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print `indent' tab characters to `a_file'.
		require
			indent_positive: indent >= 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i: INTEGER
		do
			from i := 1 until i > indent loop
				a_file.put_character ('%T')
				i := i + 1
			end
		end

	print_escaped_name (a_name: STRING; a_file: KI_TEXT_OUTPUT_STREAM) is
			-- Print escaped version of `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (a_name)
		end

feature {NONE} -- Implementation

	is_windows: BOOLEAN is
			-- Is current generator generating an Ace file
			-- to be used under Windows?
		local
			gobo_os_variable: STRING
			gobo_os_value: STRING
			a_value: STRING
		do
			gobo_os_variable := "GOBO_OS"
			gobo_os_value := "windows"
			if variables.is_defined (gobo_os_variable) then
				Result := variables.value (gobo_os_variable).is_equal (gobo_os_value)
			else
				a_value := Execution_environment.variable_value (gobo_os_variable)
				if a_value /= Void and then a_value.count > 0 then
					Result := a_value.is_equal (gobo_os_value)
				else
					Result := operating_system.is_windows
				end
			end
		end

invariant

	variables_not_void: variables /= Void
	error_handler_not_void: error_handler /= Void

end
