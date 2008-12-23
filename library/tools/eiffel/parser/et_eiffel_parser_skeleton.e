indexing

	description:

		"Eiffel parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
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
			make as make_eiffel_scanner
		redefine
			reset, set_syntax_error
		end

	ET_CLASS_PROCESSOR
		rename
			process_identifier as process_ast_identifier,
			process_c1_character_constant as process_ast_c1_character_constant,
			process_c2_character_constant as process_ast_c2_character_constant,
			process_regular_manifest_string as process_ast_regular_manifest_string
		undefine
			error_handler, universe, current_system
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			process_identifier as process_ast_identifier,
			process_c1_character_constant as process_ast_c1_character_constant,
			process_c2_character_constant as process_ast_c2_character_constant,
			process_regular_manifest_string as process_ast_regular_manifest_string
		undefine
			make
		redefine
			process_class, process_cluster
		end

	ET_SHARED_FEATURE_NAME_TESTER
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			precursor {ET_CLASS_PROCESSOR}
			create eiffel_buffer.make_with_size (std.input, Initial_eiffel_buffer_size)
			create counters.make (Initial_counters_capacity)
			create last_formal_arguments_stack.make (Initial_last_formal_arguments_stack_capacity)
			create last_local_variables_stack.make (Initial_last_local_variables_stack_capacity)
			create last_keywords.make (Initial_last_keywords_capacity)
			create last_symbols.make (Initial_last_symbols_capacity)
			create last_object_tests_stack.make (Initial_last_object_tests_capacity)
			create last_object_tests_pool.make (Initial_last_object_tests_capacity)
			create assertions.make (Initial_assertions_capacity)
			create queries.make (Initial_queries_capacity)
			create procedures.make (Initial_procedures_capacity)
			create constraints.make (Initial_constraints_capacity)
			create providers.make (Initial_providers_capacity)
			make_eiffel_scanner ("unknown file")
			make_parser_skeleton
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			precursor
			eiffel_buffer.set_end_of_file
			counters.wipe_out
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
			last_keywords.wipe_out
			last_symbols.wipe_out
			providers.wipe_out
			assertions.wipe_out
			queries.wipe_out
			procedures.wipe_out
			constraints.wipe_out
			last_class := Void
			last_clients := Void
			last_export_clients := Void
			last_feature_clause := Void
		end

feature -- Access

	time_stamp: INTEGER
			-- Time stamp of file being parsed

feature -- Status report

	providers_enabled: BOOLEAN is
			-- Should providers be built when parsing a class?
		do
			Result := current_system.providers_enabled
		end

	unknown_builtin_reported: BOOLEAN
			-- Should unknown built-in features be reported as
			-- an error when parsing a class?
		do
			Result := current_system.unknown_builtin_reported
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_time_stamp: INTEGER; a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_file' within cluster `a_cluster'.
			-- `a_filename' is the filename of `a_file' and `a_time_stamp'
			-- its time stamp just before it was open.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
			--
			-- `universe.classes_modified' and `universe.classes_added' will
			-- be updated.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
			a_cluster_not_void: a_cluster /= Void
		local
			old_group: ET_GROUP
		do
			old_group := group
			group := a_cluster
			debug ("GELINT")
				std.error.put_string ("Parsing file '")
				std.error.put_string (a_filename)
				std.error.put_line ("%'")
			end
			filename := a_filename
			time_stamp := a_time_stamp
			input_buffer := eiffel_buffer
			eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			yyparse
			reset
			group := old_group
		rescue
			reset
		end

	parse_cluster (a_cluster: ET_CLUSTER) is
			-- Traverse `a_cluster' (recursively) and parse the classes
			-- it contains. Classes are added to `universe.classes'.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
			--
			-- `universe.classes_modified' and `universe.classes_added' will
			-- be updated.
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
			old_group: ET_GROUP
			l_already_preparsed: BOOLEAN
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_class: ET_CLASS
			i, nb: INTEGER
		do
			old_group := group
			group := a_cluster
			l_already_preparsed := a_cluster.is_preparsed
			a_cluster.set_preparsed (True)
			debug ("GELINT")
				std.error.put_string ("Parse cluster '")
				std.error.put_string (a_cluster.full_pathname)
				std.error.put_line ("%'")
			end
			if not a_cluster.is_abstract and then (not l_already_preparsed or else ((current_system.preparse_readonly_mode or else not a_cluster.is_read_only) and then (current_system.preparse_override_mode implies a_cluster.is_override))) then
				dir_name := Execution_environment.interpreted_string (a_cluster.full_pathname)
				dir_name := file_system.canonical_pathname (dir_name)
				dir := tmp_directory
				dir.reset (dir_name)
				dir.open_read
				if dir.is_open_read then
					from dir.read_entry until dir.end_of_input loop
						s := dir.last_entry
						if a_cluster.is_valid_eiffel_filename (s) then
							a_filename := file_system.pathname (dir_name, s)
							if l_already_preparsed then
									-- This cluster has already been traversed. Therefore
									-- we are only interested in new or modified classes,
									-- or those which have not been parsed yet.
								if l_classes = Void then
									l_classes := universe.classes_in_group (a_cluster)
								end
								l_class := Void
								nb := l_classes.count
								from i := 1 until i > nb loop
									l_class := l_classes.item (i)
									if file_system.same_pathnames (l_class.filename, a_filename) then
										if not l_class.is_parsed then
												-- Force the parsing.
											l_class.reset
											l_class := Void
										end
										i := nb + 1
									else
										l_class := Void
										i := i + 1
									end
								end
							end
							if l_class = Void then
									-- This file is either new or has been marked as modified,
									-- or has not been parsed yet. Let's parse it now.
								a_file := tmp_file
								a_file.reset (a_filename)
								a_time_stamp := a_file.time_stamp
								a_file.open_read
								if a_file.is_open_read then
									parse_file (a_file, a_filename, a_time_stamp, a_cluster)
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
				parse_clusters (l_subclusters)
			end
			group := old_group
		end

	parse_clusters (a_clusters: ET_CLUSTERS) is
			-- Traverse `a_clusters' (recursively) and parse the classes
			-- they contain. Classes are added to `universe.classes'.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
			--
			-- `universe.classes_modified' and `universe.classes_added' will
			-- be updated.
		require
			a_clusters_not_void: a_clusters /= Void
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			l_cluster: ET_CLUSTER
			i, nb: INTEGER
			l_readonly_mode: BOOLEAN
			l_override_mode: BOOLEAN
			l_dir_name: STRING
		do
			l_readonly_mode := current_system.preparse_readonly_mode
			l_override_mode := current_system.preparse_override_mode
			l_clusters := a_clusters.clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				l_cluster := l_clusters.item (i)
				if l_cluster.is_preparsed and then l_cluster.is_implicit and then (l_readonly_mode or else not l_cluster.is_read_only) and then (l_override_mode implies l_cluster.is_override) then
					l_dir_name := Execution_environment.interpreted_string (l_cluster.full_pathname)
					if not file_system.directory_exists (l_dir_name) then
						l_clusters.remove (i)
						nb := nb - 1
					else
						parse_cluster (l_cluster)
						i := i + 1
					end
				else
					parse_cluster (l_cluster)
					i := i + 1
				end
			end
		end

feature -- AST processing

	process_class (a_class: ET_CLASS) is
			-- Parse `a_class'.
			-- The class may end up with a syntax error status its
			-- `filename' didn't contain this class after all (i.e.
			-- if the preparsing phase gave errouneous result).
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
			--
			-- `universe.classes_modified' and `universe.classes_added' will
			-- be updated.
		local
			a_filename: STRING
			a_time_stamp: INTEGER
			a_cluster: ET_CLUSTER
			a_file: KL_TEXT_INPUT_FILE
			old_class: ET_CLASS
			old_group: ET_GROUP
		do
			if a_class.is_none then
				a_class.set_parsed
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is fatal.
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				old_class := current_class
				current_class := a_class
				old_group := group
				group := current_class.group
				if not current_class.is_parsed then
					if current_class.is_in_cluster then
						a_filename := current_class.filename
						a_cluster := current_class.group.cluster
						current_class.reset_after_preparsed
						a_file := tmp_file
						a_file.reset (a_filename)
						a_time_stamp := a_file.time_stamp
						a_file.open_read
						if a_file.is_open_read then
								-- Note that `parse_file' may change the value of `current_class'
								-- if `a_file' contains a class other than `a_class'.
							parse_file (a_file, a_filename, a_time_stamp, a_cluster)
							a_file.close
							if not a_class.is_preparsed then
									-- Make sure that `current_class' is as it was
									-- after it was last preparsed when the file
									-- does not contain this class anymore.
								a_class.set_filename (a_filename)
								a_class.set_group (a_cluster)
							end
							if not a_class.is_parsed then
								if not syntax_error and current_system.preparse_multiple_mode then
										-- The file contains other classes, but not `current_class'.
									set_fatal_error (a_class)
									error_handler.report_gvscn1b_error (a_class)
								end
							end
						else
								-- Make sure that `current_class' is as it was
								-- after it was last preparsed when the file
								-- cannot be read.
							current_class.set_filename (a_filename)
							current_class.set_group (a_cluster)
							set_fatal_error (current_class)
							error_handler.report_gcaab_error (a_cluster, a_filename)
						end
					elseif current_class.is_in_dotnet_assembly then
						current_system.dotnet_assembly_consumer.consume_class (current_class)
					end
					if not a_class.is_parsed then
						set_fatal_error (a_class)
					end
				end
				current_class := old_class
				group := old_group
			end
		ensure then
			is_parsed: a_class.is_parsed
		end

	process_cluster (a_cluster: ET_CLUSTER) is
			-- Traverse `a_cluster' (recursively) and parse the classes
			-- it contains. Classes are added to `universe.classes'.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
			--
			-- `universe.classes_modified' and `universe.classes_added' will
			-- be updated.
		do
			parse_cluster (a_cluster)
		end

