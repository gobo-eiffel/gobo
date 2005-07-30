indexing

	description:

		"Eiffel parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EIFFEL_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton,
			parse as yyparse
		redefine
			report_error
		end

	ET_EIFFEL_SCANNER_SKELETON
		rename
			make as make_eiffel_scanner,
			make_with_factory as make_eiffel_scanner_with_factory
		redefine
			reset, universe
		end

	ET_CLASS_PROCESSOR
		rename
			make as make_class_processor,
			process_identifier as process_ast_identifier,
			process_c1_character_constant as process_ast_c1_character_constant,
			process_c2_character_constant as process_ast_c2_character_constant,
			process_regular_manifest_string as process_ast_regular_manifest_string
		undefine
			error_handler
		redefine
			process_class, universe
		end

	ET_SHARED_EIFFEL_BUFFER
		export {NONE} all end

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_universe: ET_UNIVERSE; an_error_handler: like error_handler) is
			-- Create a new Eiffel parser.
		require
			a_universe_not_void: a_universe /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			create a_factory.make
			make_with_factory (a_universe, a_factory, an_error_handler)
		ensure
			universe_set: universe = a_universe
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_universe: ET_UNIVERSE; a_factory: like ast_factory;
		an_error_handler: like error_handler) is
			-- Create a new Eiffel parser.
		require
			a_universe_not_void: a_universe /= Void
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			create counters.make (Initial_counters_capacity)
			create last_keywords.make (Initial_last_keywords_capacity)
			create last_symbols.make (Initial_last_symbols_capacity)
			create assertions.make (Initial_assertions_capacity)
			create features.make (Initial_features_capacity)
			create constraints.make (Initial_constraints_capacity)
			create providers.make (Initial_providers_capacity)
			make_eiffel_scanner_with_factory ("unknown file", a_universe, a_factory, an_error_handler)
			make_class_processor (a_universe)
			make_parser_skeleton
		ensure
			universe_set: universe = a_universe
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			precursor
			Eiffel_buffer.set_end_of_file
			counters.wipe_out
			last_keywords.wipe_out
			last_symbols.wipe_out
			providers.wipe_out
			assertions.wipe_out
			features.wipe_out
			constraints.wipe_out
			last_class := Void
			last_clients := Void
			last_export_clients := Void
			last_feature_clause := Void
			last_local_variables := Void
			last_formal_arguments := Void
			cluster := Void
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

	cluster: ET_CLUSTER
			-- Cluster containing the class being parsed

	time_stamp: INTEGER
			-- Time stamp of file being parsed

feature -- Setting

	set_universe (a_universe: like universe) is
			-- Set `universe' to `a_universe'.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

	set_ast_factory (a_factory: like ast_factory) is
			-- Set `ast_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

	set_error_handler (a_handler: like error_handler) is
			-- Set `error_handler' to `a_handler'.
		require
			a_handler_not_void: a_handler /= Void
		do
			error_handler := a_handler
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Status report

	is_null: BOOLEAN
			-- Is current processor a null processor?

	providers_enabled: BOOLEAN
			-- Should providers be built when parsing a class?

	overriding_class_added: BOOLEAN
			-- Has an overriding class been added to universe?

feature -- Status setting

	set_null (b: BOOLEAN) is
			-- Set `is_null' to `b'.
		do
			is_null := b
		ensure
			null_set: is_null = b
		end

	set_providers_enabled (b: BOOLEAN) is
			-- Set `providers_enabled' to `b'.
		do
			providers_enabled := b
		ensure
			providers_enabled_set: providers_enabled = b
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_time_stamp: INTEGER; a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_file' within cluster `a_cluster'.
			-- `a_filename' is the filename of `a_file' and `a_time_stamp'
			-- its time stamp just before it was open.
			-- Set `overriding_class_added' if a class overriding
			-- another one has been added.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			overriding_class_added := False
			if not is_null then
				debug ("GELINT")
					std.error.put_string ("Parsing file '")
					std.error.put_string (a_filename)
					std.error.put_line ("%'")
				end
				filename := a_filename
				time_stamp := a_time_stamp
				cluster := a_cluster
				input_buffer := Eiffel_buffer
				Eiffel_buffer.set_file (a_file)
				yy_load_input_buffer
				yyparse
				reset
			end
		rescue
			reset
		end

	parse_cluster (a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_cluster' (recursively).
			-- Set `overriding_class_added' if a class overriding
			-- another one has been added.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_time_stamp: INTEGER
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			l_subclusters: ET_CLUSTERS
			l_overriding_added: BOOLEAN
		do
			overriding_class_added := False
			if not is_null then
				debug ("GELINT")
					std.error.put_string ("Parse cluster '")
					std.error.put_string (a_cluster.full_pathname)
					std.error.put_line ("%'")
				end
				if not a_cluster.is_abstract then
					dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
					dir := tmp_directory
					dir.reset (dir_name)
					dir.open_read
					if dir.is_open_read then
						from dir.read_entry until dir.end_of_input loop
							s := dir.last_entry
							if a_cluster.is_valid_eiffel_filename (s) then
								a_filename := file_system.pathname (dir_name, s)
								a_file := tmp_file
								a_file.reset (a_filename)
								if eiffel_compiler.is_se then
										-- KL_FILE.time_stamp is too slow with SE.
									a_time_stamp := -1
								else
									a_time_stamp := a_file.time_stamp
								end
								a_file.open_read
								if a_file.is_open_read then
									parse_file (a_file, a_filename, a_time_stamp, a_cluster)
									if overriding_class_added then
										l_overriding_added := True
									end
									a_file.close
								else
									error_handler.report_gcaab_error (a_cluster, a_filename)
								end
							elseif a_cluster.is_recursive and then a_cluster.is_valid_directory_name (s) then
								if file_system.directory_exists (file_system.pathname (dir_name, s)) then
									a_cluster.add_recursive_cluster (s)
								end
							end
							dir.read_entry
						end
						dir.close
					else
						error_handler.report_gcaaa_error (a_cluster, dir_name)
					end
				end
				build_provider_constraint (a_cluster)
				build_dependant_constraint (a_cluster)
				l_subclusters := a_cluster.subclusters
				if l_subclusters /= Void then
					parse_clusters (l_subclusters)
				end
				if l_overriding_added then
					overriding_class_added := True
				end
			end
		end

	parse_clusters (a_clusters: ET_CLUSTERS) is
			-- Parse all classes in `a_clusters' (recursively).
			-- Set `overriding_class_added' if a class overriding
			-- another one has been added.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
			l_overriding_added: BOOLEAN
		do
			overriding_class_added := False
			if not is_null then
				l_clusters := a_clusters.clusters
				nb := l_clusters.count
				from i := 1 until i > nb loop
					parse_cluster (l_clusters.item (i))
					if overriding_class_added then
						l_overriding_added := True
					end
					i := i + 1
				end
				overriding_class_added := l_overriding_added
			end
		end

	reparse_cluster (a_cluster: ET_CLUSTER; a_override, a_read_only: BOOLEAN) is
			-- Parse all classes in `a_cluster' (recursively) again.
			-- `a_override' means that only override clusters are taken into account.
			-- `a_read_only' means that read-only clusters are taken into account.
			-- Set `overriding_class_added' if a class overriding
			-- another one has been added.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_time_stamp: INTEGER
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			l_subclusters: ET_CLUSTERS
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_class: ET_CLASS
			i, nb: INTEGER
			l_overriding_added: BOOLEAN
		do
			overriding_class_added := False
			if not is_null then
				debug ("GELINT")
					std.error.put_string ("Parse cluster '")
					std.error.put_string (a_cluster.full_pathname)
					std.error.put_line ("%'")
				end
				if (a_read_only or else not a_cluster.is_read_only) and then (a_override implies a_cluster.is_override) and then not a_cluster.is_abstract then
					dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
					dir := tmp_directory
					dir.reset (dir_name)
					dir.open_read
					if dir.is_open_read then
						from dir.read_entry until dir.end_of_input loop
							s := dir.last_entry
							if a_cluster.is_valid_eiffel_filename (s) then
								a_filename := file_system.pathname (dir_name, s)
								if l_classes = Void then
									l_classes := universe.classes_by_cluster (a_cluster)
								end
								l_class := Void
								nb := l_classes.count
								from i := 1 until i > nb loop
									l_class := l_classes.item (i)
									if STRING_.same_string (l_class.filename, a_filename) then
										i := nb + 1
									else
										l_class := Void
										i := i + 1
									end
								end
								if l_class = Void then
										-- This file is either new or has been marked as modified.
										-- We need to analyze it again.
									a_file := tmp_file
									a_file.reset (a_filename)
									if eiffel_compiler.is_se then
											-- KL_FILE.time_stamp is too slow with SE.
										a_time_stamp := -1
									else
										a_time_stamp := a_file.time_stamp
									end
									a_file.open_read
									if a_file.is_open_read then
										parse_file (a_file, a_filename, a_time_stamp, a_cluster)
										if overriding_class_added then
											l_overriding_added := True
										end
										a_file.close
									else
										error_handler.report_gcaab_error (a_cluster, a_filename)
									end
								end
							elseif a_cluster.is_recursive and then a_cluster.is_valid_directory_name (s) then
								if file_system.directory_exists (file_system.pathname (dir_name, s)) then
									a_cluster.add_recursive_cluster (s)
								end
							end
							dir.read_entry
						end
						dir.close
					else
						error_handler.report_gcaaa_error (a_cluster, dir_name)
					end
				end
				build_provider_constraint (a_cluster)
				build_dependant_constraint (a_cluster)
				l_subclusters := a_cluster.subclusters
				if l_subclusters /= Void then
					reparse_clusters (l_subclusters, a_override, a_read_only)
				end
				if l_overriding_added then
					overriding_class_added := True
				end
			end
		end

	reparse_clusters (a_clusters: ET_CLUSTERS; a_override, a_read_only: BOOLEAN) is
			-- Parse all classes in `a_clusters' (recursively) again.
			-- `a_override' means that only override clusters are taken into account.
			-- `a_read_only' means that read-only clusters are taken into account.
			-- Set `overriding_class_added' if a class overriding
			-- another one has been added.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			l_cluster: ET_CLUSTER
			dir_name: STRING
			i, nb: INTEGER
			l_overriding_added: BOOLEAN
		do
			overriding_class_added := False
			if not is_null then
				l_clusters := a_clusters.clusters
				nb := l_clusters.count
				from i := 1 until i > nb loop
					l_cluster := l_clusters.item (i)
					if l_cluster.is_implicit and then (a_read_only or else not l_cluster.is_read_only) and then (a_override implies l_cluster.is_override) then
						dir_name := Execution_environment.interpreted_string (l_cluster.full_pathname)
						if not file_system.directory_exists (dir_name) then
							l_clusters.remove (i)
							nb := nb - 1
						else
							reparse_cluster (l_cluster, a_override, a_read_only)
							if overriding_class_added then
								l_overriding_added := True
							end
							i := i + 1
						end
					else
						reparse_cluster (l_cluster, a_override, a_read_only)
						if overriding_class_added then
							l_overriding_added := True
						end
						i := i + 1
					end
				end
				overriding_class_added := l_overriding_added
			end
		end

