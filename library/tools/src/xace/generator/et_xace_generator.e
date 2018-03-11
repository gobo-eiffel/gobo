note

	description:

		"Eiffel config file generators from Xace files"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_XACE_GENERATOR

inherit

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_SHARED_OPERATING_SYSTEM
	ET_SHARED_XACE_OPTION_NAMES
	KL_IMPORTED_STRING_ROUTINES

feature {NONE} -- Initialization

	make (a_compiler: like compiler; a_variables: like variables; an_error_handler: like error_handler)
			-- Create a new generator.
		require
			a_compiler_not_void: a_compiler /= Void
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			compiler := a_compiler
			variables := a_variables
			error_handler := an_error_handler
		ensure
			compiler_set: compiler = a_compiler
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	compiler: STRING
			-- Name of compiler for which the Eiffel config file is generated
			-- (e.g. ise, ge, ...)

	default_system_output_filename: STRING
			-- Default system output filename
		deferred
		ensure
			default_system_output_filename_not_void: Result /= Void
		end

	default_library_output_filename: STRING
			-- Default library output filename
		deferred
		ensure
			default_library_output_filename_not_void: Result /= Void
		end

	variables: KL_VALUES [STRING, STRING]
			-- Defined variables

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Status report

	is_shallow: BOOLEAN
			-- Does current generator generate Eiffel config files
			-- which do not follow mounted libraries?
			-- Note that this option only make sense when the Eiffel config
			-- file format support the notion of mounted libraries. Otherwise
			-- this option is ignored.

feature -- Status setting

	set_shallow (b: BOOLEAN)
			-- set `is_shallow' to `b'.
		do
			is_shallow := b
		ensure
			shallow_set: is_shallow = b
		end

feature -- Output

	generate_system (a_system: ET_XACE_SYSTEM_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Generate a new Eiffel config file from `a_system'.
		require
			a_system_not_void: a_system /= Void
			root_class_name_not_void: attached a_system.root_class_name as l_root_class_name
			root_class_name_not_empty: l_root_class_name.count > 0
			creation_procedure_name_not_void: attached a_system.creation_procedure_name as l_creation_procedure_name
			creation_procedure_name_not_empty: l_creation_procedure_name.count > 0
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

	generate_library (a_library: ET_XACE_LIBRARY_CONFIG; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Generate a new Eiffel config file from `a_library'.
		require
			a_library_not_void: a_library /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		deferred
		end

feature {NONE} -- Output

	print_indentation (indent: INTEGER; a_file: KI_TEXT_OUTPUT_STREAM)
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

	print_escaped_name (a_name: STRING; a_file: KI_TEXT_OUTPUT_STREAM)
			-- Print escaped version of `a_name' to `a_file'.
		require
			a_name_not_void: a_name /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			a_file.put_string (a_name)
		end

feature {NONE} -- Implementation

	is_windows: BOOLEAN
			-- Is current generator generating an Eiffel config file
			-- to be used under Windows?
		local
			gobo_os_variable: STRING
			gobo_os_value: STRING
			a_value: detachable STRING
		do
			gobo_os_variable := "GOBO_OS"
			gobo_os_value := "windows"
			a_value := variables.value (gobo_os_variable)
			if a_value /= Void then
				Result := STRING_.same_string (a_value, gobo_os_value)
			else
				a_value := Execution_environment.variable_value (gobo_os_variable)
				if a_value /= Void and then a_value.count > 0 then
					Result := STRING_.same_string (a_value, gobo_os_value)
				else
					Result := operating_system.is_windows
				end
			end
		end

invariant

	variables_not_void: variables /= Void
	error_handler_not_void: error_handler /= Void
	compiler_not_void: compiler /= Void

end
