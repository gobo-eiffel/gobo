note

	description:

		"'system' commands for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEXACE_SYSTEM_COMMAND

inherit

	GEXACE_BUILD_COMMAND

create

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler)
			-- Create a new 'system' command.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
			xace_filename := default_system_filename
			create generators.make
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
			xace_filename_set: xace_filename = default_system_filename
		end

feature -- Execution

	execute
			-- Execute 'system' command.
		local
			a_parser: ET_XACE_SYSTEM_CONFIG_PARSER
			a_system: ET_XACE_SYSTEM_CONFIG
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_parser.make_with_variables (variables, error_handler)
			a_parser.set_shallow (is_shallow)
			create a_file.make (xace_filename)
			a_file.open_read
			if a_file.is_open_read then
				a_parser.parse_file (a_file)
				a_file.close
				a_system := a_parser.last_system
				if
					a_system /= Void and then
					((attached a_system.root_class_name as l_root_class_name and then l_root_class_name.count > 0) and
					(attached a_system.creation_procedure_name as l_creation_procedure_name and then l_creation_procedure_name.count > 0))
				then
					execute_generators (a_system)
				end
			else
				error_handler.report_cannot_read_file_error (xace_filename)
			end
		end

	execute_generators (a_system: ET_XACE_SYSTEM_CONFIG)
			-- Execute Ace file generators.
		require
			a_system_not_void: a_system /= Void
			root_class_name_not_void: attached a_system.root_class_name as l_root_class_name
			root_class_name_not_empty: l_root_class_name.count > 0
			creation_procedure_name_not_void: attached a_system.creation_procedure_name as l_creation_procedure_name
			creation_procedure_name_not_empty: l_creation_procedure_name.count > 0
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR]
			a_generator: ET_XACE_GENERATOR
			a_filename: STRING
			a_file: KL_TEXT_OUTPUT_FILE
		do
			a_cursor := generators.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_generator := a_cursor.item
				if attached output_filename as l_output_filename then
					a_filename := l_output_filename
				else
					a_filename := a_generator.default_system_output_filename
				end
				create a_file.make (a_filename)
				a_file.open_write
				if a_file.is_open_write then
					a_generator.generate_system (a_system, a_file)
					a_file.close
				else
					error_handler.report_cannot_write_file_error (a_filename)
				end
				a_cursor.forth
			end
		end

end
