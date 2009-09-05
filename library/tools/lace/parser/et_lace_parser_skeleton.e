indexing

	description:

		"Lace parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2009, Eric Bezault and others"
	license: "MIT License"
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

	ET_SHARED_TOKEN_CONSTANTS
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
			create external_include_pathnames.make (20)
			create external_object_pathnames.make (20)
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
			last_system := Void
			override_cluster_names.wipe_out
			named_clusters.wipe_out
			external_include_pathnames.wipe_out
			external_object_pathnames.wipe_out
			metadata_cache_path_value := Void
			msil_clr_version_value := Void
			console_application_value := True
			exception_trace_value := False
			trace_value := False
			yyparse
		end

feature -- Access

	last_system: ET_LACE_SYSTEM
			-- Eiffel system being parsed

	ast_factory: ET_LACE_AST_FACTORY
			-- Abstract Syntax Tree factory

feature -- Default options

	console_application_value: BOOLEAN
			-- Value of 'console_application' default option, if any;
			-- True by default

	exception_trace_value: BOOLEAN
			-- Value of 'exception_trace' default option, if any;
			-- False by default

	metadata_cache_path_value: ET_IDENTIFIER
			-- Value of 'metadata_cache_path' default option, if any

	msil_clr_version_value: ET_IDENTIFIER
			-- Value of 'msil_clr_version' default option, if any

	override_cluster_names: DS_HASH_SET [ET_IDENTIFIER]
			-- Override cluster names, if any

	trace_value: BOOLEAN
			-- Value of 'trace' default option, if any;
			-- False by default

	external_include_pathnames: DS_ARRAYED_LIST [STRING]
			-- External include pathnames

	external_object_pathnames: DS_ARRAYED_LIST [STRING]
			-- External object pathnames