feature -- AST processing

	process_class (a_class: ET_CLASS) is
			-- Parse `a_class'.
			-- The class may end up with a syntax error status its
			-- `filename' didn't contain this class after all (i.e.
			-- if the preparsing phase gave errouneous result).
			-- Set `overriding_class_added' if a class overriding
			-- another one has been added.
		local
			a_filename: STRING
			a_time_stamp: INTEGER
			a_cluster: ET_CLUSTER
			a_file: KL_TEXT_INPUT_FILE
			an_overridden_class: ET_CLASS
		do
			overriding_class_added := False
			if is_null then
				-- Do nothing.
			elseif a_class = none_class then
				a_class.set_parsed
			elseif current_class /= unknown_class then
					-- Internal error (recursive call)
					-- This internal error is fatal.
				set_fatal_error (a_class)
				error_handler.report_giaae_error
			elseif a_class /= unknown_class then
				current_class := a_class
				if not current_class.is_parsed then
					if not current_class.is_preparsed then
						universe.preparse
					end
					if current_class.is_preparsed then
						a_filename := current_class.filename
						a_cluster := current_class.cluster
						an_overridden_class := current_class.overridden_class
						current_class.reset_all
						current_class.set_overridden_class (an_overridden_class)
						a_file := tmp_file
						a_file.reset (a_filename)
						if eiffel_compiler.is_se then
								-- KL_FILE.time_stamp is too slow with SE.
							a_time_stamp := -1
						else
							a_time_stamp := a_file.time_stamp
						end
						a_file.open_read
						if a_file.is_open_read then
							parse_file (a_file, a_filename, a_time_stamp, a_cluster)
							a_file.close
						else
							set_fatal_error (current_class)
							error_handler.report_gcaab_error (a_cluster, a_filename)
						end
					end
					if not current_class.is_parsed then
						set_fatal_error (current_class)
					end
				end
				current_class := unknown_class
			end
		ensure then
			is_parsed: not is_null implies a_class.is_parsed
		end

feature {NONE} -- Basic operations

	register_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		do
			if a_feature /= Void then
				universe.register_feature (a_feature)
				features.force_last (a_feature)
				features.finish
			end
				-- Reset local variables and formal arguments
				-- before reading the next feature.
			last_local_variables := Void
			last_formal_arguments := Void
		end

	register_synonym (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		do
			if a_feature /= Void then
				universe.register_feature (a_feature)
				if features.before then
					features.forth
				end
				features.force_left (a_feature)
				features.back
			end
		end

	register_constraint (a_constraint: ET_CONSTRAINT_TYPE) is
			-- Register generic constraint
		do
			constraints.force_last (a_constraint)
		ensure
			one_more: constraints.count = old constraints.count + 1
			registered: constraints.last = a_constraint
		end

	dummy_constraint (a_constraint: ET_CONSTRAINT_TYPE): ET_TYPE is
			-- Dummy type, or Void if `a_constraint' is Void
		do
			if a_constraint /= Void then
				Result := dummy_type
			end
		ensure
			void_type: a_constraint = Void implies Result = Void
			non_void_type: a_constraint /= Void implies Result /= Void
		end

	set_formal_parameters (a_parameters: ET_FORMAL_PARAMETER_LIST) is
			-- Set formal generic parameters of `last_class'.
		require
			no_constraint: a_parameters = Void implies constraints.is_empty
			same_count: a_parameters /= Void implies constraints.count = a_parameters.count
		local
			a_class: like last_class
			a_constrained_formal: ET_CONSTRAINED_FORMAL_PARAMETER
			a_constraint: ET_CONSTRAINT_TYPE
			a_type: ET_TYPE
			i, nb: INTEGER
		do
			if a_parameters /= Void then
				a_class := last_class
				if a_class /= Void then
					a_class.set_formal_parameters (a_parameters)
					nb := a_parameters.count
					from i := nb until i < 1 loop
						a_constrained_formal ?= a_parameters.formal_parameter (i)
						if a_constrained_formal /= Void then
							a_constraint := constraints.item (i)
							if a_constraint /= Void then
								a_type := a_constraint.resolved_syntactical_constraint (a_parameters, Current)
								if a_type /= Void then
									a_constrained_formal.set_constraint (a_type)
								else
									a_parameters.remove (i)
								end
							else
								a_parameters.remove (i)
							end
						end
						i := i - 1
					end
				end
			end
			constraints.wipe_out
		end

	set_class_features is
			-- Set features of `last_class'.
		local
			a_class: like last_class
			class_features: ET_FEATURE_LIST
			i, nb: INTEGER
		do
			a_class := last_class
			if a_class /= Void then
				nb := features.count
				create class_features.make_with_capacity (nb)
				from i := nb until i < 1 loop
					class_features.put_first (features.item (i))
					i := i - 1
				end
				a_class.set_features (class_features, nb)
			end
			features.wipe_out
		end

	set_class_providers is
			-- Set providers of `last_class' (when enabled).
		local
			l_providers: DS_HASH_SET [ET_CLASS]
			l_class: ET_CLASS
		do
			if providers_enabled then
				l_class := last_class
				if l_class /= Void then
					create l_providers.make (providers.count)
					l_class.set_providers (l_providers)
					from providers.start until providers.after loop
						l_providers.put_last (providers.item_for_iteration)
						providers.forth
					end
				end
			end
			providers.wipe_out
		end

	set_class_to_end (a_class: ET_CLASS; an_obsolete: ET_OBSOLETE; a_parents: ET_PARENT_LIST;
		a_creators: ET_CREATOR_LIST; a_convert_features: ET_CONVERT_FEATURE_LIST;
		a_feature_clauses: ET_FEATURE_CLAUSE_LIST; an_invariants: ET_INVARIANTS;
		a_second_indexing: ET_INDEXING_LIST; an_end: ET_KEYWORD) is
			-- Set various elements to `a_class'.
		local
			a_feature: ET_FEATURE
		do
			if a_class /= Void then
				a_class.set_obsolete_message (an_obsolete)
				a_class.set_parents (a_parents)
				a_class.set_creators (a_creators)
				a_class.set_convert_features (a_convert_features)
				a_class.set_feature_clauses (a_feature_clauses)
				a_class.set_invariants (an_invariants)
				a_class.set_second_indexing (a_second_indexing)
				if an_end /= Void then
					a_class.set_end_keyword (an_end)
				end
				if a_class = universe.general_class then
					a_feature := a_class.named_feature (tokens.default_create_feature_name)
					if a_feature /= Void then
						universe.set_default_create_seed (a_feature.first_seed)
					else
						set_fatal_error (a_class)
						error_handler.report_gvkfe1a_error (a_class, tokens.default_create_feature_name)
						universe.set_default_create_seed (0)
					end
					a_feature := a_class.named_feature (tokens.copy_feature_name)
					if a_feature /= Void then
						universe.set_copy_seed (a_feature.first_seed)
					else
						set_fatal_error (a_class)
						error_handler.report_gvkfe1a_error (a_class, tokens.copy_feature_name)
						universe.set_copy_seed (0)
					end
					if not universe.use_void_keyword then
						a_feature := a_class.named_feature (tokens.void_feature_name)
						if a_feature /= Void then
							universe.set_void_seed (a_feature.first_seed)
						else
							set_fatal_error (a_class)
							error_handler.report_gvkfe1a_error (a_class, tokens.void_feature_name)
							universe.set_void_seed (0)
						end
					end
				elseif a_class = universe.any_class then
					a_feature := a_class.named_feature (tokens.default_create_feature_name)
					if a_feature /= Void then
						universe.set_default_create_seed (a_feature.first_seed)
					elseif a_parents = Void or else a_parents.is_empty then
							-- If there is a parent class then the feature can be defined
							-- in class GENERAL.
						universe.set_default_create_seed (0)
					end
					a_feature := a_class.named_feature (tokens.copy_feature_name)
					if a_feature /= Void then
						universe.set_copy_seed (a_feature.first_seed)
					elseif a_parents = Void or else a_parents.is_empty then
							-- If there is a parent class then the feature can be defined
							-- in class GENERAL.
						universe.set_copy_seed (0)
					end
					a_feature := a_class.named_feature (tokens.void_feature_name)
					if a_feature /= Void then
						universe.set_void_seed (a_feature.first_seed)
					elseif a_parents = Void or else a_parents.is_empty then
							-- If there is a parent class then the feature can be defined
							-- in class GENERAL.
						universe.set_void_seed (0)
					end
				end
			end
		end

	set_class_to_inheritance_end (a_class: ET_CLASS; an_obsolete: ET_OBSOLETE; a_parents: ET_PARENT_LIST) is
			-- Set various elements to `a_class'.
			-- Note: This is the case where the following class declaration:
			--		class FOO inherit BAR end
			-- produces a grammar ambiguity and where, through shift/reduce
			-- conflicts, it has been parsed with 'end' being recognized as
			-- the end of the feature adaptation of BAR instead of as the
			-- end of the class FOO.
		local
			a_parent: ET_PARENT
			an_end: ET_KEYWORD
		do
			if a_class /= Void then
				if a_parents /= Void and then not a_parents.is_empty then
					a_parent := a_parents.last.parent
					an_end := a_parent.end_keyword
					if an_end /= Void and not a_parent.has_feature_adaptation then
						a_parent.set_end_keyword (Void)
					else
						an_end := Void
					end
				end
			end
			set_class_to_end (a_class, an_obsolete, a_parents, Void, Void, Void, Void, Void, an_end)
		end

	add_expression_assertion (an_expression: ET_EXPRESSION; a_semicolon: ET_SYMBOL) is
			-- Add `an_expression' assertion, optionally followed
			-- by `a_semicolon', to `assertions'.
		local
			an_assertion: ET_ASSERTION_ITEM
			a_tagged: ET_TAGGED_ASSERTION
			done: BOOLEAN
		do
			if not assertions.is_empty then
				a_tagged ?= assertions.last
				if a_tagged /= Void and then a_tagged.expression = Void then
					if an_expression /= Void then
						a_tagged.set_expression (an_expression)
						if a_semicolon /= Void then
							an_assertion := ast_factory.new_assertion_semicolon (a_tagged, a_semicolon)
							if an_assertion /= Void then
								assertions.replace (an_assertion, assertions.count)
							else
								assertions.remove_last
							end
						end
					else
						assertions.remove_last
					end
					done := True
				end
			end
			if not done then
				if a_semicolon /= Void then
					an_assertion := ast_factory.new_assertion_semicolon (an_expression, a_semicolon)
				else
					an_assertion := an_expression
				end
				if an_assertion /= Void then
					assertions.force_last (an_assertion)
				end
			end
		end

	add_tagged_assertion (a_tag: ET_IDENTIFIER; a_colon: ET_SYMBOL; a_semicolon: ET_SYMBOL) is
			-- Add tagged assertion, optionally followed
			-- by `a_semicolon', to `assertions'.
		local
			an_assertion: ET_TAGGED_ASSERTION
			an_assertion_item: ET_ASSERTION_ITEM
		do
			an_assertion := ast_factory.new_tagged_assertion (ast_factory.new_tag (a_tag, a_colon))
			if a_semicolon /= Void then
				an_assertion_item := ast_factory.new_assertion_semicolon (an_assertion, a_semicolon)
			else
				an_assertion_item := an_assertion
			end
			if an_assertion_item /= Void then
				assertions.force_last (an_assertion_item)
			end
		end

