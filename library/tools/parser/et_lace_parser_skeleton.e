indexing

	description:

		"Lace parser skeletons"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_LACE_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton,
			parse as yyparse
		redefine
			report_error
		end

	ET_LACE_SCANNER_SKELETON
		rename
			make as make_lace_scanner
		end

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new Lace parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			make_lace_scanner ("unknown file", an_error_handler)
			make_parser_skeleton
		ensure
			error_handler_set: error_handler = an_error_handler
		end

feature -- Parsing

	parse (a_file: like INPUT_STREAM_TYPE) is
			-- Parse Ace file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			reset
			set_input_buffer (new_file_buffer (a_file))
			last_universe := Void
			yyparse
		end

feature -- Access

	last_universe: ET_UNIVERSE
			-- Universe being parsed

feature -- AST factory

	new_cluster (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER): ET_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_pathname_not_void: a_pathname /= Void
		do
			!! Result.make (a_name, a_pathname)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_CLUSTER): ET_CLUSTERS is
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			!! Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_universe (a_clusters: ET_CLUSTERS): ET_UNIVERSE is
			-- New class universe
		do
			!! Result.make (a_clusters, error_handler)
		ensure
			universe_not_void: Result /= Void
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				std.error.put_string (INPUT_STREAM_.name (f_buffer.file))
				std.error.put_string (", line ")
			else
				std.error.put_string ("line ")
			end
			std.error.put_integer (eif_lineno)
			std.error.put_string (": ")
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

end -- class ET_LACE_PARSER_SKELETON
