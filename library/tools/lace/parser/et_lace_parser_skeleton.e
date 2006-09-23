indexing

	description:

		"Lace parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_LACE_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON
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

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make_standard is
			-- Create a new Lace parser.
			-- Error messages will be sent to standard files.
		local
			a_handler: ET_LACE_ERROR_HANDLER
		do
			create a_handler.make_standard
			make (a_handler)
		end

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
			create override_cluster_names.make (5)
			make_lace_scanner ("unknown file", an_error_handler)
			make_parser_skeleton
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Ace file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			reset
			named_clusters.wipe_out
			set_input_buffer (new_file_buffer (a_file))
			last_universe := Void
			override_cluster_names.wipe_out
			named_clusters.wipe_out
			yyparse
		end

	parse (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse Ace file `a_file'.
		obsolete
			"[030724] Use `parse_file (a_file)' instead."
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			parse_file (a_file)
		end

feature -- Access

	last_universe: ET_LACE_UNIVERSE
			-- Universe being parsed

	ast_factory: ET_LACE_AST_FACTORY
			-- Abstract Syntax Tree factory

feature -- Default options

	metadata_cache_path_value: ET_IDENTIFIER
			-- Value of 'metadata_cache_path' default option, if any

	msil_clr_version_value: ET_IDENTIFIER
			-- Value of 'msil_clr_version' default option, if any

	override_cluster_names: DS_HASH_SET [ET_IDENTIFIER]
			-- Override cluster names, if any

feature {NONE} -- AST factory

	new_assembly (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER): ET_LACE_DOTNET_ASSEMBLY is
			-- New assembly
		require
			a_name_not_void: a_name /= Void
		do
			Result := ast_factory.new_assembly (a_name, a_pathname)
		ensure
			assembly_not_void: Result /= Void
		end

	new_assemblies (an_assembly: ET_LACE_DOTNET_ASSEMBLY): ET_LACE_DOTNET_ASSEMBLIES is
			-- New assembly list
		require
			an_assembly_not_void: an_assembly /= Void
		do
			Result := ast_factory.new_assemblies (an_assembly)
		ensure
			assemblies_not_void: Result /= Void
		end

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

	new_gac_assembly (a_name: ET_IDENTIFIER; an_assembly_name, a_version, a_culture, a_public_key_token: ET_IDENTIFIER): ET_LACE_DOTNET_GAC_ASSEMBLY is
			-- New GAC assembly
		require
			a_name_not_void: a_name /= Void
			an_assembly_name_not_void: an_assembly_name /= Void
		do
			Result := ast_factory.new_gac_assembly (a_name, an_assembly_name)
			Result.set_assembly_version (a_version)
			Result.set_assembly_culture (a_culture)
			Result.set_assembly_public_key_token (a_public_key_token)
		ensure
			assembly_not_void: Result /= Void
		end

	new_qualified_subcluster (a_name: ET_IDENTIFIER; a_parent: ET_IDENTIFIER;
		a_pathname: ET_IDENTIFIER; an_exclude: ET_LACE_EXCLUDE): ET_LACE_CLUSTER is
			-- New subcluster named `a_name' with pathname `a_pathname'
			-- Add this subcluster to parent cluster named `a_parent'.
			-- The leading '$' sign in `a_pathname' will be replaced by
			-- the full pathname of the parent cluster.
			-- (This is the way to nest clusters in ISE's LACE syntax.)
		require
			a_name_not_void: a_name /= Void
			a_parent_not_void: a_parent /= Void
			a_pathname_not_void: a_pathname /= Void
		local
			a_full_pathname_string, a_pathname_string: STRING
			a_parent_full_pathname: STRING
			a_full_pathname: ET_IDENTIFIER
			a_parent_cluster: ET_LACE_CLUSTER
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
							create a_full_pathname_string.make (a_parent_full_pathname.count + nb - 1)
							a_full_pathname_string.append_string (a_parent_full_pathname)
							a_full_pathname_string.append_string (a_pathname_string.substring (2, nb))
							create a_full_pathname.make (a_full_pathname_string)
							a_full_pathname.set_position (a_pathname.line, a_pathname.column)
						else
							a_full_pathname := a_pathname
						end
					end
				end
				Result := new_cluster (a_name, a_full_pathname)
				Result.set_exclude (an_exclude)
				if a_parent_cluster.subclusters /= Void then
					a_parent_cluster.add_subcluster (Result)
				else
					a_parent_cluster.set_subclusters (new_clusters (Result))
				end
			else
					-- TODO: better error handling
				report_error ("Parent cluster '" + a_parent.name + "' not found.")
				abort
				Result := new_cluster (a_name, a_pathname)
				Result.set_exclude (an_exclude)
			end
		ensure
			subcluster_not_void: Result /= Void
		end

	new_universe (a_clusters: ET_LACE_CLUSTERS): ET_LACE_UNIVERSE is
			-- New class universe
		local
			an_error_handler: ET_ERROR_HANDLER
			a_factory: ET_AST_FACTORY
		do
			from override_cluster_names.start until override_cluster_names.after loop
				named_clusters.search (override_cluster_names.item_for_iteration)
				if named_clusters.found then
					named_clusters.found_item.set_override (True)
				end
				override_cluster_names.forth
			end
			an_error_handler := ast_factory.new_error_handler
			a_factory := ast_factory.new_ast_factory
			Result := ast_factory.new_universe (a_clusters, a_factory, an_error_handler)
		ensure
			universe_not_void: Result /= Void
		end

	new_default_value (a_name, a_value: ET_IDENTIFIER): ANY is
			-- New default value;
			-- Void if not recognized
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			if a_name.same_identifier (override_cluster_option) then
				override_cluster_names.force_last (a_value)
			elseif a_name.same_identifier (msil_clr_version_option) then
				if msil_clr_version_value /= Void then
						-- TODO: better error handling
					report_error ("Option 'msil_clr_version' already set to '" + msil_clr_version_value.name + "'.")
				else
					msil_clr_version_value := a_value
				end
			elseif a_name.same_identifier (metadata_cache_path_option) then
				if metadata_cache_path_value /= Void then
						-- TODO: better error handling
					report_error ("Option 'metadata_cache_path' already set to '" + metadata_cache_path_value.name + "'.")
				else
					metadata_cache_path_value := a_value
				end
			end
		end

feature {NONE} -- Implementation

	named_clusters: DS_HASH_TABLE [ET_LACE_CLUSTER, ET_IDENTIFIER]
			-- Named clusters

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
			a_lined_message: STRING
			an_error: UT_MESSAGE
		do
			create a_lined_message.make (30)
			f_buffer ?= input_buffer
			if f_buffer /= Void then
				a_lined_message.append_string (f_buffer.file.name)
				a_lined_message.append_string (", line ")
			else
				a_lined_message.append_string ("line ")
			end
			INTEGER_.append_decimal_integer (eif_lineno, a_lined_message)
			a_lined_message.append_string (": ")
			a_lined_message.append_string (a_message)
			create an_error.make (a_lined_message)
			error_handler.report_error (an_error)
		end

feature {NONE} -- Constants

	metadata_cache_path_option: ET_IDENTIFIER is
			-- 'metadata_cache_path' default option name
		once
			Result := new_identifier ("metadata_cache_path")
		ensure
			metadata_cache_path_option_not_void: Result /= Void
		end

	msil_clr_version_option: ET_IDENTIFIER is
			-- 'msil_clr_version' default option name
		once
			Result := new_identifier ("msil_clr_version")
		ensure
			msil_clr_version_option_not_void: Result /= Void
		end

	override_cluster_option: ET_IDENTIFIER is
			-- 'override_cluster' default option name
		once
			Result := new_identifier ("override_cluster")
		ensure
			override_cluster_option_not_void: Result /= Void
		end

invariant

	ast_factory_not_void: ast_factory /= Void
	named_clusters_not_void: named_clusters /= Void
	no_void_named_cluster: not named_clusters.has_item (Void)
	override_cluster_names_not_void: override_cluster_names /= Void
	no_void_override_cluster_name: not override_cluster_names.has (Void)

end