feature {ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM, ET_CONSTRAINT_ACTUAL_PARAMETER_LIST} -- Generic constraints

	resolved_constraint_actual_parameter_comma (a_constraint: ET_CONSTRAINT_ACTUAL_PARAMETER_COMMA;
		a_formals: ET_FORMAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER_ITEM is
			-- Version of `a_constraint', appearing in the constraint
			-- of one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
		local
			a_parameter: ET_ACTUAL_PARAMETER
		do
			a_parameter := a_constraint.actual_parameter.resolved_syntactical_constraint (a_formals, Current)
			if a_parameter /= Void then
				Result := ast_factory.new_actual_parameter_comma (a_parameter, a_constraint.comma)
			end
		end

	resolved_constraint_qualified_actual_parameter (a_constraint: ET_CONSTRAINT_QUALIFIED_ACTUAL_PARAMETER;
		a_formals: ET_FORMAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER is
			-- Version of `a_constraint', appearing in the constraint
			-- of one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
		do
			Result := a_constraint.type.resolved_syntactical_constraint (a_formals, Current)
		end

	resolved_constraint_named_type (a_constraint: ET_CONSTRAINT_NAMED_TYPE;
		a_formals: ET_FORMAL_PARAMETER_LIST): ET_TYPE is
			-- Version of `a_constraint', appearing in the constraint of
			-- one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
		local
			a_name: ET_IDENTIFIER
			a_formal: ET_FORMAL_PARAMETER
			a_type_mark: ET_KEYWORD
			a_base_class: ET_CLASS
		do
			a_name := a_constraint.name
			a_type_mark := a_constraint.type_mark
			a_formal := a_formals.formal_parameter_by_name (a_name)
			if a_formal /= Void then
				if a_type_mark /= Void then
						-- A formal parameter cannot be prefixed by
						-- 'expanded' or 'reference'.
					report_syntax_error (a_type_mark.position)
				end
				Result := ast_factory.new_formal_parameter_type (a_name, a_formal.index)
			else
				a_base_class := universe.eiffel_class (a_name)
				if providers_enabled then
					providers.force_last (a_base_class)
				end
				a_base_class.set_in_system (True)
				if a_base_class = universe.tuple_class then
					if a_type_mark /= Void then
							-- A TUPLE type is not a class type. It cannot
							-- be prefixed by 'expanded' or 'reference'.
						report_syntax_error (a_type_mark.position)
					end
					Result := ast_factory.new_tuple_type (a_name, Void)
				else
					Result := ast_factory.new_class_type (a_type_mark, a_name, a_base_class)
				end
			end
		end

	resolved_constraint_generic_named_type (a_constraint: ET_CONSTRAINT_GENERIC_NAMED_TYPE;
		a_formals: ET_FORMAL_PARAMETER_LIST): ET_TYPE is
			-- Version `a_constraint', appearing in the constraint of
			-- one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
		local
			a_name: ET_IDENTIFIER
			a_type_mark: ET_KEYWORD
			a_formal: ET_FORMAL_PARAMETER
			a_base_class: ET_CLASS
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_name := a_constraint.name
			a_type_mark := a_constraint.type_mark
			a_formal := a_formals.formal_parameter_by_name (a_name)
			if a_formal /= Void then
				if a_type_mark /= Void then
						-- A formal parameter cannot be prefixed by
						-- 'expanded' or 'reference'.
					report_syntax_error (a_type_mark.position)
				end
					-- A formal parameter cannot have actual generic parameters.
				report_syntax_error (a_constraint.actual_parameters.position)
				Result := ast_factory.new_formal_parameter_type (a_name, a_formal.index)
			else
				a_base_class := universe.eiffel_class (a_name)
				a_parameters := a_constraint.actual_parameters.resolved_syntactical_constraint (a_formals, Current)
				if a_parameters /= Void then
					if providers_enabled then
						providers.force_last (a_base_class)
					end
					a_base_class.set_in_system (True)
					if a_base_class = universe.tuple_class then
						if a_type_mark /= Void then
								-- A TUPLE type is not a class type. It cannot
								-- be prefixed by 'expanded' or 'reference'.
							report_syntax_error (a_type_mark.position)
						end
						Result := ast_factory.new_tuple_type (a_name, a_parameters)
					else
						Result := ast_factory.new_generic_class_type (a_type_mark, a_name, a_parameters, a_base_class)
					end
				end
			end
		end

	resolved_constraint_actual_parameter_list (a_constraint: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST;
		a_formals: ET_FORMAL_PARAMETER_LIST): ET_ACTUAL_PARAMETER_LIST is
			-- Version of `a_constraint', appearing in the constraint of
			-- one of the formal generic parameters in `a_formals', where
			-- class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
		local
			i, nb: INTEGER
			a_parameter: ET_ACTUAL_PARAMETER_ITEM
		do
			nb := a_constraint.count
			Result := ast_factory.new_actual_parameters (a_constraint.left_bracket, a_constraint.right_bracket, nb)
			if Result /= Void then
				from i := nb until i < 1 loop
					a_parameter := a_constraint.item (i).resolved_syntactical_constraint (a_formals, Current)
					if a_parameter /= Void then
						Result.put_first (a_parameter)
					end
					i := i - 1
				end
			end
		end

feature {NONE} -- AST factory

	new_actual_parameter (a_type: ET_TYPE): ET_ACTUAL_PARAMETER is
			-- New actual parameter
		do
			Result := ast_factory.new_actual_parameter (a_type)
		end

	new_agent_identifier_target (an_identifier: ET_IDENTIFIER): ET_IDENTIFIER is
			-- New agent identifier target
		local
			a_seed: INTEGER
		do
			if an_identifier /= Void then
				Result := an_identifier
				if last_formal_arguments /= Void then
					a_seed := last_formal_arguments.index_of (an_identifier)
					if a_seed /= 0 then
						an_identifier.set_seed (a_seed)
						an_identifier.set_argument (True)
					end
				end
				if a_seed = 0 and then last_local_variables /= Void then
					a_seed := last_local_variables.index_of (an_identifier)
					if a_seed /= 0 then
						an_identifier.set_seed (a_seed)
						an_identifier.set_local (True)
					end
				end
			end
		end

	new_alias_free_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_FREE_NAME is
			-- New alias free feature name
		do
			if a_string /= Void then
				if a_string.value.count > 0 then
					Result := ast_factory.new_alias_free_name (an_alias, a_string)
				else
					-- TODO: error.
				end
			else
				Result := ast_factory.new_alias_free_name (an_alias, a_string)
			end
		end

	new_bit_n (a_bit: ET_IDENTIFIER; an_int: ET_INTEGER_CONSTANT): ET_BIT_N is
			-- New 'BIT N' type
		do
			Result := ast_factory.new_bit_n (a_bit, an_int)
			if Result /= Void then
				Result.compute_size
				if Result.has_size_error then
					if last_class /= Void then
						last_class.set_syntax_error
						error_handler.report_vtbt0c_error (last_class, Result)
					else
						error_handler.report_syntax_error (filename, Result.constant.position)
					end
				elseif Result.size = 0 and Result.constant.is_negative then
						-- Not considered as a fatal error by gelint.
					if last_class /= Void then
						error_handler.report_vtbt0d_error (last_class, Result)
					else
						error_handler.report_syntax_error (filename, Result.constant.position)
					end
				end
			end
		end

	new_check_instruction (a_check: ET_KEYWORD; an_end: ET_KEYWORD): ET_CHECK_INSTRUCTION is
			-- New check instruction
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_check_instruction (a_check, an_end, 0)
			else
				Result := ast_factory.new_check_instruction (a_check, an_end, i)
				if Result /= Void then
					from until i < 1 loop
						Result.put_first (assertions.item (i))
						i := i - 1
					end
				end
				assertions.wipe_out
			end
		end

	new_constraint_actual_parameter (a_type: ET_CONSTRAINT_TYPE): ET_CONSTRAINT_ACTUAL_PARAMETER is
			-- New actual parameter appearing in a generic constraint
		do
			Result := ast_factory.new_constraint_actual_parameter (a_type)
		end

	new_constrained_formal_parameter (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER; an_arrow: ET_SYMBOL;
		a_constraint: ET_TYPE; a_creation: ET_CONSTRAINT_CREATOR): ET_CONSTRAINED_FORMAL_PARAMETER is
			-- New constrained formal generic parameter
		do
			Result := ast_factory.new_constrained_formal_parameter (a_type_mark, a_name, an_arrow, a_constraint, a_creation)
		end

	new_constraint_named_type (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER;
		a_parameters: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST): ET_CONSTRAINT_NAMED_TYPE is
			-- New Eiffel class type or formal generic paramater
			-- appearing in a generic constraint
		do
			if a_parameters /= Void then
				Result := ast_factory.new_constraint_generic_named_type (a_type_mark, a_name, a_parameters)
			else
				Result := ast_factory.new_constraint_named_type (a_type_mark, a_name)
			end
		end

	new_external_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE;
		an_alias: ET_EXTERNAL_ALIAS; a_postconditions: ET_POSTCONDITIONS;
		an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_FUNCTION is
			-- New external function
		do
			Result := ast_factory.new_external_function (a_name, args, a_type, an_assigner, an_is, a_first_indexing,
				an_obsolete, a_preconditions, a_language, an_alias, a_postconditions,
				an_end, a_semicolon, a_clients, a_feature_clause, a_class)
			if Result /= Void then
				if STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.builtin_marker) then
					set_builtin_function (Result)
				end
			end
		end

	new_external_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE; an_alias: ET_EXTERNAL_ALIAS;
		a_postconditions: ET_POSTCONDITIONS; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		do
			Result := ast_factory.new_external_procedure (a_name, args, an_is, a_first_indexing,
				an_obsolete, a_preconditions, a_language, an_alias, a_postconditions,
				an_end, a_semicolon, a_clients, a_feature_clause, a_class)
			if Result /= Void then
				if STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.builtin_marker) then
					set_builtin_procedure (Result)
				end
			end
		end

	new_formal_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_FORMAL_ARGUMENT_LIST is
			-- New formal argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			Result := ast_factory.new_formal_arguments (a_left, a_right, nb)
			last_formal_arguments := Result
		end

	new_formal_parameter (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER): ET_FORMAL_PARAMETER is
			-- New formal generic parameter
		do
			Result := ast_factory.new_formal_parameter (a_type_mark, a_name)
		end

	new_invalid_alias_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_FREE_NAME is
			-- New invalid alias feature name
		do
