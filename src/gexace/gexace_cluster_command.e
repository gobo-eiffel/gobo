indexing

	description:

		"'cluster' commands for 'gexace'"

	system:     "Gobo Eiffel Xace"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEXACE_CLUSTER_COMMAND

inherit

	GEXACE_BUILD_COMMAND

creation

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler) is
			-- Create a new 'cluster' command.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
			xace_filename := default_cluster_filename
			!! generators.make
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
			xace_filename_set: xace_filename = default_cluster_filename
		end

feature -- Execution

	execute is
			-- Execute 'cluster' command.
		local
			a_parser: ET_XACE_CLUSTER_PARSER
			a_cluster: ET_XACE_CLUSTER
			a_file: KL_TEXT_INPUT_FILE
		do
			!! a_parser.make_with_variables (variables, error_handler)
			!! a_file.make (xace_filename)
			a_file.open_read
			if a_file.is_open_read then
				a_parser.parse_file (a_file)
				a_file.close
				a_cluster := a_parser.last_cluster
				if a_cluster /= Void then
					execute_generators (a_cluster)
				end
			else
				error_handler.report_cannot_read_file_error (xace_filename)
			end
		end

	execute_generators (a_cluster: ET_XACE_CLUSTER) is
			-- Execute Ace file generators.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_XACE_GENERATOR]
		do
			a_cursor := generators.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.generate_cluster (a_cluster)
				a_cursor.forth
			end
		end

end -- class GEXACE_CLUSTER_COMMAND