feature {NONE} -- Basic operations

	register_query (a_query: ET_QUERY) is
			-- Register `a_query' in `last_class'.
		do
			if a_query /= Void then
				current_system.register_feature (a_query)
				queries.force_last (a_query)
				queries.finish
				if last_object_tests /= Void then
					a_query.set_object_tests (last_object_tests.cloned_object_test_list)
				end
			end
				-- Reset local variables, formal arguments and
				-- object-tests before reading the next feature.
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
		end

	register_query_synonym (a_query: ET_QUERY) is
			-- Register `a_query' in `last_class'.
		do
			if a_query /= Void then
				current_system.register_feature (a_query)
				if queries.before then
					queries.forth
				end
				queries.force_left (a_query)
				queries.back
			end
		end

	register_procedure (a_procedure: ET_PROCEDURE) is
			-- Register `a_procedure' in `last_class'.
		do
			if a_procedure /= Void then
				current_system.register_feature (a_procedure)
				procedures.force_last (a_procedure)
				procedures.finish
				if last_object_tests /= Void then
					a_procedure.set_object_tests (last_object_tests.cloned_object_test_list)
				end
			end
				-- Reset local variables, formal arguments and
				-- object-tests before reading the next feature.
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
		end

	register_procedure_synonym (a_procedure: ET_PROCEDURE) is
			-- Register `a_procedure' in `last_class'.
		do
			if a_procedure /= Void then
				current_system.register_feature (a_procedure)
				if procedures.before then
					procedures.forth
				end
				procedures.force_left (a_procedure)
				procedures.back
			end
		end

	register_constraint (a_constraint: ET_CONSTRAINT_TYPE) is
			-- Register generic constraint.
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
			l_queries: ET_QUERY_LIST
			l_procedures: ET_PROCEDURE_LIST
			i, nb: INTEGER
		do
			a_class := last_class
			if a_class /= Void then
				nb := queries.count
				create l_queries.make_with_capacity (nb)
				from i := nb until i < 1 loop
					l_queries.put_first (queries.item (i))
					i := i - 1
				end
				l_queries.set_declared_count (nb)
				a_class.set_queries (l_queries)
				nb := procedures.count
				create l_procedures.make_with_capacity (nb)
				from i := nb until i < 1 loop
					l_procedures.put_first (procedures.item (i))
					i := i - 1
				end
				l_procedures.set_declared_count (nb)
				a_class.set_procedures (l_procedures)
			end
			queries.wipe_out
			procedures.wipe_out
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
			l_query: ET_QUERY
			l_procedure: ET_PROCEDURE
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
				if a_class = current_system.any_class then
					l_procedure := a_class.named_procedure (tokens.default_create_feature_name)
					if l_procedure /= Void then
						current_system.set_default_create_seed (l_procedure.first_seed)
					else
						l_query := a_class.named_query (tokens.default_create_feature_name)
						if l_query /= Void then
							set_fatal_error (a_class)
							error_handler.report_gvkfe4a_error (a_class, l_query)
							current_system.set_default_create_seed (0)
						else
							set_fatal_error (a_class)
							error_handler.report_gvkfe1a_error (a_class, tokens.default_create_feature_name)
							current_system.set_default_create_seed (0)
						end
					end
					l_procedure := a_class.named_procedure (tokens.copy_feature_name)
					if l_procedure /= Void then
						current_system.set_copy_seed (l_procedure.first_seed)
					else
						l_query := a_class.named_query (tokens.copy_feature_name)
						if l_query /= Void then
							set_fatal_error (a_class)
							error_handler.report_gvkfe4a_error (a_class, l_query)
							current_system.set_copy_seed (0)
						else
							set_fatal_error (a_class)
							error_handler.report_gvkfe1a_error (a_class, tokens.copy_feature_name)
							current_system.set_copy_seed (0)
						end
					end
					l_query := a_class.named_query (tokens.is_equal_feature_name)
					if l_query /= Void then
						current_system.set_is_equal_seed (l_query.first_seed)
					else
						l_procedure := a_class.named_procedure (tokens.is_equal_feature_name)
						if l_procedure /= Void then
							set_fatal_error (a_class)
							error_handler.report_gvkfe5a_error (a_class, l_procedure)
							current_system.set_is_equal_seed (0)
						else
							set_fatal_error (a_class)
							error_handler.report_gvkfe1a_error (a_class, tokens.is_equal_feature_name)
							current_system.set_is_equal_seed (0)
						end
					end
				elseif a_class = current_system.routine_class then
					l_procedure := a_class.named_procedure (tokens.call_feature_name)
					if l_procedure /= Void then
						current_system.set_routine_call_seed (l_procedure.first_seed)
					else
						current_system.set_routine_call_seed (0)
					end
				elseif a_class = current_system.function_class then
					l_query := a_class.named_query (tokens.item_feature_name)
					if l_query /= Void then
						current_system.set_function_item_seed (l_query.first_seed)
					else
						current_system.set_function_item_seed (0)
					end
				elseif a_class = current_system.disposable_class then
					l_procedure := a_class.named_procedure (tokens.dispose_feature_name)
					if l_procedure /= Void then
						current_system.set_dispose_seed (l_procedure.first_seed)
					else
						current_system.set_dispose_seed (0)
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
			a_tagged: ET_TAGGED_ASSERTION
			l_position: ET_POSITION
			l_file_position: ET_FILE_POSITION
		do
			if current_system.is_ise then
					-- ISE does not accept assertions of the form:
					--      a_tag: -- a comment assertion
					-- when followed by another tagged assertion.
				if not assertions.is_empty then
					a_tagged ?= assertions.last
					if a_tagged /= Void and then a_tagged.expression = Void then
						l_position := a_tag.position
						if not l_position.is_null then
							create l_file_position.make (filename, l_position.line, l_position.column)
							l_position := l_file_position
						else
							l_position := current_position
						end
						report_syntax_error (l_position)
					end
				end
			end
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

	add_to_actual_parameter_list (a_parameter: ET_ACTUAL_PARAMETER_ITEM; a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Add `a_parameter' at the beginning of `a_list'.
		do
			if a_list /= Void and a_parameter /= Void then
				a_list.put_first (a_parameter)
			end
		end

	add_to_constraint_actual_parameter_list (a_parameter: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM; a_list: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST) is
			-- Add `a_parameter' at the beginning of `a_list'.
		do
			if a_list /= Void and a_parameter /= Void then
				a_list.put_first (a_parameter)
			end
		end

	set_start_closure (a_formal_arguments: ET_FORMAL_ARGUMENT_LIST) is
			-- Indicate the we just parsed the formal arguments of a
			-- new closure (i.e. feature, invariant or inline agent).
			-- Keep track of the values of `last_formal_arguments',
			-- `last_local_variables' and `last_object_tests' for the
			-- enclosing closure. They will be restored when we reach
			-- the end of the closure by `set_end_closure'.
		do
			if not last_formal_arguments_stack.is_empty or last_formal_arguments /= Void then
				last_formal_arguments_stack.force (last_formal_arguments)
			end
			last_formal_arguments := a_formal_arguments
			if not last_local_variables_stack.is_empty or last_local_variables /= Void then
				last_local_variables_stack.force (last_local_variables)
			end
			last_local_variables := Void
			if not last_object_tests_stack.is_empty or last_object_tests /= Void then
				last_object_tests_stack.force (last_object_tests)
			end
			last_object_tests := Void
		end

	set_end_closure is
			-- Indicate that the end of the closure (i.e. feature, invariant
			-- or inline agent) being parsed has been reached. Restore
			-- `last_formal_arguments', `last_local_variables' and
			-- `last_object_tests' for the enclosing closure if any.
		do
			if not last_formal_arguments_stack.is_empty then
				last_formal_arguments := last_formal_arguments_stack.item
				last_formal_arguments_stack.remove
			else
				last_formal_arguments := Void
			end
			if not last_local_variables_stack.is_empty then
				last_local_variables := last_local_variables_stack.item
				last_local_variables_stack.remove
			else
				last_local_variables := Void
			end
			if not last_object_tests_stack.is_empty then
				last_object_tests := last_object_tests_stack.item
				last_object_tests_stack.remove
			else
				last_object_tests := Void
			end
		end

feature {ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM, ET_CONSTRAINT_ACTUAL_PARAMETER_LIST} -- Generic constraints

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
			a_type_mark: ET_TYPE_MARK
			a_base_class: ET_CLASS
		do
			a_name := a_constraint.name
			a_type_mark := a_constraint.type_mark
			a_formal := a_formals.formal_parameter_by_name (a_name)
			if a_formal /= Void then
				if a_type_mark /= Void and then not (a_type_mark.is_question_mark or a_type_mark.is_bang) then
						-- A formal parameter type is not a class type.
						-- It cannot be prefixed by 'expanded' or 'reference'.
						-- But it can be prefixed by '!' or '?'.
					report_syntax_error (a_type_mark.position)
					Result := ast_factory.new_formal_parameter_type (Void, a_name, a_formal.index)
				else
					Result := ast_factory.new_formal_parameter_type (a_type_mark, a_name, a_formal.index)
				end
			else
				a_base_class := universe.eiffel_class (a_name)
				if providers_enabled then
					providers.force_last (a_base_class)
				end
				a_base_class.set_in_system (True)
				if a_base_class = current_system.tuple_class then
					if a_type_mark /= Void and then not (a_type_mark.is_question_mark or a_type_mark.is_bang) then
							-- A TUPLE type is not a class type. It cannot
							-- be prefixed by 'expanded' or 'reference'.
							-- But it can be prefixed by '!' or '?'.
						report_syntax_error (a_type_mark.position)
						Result := ast_factory.new_tuple_type (Void, a_name, Void, a_base_class)
					else
						Result := ast_factory.new_tuple_type (a_type_mark, a_name, Void, a_base_class)
					end
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
			a_type_mark: ET_TYPE_MARK
			a_formal: ET_FORMAL_PARAMETER
			a_base_class: ET_CLASS
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			a_name := a_constraint.name
			a_type_mark := a_constraint.type_mark
			a_formal := a_formals.formal_parameter_by_name (a_name)
			if a_formal /= Void then
				if a_type_mark /= Void and then not (a_type_mark.is_question_mark or a_type_mark.is_bang) then
						-- A formal parameter type is not a class type.
						-- It cannot be prefixed by 'expanded' or 'reference'.
						-- But it can be prefixed by '!' or '?'.
					report_syntax_error (a_type_mark.position)
				end
					-- A formal parameter cannot have actual generic parameters.
				report_syntax_error (a_constraint.actual_parameters.position)
				Result := ast_factory.new_formal_parameter_type (a_type_mark, a_name, a_formal.index)
			else
				a_base_class := universe.eiffel_class (a_name)
				a_parameters := a_constraint.actual_parameters.resolved_syntactical_constraint (a_formals, Current)
				if a_parameters /= Void then
					if providers_enabled then
						providers.force_last (a_base_class)
					end
					a_base_class.set_in_system (True)
					if a_base_class = current_system.tuple_class then
						if a_type_mark /= Void and then not (a_type_mark.is_question_mark or a_type_mark.is_bang) then
								-- A TUPLE type is not a class type. It cannot
								-- be prefixed by 'expanded' or 'reference'.
								-- But it can be prefixed by '!' or '?'.
							report_syntax_error (a_type_mark.position)
							Result := ast_factory.new_tuple_type (Void, a_name, a_parameters, a_base_class)
						else
							Result := ast_factory.new_tuple_type (a_type_mark, a_name, a_parameters, a_base_class)
						end
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
			l_type, l_other_type: ET_CONSTRAINT_TYPE
			l_resolved_type: ET_TYPE
			l_parameter: ET_ACTUAL_PARAMETER_ITEM
			l_actual: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
			nb := a_constraint.count
			Result := ast_factory.new_actual_parameters (a_constraint.left_bracket, a_constraint.right_bracket, nb)
			if Result /= Void then
				from i := nb until i < 1 loop
					l_actual := a_constraint.item (i)
					l_type := l_actual.type
					if l_type /= l_other_type then
						l_resolved_type := l_type.resolved_syntactical_constraint (a_formals, Current)
						l_other_type := l_type
					end
					l_parameter := l_actual.resolved_syntactical_constraint_with_type (l_resolved_type, Current)
					if l_parameter /= Void then
						Result.put_first (l_parameter)
					end
					i := i - 1
				end
			end
		end

	resolved_constraint_actual_parameter_comma (a_constraint: ET_CONSTRAINT_ACTUAL_PARAMETER_COMMA;
		a_type: ET_TYPE): ET_ACTUAL_PARAMETER_ITEM is
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		local
			a_parameter: ET_ACTUAL_PARAMETER
		do
			a_parameter := a_constraint.actual_parameter.resolved_syntactical_constraint_with_type (a_type, Current)
			Result := ast_factory.new_actual_parameter_comma (a_parameter, a_constraint.comma)
		end

	resolved_constraint_labeled_actual_parameter (a_constraint: ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER;
		a_type: ET_TYPE): ET_LABELED_ACTUAL_PARAMETER is
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		do
			Result := ast_factory.new_labeled_actual_parameter (a_constraint.label, ast_factory.new_colon_type (a_constraint.colon, a_type))
		end

	resolved_constraint_labeled_comma_actual_parameter (a_constraint: ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER;
		a_type: ET_TYPE): ET_LABELED_ACTUAL_PARAMETER is
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		do
			Result := ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (a_constraint.label, a_constraint.comma), a_type)
		end

	resolved_constraint_labeled_actual_parameter_semicolon (a_constraint: ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER_SEMICOLON;
		a_type: ET_TYPE): ET_ACTUAL_PARAMETER_ITEM is
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		local
			l_parameter: ET_LABELED_ACTUAL_PARAMETER
		do
			l_parameter := a_constraint.actual_parameter.resolved_syntactical_constraint_with_type (a_type, Current)
			Result := ast_factory.new_labeled_actual_parameter_semicolon (l_parameter, a_constraint.semicolon)
		end

feature {NONE} -- AST factory

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

	new_any_clients (a_keyword: ET_KEYWORD): ET_CLIENT_LIST is
			-- Implicit client list (when preceded by `a_keyword')
			-- with only one client: "ANY"
		local
			l_name: ET_IDENTIFIER
			l_position: ET_POSITION
			l_client: ET_CLIENT
		do
			if a_keyword = Void or else a_keyword.position.is_null then
				Result := current_system.any_clients
			else
				create Result.make_with_capacity (1)
				create l_name.make (tokens.any_class_name.name)
				l_position := a_keyword.position
				l_name.set_position (l_position.line, l_position.column)
				l_client := new_client (l_name)
				if l_client /= Void then
					Result.put_first (l_client)
				end
			end
		end

	new_bit_feature (a_bit: ET_IDENTIFIER; an_id: ET_IDENTIFIER): ET_BIT_FEATURE is
			-- New 'BIT Identifier' type
		local
			a_class: ET_CLASS
		do
			a_class := current_system.bit_class
			if providers_enabled then
				providers.force_last (a_class)
			end
			a_class.set_in_system (True)
			Result := ast_factory.new_bit_feature (a_bit, an_id, a_class)
		end

	new_bit_n (a_bit: ET_IDENTIFIER; an_int: ET_INTEGER_CONSTANT): ET_BIT_N is
			-- New 'BIT N' type
		local
			a_class: ET_CLASS
		do
			a_class := current_system.bit_class
			if providers_enabled then
				providers.force_last (a_class)
			end
			a_class.set_in_system (True)
			Result := ast_factory.new_bit_n (a_bit, an_int, a_class)
			if Result /= Void then
				Result.compute_size
				if Result.has_size_error then
					if last_class /= Void then
						set_fatal_error (last_class)
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

	new_choice_attribute_constant (a_name: ET_IDENTIFIER): ET_IDENTIFIER is
			-- New choice constant which is supposed to be the name of
			-- a constant attribute or unique attribute
		local
			a_seed: INTEGER
		do
			if a_name /= Void then
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
				if a_seed = 0 and then last_object_tests /= Void then
					a_seed := last_object_tests.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_object_test_local (True)
					end
				end
			end
		end

	new_client (a_name: ET_CLASS_NAME): ET_CLIENT is
			-- New client
		local
			l_base_class: ET_CLASS
		do
			l_base_class := universe.eiffel_class (a_name)
			Result := ast_factory.new_client (a_name, l_base_class)
		end

	new_client_comma (a_name: ET_CLASS_NAME; a_comma: ET_SYMBOL): ET_CLIENT_ITEM is
			-- New client followed by a comma
		local
			l_base_class: ET_CLASS
		do
			l_base_class := universe.eiffel_class (a_name)
			Result := ast_factory.new_client_comma (a_name, l_base_class, a_comma)
		end

	new_constraint_named_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER;
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
		an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLIENT_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_FUNCTION is
			-- New external function
		do
			Result := ast_factory.new_external_function (a_name, args, a_type, an_assigner, an_is, a_first_indexing,
				an_obsolete, a_preconditions, a_language, an_alias, a_postconditions,
				an_end, a_semicolon, a_clients, a_feature_clause, a_class)
			if Result /= Void then
				if STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.builtin_marker) then
					set_builtin_function (Result)
				elseif STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.builtin_static_marker) then
					set_builtin_function (Result)
				elseif STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.static_builtin_marker) then
					set_builtin_function (Result)
				end
			end
		end

	new_external_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE; an_alias: ET_EXTERNAL_ALIAS;
		a_postconditions: ET_POSTCONDITIONS; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLIENT_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		do
			Result := ast_factory.new_external_procedure (a_name, args, an_is, a_first_indexing,
				an_obsolete, a_preconditions, a_language, an_alias, a_postconditions,
				an_end, a_semicolon, a_clients, a_feature_clause, a_class)
			if Result /= Void then
				if STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.builtin_marker) then
					set_builtin_procedure (Result)
				elseif STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.builtin_static_marker) then
					set_builtin_procedure (Result)
				elseif STRING_.same_case_insensitive (Result.language.manifest_string.value, tokens.static_builtin_marker) then
					set_builtin_procedure (Result)
				end
			end
		end

	new_feature_address (d: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_FEATURE_ADDRESS is
			-- New feature address
		local
			l_identifier: ET_IDENTIFIER
			l_seed: INTEGER
		do
			l_identifier ?= a_name
			if l_identifier /= Void then
				if last_formal_arguments /= Void then
					l_seed := last_formal_arguments.index_of (l_identifier)
					if l_seed /= 0 then
						l_identifier.set_seed (l_seed)
						l_identifier.set_argument (True)
						last_formal_arguments.formal_argument (l_seed).set_used (True)
					end
				end
				if l_seed = 0 and then last_local_variables /= Void then
					l_seed := last_local_variables.index_of (l_identifier)
					if l_seed /= 0 then
						l_identifier.set_seed (l_seed)
						l_identifier.set_local (True)
						last_local_variables.local_variable (l_seed).set_used (True)
					end
				end
				if l_seed = 0 and then last_object_tests /= Void then
					l_seed := last_object_tests.index_of (l_identifier)
					if l_seed /= 0 then
						l_identifier.set_object_test_local (True)
					end
				end
			end
			Result := ast_factory.new_feature_address (d, a_name)
		end

	new_formal_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_FORMAL_ARGUMENT_LIST is
			-- New formal argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			Result := ast_factory.new_formal_arguments (a_left, a_right, nb)
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
				Result := ast_factory.new_invariants (an_invariant, last_class.master_class, 0)
			else
				Result := ast_factory.new_invariants (an_invariant, last_class.master_class, i)
				if Result /= Void then
					from until i < 1 loop
						Result.put_first (assertions.item (i))
						i := i - 1
					end
				end
				assertions.wipe_out
			end
			if Result /= Void and last_object_tests /= Void then
				Result.set_object_tests (last_object_tests.cloned_object_test_list)
			end
				-- Reset local variables, formal arguments and
				-- object-tests before reading the next closure.
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
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

	new_named_type (a_type_mark: ET_TYPE_MARK; a_name: ET_IDENTIFIER; a_generics: ET_ACTUAL_PARAMETER_LIST): ET_TYPE is
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
					if a_type_mark /= Void and then a_type_mark.is_keyword then
						-- TODO: Error
					end
					Result := ast_factory.new_formal_parameter_type (a_type_mark, a_name, a_parameter.index)
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

	new_object_test (a_left_brace: ET_SYMBOL; a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL; a_type: ET_TYPE; a_right_brace: ET_SYMBOL; a_expression: ET_EXPRESSION): ET_OBJECT_TEST is
			-- New object-test expression
		local
			l_name: ET_IDENTIFIER
		do
			Result := ast_factory.new_object_test (a_left_brace, a_name, a_colon, a_type, a_right_brace, a_expression)
			if Result /= Void then
				if last_object_tests = Void then
					last_object_tests := new_object_test_list
				end
				last_object_tests.force_last (Result)
				l_name := Result.name
				l_name.set_object_test_local (True)
				l_name.set_seed (last_object_tests.count)
			end
		end

	new_once_manifest_string (a_once: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ONCE_MANIFEST_STRING is
			-- New once manifest string
		do
			Result := ast_factory.new_once_manifest_string (a_once, a_string)
			if Result /= Void then
				current_system.register_inline_constant (Result)
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

	new_prefix_minus_expression (a_sign: ET_SYMBOL_OPERATOR; an_expression: ET_EXPRESSION): ET_EXPRESSION is
			-- New prefix minus expression
		local
			l_integer: ET_INTEGER_CONSTANT
			l_real: ET_REAL_CONSTANT
		do
			if a_sign /= Void and an_expression /= Void then
				l_integer ?= an_expression
				if l_integer /= Void then
					if l_integer.sign = Void then
						l_integer.set_sign (a_sign)
						Result := l_integer
					end
				else
					l_real ?= an_expression
					if l_real /= Void then
						if l_real.sign = Void then
							l_real.set_sign (a_sign)
							Result := l_real
						end
					end
				end
			end
			if Result = Void then
				Result := ast_factory.new_prefix_expression (ast_factory.new_prefix_minus_operator (a_sign), an_expression)
			end
		end

	new_prefix_plus_expression (a_sign: ET_SYMBOL_OPERATOR; an_expression: ET_EXPRESSION): ET_EXPRESSION is
			-- New prefix plus expression
		local
			l_integer: ET_INTEGER_CONSTANT
			l_real: ET_REAL_CONSTANT
		do
			if a_sign /= Void and an_expression /= Void then
				l_integer ?= an_expression
				if l_integer /= Void then
					if l_integer.sign = Void then
						l_integer.set_sign (a_sign)
						Result := l_integer
					end
				else
					l_real ?= an_expression
					if l_real /= Void then
						if l_real.sign = Void then
							l_real.set_sign (a_sign)
							Result := l_real
						end
					end
				end
			end
			if Result = Void then
				Result := ast_factory.new_prefix_expression (ast_factory.new_prefix_plus_operator (a_sign), an_expression)
			end
		end

	new_tuple_type (a_type_mark: ET_TYPE_MARK; a_tuple: ET_IDENTIFIER; a_generics: ET_ACTUAL_PARAMETER_LIST): ET_TUPLE_TYPE is
			-- New 'TUPLE' type
		local
			a_class: ET_CLASS
		do
			a_class := current_system.tuple_class
			if providers_enabled then
				providers.force_last (a_class)
			end
			a_class.set_in_system (True)
			Result := ast_factory.new_tuple_type (a_type_mark, a_tuple, a_generics, a_class)
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
				if a_seed = 0 and then last_object_tests /= Void then
					a_seed := last_object_tests.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_object_test_local (True)
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
				a_name.set_instruction (True)
			end
		end

	new_writable (a_name: ET_IDENTIFIER): ET_WRITABLE is
			-- New writable
		local
			a_seed: INTEGER
		do
			if a_name /= Void then
				Result := a_name
				if last_local_variables /= Void then
					a_seed := last_local_variables.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_local (True)
						last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
			end
		end

	new_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New Eiffel class
		local
			old_class: ET_CLASS
			l_other_class: ET_CLASS
			l_basename: STRING
			l_class_name: ET_IDENTIFIER
		do
			if a_name /= Void then
				Result := universe.eiffel_class (a_name)
				if current_class.master_class = Result then
						-- Make sure that `current_class' is parsed,
						-- and not its overriding class if any.
					Result := current_class
				end
				if not current_system.preparse_multiple_mode and then not current_class.is_unknown and then Result /= current_class then
						-- We are parsing another class than the one we want to parse.
					set_fatal_error (current_class)
					error_handler.report_gvscn1a_error (current_class, a_name)
						-- Stop the parsing.
					accept
				elseif current_system.preparse_shallow_mode and then current_class.is_unknown and then not file_system.basename (filename).as_lower.same_string (a_name.lower_name + ".e") then
						-- The file does not contain the expected class
						-- (whose name is supposed to match the filename).
					l_other_class := Result.cloned_class
					l_other_class.reset
					l_other_class.set_filename (filename)
					l_other_class.set_group (group)
					l_basename := file_system.basename (filename)
					create l_class_name.make (l_basename.substring (1, l_basename.count - 2))
					l_other_class.set_name (l_class_name)
					set_fatal_error (l_other_class)
					error_handler.report_gvscn1a_error (l_other_class, a_name)
						-- Stop the parsing.
					accept
				elseif Result.is_none then
					if group.is_override then
							-- Cannot override built-in class "NONE".
						l_other_class := Result.cloned_class
						l_other_class.reset
						l_other_class.set_filename (filename)
						l_other_class.set_group (group)
						Result.set_overridden_class (l_other_class)
						error_handler.report_vscn0h_error (l_other_class)
						Result := l_other_class
					else
							-- Error: class "NONE" should be built-in.
						l_other_class := Result.cloned_class
						l_other_class.reset
						l_other_class.set_filename (filename)
						l_other_class.set_group (group)
						Result.set_overridden_class (l_other_class)
						error_handler.report_vscn0f_error (l_other_class)
						Result := l_other_class
					end
				elseif Result.is_preparsed then
					if (Result = current_class) or (Result.is_in_cluster and then (Result.group = group and file_system.same_pathnames (Result.filename, filename))) then
							-- This is the class we want to parse.
						if Result.is_parsed then
-- TODO: find a way to check whether two classes in the same file don't have the same name.
							if Result = Result.master_class then
								universe.set_classes_modified (True)
							end
							Result.reset
						end
						Result.set_filename (filename)
						Result.set_group (group)
						Result.set_name (a_name)
						Result.set_parsed
						Result.set_time_stamp (time_stamp)
						Result.set_in_system (True)
					elseif group.is_override then
						if Result.group.is_override then
								-- Two classes with the same name in two override groups.
							l_other_class := Result.cloned_class
							l_other_class.reset
							l_other_class.set_filename (filename)
							l_other_class.set_group (group)
							l_other_class.set_name (a_name)
							l_other_class.set_parsed
							l_other_class.set_time_stamp (time_stamp)
							l_other_class.set_in_system (True)
							l_other_class.set_overridden_class (Result.overridden_class)
							Result.set_overridden_class (l_other_class)
							if Result.is_in_cluster then
								error_handler.report_vscn0a_error (l_other_class, Result)
							elseif Result.is_in_dotnet_assembly then
								error_handler.report_vscn0b_error (l_other_class, Result)
							else
								error_handler.report_vscn0c_error (l_other_class, Result)
							end
							Result := l_other_class
						elseif Result.is_in_dotnet_assembly then
								-- Cannot override .NET assembly classes.
							l_other_class := Result.cloned_class
							l_other_class.reset
							l_other_class.set_filename (filename)
							l_other_class.set_group (group)
							l_other_class.set_name (a_name)
							l_other_class.set_parsed
							l_other_class.set_time_stamp (time_stamp)
							l_other_class.set_in_system (True)
							l_other_class.set_overridden_class (Result.overridden_class)
							Result.set_overridden_class (l_other_class)
							error_handler.report_vscn0j_error (Result, l_other_class)
							Result := l_other_class
						else
								-- Override.
							l_other_class := Result.cloned_class
							l_other_class.reset_after_parsed
							Result.reset
							Result.set_filename (filename)
							Result.set_group (group)
							Result.set_name (a_name)
							Result.set_parsed
							Result.set_time_stamp (time_stamp)
							Result.set_in_system (True)
							Result.set_overridden_class (l_other_class)
							universe.set_classes_modified (True)
						end
					elseif not Result.is_in_override_cluster then
							-- Two classes with the same name in two non-override groups.
						l_other_class := Result.cloned_class
						l_other_class.reset
						l_other_class.set_filename (filename)
						l_other_class.set_group (group)
						l_other_class.set_name (a_name)
						l_other_class.set_parsed
						l_other_class.set_time_stamp (time_stamp)
						l_other_class.set_in_system (True)
						Result.set_overridden_class (l_other_class)
						if Result.is_in_cluster then
							error_handler.report_vscn0a_error (l_other_class, Result)
						elseif Result.is_in_dotnet_assembly then
							error_handler.report_vscn0b_error (l_other_class, Result)
						else
							error_handler.report_vscn0c_error (l_other_class, Result)
						end
						Result := l_other_class
					else
							-- Overridden.
						l_other_class := Result.cloned_class
						Result.set_in_system (True)
						l_other_class.reset
						l_other_class.set_filename (filename)
						l_other_class.set_group (group)
						l_other_class.set_name (a_name)
						l_other_class.set_parsed
						l_other_class.set_time_stamp (time_stamp)
						l_other_class.set_overridden_class (Void)
						Result.add_overridden_class (l_other_class)
						Result := l_other_class
					end
					old_class := current_class
					current_class := Result
					error_handler.report_compilation_status (Current, current_class)
					current_class := old_class
					queries.wipe_out
					procedures.wipe_out
				else
					Result.set_filename (filename)
					Result.set_group (group)
					Result.set_name (a_name)
					Result.set_parsed
					Result.set_time_stamp (time_stamp)
					Result.set_in_system (True)
					old_class := current_class
					current_class := Result
					error_handler.report_compilation_status (Current, current_class)
					current_class := old_class
					queries.wipe_out
					procedures.wipe_out
					if Result /= current_class then
						universe.set_classes_added (True)
					end
				end
			end
		end

	new_query_synonym (a_name: ET_EXTENDED_FEATURE_NAME; a_query: ET_QUERY): ET_QUERY is
			-- New synomym for feature `a_query'
		require
			a_name_not_void: a_name /= Void
			a_query_not_void: a_query /= Void
		local
			l_external_function: ET_EXTERNAL_FUNCTION
		do
			Result := a_query.new_synonym (a_name)
			l_external_function ?= Result
			if l_external_function /= Void then
				if l_external_function.is_builtin then
					set_builtin_function (l_external_function)
				end
			end
		ensure
			synonym_not_void: Result /= Void
		end

	new_procedure_synonym (a_name: ET_EXTENDED_FEATURE_NAME; a_procedure: ET_PROCEDURE): ET_PROCEDURE is
			-- New synomym for feature `a_procedure'
		require
			a_name_not_void: a_name /= Void
			a_procedure_not_void: a_procedure /= Void
		local
			l_external_procedure: ET_EXTERNAL_PROCEDURE
		do
			Result := a_procedure.new_synonym (a_name)
			l_external_procedure ?= Result
			if l_external_procedure /= Void and then l_external_procedure.is_builtin then
				set_builtin_procedure (l_external_procedure)
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
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_class = current_system.any_class then
				set_builtin_any_function (a_feature)
			elseif a_class = current_system.type_class then
				set_builtin_type_function (a_feature)
			elseif a_class = current_system.special_class then
				set_builtin_special_function (a_feature)
			elseif a_class = current_system.character_8_ref_class then
				set_builtin_sized_character_ref_function (a_feature, current_system.character_8_class, tokens.builtin_character_8_class)
			elseif a_class = current_system.character_8_class then
				set_builtin_sized_character_function (a_feature, tokens.builtin_character_8_class)
			elseif a_class = current_system.character_32_ref_class then
				set_builtin_sized_character_ref_function (a_feature, current_system.character_32_class, tokens.builtin_character_32_class)
			elseif a_class = current_system.character_32_class then
				set_builtin_sized_character_function (a_feature, tokens.builtin_character_32_class)
			elseif a_class = current_system.boolean_ref_class then
				set_builtin_boolean_ref_function (a_feature)
			elseif a_class = current_system.boolean_class then
				set_builtin_boolean_function (a_feature)
			elseif a_class = current_system.pointer_ref_class then
				set_builtin_pointer_ref_function (a_feature)
			elseif a_class = current_system.pointer_class then
				set_builtin_pointer_function (a_feature)
			elseif a_class = current_system.arguments_class then
				set_builtin_arguments_function (a_feature)
			elseif a_class = current_system.memory_class then
				set_builtin_memory_function (a_feature)
			elseif a_class = current_system.identified_routines_class then
				set_builtin_identified_routines_function (a_feature)
			elseif a_class = current_system.platform_class then
				set_builtin_platform_function (a_feature)
			elseif a_class = current_system.procedure_class then
				set_builtin_procedure_function (a_feature)
			elseif a_class = current_system.function_class then
				set_builtin_function_function (a_feature)
			elseif a_class = current_system.tuple_class then
				set_builtin_tuple_function (a_feature)
			elseif a_class = current_system.integer_8_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.integer_8_class, tokens.builtin_integer_8_class)
			elseif a_class = current_system.integer_8_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_integer_8_class)
			elseif a_class = current_system.integer_16_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.integer_16_class, tokens.builtin_integer_16_class)
			elseif a_class = current_system.integer_16_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_integer_16_class)
			elseif a_class = current_system.integer_32_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.integer_32_class, tokens.builtin_integer_32_class)
			elseif a_class = current_system.integer_32_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_integer_32_class)
			elseif a_class = current_system.integer_64_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.integer_64_class, tokens.builtin_integer_64_class)
			elseif a_class = current_system.integer_64_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_integer_64_class)
			elseif a_class = current_system.natural_8_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.natural_8_class, tokens.builtin_natural_8_class)
			elseif a_class = current_system.natural_8_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_natural_8_class)
			elseif a_class = current_system.natural_16_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.natural_16_class, tokens.builtin_natural_16_class)
			elseif a_class = current_system.natural_16_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_natural_16_class)
			elseif a_class = current_system.natural_32_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.natural_32_class, tokens.builtin_natural_32_class)
			elseif a_class = current_system.natural_32_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_natural_32_class)
			elseif a_class = current_system.natural_64_ref_class then
				set_builtin_sized_integer_ref_function (a_feature, current_system.natural_64_class, tokens.builtin_natural_64_class)
			elseif a_class = current_system.natural_64_class then
				set_builtin_sized_integer_function (a_feature, tokens.builtin_natural_64_class)
			elseif a_class = current_system.real_32_ref_class then
				set_builtin_sized_real_ref_function (a_feature, current_system.real_32_class, tokens.builtin_real_32_class)
			elseif a_class = current_system.real_32_class then
				set_builtin_sized_real_function (a_feature, tokens.builtin_real_32_class)
			elseif a_class = current_system.real_64_ref_class then
				set_builtin_sized_real_ref_function (a_feature, current_system.real_64_class, tokens.builtin_real_64_class)
			elseif a_class = current_system.real_64_class then
				set_builtin_sized_real_function (a_feature, tokens.builtin_real_64_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_any_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class ANY.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_type_like_current: ET_GENERIC_CLASS_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.twin_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_twin))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'twin: like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'twin: like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.is_equal_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_equal))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'is_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.standard_is_equal_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_is_equal))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'standard_is_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.same_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_same_type))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'same_type (other: ANY): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'same_type (other: ANY): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'same_type (other: ANY): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.conforms_to_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_conforms_to))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'conforms_to (other: ANY): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'conforms_to (other: ANY): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'conforms_to (other: ANY): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.generator_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generator))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generator: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'generator: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generating_type))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (tokens.like_current)
				create l_type_like_current.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generating_type: STRING' or 'generating_type: TYPE [like Current]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				elseif a_feature.type.same_syntactical_type (l_type_like_current, a_class, a_class) then
						-- The signature is 'generating_type: TYPE [like Current]'.
					a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generating_type2))
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'generating_type: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.tagged_out_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_tagged_out))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'tagged_out: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'tagged_out: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.standard_twin_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_twin))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'standard_twin: like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'standard_twin: like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.is_deep_equal_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_deep_equal))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_deep_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'is_deep_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_deep_equal (other: like Current): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.deep_twin_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_deep_twin))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'deep_twin: like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'deep_twin: like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.standard_copy_feature_name) then
					-- 'ANY.standard_copy' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_copy))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.copy_feature_name) then
					-- 'ANY.copy' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_copy))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_type_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class TYPE.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_type_any: ET_GENERIC_CLASS_TYPE
			l_type_type_any: ET_GENERIC_CLASS_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generating_type))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_system.any_type)
				create l_type_any.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (l_type_any)
				create l_type_type_any.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generating_type: TYPE [TYPE [ANY]]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_type_type_any)
				elseif not a_feature.type.same_syntactical_type (l_type_type_any, a_class, a_class) then
						-- The signature should be 'generating_type: TYPE [TYPE [ANY]]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_type_type_any)
				end
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_system.any_type)
				create l_type_any.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'generic_parameter (i: INTEGER): TYPE [ANY]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_type_any)
				elseif not a_feature.type.same_syntactical_type (l_type_any, a_class, a_class) then
						-- The signature should be 'generic_parameter (i: INTEGER): TYPE [ANY]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_type_any)
				end
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'generic_parameter_count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'generic_parameter_count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.name_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_name))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'name: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'name: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.type_id_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_type_id))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'type_id: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'type_id: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_special_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class SPECIAL.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'item (i: INTEGER): G'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.formal_parameter_1)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'item (i: INTEGER): G'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.formal_parameter_1)
				elseif not a_feature.type.same_syntactical_type (tokens.formal_parameter_1, a_class, a_class) then
						-- The signature should be 'item (i: INTEGER): G'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.formal_parameter_1)
				end
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.element_size_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_element_size))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'element_size: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'element_size: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.aliased_resized_area_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_aliased_resized_area))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'aliased_resized_area (n: INTEGER): like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.like_current)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'aliased_resized_area (n: INTEGER): like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.like_current)
				elseif not a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'aliased_resized_area (n: INTEGER): like Current'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.like_current)
				end
			elseif a_feature.name.same_feature_name (tokens.base_address_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_base_address))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'base_address: POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.pointer_class)
				elseif not a_feature.type.same_syntactical_type (current_system.pointer_class, a_class, a_class) then
						-- The signature should be 'base_address: POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.pointer_class)
				end
			elseif a_feature.name.same_feature_name (tokens.make_feature_name) then
					-- 'SPECIAL.make' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_make))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_feature_name) then
					-- 'SPECIAL.put' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_put))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.formal_parameter_1.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_default_feature_name) then
					-- 'SPECIAL.put_default' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_put_default))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_character_ref_function (a_feature: ET_EXTERNAL_FUNCTION; a_character_class: ET_CLASS; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from the ref class of sized character class `a_character_class'.
			-- `a_builtin_class_code' is the built-in code of class `a_character_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_character_class_not_void: a_character_class /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: CHARACTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, a_character_class)
				elseif not a_feature.type.same_syntactical_type (a_character_class, a_class, a_class) then
						-- The signature should be 'item: CHARACTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, a_character_class)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'CHARACTER_REF.set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_set_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<a_character_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_character_function (a_feature: ET_EXTERNAL_FUNCTION; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from a sized character class whose
			-- built-in code is `a_builtin_class_code'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_code))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'code: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'code: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_32_code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_natural_32_code))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'natural_32_code: NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_32_class, a_class, a_class) then
						-- The signature should be 'natural_32_code: NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.character_8_class, a_class, a_class) then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.character_32_class, a_class, a_class) then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_32_class)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_boolean_ref_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class BOOLEAN_REF.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'item: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'BOOLEAN_REF.set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_set_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_boolean_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class BOOLEAN.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.conjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'conjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'conjuncted (other: BOOLEAN): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'conjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.conjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_then_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and_then))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'conjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'conjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'conjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.disjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'disjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'disjuncted (other: BOOLEAN): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'disjuncted (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.disjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_else_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or_else))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'disjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'disjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'disjuncted_semistrict (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.negated_feature_name) or a_feature.name.same_feature_name (tokens.prefix_not_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_not))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'negated: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_1_latest and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'negated: BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.implication_feature_name) or a_feature.name.same_feature_name (tokens.infix_implies_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_implies))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'implication (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'implication (other: BOOLEAN): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'implication (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.disjuncted_exclusive_feature_name) or a_feature.name.same_feature_name (tokens.infix_xor_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_xor))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'disjuncted_exclusive (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'disjuncted_exclusive (other: BOOLEAN): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'disjuncted_exclusive (other: BOOLEAN): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, current_system.boolean_class)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_pointer_ref_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class POINTER_REF.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.pointer_class)
				elseif not a_feature.type.same_syntactical_type (current_system.pointer_class, a_class, a_class) then
						-- The signature should be 'item: POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.pointer_class)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'POINTER_REF.set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_set_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_pointer_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class POINTER.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_plus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'plus (offset: INTEGER): POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'plus (offset: INTEGER): POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
				elseif not a_feature.type.same_syntactical_type (current_system.pointer_class, a_class, a_class) then
						-- The signature should be 'plus (offset: INTEGER): POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_integer_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_to_integer_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_integer_32: INTEGER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class)) then
							-- The signature should be 'to_integer_32: INTEGER_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_out))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'out: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'out: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.hash_code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_hash_code))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'hash_code: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'hash_code: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_arguments_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class ARGUMENTS.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.argument_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_arguments_feature (tokens.builtin_arguments_argument))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'argument (i: INTEGER): STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.string_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'argument (i: INTEGER): STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.string_type)
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'argument (i: INTEGER): STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.string_type)
				end
			elseif a_feature.name.same_feature_name (tokens.argument_count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_arguments_feature (tokens.builtin_arguments_argument_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'argument_count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'argument_count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_memory_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class MEMORY.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_special_any: ET_GENERIC_CLASS_TYPE
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.find_referers_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_find_referers))
				l_formals := a_feature.arguments
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_system.any_type)
				create l_special_any.make (Void, current_system.special_class.name, l_parameters, current_system.special_class)
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, current_system.integer_type.type>>, l_special_any)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, current_system.integer_type.type>>, l_special_any)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, current_system.integer_type.type>>, l_special_any)
				elseif not a_feature.type.same_syntactical_type (l_special_any, a_class, a_class) then
						-- The signature should be 'find_referers (target: ANY; result_type: INTEGER): SPECIAL [ANY]'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, current_system.integer_type.type>>, l_special_any)
				end
			elseif a_feature.name.same_feature_name (tokens.free_feature_name) then
					-- 'MEMORY.free' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_free))
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_identified_routines_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class IDENTIFIED_ROUTINES.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.eif_id_object_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_id_object))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'eif_id_object (an_id: INTEGER): ANY'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'eif_id_object (an_id: INTEGER): ANY'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
				elseif not a_feature.type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'eif_id_object (an_id: INTEGER): ANY'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
				end
			elseif a_feature.name.same_feature_name (tokens.eif_object_id_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'eif_object_id (an_object: ANY): INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, universe.integer_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'eif_object_id (an_object: ANY): INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'eif_object_id (an_object: ANY): INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.eif_object_id_free_feature_name) then
					-- 'IDENTIFIED_ROUTINES.eif_object_id_free' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id_free))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_platform_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class PLATFORM.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.is_dotnet_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_dotnet))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_dotnet: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_dotnet: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.is_mac_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_mac))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_mac: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_mac: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.is_unix_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_unix))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_unix: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_unix: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.is_vms_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_vms))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_vms: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_vms: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.is_windows_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_windows))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_windows: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_windows: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.boolean_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_boolean_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'boolean_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'boolean_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.character_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_character_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'character_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'character_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.double_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_double_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'double_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'double_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_integer_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'integer_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'integer_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.pointer_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_pointer_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'pointer_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'pointer_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.real_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_real_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'real_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'real_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.is_thread_capable_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_thread_capable))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'is_thread_capable: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_thread_capable: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.wide_character_bytes_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_wide_character_bytes))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'wide_character_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'wide_character_bytes: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_procedure_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class PROCEDURE.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_name: ET_IDENTIFIER
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.call_feature_name) then
					-- 'call' should be a procedure.
				create l_name.make ("OPEN_ARGS")
				create l_open_args.make (Void, l_name, 2)
				a_feature.set_builtin_code (tokens.builtin_procedure_feature (tokens.builtin_procedure_call))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_function_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class FUNCTION.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_result_type: ET_FORMAL_PARAMETER_TYPE
			l_name: ET_IDENTIFIER
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				create l_name.make ("OPEN_ARGS")
				create l_open_args.make (Void, l_name, 2)
				create l_name.make ("RESULT_TYPE")
				create l_result_type.make (Void, l_name, 3)
				a_feature.set_builtin_code (tokens.builtin_function_feature (tokens.builtin_function_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'item (args: OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, l_result_type)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.formal_parameter_2, a_class, a_class) then
						-- The signature should be 'item (args: OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, l_result_type)
				elseif not a_feature.type.same_syntactical_type (tokens.formal_parameter_3, a_class, a_class) then
						-- The signature should be 'item (args: OPEN_ARGS): RESULT_TYPE'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, l_result_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_tuple_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Set built-in code of `a_feature' from class TUPLE.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.boolean_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_boolean_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'boolean_item (i: INTEGER): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'boolean_item (i: INTEGER): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'boolean_item (i: INTEGER): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.character_8_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_8_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'character_8_item (i: INTEGER): CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_8_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'character_8_item (i: INTEGER): CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.character_8_class, a_class, a_class) then
						-- The signature should be 'character_8_item (i: INTEGER): CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.character_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'character_32_item (i: INTEGER): CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_32_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'character_32_item (i: INTEGER): CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.character_32_class, a_class, a_class) then
						-- The signature should be 'character_32_item (i: INTEGER): CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_count))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				elseif not a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'count: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_8_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_8_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_8_item (i: INTEGER): INTEGER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_8_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'integer_8_item (i: INTEGER): INTEGER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_8_class, a_class, a_class) then
						-- The signature should be 'integer_8_item (i: INTEGER): INTEGER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_16_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_16_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_16_item (i: INTEGER): INTEGER_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_16_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'integer_16_item (i: INTEGER): INTEGER_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_16_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_16_class, a_class, a_class) then
						-- The signature should be 'integer_16_item (i: INTEGER): INTEGER_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_16_class)
				end
			elseif a_feature.name.same_feature_name (tokens.integer_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_32_item (i: INTEGER): INTEGER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_32_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'integer_32_item (i: INTEGER): INTEGER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class)) then
							-- The signature should be 'integer_32_item (i: INTEGER): INTEGER_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.integer_64_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_64_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_64_item (i: INTEGER): INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_64_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'integer_64_item (i: INTEGER): INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_64_class, a_class, a_class) then
						-- The signature should be 'integer_64_item (i: INTEGER): INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.item_code_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_item_code))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'item_code (i: INTEGER): NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'item_code (i: INTEGER): NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_8_class, a_class, a_class) then
						-- The signature should be 'item_code (i: INTEGER): NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_8_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_8_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_8_item (i: INTEGER): NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'natural_8_item (i: INTEGER): NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_8_class, a_class, a_class) then
						-- The signature should be 'natural_8_item (i: INTEGER): NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_16_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_16_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_16_item (i: INTEGER): NATURAL_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_16_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'natural_16_item (i: INTEGER): NATURAL_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_16_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_16_class, a_class, a_class) then
						-- The signature should be 'natural_16_item (i: INTEGER): NATURAL_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_16_class)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_32_item (i: INTEGER): NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_32_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'natural_32_item (i: INTEGER): NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_32_class, a_class, a_class) then
						-- The signature should be 'natural_32_item (i: INTEGER): NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.natural_64_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_64_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'natural_64_item (i: INTEGER): NATURAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_64_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'natural_64_item (i: INTEGER): NATURAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_64_class, a_class, a_class) then
						-- The signature should be 'natural_64_item (i: INTEGER): NATURAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.object_comparison_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_object_comparison))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'object_comparison: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'object_comparison: BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.pointer_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_pointer_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'pointer_item (i: INTEGER): POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'pointer_item (i: INTEGER): POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
				elseif not a_feature.type.same_syntactical_type (current_system.pointer_class, a_class, a_class) then
						-- The signature should be 'pointer_item (i: INTEGER): POINTER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
				end
			elseif a_feature.name.same_feature_name (tokens.real_32_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_32_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'real_32_item (i: INTEGER): REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.real_32_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'real_32_item (i: INTEGER): REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.real_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.real_class, a_class, a_class)) then
							-- The signature should be 'real_32_item (i: INTEGER): REAL_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.real_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.real_64_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_64_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'real_64_item (i: INTEGER): REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.real_64_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'real_64_item (i: INTEGER): REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.real_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'real_64_item (i: INTEGER): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.reference_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_reference_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'reference_item (i: INTEGER): ANY'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'reference_item (i: INTEGER): ANY'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
				elseif not a_feature.type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'reference_item (i: INTEGER): ANY'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
				end
			elseif a_feature.name.same_feature_name (tokens.put_boolean_feature_name) then
					-- 'TUPLE.put_boolean' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_boolean))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_character_8_feature_name) then
					-- 'TUPLE.put_character_8' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_8_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_character_32_feature_name) then
					-- 'TUPLE.put_character_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_32_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_8_feature_name) then
					-- 'TUPLE.put_integer_8' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_8_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_16_feature_name) then
					-- 'TUPLE.put_integer_16' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_16))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_16_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_32_feature_name) then
					-- 'TUPLE.put_integer_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_integer_64_feature_name) then
					-- 'TUPLE.put_integer_64' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_64_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_8_feature_name) then
					-- 'TUPLE.put_natural_8' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_8_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_16_feature_name) then
					-- 'TUPLE.put_natural_16' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_16))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_16_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_32_feature_name) then
					-- 'TUPLE.put_natural_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_32_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_natural_64_feature_name) then
					-- 'TUPLE.put_natural_64' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_64_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_pointer_feature_name) then
					-- 'TUPLE.put_pointer' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_pointer))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_real_32_feature_name) then
					-- 'TUPLE.put_real_32' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.real_type.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_real_64_feature_name) then
					-- 'TUPLE.put_real_64' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.double_type.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.put_reference_feature_name) then
					-- 'TUPLE.put_reference' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_reference))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, universe.integer_type.type>>, Void)
			elseif a_feature.name.same_feature_name (tokens.set_object_comparison_feature_name) then
					-- 'TUPLE.set_object_comparison' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_set_object_comparison))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_integer_ref_function (a_feature: ET_EXTERNAL_FUNCTION; an_integer_class: ET_CLASS; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from the ref class of sized integer class `an_integer_class'.
			-- `a_builtin_class_code' is the built-in code of class `an_integer_class'.
		require
			a_feature_not_void: a_feature /= Void
			an_integer_class_not_void: an_integer_class /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, an_integer_class)
				elseif not a_feature.type.same_syntactical_type (an_integer_class, a_class, a_class) then
						-- The signature should be 'item: INTEGER'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, an_integer_class)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_set_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<an_integer_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_integer_function (a_feature: ET_EXTERNAL_FUNCTION; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from a sized integer class whose
			-- built-in code is `a_builtin_class_code'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_integer_class: ET_CLASS
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			l_integer_class := a_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_plus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'plus (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'plus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'plus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_minus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'minus (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'minus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'minus (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_times))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'product (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'product (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'product (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_divide))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'quotient (other: INTEGER_xx): REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, current_system.real_64_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'quotient (other: INTEGER_xx): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, current_system.real_64_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'quotient (other: INTEGER_xx): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.integer_quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_div_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_div))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_quotient (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'integer_quotient (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'integer_quotient (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.integer_remainder_feature_name) or a_feature.name.same_feature_name (tokens.infix_mod_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_mod))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'integer_remainder (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'integer_remainder (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'integer_remainder (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_power))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'power (other: REAL_64): REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type>>, current_system.real_64_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type>>, current_system.real_64_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type>>, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_opposite))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'opposite: INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_integer_class)
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'opposite: INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_lt))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_less (other: INTEGER_xx): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'is_less (other: INTEGER_xx): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_less (other: INTEGER_xx): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.character_8_class, a_class, a_class) then
						-- The signature should be 'to_character_8: CHARACTER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.character_32_class, a_class, a_class) then
						-- The signature should be 'to_character_32: CHARACTER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_real_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_real: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.real_class, a_class, a_class)) then
							-- The signature should be 'to_real: REAL_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.to_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_real_32: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.real_class, a_class, a_class)) then
							-- The signature should be 'to_real_32: REAL_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.to_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_real_64: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'to_real_64: REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_double))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_double: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'to_double: REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_8: NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_8_class, a_class, a_class) then
						-- The signature should be 'as_natural_8: NATURAL_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_16))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_16: NATURAL_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_16_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_16_class, a_class, a_class) then
						-- The signature should be 'as_natural_16: NATURAL_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_16_class)
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_32: NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_32_class, a_class, a_class) then
						-- The signature should be 'as_natural_32: NATURAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.as_natural_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_natural_64: NATURAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.natural_64_class, a_class, a_class) then
						-- The signature should be 'as_natural_64: NATURAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_8))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_8: INTEGER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_8_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_8_class, a_class, a_class) then
						-- The signature should be 'as_integer_8: INTEGER_8'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_8_class)
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_16))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_16: INTEGER_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_16_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_16_class, a_class, a_class) then
						-- The signature should be 'as_integer_16: INTEGER_16'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_16_class)
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_32: INTEGER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class)) then
							-- The signature should be 'as_integer_32: INTEGER_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.as_integer_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'as_integer_64: INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_64_class, a_class, a_class) then
						-- The signature should be 'as_integer_64: INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.bit_or_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_or))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_or (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_or (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_or (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_and_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_and))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_and (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_and (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_and (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_shift_left_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_left))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_shift_left (other: INTEGER): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'bit_shift_left (other: INTEGER): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_integer_class)
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_shift_left (other: INTEGER): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_shift_right_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_right))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_shift_right (other: INTEGER): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'bit_shift_right (other: INTEGER): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_integer_class)
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_shift_right (other: INTEGER): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_xor_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_xor))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'bit_xor (other: INTEGER_xx): INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_xor (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_xor (other: INTEGER_xx): INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_integer_class.type>>, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.bit_not_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_not))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'bit_not: INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_integer_class)
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'bit_not: INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_integer_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_identity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'identity: INTEGER_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_integer_class)
				elseif not a_feature.type.same_syntactical_type (l_integer_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'identity: INTEGER_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_integer_class)
					end
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_real_ref_function (a_feature: ET_EXTERNAL_FUNCTION; a_real_class: ET_CLASS; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from the ref class of sized real class `a_real_class'.
			-- `a_builtin_class_code' is the built-in code of class `a_real_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_real_class_not_void: a_real_class /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_item))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'item: REAL'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, a_real_class)
				elseif not a_feature.type.same_syntactical_type (a_real_class, a_class, a_class) then
						-- The signature should be 'item: REAL'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, a_real_class)
				end
			elseif a_feature.name.same_feature_name (tokens.set_item_feature_name) then
					-- 'set_item' should be a procedure.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_set_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<a_real_class.type>>, Void)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_real_function (a_feature: ET_EXTERNAL_FUNCTION; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from a sized real class whose
			-- built-in code is `a_builtin_class_code'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_real_class: ET_CLASS
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			l_real_class := a_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_plus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'plus (other: REAL_xx): REAL_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'plus (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'plus (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_minus))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'minus (other: REAL_xx): REAL_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'minus (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'minus (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_times))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'product (other: REAL_xx): REAL_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'product (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'product (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_divide))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'quotient (other: REAL_xx): REAL_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'quotient (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				elseif not a_feature.type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'quotient (other: REAL_xx): REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, l_real_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_power))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'power (other: REAL_64): REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type>>, current_system.real_64_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type>>, current_system.real_64_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'power (other: REAL_64): REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type>>, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_opposite))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'opposite: REAL_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_real_class)
				elseif not a_feature.type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'opposite: REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_real_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_identity))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'identity: REAL_xx'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_real_class)
				elseif not a_feature.type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then a_feature.type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'identity: REAL_xx'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_real_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_lt))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'is_less (other: REAL_xx): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, current_system.boolean_class)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (l_real_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class)) then
							-- The signature should be 'is_less (other: REAL_xx): BOOLEAN'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, current_system.boolean_class)
					end
				elseif not a_feature.type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'is_less (other: REAL_xx): BOOLEAN'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_real_class.type>>, current_system.boolean_class)
				end
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'truncated_to_integer: INTEGER_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.integer_class, a_class, a_class)) then
							-- The signature should be 'truncated_to_integer: INTEGER_32'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_32_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'truncated_to_integer_64: INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.integer_64_class, a_class, a_class) then
						-- The signature should be 'truncated_to_integer_64: INTEGER_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.truncated_to_real_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_real))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'truncated_to_real: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
						-- The signature should be 'truncated_to_real: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_to_double))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'to_double: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then a_feature.type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'to_double: REAL_64'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
					end
				end
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'ceiling_real_32: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
						-- The signature should be 'ceiling_real_32: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'ceiling_real_64: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
						-- The signature should be 'ceiling_real_64: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.floor_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_32))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'floor_real_32: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
						-- The signature should be 'floor_real_32: REAL_32'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
				end
			elseif a_feature.name.same_feature_name (tokens.floor_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_64))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'floor_real_64: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				elseif not a_feature.type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
						-- The signature should be 'floor_real_64: REAL_64'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
				end
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_out))
				l_formals := a_feature.arguments
				if l_formals /= Void and then l_formals.count /= 0 then
						-- The signature should be 'out: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				elseif not a_feature.type.same_syntactical_type (universe.string_class, a_class, a_class) then
						-- The signature should be 'out: STRING'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_class = current_system.any_class then
				set_builtin_any_procedure (a_feature)
			elseif a_class = current_system.type_class then
				set_builtin_type_procedure (a_feature)
			elseif a_class = current_system.special_class then
				set_builtin_special_procedure (a_feature)
			elseif a_class = current_system.character_8_ref_class then
				set_builtin_sized_character_ref_procedure (a_feature, current_system.character_8_class, tokens.builtin_character_8_class)
			elseif a_class = current_system.character_8_class then
				set_builtin_sized_character_procedure (a_feature, tokens.builtin_character_8_class)
			elseif a_class = current_system.character_32_ref_class then
				set_builtin_sized_character_ref_procedure (a_feature, current_system.character_32_class, tokens.builtin_character_32_class)
			elseif a_class = current_system.character_32_class then
				set_builtin_sized_character_procedure (a_feature, tokens.builtin_character_32_class)
			elseif a_class = current_system.boolean_ref_class then
				set_builtin_boolean_ref_procedure (a_feature)
			elseif a_class = current_system.boolean_class then
				set_builtin_boolean_procedure (a_feature)
			elseif a_class = current_system.pointer_ref_class then
				set_builtin_pointer_ref_procedure (a_feature)
			elseif a_class = current_system.pointer_class then
				set_builtin_pointer_procedure (a_feature)
			elseif a_class = current_system.arguments_class then
				set_builtin_arguments_procedure (a_feature)
			elseif a_class = current_system.memory_class then
				set_builtin_memory_procedure (a_feature)
			elseif a_class = current_system.identified_routines_class then
				set_builtin_identified_routines_procedure (a_feature)
			elseif a_class = current_system.platform_class then
				set_builtin_platform_procedure (a_feature)
			elseif a_class = current_system.procedure_class then
				set_builtin_procedure_procedure (a_feature)
			elseif a_class = current_system.function_class then
				set_builtin_function_procedure (a_feature)
			elseif a_class = current_system.tuple_class then
				set_builtin_tuple_procedure (a_feature)
			elseif a_class = current_system.integer_8_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.integer_8_class, tokens.builtin_integer_8_class)
			elseif a_class = current_system.integer_8_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_integer_8_class)
			elseif a_class = current_system.integer_16_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.integer_16_class, tokens.builtin_integer_16_class)
			elseif a_class = current_system.integer_16_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_integer_16_class)
			elseif a_class = current_system.integer_32_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.integer_32_class, tokens.builtin_integer_32_class)
			elseif a_class = current_system.integer_32_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_integer_32_class)
			elseif a_class = current_system.integer_64_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.integer_64_class, tokens.builtin_integer_64_class)
			elseif a_class = current_system.integer_64_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_integer_64_class)
			elseif a_class = current_system.natural_8_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.natural_8_class, tokens.builtin_natural_8_class)
			elseif a_class = current_system.natural_8_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_natural_8_class)
			elseif a_class = current_system.natural_16_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.natural_16_class, tokens.builtin_natural_16_class)
			elseif a_class = current_system.natural_16_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_natural_16_class)
			elseif a_class = current_system.natural_32_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.natural_32_class, tokens.builtin_natural_32_class)
			elseif a_class = current_system.natural_32_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_natural_32_class)
			elseif a_class = current_system.natural_64_ref_class then
				set_builtin_sized_integer_ref_procedure (a_feature, current_system.natural_64_class, tokens.builtin_natural_64_class)
			elseif a_class = current_system.natural_64_class then
				set_builtin_sized_integer_procedure (a_feature, tokens.builtin_natural_64_class)
			elseif a_class = current_system.real_32_ref_class then
				set_builtin_sized_real_ref_procedure (a_feature, current_system.real_32_class, tokens.builtin_real_32_class)
			elseif a_class = current_system.real_32_class then
				set_builtin_sized_real_procedure (a_feature, tokens.builtin_real_32_class)
			elseif a_class = current_system.real_64_ref_class then
				set_builtin_sized_real_ref_procedure (a_feature, current_system.real_64_class, tokens.builtin_real_64_class)
			elseif a_class = current_system.real_64_class then
				set_builtin_sized_real_procedure (a_feature, tokens.builtin_real_64_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_any_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class ANY.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.standard_copy_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_copy))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'standard_copy (other: like Current)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'standard_copy (other: like Current)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.copy_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_copy))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'copy (other: like Current)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.like_current, a_class, a_class) then
						-- The signature should be 'copy (other: like Current)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.twin_feature_name) then
					-- 'ANY.twin' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_twin))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_equal_feature_name) then
					-- 'ANY.is_equal' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_equal))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.standard_is_equal_feature_name) then
					-- 'ANY.standard_is_equal' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_is_equal))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.same_type_feature_name) then
					-- 'ANY.same_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_same_type))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.conforms_to_feature_name) then
					-- 'ANY.conforms_to' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_conforms_to))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.generator_feature_name) then
					-- 'ANY.generator' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generator))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
					-- 'ANY.generating_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_generating_type))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.tagged_out_feature_name) then
					-- 'ANY.tagged_out' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_tagged_out))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.standard_twin_feature_name) then
					-- 'ANY.standard_twin' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_standard_twin))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_deep_equal_feature_name) then
					-- 'ANY.is_deep_equal' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_is_deep_equal))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.deep_twin_feature_name) then
					-- 'ANY.deep_twin' should be a function.
				a_feature.set_builtin_code (tokens.builtin_any_feature (tokens.builtin_any_deep_twin))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_type_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class TYPE.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_type_any: ET_GENERIC_CLASS_TYPE
			l_type_type_any: ET_GENERIC_CLASS_TYPE
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.generating_type_feature_name) then
					-- 'TYPE.generating_type' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generating_type))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_system.any_type)
				create l_type_any.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (l_type_any)
				create l_type_type_any.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, l_type_type_any)
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_feature_name) then
					-- 'TYPE.generic_parameter' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter))
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_system.any_type)
				create l_type_any.make (Void, tokens.type_class_name, l_parameters, current_system.type_class)
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, l_type_any)
			elseif a_feature.name.same_feature_name (tokens.generic_parameter_count_feature_name) then
					-- 'TYPE.generic_parameter_count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_generic_parameter_count))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.name_feature_name) then
					-- 'TYPE.name' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_name))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.type_id_feature_name) then
					-- 'TYPE.type_id' should be a function.
				a_feature.set_builtin_code (tokens.builtin_type_feature (tokens.builtin_type_type_id))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_special_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class SPECIAL.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.make_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_make))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'make (nb: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'make (nb: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_put))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put (v: G; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.formal_parameter_1.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.formal_parameter_1, a_class, a_class) then
						-- The signature should be 'put (v: G; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.formal_parameter_1.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put (v: G; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.formal_parameter_1.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_default_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_put_default))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'put_default (i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_default (i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'SPECIAL.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.formal_parameter_1.type)
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
					-- 'SPECIAL.count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_count))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.element_size_feature_name) then
					-- 'SPECIAL.element_size' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_element_size))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.aliased_resized_area_feature_name) then
					-- 'SPECIAL.aliased_resized_area' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_aliased_resized_area))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.base_address_feature_name) then
					-- 'SPECIAL.base_address' should be a function.
				a_feature.set_builtin_code (tokens.builtin_special_feature (tokens.builtin_special_base_address))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.pointer_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_character_ref_procedure (a_feature: ET_EXTERNAL_PROCEDURE; a_character_class: ET_CLASS; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from the ref class of sized character class `a_character_class'.
			-- `a_builtin_class_code' is the built-in code of class `a_character_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_character_class_not_void: a_character_class /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (c: CHARACTER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<a_character_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (a_character_class, a_class, a_class) then
						-- The signature should be 'set_item (c: CHARACTER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<a_character_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'CHARACTER_REF.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, a_character_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_character_procedure (a_feature: ET_EXTERNAL_PROCEDURE; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from a sized character class whose
			-- built-in code is `a_builtin_class_code'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.code_feature_name) then
					-- 'CHARACTER.code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_code))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.natural_32_code_feature_name) then
					-- 'CHARACTER.natural_32_code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_natural_32_code))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_32_class)
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
					-- 'CHARACTER.to_character_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_8_class)
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
					-- 'CHARACTER.to_character_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_character_to_character_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_32_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_boolean_ref_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class BOOLEAN_REF.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (b: BOOLEAN)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'set_item (b: BOOLEAN)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'BOOLEAN_REF.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_boolean_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class BOOLEAN.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.conjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_feature_name) then
					-- 'BOOLEAN.conjuncted' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.conjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_and_then_feature_name) then
					-- 'BOOLEAN.conjuncted_seminstrict' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_and_then))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.disjuncted_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_feature_name) then
					-- 'BOOLEAN.disjuncted' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.disjuncted_semistrict_feature_name) or a_feature.name.same_feature_name (tokens.infix_or_else_feature_name) then
					-- 'BOOLEAN.disjuncted_semistrict' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_or_else))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.implication_feature_name) or a_feature.name.same_feature_name (tokens.infix_implies_feature_name) then
					-- 'BOOLEAN.implication' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_implies))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.negated_feature_name) or a_feature.name.same_feature_name (tokens.prefix_not_feature_name) then
					-- 'BOOLEAN.negated' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_not))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.disjuncted_exclusive_feature_name) or a_feature.name.same_feature_name (tokens.infix_xor_feature_name) then
					-- 'BOOLEAN.disjuncted_exclusive' should be a function.
				a_feature.set_builtin_code (tokens.builtin_boolean_feature (tokens.builtin_boolean_xor))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_pointer_ref_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class POINTER_REF.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (p: POINTER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.pointer_class, a_class, a_class) then
						-- The signature should be 'set_item (p: POINTER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'POINTER_REF.item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.pointer_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_pointer_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class POINTER.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					-- 'POINTER.plus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_plus))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.to_integer_32_feature_name) then
					-- 'POINTER.to_integer_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_to_integer_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
					-- 'POINTER.out' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_out))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.hash_code_feature_name) then
					-- 'POINTER.hash_code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_pointer_feature (tokens.builtin_pointer_hash_code))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_arguments_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class ARGUMENTS.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.argument_feature_name) then
					-- 'ARGUMENTS.argument' should be a function.
				a_feature.set_builtin_code (tokens.builtin_arguments_feature (tokens.builtin_arguments_argument))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.string_type)
			elseif a_feature.name.same_feature_name (tokens.argument_count_feature_name) then
					-- 'ARGUMENTS.argument_count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_arguments_feature (tokens.builtin_arguments_argument_count))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_memory_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class MEMORY.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_special_any: ET_GENERIC_CLASS_TYPE
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.free_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_free))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'free (object: ANY)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'free (object: ANY)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.argument_count_feature_name) then
					-- 'MEMORY.find_referers' should be a function.
				create l_parameters.make_with_capacity (1)
				l_parameters.put_first (current_system.any_type)
				create l_special_any.make (Void, current_system.special_class.name, l_parameters, current_system.special_class)
				a_feature.set_builtin_code (tokens.builtin_memory_feature (tokens.builtin_memory_find_referers))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, current_system.integer_type.type>>, l_special_any)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_identified_routines_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class IDENTIFIED_ROUTINES.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.eif_object_id_free_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id_free))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'eif_object_id_free (an_id: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'eif_object_id_free (an_id: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, Void)
				end

			elseif a_feature.name.same_feature_name (tokens.eif_id_object_feature_name) then
					-- 'IDENTIFIED_ROUTINES.eif_id_object' should be a function.
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_id_object))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
			elseif a_feature.name.same_feature_name (tokens.eif_object_id_feature_name) then
					-- 'IDENTIFIED_ROUTINES.eif_object_id' should be a function.
				a_feature.set_builtin_code (tokens.builtin_identified_feature (tokens.builtin_identified_eif_object_id))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type>>, universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_platform_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class PLATFORM.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.is_dotnet_feature_name) then
					-- 'PLATFORM.is_dotnet' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_dotnet))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.is_mac_feature_name) then
					-- 'PLATFORM.is_mac' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_mac))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.is_unix_feature_name) then
					-- 'PLATFORM.is_unix' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_unix))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.is_vms_feature_name) then
					-- 'PLATFORM.is_vms' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_vms))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.is_windows_feature_name) then
					-- 'PLATFORM.is_windows' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_windows))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.boolean_bytes_feature_name) then
					-- 'PLATFORM.boolean_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_boolean_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.character_bytes_feature_name) then
					-- 'PLATFORM.character_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_character_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.double_bytes_feature_name) then
					-- 'PLATFORM.double_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_double_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.integer_bytes_feature_name) then
					-- 'PLATFORM.integer_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_integer_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.pointer_bytes_feature_name) then
					-- 'PLATFORM.pointer_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_pointer_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.real_bytes_feature_name) then
					-- 'PLATFORM.real_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_real_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.is_thread_capable_feature_name) then
					-- 'PLATFORM.is_thread_capable' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_is_thread_capable))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.wide_character_bytes_feature_name) then
					-- 'PLATFORM.wide_character_bytes' should be a function.
				a_feature.set_builtin_code (tokens.builtin_platform_feature (tokens.builtin_platform_wide_character_bytes))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_procedure_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class PROCEDURE.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_name: ET_IDENTIFIER
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.call_feature_name) then
				create l_name.make ("OPEN_ARGS")
				create l_open_args.make (Void, l_name, 2)
				a_feature.set_builtin_code (tokens.builtin_procedure_feature (tokens.builtin_procedure_call))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'call (args: OPEN_ARGS)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (tokens.formal_parameter_2, a_class, a_class) then
						-- The signature should be 'call (args: OPEN_ARGS)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, Void)
				end
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_function_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class FUNCTION.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_open_args: ET_FORMAL_PARAMETER_TYPE
			l_result_type: ET_FORMAL_PARAMETER_TYPE
			l_name: ET_IDENTIFIER
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'item' should be a function.
				create l_name.make ("OPEN_ARGS")
				create l_open_args.make (Void, l_name, 2)
				create l_name.make ("RESULT_TYPE")
				create l_result_type.make (Void, l_name, 3)
				a_feature.set_builtin_code (tokens.builtin_function_feature (tokens.builtin_function_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<l_open_args.type>>, l_result_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_tuple_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Set built-in code of `a_feature' from class TUPLE.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List procedure names first, then function names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.put_boolean_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_boolean))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_boolean (v: BOOLEAN; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'put_boolean (v: BOOLEAN; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_boolean (v: BOOLEAN; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_character_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_8))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_character_8 (v: CHARACTER_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_8_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.character_8_class, a_class, a_class) then
						-- The signature should be 'put_character_8 (v: CHARACTER_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_8_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_character_8 (v: CHARACTER_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_8_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_character_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_character_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_character_32 (v: CHARACTER_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_32_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.character_32_class, a_class, a_class) then
						-- The signature should be 'put_character_32 (v: CHARACTER_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_32_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_character_32 (v: CHARACTER_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.character_32_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_8))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_8 (v: INTEGER_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_8_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.integer_8_class, a_class, a_class) then
						-- The signature should be 'put_integer_8 (v: INTEGER_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_8_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_integer_8 (v: INTEGER_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_8_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_16))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_16 (v: INTEGER_16; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_16_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.integer_16_class, a_class, a_class) then
						-- The signature should be 'put_integer_16 (v: INTEGER_16; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_16_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_integer_16 (v: INTEGER_16; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_16_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_32 (v: INTEGER_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_32_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.integer_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (universe.integer_class, a_class, a_class)) then
							-- The signature should be 'put_integer_32 (v: INTEGER_32; i: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_32_class.type, universe.integer_type.type>>, Void)
					end
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_integer_32 (v: INTEGER_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_32_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_integer_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_integer_64))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_integer_64 (v: INTEGER_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_64_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.integer_64_class, a_class, a_class) then
						-- The signature should be 'put_integer_64 (v: INTEGER_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_64_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_integer_64 (v: INTEGER_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.integer_64_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_8_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_8))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_8 (v: NATURAL_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_8_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.natural_8_class, a_class, a_class) then
						-- The signature should be 'put_natural_8 (v: NATURAL_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_8_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_natural_8 (v: NATURAL_8; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_8_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_16_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_16))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_16 (v: NATURAL_16; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_16_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.natural_16_class, a_class, a_class) then
						-- The signature should be 'put_natural_16 (v: NATURAL_16; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_16_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_natural_16 (v: NATURAL_16; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_16_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_32 (v: NATURAL_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_32_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.natural_32_class, a_class, a_class) then
						-- The signature should be 'put_natural_32 (v: NATURAL_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_32_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_natural_32 (v: NATURAL_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_32_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_natural_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_natural_64))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_natural_64 (v: NATURAL_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_64_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.natural_64_class, a_class, a_class) then
						-- The signature should be 'put_natural_64 (v: NATURAL_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_64_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_natural_64 (v: NATURAL_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.natural_64_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_pointer_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_pointer))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_pointer (v: POINTER; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.pointer_class, a_class, a_class) then
						-- The signature should be 'put_pointer (v: POINTER; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_pointer (v: POINTER; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.pointer_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_real_32_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_32))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_real_32 (v: REAL_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_32_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.real_32_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (universe.real_class, a_class, a_class)) then
							-- The signature should be 'put_real_32 (v: REAL_32; i: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_32_class.type, universe.integer_type.type>>, Void)
					end
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_real_32 (v: REAL_32; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_32_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_real_64_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_real_64))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_real_64 (v: REAL_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.real_64_class, a_class, a_class) then
					if not (current_system.is_ise and then current_system.ise_version <= ise_6_2_7_2906 and then l_formals.formal_argument (1).type.same_syntactical_type (universe.double_class, a_class, a_class)) then
							-- The signature should be 'put_real_64 (v: REAL_64; i: INTEGER)'.
						set_fatal_error (a_class)
						error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type, universe.integer_type.type>>, Void)
					end
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_real_64 (v: REAL_64; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.real_64_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.put_reference_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_put_reference))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 2 then
						-- The signature should be 'put_reference (v: ANY; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.any_class, a_class, a_class) then
						-- The signature should be 'put_reference (v: ANY; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, universe.integer_type.type>>, Void)
				elseif not l_formals.formal_argument (2).type.same_syntactical_type (universe.integer_class, a_class, a_class) then
						-- The signature should be 'put_reference (v: ANY; i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.any_class.type, universe.integer_type.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.set_object_comparison_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_set_object_comparison))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_object_comparison (b: BOOLEAN)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (current_system.boolean_class, a_class, a_class) then
						-- The signature should be 'set_object_comparison (b: BOOLEAN)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<current_system.boolean_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.boolean_item_feature_name) then
					-- 'TUPLE.boolean_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_boolean_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.character_8_item_feature_name) then
					-- 'TUPLE.character_8_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_8_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_8_class)
			elseif a_feature.name.same_feature_name (tokens.character_32_item_feature_name) then
					-- 'TUPLE.character_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_character_32_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.character_32_class)
			elseif a_feature.name.same_feature_name (tokens.count_feature_name) then
					-- 'TUPLE.count' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_count))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.integer_8_item_feature_name) then
					-- 'TUPLE.integer_8_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_8_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_8_class)
			elseif a_feature.name.same_feature_name (tokens.integer_16_item_feature_name) then
					-- 'TUPLE.integer_16_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_16_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_16_class)
			elseif a_feature.name.same_feature_name (tokens.integer_32_item_feature_name) then
					-- 'TUPLE.integer_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_32_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.integer_64_item_feature_name) then
					-- 'TUPLE.integer_64_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_integer_64_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.integer_64_class)
			elseif a_feature.name.same_feature_name (tokens.item_code_feature_name) then
					-- 'TUPLE.item_code' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_item_code))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
			elseif a_feature.name.same_feature_name (tokens.natural_8_item_feature_name) then
					-- 'TUPLE.natural_8_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_8_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_8_class)
			elseif a_feature.name.same_feature_name (tokens.natural_16_item_feature_name) then
					-- 'TUPLE.natural_16_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_16_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_16_class)
			elseif a_feature.name.same_feature_name (tokens.natural_32_item_feature_name) then
					-- 'TUPLE.natural_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_32_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_32_class)
			elseif a_feature.name.same_feature_name (tokens.natural_64_item_feature_name) then
					-- 'TUPLE.natural_64_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_natural_64_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.natural_64_class)
			elseif a_feature.name.same_feature_name (tokens.object_comparison_feature_name) then
					-- 'TUPLE.object_comparison' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_object_comparison))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.pointer_item_feature_name) then
					-- 'TUPLE.pointer_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_pointer_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.pointer_class)
			elseif a_feature.name.same_feature_name (tokens.real_32_item_feature_name) then
					-- 'TUPLE.real_32_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_32_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.real_type)
			elseif a_feature.name.same_feature_name (tokens.real_64_item_feature_name) then
					-- 'TUPLE.real_64_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_real_64_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.reference_item_feature_name) then
					-- 'TUPLE.reference_item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_tuple_feature (tokens.builtin_tuple_reference_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, current_system.any_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_integer_ref_procedure (a_feature: ET_EXTERNAL_PROCEDURE; an_integer_class: ET_CLASS; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from the ref class of sized integer class `an_integer_class'.
			-- `a_builtin_class_code' is the built-in code of class `an_integer_class'.
		require
			a_feature_not_void: a_feature /= Void
			an_integer_class_not_void: an_integer_class /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<an_integer_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (an_integer_class, a_class, a_class) then
						-- The signature should be 'set_item (i: INTEGER)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<an_integer_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, an_integer_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_integer_procedure (a_feature: ET_EXTERNAL_PROCEDURE; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from a sized integer class whose
			-- built-in code is `a_builtin_class_code'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					-- 'plus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_plus))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
					-- 'minus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_minus))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
					-- 'product' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_times))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
					-- 'quotient' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_divide))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.integer_quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_div_feature_name) then
					-- 'integer_quotient' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_div))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.integer_remainder_feature_name) or a_feature.name.same_feature_name (tokens.infix_mod_feature_name) then
					-- 'integer_remainder' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_mod))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
					-- 'power' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_power))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.double_type.type>>, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
					-- 'opposite' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_opposite))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
					-- 'identity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_identity))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
					-- 'is_less' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_lt))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.to_character_8_feature_name) then
					-- 'to_character_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_8_class)
			elseif a_feature.name.same_feature_name (tokens.to_character_32_feature_name) then
					-- 'to_character_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_character_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.character_32_class)
			elseif a_feature.name.same_feature_name (tokens.to_real_feature_name) then
					-- 'to_real' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.real_type)
			elseif a_feature.name.same_feature_name (tokens.to_real_32_feature_name) then
					-- 'to_real_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.real_type)
			elseif a_feature.name.same_feature_name (tokens.to_real_64_feature_name) then
					-- 'to_real_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_real_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
					-- 'to_double' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_to_double))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.as_natural_8_feature_name) then
					-- 'as_natural_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_8_class)
			elseif a_feature.name.same_feature_name (tokens.as_natural_16_feature_name) then
					-- 'as_natural_16' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_16))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_16_class)
			elseif a_feature.name.same_feature_name (tokens.as_natural_32_feature_name) then
					-- 'as_natural_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_32_class)
			elseif a_feature.name.same_feature_name (tokens.as_natural_64_feature_name) then
					-- 'as_natural_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_natural_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.natural_64_class)
			elseif a_feature.name.same_feature_name (tokens.as_integer_8_feature_name) then
					-- 'as_integer_8' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_8))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_8_class)
			elseif a_feature.name.same_feature_name (tokens.as_integer_16_feature_name) then
					-- 'as_integer_16' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_16))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_16_class)
			elseif a_feature.name.same_feature_name (tokens.as_integer_32_feature_name) then
					-- 'as_integer_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.as_integer_64_feature_name) then
					-- 'as_integer_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_as_integer_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_64_class)
			elseif a_feature.name.same_feature_name (tokens.bit_or_feature_name) then
					-- 'bit_or' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_or))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_and_feature_name) then
					-- 'bit_and' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_and))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_shift_left_feature_name) then
					-- 'bit_shift_left' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_left))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_shift_right_feature_name) then
					-- 'bit_shift_right' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_shift_right))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.integer_type.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_xor_feature_name) then
					-- 'bit_xor' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_xor))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.bit_not_feature_name) then
					-- 'bit_not' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_integer_bit_not))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_real_ref_procedure (a_feature: ET_EXTERNAL_PROCEDURE; a_real_class: ET_CLASS; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from the ref class of sized real class `a_real_class'.
			-- `a_builtin_class_code' is the built-in code of class `a_real_class'.
		require
			a_feature_not_void: a_feature /= Void
			a_real_class_not_void: a_real_class /= Void
		local
			a_class: ET_CLASS
			l_formals: ET_FORMAL_ARGUMENT_LIST
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.set_item_feature_name) then
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_set_item))
				l_formals := a_feature.arguments
				if l_formals = Void or else l_formals.count /= 1 then
						-- The signature should be 'set_item (r: REAL)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<a_real_class.type>>, Void)
				elseif not l_formals.formal_argument (1).type.same_syntactical_type (a_real_class, a_class, a_class) then
						-- The signature should be 'set_item (r: REAL)'.
					set_fatal_error (a_class)
					error_handler.report_gvkbs0a_error (a_class, a_feature, <<a_real_class.type>>, Void)
				end
			elseif a_feature.name.same_feature_name (tokens.item_feature_name) then
					-- 'item' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_item))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, a_real_class)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

	set_builtin_sized_real_procedure (a_feature: ET_EXTERNAL_PROCEDURE; a_builtin_class_code: INTEGER) is
			-- Set built-in code of `a_feature' from a sized real class whose
			-- built-in code is `a_builtin_class_code'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_class: ET_CLASS
		do
				-- List function names first, then procedure names.
			a_class := a_feature.implementation_class
			if a_feature.name.same_feature_name (tokens.plus_feature_name) or a_feature.name.same_feature_name (tokens.infix_plus_feature_name) then
					-- 'plus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_plus))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.minus_feature_name) or a_feature.name.same_feature_name (tokens.infix_minus_feature_name) then
					-- 'minus' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_minus))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.product_feature_name) or a_feature.name.same_feature_name (tokens.infix_times_feature_name) then
					-- 'product' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_times))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.quotient_feature_name) or a_feature.name.same_feature_name (tokens.infix_divide_feature_name) then
					-- 'quotient' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_divide))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.power_feature_name) or a_feature.name.same_feature_name (tokens.infix_power_feature_name) then
					-- 'power' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_power))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<universe.double_type.type>>, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.opposite_feature_name) or a_feature.name.same_feature_name (tokens.prefix_minus_feature_name) then
					-- 'opposite' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_opposite))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.identity_feature_name) or a_feature.name.same_feature_name (tokens.prefix_plus_feature_name) then
					-- 'identity' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_identity))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, tokens.like_current)
			elseif a_feature.name.same_feature_name (tokens.is_less_feature_name) or a_feature.name.same_feature_name (tokens.infix_lt_feature_name) then
					-- 'is_less' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_lt))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, <<tokens.like_current.type>>, current_system.boolean_class)
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_feature_name) then
					-- 'truncated_to_integer' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.integer_type)
			elseif a_feature.name.same_feature_name (tokens.truncated_to_integer_64_feature_name) then
					-- 'truncated_to_integer_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_integer_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.integer_64_class)
			elseif a_feature.name.same_feature_name (tokens.truncated_to_real_feature_name) then
					-- 'truncated_to_real' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_truncated_to_real))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
			elseif a_feature.name.same_feature_name (tokens.to_double_feature_name) then
					-- 'to_double' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_to_double))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.double_type)
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_32_feature_name) then
					-- 'ceiling_real_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
			elseif a_feature.name.same_feature_name (tokens.ceiling_real_64_feature_name) then
					-- 'ceiling_real_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_ceiling_real_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
			elseif a_feature.name.same_feature_name (tokens.floor_real_32_feature_name) then
					-- 'floor_real_32' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_32))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_32_class)
			elseif a_feature.name.same_feature_name (tokens.floor_real_64_feature_name) then
					-- 'floor_real_64' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_floor_real_64))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, current_system.real_64_class)
			elseif a_feature.name.same_feature_name (tokens.out_feature_name) then
					-- 'out' should be a function.
				a_feature.set_builtin_code (tokens.builtin_feature (a_builtin_class_code, tokens.builtin_real_out))
				set_fatal_error (a_class)
				error_handler.report_gvkbs0a_error (a_class, a_feature, Void, universe.string_type)
			else
					-- Unknown built-in routine.
				a_feature.set_builtin_code (tokens.builtin_unknown)
				if unknown_builtin_reported then
					set_fatal_error (a_class)
					error_handler.report_gvkbu1a_error (a_class, a_feature)
				end
			end
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			report_syntax_error (current_position)
		end

	set_syntax_error is
			-- Set syntax error flag in class being parsed, if already known.
		do
			if last_class /= Void then
				set_fatal_error (last_class)
			end
		end

	set_fatal_error (a_class: ET_CLASS) is
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_parsed
			a_class.set_syntax_error
		ensure
			is_parsed: a_class.is_parsed
			has_syntax_error: a_class.has_syntax_error
		end