feature {NONE} -- AST factory

	new_assembly (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER): ET_LACE_DOTNET_ASSEMBLY is
			-- New assembly
		require
			a_name_not_void: a_name /= Void
		do
			if last_system /= Void then
				Result := ast_factory.new_assembly (a_name, a_pathname, last_system)
			else
				Result := ast_factory.new_assembly (a_name, a_pathname, tokens.empty_system)
			end
		ensure
			assembly_not_void: Result /= Void
		end

	new_assemblies (an_assembly: ET_LACE_DOTNET_ASSEMBLY): ET_ADAPTED_DOTNET_ASSEMBLIES is
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
			if last_system /= Void then
				Result := ast_factory.new_cluster (a_name, a_pathname, last_system)
			else
				Result := ast_factory.new_cluster (a_name, a_pathname, tokens.empty_system)
			end
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

	new_default_value (a_name, a_value: ET_IDENTIFIER): ANY is
			-- New default value;
			-- Void if not recognized
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			if a_name.same_identifier (override_cluster_option) then
				override_cluster_names.force_last (a_value)
			elseif a_name.same_identifier (console_application_option) then
				if a_value.same_identifier (yes_value) then
					console_application_value := True
				elseif a_value.same_identifier (no_value) then
					console_application_value := False
				else
						-- TODO: better error handling
					report_error ("Option 'console_application' should be set to either 'yes' or 'no'.")
				end
			elseif a_name.same_identifier (exception_trace_option) then
				if a_value.same_identifier (yes_value) then
					exception_trace_value := True
				elseif a_value.same_identifier (no_value) then
					exception_trace_value := False
				else
						-- TODO: better error handling
					report_error ("Option 'exception_trace' should be set to either 'yes' or 'no'.")
				end
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
			elseif a_name.same_identifier (trace_option) then
				if a_value.same_identifier (yes_value) then
					trace_value := True
				elseif a_value.same_identifier (no_value) then
					trace_value := False
				else
						-- TODO: better error handling
					report_error ("Option 'trace' should be set to either 'yes' or 'no'.")
				end
			end
		end

	new_gac_assembly (a_name: ET_IDENTIFIER; an_assembly_name, a_version, a_culture, a_public_key_token: ET_IDENTIFIER): ET_LACE_DOTNET_GAC_ASSEMBLY is
			-- New GAC assembly
		require
			a_name_not_void: a_name /= Void
			an_assembly_name_not_void: an_assembly_name /= Void
		do
			if last_system /= Void then
				Result := ast_factory.new_gac_assembly (a_name, an_assembly_name, last_system)
			else
				Result := ast_factory.new_gac_assembly (a_name, an_assembly_name, tokens.empty_system)
			end
			Result.set_assembly_version_id (a_version)
			Result.set_assembly_culture_id (a_culture)
			Result.set_assembly_public_key_token_id (a_public_key_token)
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

	new_system (a_name: STRING): ET_LACE_SYSTEM is
			-- New Eiffel system
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			Result := ast_factory.new_system (a_name)
			Result.set_error_handler (ast_factory.new_error_handler)
			Result.set_ast_factory (ast_factory.new_ast_factory)
		ensure
			system_not_void: Result /= Void
		end

	set_system (a_system: ET_LACE_SYSTEM) is
			-- Set Eiffel system.
		require
			a_system_not_void: a_system /= Void
		do
			from override_cluster_names.start until override_cluster_names.after loop
				named_clusters.search (override_cluster_names.item_for_iteration)
				if named_clusters.found then
					named_clusters.found_item.set_override (True)
				end
				override_cluster_names.forth
			end
			a_system.set_external_include_pathnames (external_include_pathnames)
			create external_include_pathnames.make (20)
			a_system.set_external_object_pathnames (external_object_pathnames)
			create external_object_pathnames.make (20)
			a_system.set_console_application_mode (console_application_value)
			a_system.set_exception_trace_mode (exception_trace_value)
			a_system.set_trace_mode (trace_value)
		end

	add_external_value (a_name, a_value: ET_IDENTIFIER) is
			-- Add external value.
			-- Do nothing if not recognized.
		require
			a_name_not_void: a_name /= Void
			a_value_not_void: a_value /= Void
		do
			if a_name.same_identifier (include_path_option) then
				external_include_pathnames.force_last (a_value.name)
			elseif a_name.same_identifier (object_option) then
				external_object_pathnames.force_last (a_value.name)
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

	console_application_option: ET_IDENTIFIER is
			-- 'console_application' external option name
		once
			Result := new_identifier ("console_application")
		ensure
			console_application_option_not_void: Result /= Void
		end

	exception_trace_option: ET_IDENTIFIER is
			-- 'exception_trace' external option name
		once
			Result := new_identifier ("exception_trace")
		ensure
			exception_trace_option_not_void: Result /= Void
		end

	include_path_option: ET_IDENTIFIER is
			-- 'include_path' external option name
		once
			Result := new_identifier ("include_path")
		ensure
			include_path_option_not_void: Result /= Void
		end

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

	object_option: ET_IDENTIFIER is
			-- 'object' external option name
		once
			Result := new_identifier ("object")
		ensure
			object_option_not_void: Result /= Void
		end

	override_cluster_option: ET_IDENTIFIER is
			-- 'override_cluster' default option name
		once
			Result := new_identifier ("override_cluster")
		ensure
			override_cluster_option_not_void: Result /= Void
		end

	trace_option: ET_IDENTIFIER is
			-- 'trace' external option name
		once
			Result := new_identifier ("trace")
		ensure
			trace_option_not_void: Result /= Void
		end

	no_value: ET_IDENTIFIER is
			-- 'no' value
		once
			Result := new_identifier ("no")
		ensure
			no_value_not_void: Result /= Void
		end

	yes_value: ET_IDENTIFIER is
			-- 'yes' value
		once
			Result := new_identifier ("yes")
		ensure
			yes_value_not_void: Result /= Void
		end

invariant

	ast_factory_not_void: ast_factory /= Void
	named_clusters_not_void: named_clusters /= Void
	no_void_named_cluster: not named_clusters.has_void_item
	override_cluster_names_not_void: override_cluster_names /= Void
	no_void_override_cluster_name: not override_cluster_names.has_void
	external_include_pathnames_not_void: external_include_pathnames /= Void
	no_void_external_include_pathname: not external_include_pathnames.has_void
	external_object_pathnames_not_void: external_object_pathnames /= Void
	no_void_external_object_pathname: not external_object_pathnames.has_void

end
