indexing

	description:

		"'system' commands for 'gexace'"

	system: "Gobo Eiffel Xace"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXACE_SYSTEM_COMMAND

inherit

	GEXACE_BUILD_COMMAND

creation

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler) is
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

	execute is
			-- Execute 'system' command.
		local
			a_parser: ET_XACE_SYSTEM_PARSER
			a_system: ET_XACE_SYSTEM
			a_file: KL_TEXT_INPUT_FILE
		do
			create a_parser.make_with_variables (variables, error_handler)
			create a_file.make (xace_filename)
			a_file.open_read
			if a_file.is_open_read then
				a_parser.parse_file (a_file)
				a_file.close
				a_system := a_parser.last_system
				if
					a_system /= Void and then
					((a_system.system_name /= Void and then a_system.system_name.count > 0) and
					(a_system.root_class_name /= Void and then a_system.root_class_name.count > 0) and
					(a_system.creation_procedure_name /= Void and then a_system.creation_procedure_name.count > 0))
				then
					execute_generators (a_system)
				end
			else
				error_handler.report_cannot_read_file_error (xace_filename)
			end
		end

	execute_generators (a_system: ET_XACE_SYSTEM) is
			-- Execute Ace file generators.
		require
			a_system_not_void: a_system /= Void
			system_name_not_void: a_system.system_name /= Void
			system_name_not_empty: a_system.system_name.count > 0
			root_class_name_not_void: a_system.root_class_name /= Void
			root_class_name_not_empty: a_system.root_class_name.count > 0
			creation_procedure_name_not_void: a_system.creation_procedure_name /= Void
			creation_procedure_name_not_empty: a_system.creation_procedure_name.count > 0
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR]
		do
			a_cursor := generators.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.generate_system (a_system)
				a_cursor.forth
			end
		end

end