feature {NONE} -- Access

	last_clients: ET_CLIENT_LIST
			-- Last clients read

	last_export_clients: ET_CLIENTS
			-- Last clients read in New_export clauses

	last_feature_clause: ET_FEATURE_CLAUSE
			-- Last feature clause read

	last_class: ET_CLASS
			-- Class being parsed

	assertions: DS_ARRAYED_LIST [ET_ASSERTION_ITEM]
			-- List of assertions currently being parsed

	queries: DS_ARRAYED_LIST [ET_QUERY]
			-- List of queries currently being parsed

	procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
			-- List of procedures currently being parsed

	constraints: DS_ARRAYED_LIST [ET_CONSTRAINT_TYPE]
			-- List of generic constraints currently being parsed

	providers: DS_HASH_SET [ET_CLASS]
			-- Provider classes already read (when enabled)

feature {NONE} -- Local variables

	last_local_variables: ET_LOCAL_VARIABLE_LIST
			-- Last local variable clause read for the closure
			-- (i.e. feature or inline agent) being parsed

	last_local_variables_stack: DS_ARRAYED_STACK [ET_LOCAL_VARIABLE_LIST]
			-- Stack of last local variable clauses read
			-- for the enclosing closures (i.e. feature or
			-- inline agents) of the closure being parsed

	wipe_out_last_local_variables_stack is
			-- Wipe out `last_local_variables_stack' and
			-- set `last_local_variables' to Void.
		do
			last_local_variables_stack.wipe_out
			last_local_variables := Void
		ensure
			last_local_variables_stack_wiped_out: last_local_variables_stack.is_empty
			last_local_variables_void: last_local_variables = Void
		end

