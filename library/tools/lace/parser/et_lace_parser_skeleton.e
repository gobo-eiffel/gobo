indexing

	description:

		"Lace parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
		local
			a_factory: ET_LACE_AST_FACTORY
		do
			create a_factory.make
			make_with_factory (a_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler) is
			-- Create a new Lace parser.
		require
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			ast_factory := a_factory
			create named_clusters.make (100)
			make_lace_scanner ("unknown file", an_error_handler)
			make_parser_skeleton
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Parsing

	parse (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Ace file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			reset
			named_clusters.wipe_out
			set_input_buffer (new_file_buffer (a_file))
			last_universe := Void
			named_clusters.wipe_out
			yyparse
		end

feature -- Access

	last_universe: ET_LACE_UNIVERSE
			-- Universe being parsed

	ast_factory: ET_LACE_AST_FACTORY
			-- Abstract Syntax Tree factory

feature {NONE} -- Basic operations

	add_subcluster (a_name: ET_IDENTIFIER; a_parent: ET_IDENTIFIER;
		a_pathname: ET_IDENTIFIER; an_exclude: ET_LACE_EXCLUDE) is
			-- Add cluster named `a_name' with pathname `a_pathname' to
			-- parent cluster named `a_parent'. The leading '$' sign in
			-- `a_pathname' will be replaced by the full pathname of the
			-- parent cluster. (This is the way to nest clusters in
			-- ISE's LACE syntax.)
		require
			a_name_not_void: a_name /= Void
			a_parent_not_void: a_parent /= Void
			a_pathname_not_void: a_pathname /= Void
		local
			a_full_pathname_string, a_pathname_string: STRING
			a_parent_full_pathname: STRING
			a_full_pathname: ET_IDENTIFIER
			a_parent_cluster: ET_LACE_CLUSTER
			a_cluster: ET_LACE_CLUSTER
			nb: INTEGER
		do
			named_clusters.search (a_parent)
			if named_clusters.found then
				a_parent_cluster := named_clusters.found_item
				a_pathname_string := a_pathname.name
				nb := a_pathname_string.count
				if nb = 0 then
					a_full_pathname := a_pathname
				elseif a_pathname_string.item (1) /= '$' then
					a_full_pathname := a_pathname
				else
					a_parent_full_pathname := a_parent_cluster.full_pathname
					if nb = 1 then
						a_full_pathname_string := a_parent_full_pathname
						create a_full_pathname.make (a_full_pathname_string)
						a_full_pathname.set_position (a_pathname.line, a_pathname.column)
					else
						inspect a_pathname_string.item (2)
						when '/', '\' then
							a_full_pathname_string := STRING_.make (a_parent_full_pathname.count + nb - 1)
							a_full_pathname_string.append_string (a_parent_full_pathname)
							a_full_pathname_string.append_string (a_pathname_string.substring (2, nb))
							create a_full_pathname.make (a_full_pathname_string)
							a_full_pathname.set_position (a_pathname.line, a_pathname.column)
						else
							a_full_pathname := a_pathname
						end
					end
				end
				a_cluster := new_cluster (a_name, a_full_pathname)
				a_cluster.set_exclude (an_exclude)
				if a_parent_cluster.subclusters /= Void then
					a_parent_cluster.add_subcluster (a_cluster)
				else
					a_parent_cluster.set_subclusters (new_clusters (a_cluster))
				end
			else
					-- TODO: better error handling
				report_error ("Parent cluster '" + a_parent.name + "' not found.")
				abort
			end
		end

feature {NONE} -- AST factory

	new_cluster (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER): ET_LACE_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_cluster (a_name, a_pathname)
			named_clusters.force_last (Result, a_name)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_LACE_CLUSTER): ET_LACE_CLUSTERS is
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			Result := ast_factory.new_clusters (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_universe (a_clusters: ET_LACE_CLUSTERS): ET_LACE_UNIVERSE is
			-- New class universe
		local
			an_error_handler: ET_ERROR_HANDLER
			a_factory: ET_AST_FACTORY
		do
			an_error_handler := ast_factory.new_error_handler
			a_factory := ast_factory.new_ast_factory
			Result := ast_factory.new_universe (a_clusters, a_factory, an_error_handler)
		ensure
			universe_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	named_clusters: DS_HASH_TABLE [ET_LACE_CLUSTER, ET_IDENTIFIER]
			-- Named clusters

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				std.error.put_string (f_buffer.file.name)
				std.error.put_string (", line ")
			else
				std.error.put_string ("line ")
			end
			std.error.put_integer (eif_lineno)
			std.error.put_string (": ")
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

invariant

	ast_factory_not_void: ast_factory /= Void
	named_clusters_not_void: named_clusters /= Void
	no_void_named_cluster: not named_clusters.has_item (Void)

end