-- ERROR
			Result := new_alias_free_name (an_alias, a_string)
		end

	new_invalid_infix_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New invalid infix feature name
		do
-- ERROR
			Result := new_infix_free_name (an_infix, an_operator)
		end

	new_invalid_prefix_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New invalid prefix feature name
		do
-- ERROR
			Result := new_prefix_free_name (a_prefix, an_operator)
		end

	new_infix_free_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New infix free feature name
		do
			if an_operator /= Void then
				if an_operator.value.count > 0 then
					Result := ast_factory.new_infix_free_name (an_infix, an_operator)
				else
					-- TODO: error.
				end
			else
				Result := ast_factory.new_infix_free_name (an_infix, an_operator)
			end
		end

	new_invariants (an_invariant: ET_KEYWORD): ET_INVARIANTS is
			-- New class invariants
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_invariants (an_invariant, last_class, 0)
			else
				Result := ast_factory.new_invariants (an_invariant, last_class, i)
				if Result /= Void then
					from until i < 1 loop
						Result.put_first (assertions.item (i))
						i := i - 1
					end
				end
				assertions.wipe_out
			end
		end

	new_local_variables (a_local: ET_KEYWORD; nb: INTEGER): ET_LOCAL_VARIABLE_LIST is
			-- New local variable list with given capacity
		require
			nb_positive: nb >= 0
		do
			Result := ast_factory.new_local_variables (a_local, nb)
			last_local_variables := Result
		end

	new_loop_invariants (an_invariant: ET_KEYWORD): ET_LOOP_INVARIANTS is
			-- New loop invariants
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_loop_invariants (an_invariant, 0)
			else
				Result := ast_factory.new_loop_invariants (an_invariant, i)
				if Result /= Void then
					from until i < 1 loop
						Result.put_first (assertions.item (i))
						i := i - 1
					end
				end
				assertions.wipe_out
			end
		end

	new_named_type (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER; a_generics: ET_ACTUAL_PARAMETER_LIST): ET_TYPE is
			-- New Eiffel class type or formal generic paramater
		local
			a_parameter: ET_FORMAL_PARAMETER
			a_last_class: ET_CLASS
			a_class: ET_CLASS
		do
			a_last_class := last_class
			if a_last_class /= Void and a_name /= Void then
				a_parameter := a_last_class.formal_parameter (a_name)
				if a_parameter /= Void then
					if a_generics /= Void then
						-- TODO: Error
					end
					if a_type_mark /= Void then
						-- TODO: ERROR
					end
					Result := ast_factory.new_formal_parameter_type (a_name, a_parameter.index)
				else
					a_class := universe.eiffel_class (a_name)
					if providers_enabled then
						providers.force_last (a_class)
					end
					a_class.set_in_system (True)
					if a_generics /= Void then
						Result := ast_factory.new_generic_class_type (a_type_mark, a_name, a_generics, a_class)
					else
						Result := ast_factory.new_class_type (a_type_mark, a_name, a_class)
					end
				end
			end
		end

	new_parent (a_name: ET_IDENTIFIER; a_generic_parameters: ET_ACTUAL_PARAMETER_LIST;
		a_renames: ET_RENAME_LIST; an_exports: ET_EXPORT_LIST; an_undefines, a_redefines,
		a_selects: ET_KEYWORD_FEATURE_NAME_LIST; an_end: ET_KEYWORD): ET_PARENT is
			-- New parent
		local
			a_type: ET_CLASS_TYPE
			a_last_class: like last_class
			a_class: ET_CLASS
		do
			a_last_class := last_class
			if a_last_class /= Void and a_name /= Void then
				if a_last_class.has_formal_parameter (a_name) then
					-- Error
				end
				a_class := universe.eiffel_class (a_name)
				if providers_enabled then
					providers.force_last (a_class)
				end
				a_class.set_in_system (True)
				if a_generic_parameters /= Void then
					a_type := ast_factory.new_generic_class_type (Void, a_name, a_generic_parameters, a_class)
				else
					a_type := ast_factory.new_class_type (Void, a_name, a_class)
				end
				Result := ast_factory.new_parent (a_type, a_renames, an_exports,
					an_undefines, a_redefines, a_selects, an_end)
			end
		end

	new_postconditions (an_ensure: ET_KEYWORD; a_then: ET_KEYWORD): ET_POSTCONDITIONS is
			-- New postconditions
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_postconditions (an_ensure, a_then, 0)
			else
				Result := ast_factory.new_postconditions (an_ensure, a_then, i)
				if Result /= Void then
					from until i < 1 loop
						Result.put_first (assertions.item (i))
						i := i - 1
					end
				end
				assertions.wipe_out
			end
		end

	new_preconditions (a_require: ET_KEYWORD; an_else: ET_KEYWORD): ET_PRECONDITIONS is
			-- New preconditions
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_preconditions (a_require, an_else, 0)
			else
				Result := ast_factory.new_preconditions (a_require, an_else, i)
				if Result /= Void then
					from until i < 1 loop
						Result.put_first (assertions.item (i))
						i := i - 1
					end
				end
				assertions.wipe_out
			end
		end

	new_prefix_free_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New prefix free feature name
		do
			if an_operator /= Void then
				if an_operator.value.count > 0 then
					Result := ast_factory.new_prefix_free_name (a_prefix, an_operator)
				else
					-- TODO: error.
				end
			else
				Result := ast_factory.new_prefix_free_name (a_prefix, an_operator)
			end
		end

	new_tuple_type (a_name: ET_IDENTIFIER; a_parameters: ET_ACTUAL_PARAMETER_LIST): ET_TUPLE_TYPE is
			-- New TUPLE class type
		do
			Result := ast_factory.new_tuple_type (a_name, a_parameters)
		end

	new_unqualified_call_expression (a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENT_LIST): ET_EXPRESSION is
			-- New unqualified call expression
		local
			a_seed: INTEGER
		do
			if args /= Void then
				Result := ast_factory.new_call_expression (Void, a_name, args)
			elseif a_name /= Void then
				Result := a_name
				if last_formal_arguments /= Void then
					a_seed := last_formal_arguments.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_argument (True)
						last_formal_arguments.formal_argument (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then last_local_variables /= Void then
					a_seed := last_local_variables.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_local (True)
						last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
			end
		end

	new_unqualified_call_instruction (a_name: ET_IDENTIFIER; args: ET_ACTUAL_ARGUMENT_LIST): ET_INSTRUCTION is
			-- New unqualified call instruction
		do
			if args /= Void then
				Result := ast_factory.new_call_instruction (Void, a_name, args)
			else
				Result := a_name
			end
		end

	new_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New Eiffel class
		require
			a_name_not_void: a_name /= Void
			cluster_not_void: cluster /= Void
		local
			old_class: ET_CLASS
			l_other_class: ET_CLASS
		do
			Result := universe.eiffel_class (a_name)
			if current_class.master_class = Result then
					-- Make sure that `current_class' is parsed,
					-- and not its overriding class if any.
				Result := current_class
			end
			if Result.is_parsed and Result.is_preparsed then
				if cluster.is_override then
					if Result.is_override then
							-- Two classes with the same name in two override clusters.
						l_other_class := Result.cloned_class
						l_other_class.reset_all
						l_other_class.set_filename (filename)
						l_other_class.set_cluster (cluster)
						l_other_class.set_name (a_name)
						l_other_class.set_parsed
						l_other_class.set_time_stamp (time_stamp)
						l_other_class.set_in_system (True)
						l_other_class.set_overridden_class (Result.overridden_class)
						Result.set_overridden_class (l_other_class)
						error_handler.report_vscn0a_error (Result, cluster, filename)
						Result := l_other_class
					else
							-- Override.
						l_other_class := Result.cloned_class
						l_other_class.set_overridden_class (Result.overridden_class)
						Result.reset_all
						Result.set_filename (filename)
						Result.set_cluster (cluster)
						Result.set_name (a_name)
						Result.set_parsed
						Result.set_time_stamp (time_stamp)
						Result.set_in_system (True)
						Result.set_overridden_class (l_other_class)
						old_class := current_class
						current_class := Result
						error_handler.report_compilation_status (Current, current_class)
						current_class := old_class
						features.wipe_out
						overriding_class_added := True
					end
				elseif not Result.is_override then
						-- Two classes with the same name in two non-override clusters.
					l_other_class := Result.cloned_class
					l_other_class.reset_all
					l_other_class.set_filename (filename)
					l_other_class.set_cluster (cluster)
					l_other_class.set_name (a_name)
					l_other_class.set_parsed
					l_other_class.set_time_stamp (time_stamp)
					l_other_class.set_in_system (True)
					l_other_class.set_overridden_class (Result.overridden_class)
					Result.set_overridden_class (l_other_class)
					error_handler.report_vscn0a_error (Result, cluster, filename)
					Result := l_other_class
				else
						-- Overridden.
					l_other_class := Result.cloned_class
					Result.set_in_system (True)
					l_other_class.reset_all
					l_other_class.set_filename (filename)
					l_other_class.set_cluster (cluster)
					l_other_class.set_name (a_name)
					l_other_class.set_parsed
					l_other_class.set_time_stamp (time_stamp)
					l_other_class.set_overridden_class (Result.overridden_class)
					Result.set_overridden_class (l_other_class)
					Result := l_other_class
					old_class := current_class
					current_class := Result
					error_handler.report_compilation_status (Current, current_class)
					current_class := old_class
					features.wipe_out
				end
			else
				Result.set_filename (filename)
				Result.set_cluster (cluster)
				Result.set_name (a_name)
				Result.set_parsed
				Result.set_time_stamp (time_stamp)
				Result.set_in_system (True)
				old_class := current_class
				current_class := Result
				error_handler.report_compilation_status (Current, current_class)
				current_class := old_class
				features.wipe_out
			end
		end

	new_synonym_feature (a_name: ET_EXTENDED_FEATURE_NAME; a_feature: ET_FEATURE): ET_FEATURE is
			-- New synomym for feature `a_feature'
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		local
			l_external_procedure: ET_EXTERNAL_PROCEDURE
			l_external_function: ET_EXTERNAL_FUNCTION
		do
			Result := a_feature.new_synonym (a_name)
			l_external_function ?= Result
			if l_external_function /= Void then
				if l_external_function.is_builtin then
					set_builtin_function (l_external_function)
				end
			else
				l_external_procedure ?= Result
				if l_external_procedure /= Void and then l_external_procedure.is_builtin then
					set_builtin_procedure (l_external_procedure)
				end
			end
		ensure
			synonym_not_void: Result /= Void
		end

feature {NONE} -- Built-in

	set_builtin_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_class = universe.any_class then
				if a_feature.name.same_feature_name (tokens.twin_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_any_twin)
					l_formals := a_feature.arguments
					if l_formals /= Void and then l_formals.count /= 0 then
							-- The signature should be 'twin: like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1a_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'twin: like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1a_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.standard_is_equal_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_any_standard_is_equal)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1b_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1b_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1b_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.same_type_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_any_same_type)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'same_type (other: ANY): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1d_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.any_class, a_class, a_class, universe) then
							-- The signature should be 'same_type (other: ANY): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1d_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'same_type (other: ANY): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1d_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.standard_copy_feature_name) then
						-- 'ANY.standard_copy' should be a procedure.
					a_feature.set_builtin_code (tokens.builtin_any_standard_copy)
					set_fatal_error (a_class)
					error_handler.report_gvkbs1c_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.special_class then
				if a_feature.name.same_feature_name (tokens.item_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_special_item)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'item (i: INTEGER): G'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2a_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class, universe) then
							-- The signature should be 'item (i: INTEGER): G'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2a_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.formal_parameter_1, a_class, a_class, universe) then
							-- The signature should be 'item (i: INTEGER): G'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2a_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_special_count)
					l_formals := a_feature.arguments
					if l_formals /= Void and then l_formals.count /= 0 then
							-- The signature should be 'count: INTEGER'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2d_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class, universe) then
							-- The signature should be 'count: INTEGER'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2d_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.make_feature_name) then
						-- 'SPECIAL.make' should be a procedure.
					a_feature.set_builtin_code (tokens.builtin_special_make)
					set_fatal_error (a_class)
					error_handler.report_gvkbs2c_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.put_feature_name) then
						-- 'SPECIAL.put' should be a procedure.
					a_feature.set_builtin_code (tokens.builtin_special_put)
					set_fatal_error (a_class)
					error_handler.report_gvkbs2b_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.character_class or a_class = universe.character_ref_class then
				if a_feature.name.same_feature_name (tokens.code_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_character_code)
					l_formals := a_feature.arguments
					if l_formals /= Void and then l_formals.count /= 0 then
							-- The signature should be 'code: INTEGER'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3a_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class, universe) then
							-- The signature should be 'code: INTEGER'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3a_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_character_lt)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "<" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3b_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "<" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3b_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix "<" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3b_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_gt_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_character_gt)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix ">" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3c_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix ">" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3c_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix ">" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3c_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_le_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_character_le)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "<=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3d_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "<=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3d_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix "<=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3d_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_ge_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_character_ge)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix ">=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3e_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix ">=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3e_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix ">=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs3e_error (a_class, a_feature)
					end
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.integer_class or a_class = universe.integer_ref_class then
				if a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_plus)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "+" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4a_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "+" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4a_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "+" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4a_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_minus)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "-" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4b_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "-" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4b_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "-" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4b_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_times)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "*" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4c_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "*" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4c_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "*" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4c_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_divide)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "/" (other: like Current): DOUBLE'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4d_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "/" (other: like Current): DOUBLE'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4d_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class, universe) then
							-- The signature should be 'infix "/" (other: like Current): DOUBLE'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4d_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_div_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_div)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "//" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4e_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "//" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4e_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "//" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4e_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_mod_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_mod)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "\\" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4f_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "\\" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4f_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "\\" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4f_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_opposite)
					l_formals := a_feature.arguments
					if l_formals /= Void and then l_formals.count /= 0 then
							-- The signature should be 'prefix "-": like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4g_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'prefix "-": like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4g_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_lt)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "<" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4h_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "<" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4h_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix "<" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4h_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_gt_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_gt)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix ">" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4l_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix ">" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4l_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix ">" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4l_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_le_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_le)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "<=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4m_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "<=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4m_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix "<=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4m_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_ge_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_ge)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix ">=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4n_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix ">=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4n_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.boolean_class, a_class, a_class, universe) then
							-- The signature should be 'infix ">=" (other: like Current): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4n_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.to_character_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_to_character)
					l_formals := a_feature.arguments
					if l_formals /= Void and then l_formals.count /= 0 then
							-- The signature should be 'to_character: CHARACTER'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4i_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (universe.character_class, a_class, a_class, universe) then
							-- The signature should be 'to_character: CHARACTER'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4i_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.bit_or_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_bit_or)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'bit_or (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4j_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'bit_or (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4j_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'bit_or (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4j_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.bit_shift_left_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_integer_bit_shift_left)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'bit_shift_left (other: INTEGER): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4k_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class, universe) then
							-- The signature should be 'bit_shift_left (other: INTEGER): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4k_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'bit_shift_left (other: INTEGER): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs4k_error (a_class, a_feature)
					end
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.boolean_class then
				if a_feature.name.same_feature_name (tokens.infix_and_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_and)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "and" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5d_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "and" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5d_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "and" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5d_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_and_then_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_and_then)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "and then" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5a_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "and then" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5a_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "and then" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5a_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_or_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_or)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "or" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5e_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "or" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5e_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "or" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5e_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_or_else_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_or_else)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "or else" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5b_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "or else" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5b_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "or else" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5b_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.prefix_not_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_not)
					l_formals := a_feature.arguments
					if l_formals /= Void and then l_formals.count /= 0 then
							-- The signature should be 'prefix "not": like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5g_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'prefix "not": like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5g_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_implies_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_implies)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "implies" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5c_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "implies" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5c_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "implies" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5c_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.infix_xor_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_boolean_xor)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'infix "xor" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5f_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "xor" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5f_error (a_class, a_feature)
					elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'infix "xor" (other: like Current): like Current'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs5f_error (a_class, a_feature)
					end
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				set_fatal_error (a_class)
				error_handler.report_gvkbu1a_error (a_class, a_feature)
			end
		end

	set_builtin_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_class = universe.any_class then
				if a_feature.name.same_feature_name (tokens.standard_copy_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_any_standard_copy)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'standard_copy (other: like Current)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1c_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class, universe) then
							-- The signature should be 'standard_copy (other: like Current)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs1c_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.twin_feature_name) then
						-- 'ANY.twin' should be a function.
					a_feature.set_builtin_code (tokens.builtin_any_twin)
					set_fatal_error (a_class)
					error_handler.report_gvkbs1a_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.standard_is_equal_feature_name) then
						-- 'ANY.standard_is_equal' should be a function.
					a_feature.set_builtin_code (tokens.builtin_any_standard_is_equal)
					set_fatal_error (a_class)
					error_handler.report_gvkbs1b_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.same_type_feature_name) then
						-- 'ANY.same_type' should be a function.
					a_feature.set_builtin_code (tokens.builtin_any_same_type)
					set_fatal_error (a_class)
					error_handler.report_gvkbs1d_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.special_class then
				if a_feature.name.same_feature_name (tokens.make_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_special_make)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 1 then
							-- The signature should be 'make (nb: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2c_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class, universe) then
							-- The signature should be 'make (nb: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2c_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.put_feature_name) then
					a_feature.set_builtin_code (tokens.builtin_special_put)
					l_formals := a_feature.arguments
					if l_formals = Void or else l_formals.count /= 2 then
							-- The signature should be 'put (v: G; i: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2b_error (a_class, a_feature)
					elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.formal_parameter_1, a_class, a_class, universe) then
							-- The signature should be 'put (v: G; i: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2b_error (a_class, a_feature)
					elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class, universe) then
							-- The signature should be 'put (v: G; i: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs2b_error (a_class, a_feature)
					end
				elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
						-- 'SPECIAL.item' should be a function.
					a_feature.set_builtin_code (tokens.builtin_special_item)
					set_fatal_error (a_class)
					error_handler.report_gvkbs2a_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
						-- 'SPECIAL.count' should be a function.
					a_feature.set_builtin_code (tokens.builtin_special_count)
					set_fatal_error (a_class)
					error_handler.report_gvkbs2d_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.character_class then
				if a_feature.name.same_feature_name (tokens.code_feature_name) then
						-- 'CHARACTER.code' should be a function.
					a_feature.set_builtin_code (tokens.builtin_character_code)
					set_fatal_error (a_class)
					error_handler.report_gvkbs3a_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
						-- 'CHARACTER.infix "<"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_character_lt)
					set_fatal_error (a_class)
					error_handler.report_gvkbs3b_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_gt_feature_name) then
						-- 'CHARACTER.infix ">"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_character_gt)
					set_fatal_error (a_class)
					error_handler.report_gvkbs3c_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_le_feature_name) then
						-- 'CHARACTER.infix "<="' should be a function.
					a_feature.set_builtin_code (tokens.builtin_character_le)
					set_fatal_error (a_class)
					error_handler.report_gvkbs3d_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_ge_feature_name) then
						-- 'CHARACTER.infix ">="' should be a function.
					a_feature.set_builtin_code (tokens.builtin_character_ge)
					set_fatal_error (a_class)
					error_handler.report_gvkbs3e_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.integer_class or a_class = universe.integer_ref_class then
				if a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
						-- 'INTEGER.infix "+"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_plus)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4a_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
						-- 'INTEGER.infix "-"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_minus)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4b_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
						-- 'INTEGER.infix "*"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_times)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4c_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
						-- 'INTEGER.infix "/"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_divide)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4d_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_div_feature_name) then
						-- 'INTEGER.infix "//"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_div)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4e_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_mod_feature_name) then
						-- 'INTEGER.infix "\\"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_mod)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4f_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
						-- 'INTEGER.prefix "-"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_opposite)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4g_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
						-- 'INTEGER.infix "<"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_lt)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4h_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_gt_feature_name) then
						-- 'INTEGER.infix ">"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_gt)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4l_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_le_feature_name) then
						-- 'INTEGER.infix "<="' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_le)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4m_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_ge_feature_name) then
						-- 'INTEGER.infix ">="' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_ge)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4n_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.to_character_feature_name) then
						-- 'INTEGER.to_character' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_to_character)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4i_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.bit_or_feature_name) then
						-- 'INTEGER.bit_or' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_bit_or)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4j_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.bit_shift_left_feature_name) then
						-- 'INTEGER.bit_shift_left' should be a function.
					a_feature.set_builtin_code (tokens.builtin_integer_bit_shift_left)
					set_fatal_error (a_class)
					error_handler.report_gvkbs4k_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			elseif a_class = universe.boolean_class then
				if a_feature.name.same_feature_name (tokens.infix_and_feature_name) then
						-- 'BOOLEAN.infix "and"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_and)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5d_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_and_then_feature_name) then
						-- 'BOOLEAN.infix "and then"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_and_then)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5a_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_or_feature_name) then
						-- 'BOOLEAN.infix "or"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_or)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5e_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_or_else_feature_name) then
						-- 'BOOLEAN.infix "or else"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_or_else)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5b_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_implies_feature_name) then
						-- 'BOOLEAN.infix "implies"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_implies)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5c_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.prefix_not_feature_name) then
						-- 'BOOLEAN.prefix "not"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_not)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5g_error (a_class, a_feature)
				elseif a_feature.name.same_feature_name (tokens.infix_xor_feature_name) then
						-- 'BOOLEAN.infix "xor"' should be a function.
					a_feature.set_builtin_code (tokens.builtin_boolean_xor)
					set_fatal_error (a_class)
					error_handler.report_gvkbs5f_error (a_class, a_feature)
				else
						-- Unknown built-in routine.
					a_feature.set_builtin_code (tokens.builtin_unknown)
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				set_fatal_error (a_class)
				error_handler.report_gvkbu1a_error (a_class, a_feature)
			end
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			report_syntax_error (current_position)
		end

	report_syntax_error (a_position: ET_POSITION) is
			-- Report a syntax error at position `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			error_handler.report_syntax_error (filename, a_position)
			if last_class /= Void then
				last_class.set_syntax_error
			end
		end

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		do
			a_class.set_parsed
			a_class.set_syntax_error
		ensure then
			is_parsed: a_class.is_parsed
			has_syntax_error: a_class.has_syntax_error
		end

feature {NONE} -- Access

	last_clients: ET_CLASS_NAME_LIST
			-- Last clients read

	last_export_clients: ET_CLIENTS
			-- Last clients read in New_export clauses

	last_feature_clause: ET_FEATURE_CLAUSE
			-- Last feature clause read

	last_class: ET_CLASS
			-- Class being parsed

	last_local_variables: ET_LOCAL_VARIABLE_LIST
			-- Last local variable clause read

	last_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			-- Last formal argument clause read

feature {NONE} -- Last keyword

	last_keyword: ET_KEYWORD is
			-- Last keyword read
		require
			last_keywords_not_empty: not last_keywords.is_empty
		do
			Result := last_keywords.item
		end

	add_keyword (a_keyword: ET_KEYWORD) is
			-- Add `a_keyword' to `last_keywords'.
		do
			last_keywords.force (a_keyword)
		ensure
			one_more: last_keywords.count = old last_keywords.count + 1
			keyword_added: last_keyword = a_keyword
		end

	remove_keyword is
			-- Remove `last_keyword' from `last_keywords'.
		require
			last_keywords_not_empty: not last_keywords.is_empty
		do
			last_keywords.remove
		ensure
			one_less: last_keywords.count = old last_keywords.count - 1
		end

	last_keywords: DS_ARRAYED_STACK [ET_KEYWORD]
			-- Last keywords read