feature {NONE} -- Object-tests

	last_object_tests: ET_OBJECT_TEST_LIST
			-- Object-tests already found in the closure (i.e. feature,
			-- invariant or inline agent) being parsed

	last_object_tests_stack: DS_ARRAYED_STACK [ET_OBJECT_TEST_LIST]
			-- Stack of object-tests already found in the enclosing
			-- closures (i.e. feature, invariant or inline agents)
			-- of the closure being parsed

	last_object_tests_pool: DS_ARRAYED_STACK [ET_OBJECT_TEST_LIST]
			-- Pool of object-test lists available for usage
			-- whenever needed

	new_object_test_list: ET_OBJECT_TEST_LIST is
			-- New object-test list;
			-- Reuse items from `last_object_tests_pool' if available.
		do
			if not last_object_tests_pool.is_empty then
				Result := last_object_tests_pool.item
				last_object_tests_pool.remove
			else
				create Result.make_with_capacity (Initial_last_object_tests_capacity)
			end
		ensure
			new_object_test_list_not_void: Result /= Void
		end

	wipe_out_last_object_tests_stack is
			-- Wipe out `last_object_tests_stack' and
			-- set `last_object_tests' to Void.
		local
			l_object_test_list: ET_OBJECT_TEST_LIST
			i, nb: INTEGER
		do
			if last_object_tests /= Void then
				last_object_tests.wipe_out
				last_object_tests_pool.force (last_object_tests)
				last_object_tests := Void
			end
			nb := last_object_tests_stack.count
			from i := 1 until i > nb loop
				l_object_test_list := last_object_tests_stack.i_th (i)
				if l_object_test_list /= Void then
					l_object_test_list.wipe_out
					last_object_tests_pool.force (l_object_test_list)
				end
				i := i + 1
			end
			last_object_tests_stack.wipe_out
		ensure
			last_object_tests_stack_wiped_out: last_object_tests_stack.is_empty
			last_object_tests_void: last_object_tests = Void
		end

feature {NONE} -- Formal arguments

	last_formal_arguments: ET_FORMAL_ARGUMENT_LIST
			-- Last formal argument clause read for the closure
			-- (i.e. feature or inline agent) being parsed

	last_formal_arguments_stack: DS_ARRAYED_STACK [ET_FORMAL_ARGUMENT_LIST]
			-- Stack of last formal argument clauses read
			-- for the enclosing closures (i.e. feature or
			-- inline agents) of the closure being parsed

	wipe_out_last_formal_arguments_stack is
			-- Wipe out `last_formal_arguments_stack' and
			-- set `last_formal_arguments' to Void.
		do
			last_formal_arguments_stack.wipe_out
			last_formal_arguments := Void
		ensure
			last_formal_arguments_stack_wiped_out: last_formal_arguments_stack.is_empty
			last_formal_arguments_void: last_formal_arguments = Void
		end

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

feature {NONE} -- Input buffer

	eiffel_buffer: YY_FILE_BUFFER
			-- Eiffel file input buffer

feature {NONE} -- Constants

	Initial_eiffel_buffer_size: INTEGER is 50000
			-- Initial size for `eiffel_buffer'

	Initial_counters_capacity: INTEGER is 10
			-- Initial capacity for `counters'

	Initial_last_formal_arguments_stack_capacity: INTEGER is 5
			-- Initial capacity for `last_formal_arguments_stack'

	Initial_last_local_variables_stack_capacity: INTEGER is 5
			-- Initial capacity for `last_local_variables_stack'

	Initial_last_keywords_capacity: INTEGER is 5
			-- Initial capacity for `last_keywords'

	Initial_last_symbols_capacity: INTEGER is 5
			-- Initial capacity for `last_symbols'

	Initial_last_object_tests_capacity: INTEGER is 50
			-- Initial capacity for `last_object_tests'

	Initial_assertions_capacity: INTEGER is 20
			-- Initial capacity for `assertions'

	Initial_queries_capacity: INTEGER is 100
			-- Initial capacity for `queries'

	Initial_procedures_capacity: INTEGER is 100
			-- Initial capacity for `procedures'

	Initial_constraints_capacity: INTEGER is 10
			-- Initial capacity for `constraints'

	Initial_providers_capacity: INTEGER is 100
			-- Initial capacity for `providers'

	dummy_type: ET_TYPE is
			-- Dummy type
		once
			Result := tokens.unknown_class
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
	last_formal_arguments_stack_not_void: last_formal_arguments_stack /= Void
	last_local_variables_stack_not_void: last_local_variables_stack /= Void
	last_keywords_not_void: last_keywords /= Void
	last_symbols_not_void: last_symbols /= Void
	assertions_not_void: assertions /= Void
	no_void_assertion: not assertions.has (Void)
	queries_not_void: queries /= Void
	no_void_query: not queries.has (Void)
	-- queries_registered: forall f in queries, f.is_registered
	procedures_not_void: procedures /= Void
	no_void_procedure: not procedures.has (Void)
	-- procedures_registered: forall f in procedures, f.is_registered
	constraints_not_void: constraints /= Void
	providers_not_void: providers /= Void
	no_void_provider: not providers.has (Void)
		-- Object-tests.
	last_object_tests_stack_not_void: last_object_tests_stack /= Void
	last_object_tests_pool_not_void: last_object_tests_pool /= Void
	no_void_last_object_tests_in_pool: not last_object_tests_pool.has (Void)
		-- Input buffer.
	eiffel_buffer_not_void: eiffel_buffer /= Void

end