feature {NONE} -- Last symbol

	last_symbol: ET_SYMBOL is
			-- Last symbol read
		require
			last_symbols_not_empty: not last_symbols.is_empty
		do
			Result := last_symbols.item
		end

	add_symbol (a_symbol: ET_SYMBOL) is
			-- Add `a_symbol' to `last_symbols'.
		do
			last_symbols.force (a_symbol)
		ensure
			one_more: last_symbols.count = old last_symbols.count + 1
			keyword_added: last_symbol = a_symbol
		end

	remove_symbol is
			-- Remove `last_symbol' from `last_symbols'.
		require
			last_symbols_not_empty: not last_symbols.is_empty
		do
			last_symbols.remove
		ensure
			one_less: last_symbols.count = old last_symbols.count - 1
		end

	last_symbols: DS_ARRAYED_STACK [ET_SYMBOL]
			-- Last symbols read

feature {NONE} -- Counters

	counter_value: INTEGER is
			-- Value of the last counter registered
		require
			counters_not_empty: not counters.is_empty
		do
			Result := counters.item
		ensure
			value_positive: Result >= 0
		end

	add_counter is
			-- Register a new counter.
		do
			counters.force (0)
		ensure
			one_more: counters.count = old counters.count + 1
			value_zero: counter_value = 0
		end

	remove_counter is
			-- Unregister last registered counter.
		require
			counters_not_empty: not counters.is_empty
		do
			counters.remove
		ensure
			one_less: counters.count = old counters.count - 1
		end

	increment_counter is
			-- Increment `counter_value'.
		require
			counters_not_empty: not counters.is_empty
		local
			a_value: INTEGER
		do
			a_value := counters.item
			counters.replace (a_value + 1)
		ensure
			same_counters_count: counters.count = old counters.count
			one_more: counter_value = old counter_value + 1
		end

	counters: DS_ARRAYED_STACK [INTEGER]
			-- Counters currently in use by the parser
			-- to build lists of AST nodes

feature {NONE} -- Constants

	Initial_counters_capacity: INTEGER is 10
			-- Initial capacity for `counters'

	Initial_last_keywords_capacity: INTEGER is 5
			-- Initial capacity for `last_keywords'

	Initial_last_symbols_capacity: INTEGER is 5
			-- Initial capacity for `last_symbols'

	assertions: DS_ARRAYED_LIST [ET_ASSERTION_ITEM]
			-- List of assertions currently being parsed

	Initial_assertions_capacity: INTEGER is 20
			-- Initial capacity for `assertions'

	features: DS_ARRAYED_LIST [ET_FEATURE]
			-- List of features currently being parsed

	Initial_features_capacity: INTEGER is 100
			-- Initial capacity for `features'

	constraints: DS_ARRAYED_LIST [ET_CONSTRAINT_TYPE]
			-- List of generic constraints currently being parsed

	Initial_constraints_capacity: INTEGER is 10
			-- Initial capacity for `constraints'

	providers: DS_HASH_SET [ET_CLASS]
			-- Provider classes already read (when enabled)

	Initial_providers_capacity: INTEGER is 100
			-- Initial capacity for `providers'

	dummy_type: ET_TYPE is
			-- Dummy type
		once
			Result := universe.any_type
		ensure
			dummy_type_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	tmp_directory: KL_DIRECTORY is
			-- Temporary directory object
		do
			Result := shared_directory
			if not Result.is_closed then
				create Result.make (dummy_name)
			end
		ensure
			directory_not_void: Result /= Void
			directory_closed: Result.is_closed
		end

	shared_directory: KL_DIRECTORY is
			-- Shared directory object
		once
			create Result.make (dummy_name)
		ensure
			directory_not_void: Result /= Void
		end

invariant

	counters_not_void: counters /= Void
	last_keywords_not_void: last_keywords /= Void
	last_symbols_not_void: last_symbols /= Void
	assertions_not_void: assertions /= Void
	no_void_assertion: not assertions.has (Void)
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	-- features_registered: forall f in features, f.is_registered
	constraints_not_void: constraints /= Void
	providers_not_void: providers /= Void
	no_void_provider: not providers.has (Void)

end
