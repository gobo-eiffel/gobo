note

	description:

		"Eiffel parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2009/11/01 $"
	revision: "$Revision: #41 $"

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
			error_handler, current_universe, current_system
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

	make
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
			create last_across_components_stack.make (Initial_last_across_components_capacity)
			create last_across_components_pool.make (Initial_last_across_components_capacity)
			create assertions.make (Initial_assertions_capacity)
			create check_assertion_counters.make (Initial_check_assertion_counters_capacity)
			create queries.make (Initial_queries_capacity)
			create procedures.make (Initial_procedures_capacity)
			create constraints.make (Initial_constraints_capacity)
			create providers.make (Initial_providers_capacity)
			make_eiffel_scanner ("unknown file")
			make_parser_skeleton
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			precursor
			eiffel_buffer.set_end_of_file
			counters.wipe_out
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
			wipe_out_last_across_components_stack
			last_keywords.wipe_out
			last_symbols.wipe_out
			providers.wipe_out
			assertions.wipe_out
			check_assertion_counters.wipe_out
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

	providers_enabled: BOOLEAN
			-- Should providers be built when parsing a class?
		do
			Result := current_system.providers_enabled
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_time_stamp: INTEGER; a_group: ET_PRIMARY_GROUP)
			-- Parse all classes in `a_file' within group `a_group'.
			-- `a_filename' is the filename of `a_file' and `a_time_stamp'
			-- its time stamp just before it was open.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
			a_group_not_void: a_group /= Void
		local
			old_group: ET_PRIMARY_GROUP
		do
			old_group := group
			group := a_group
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

	parse_cluster (a_cluster: ET_CLUSTER)
			-- Traverse `a_cluster' (recursively) and parse the classes
			-- it contains. Classes are added to `universe.classes'.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_time_stamp: INTEGER
			dir_name: STRING
			dir: KL_DIRECTORY
			s: STRING
			old_group: ET_PRIMARY_GROUP
			l_already_preparsed: BOOLEAN
			l_classes: detachable DS_ARRAYED_LIST [ET_CLASS]
			l_cell: detachable DS_CELL [detachable ET_CLASS]
			l_class_name: ET_IDENTIFIER
			l_class: detachable ET_CLASS
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
							l_class := Void
							if l_already_preparsed then
									-- This cluster has already been traversed. Therefore
									-- we are only interested in new or modified classes,
									-- or those which have not been parsed yet.
								if l_cell = Void then
									create l_cell.make (Void)
								else
									l_cell.put (Void)
								end
								create l_class_name.make (s.substring (1, s.count - 2))
								current_universe.master_class (l_class_name).local_classes_do_if (agent l_cell.put ({ET_CLASS}?), agent {ET_CLASS}.is_in_group (a_cluster))
								if attached l_cell.item as l_local_class and then attached l_local_class.filename as l_local_class_filename and then file_system.same_pathnames (l_local_class_filename, a_filename) then
									if l_local_class.is_parsed then
										l_class := l_local_class
									else
											-- Force the parsing.
										l_local_class.reset
									end
								else
									if l_classes = Void then
										l_classes := current_universe.classes_in_group (a_cluster)
									end
									l_class := Void
									nb := l_classes.count
									from i := 1 until i > nb loop
										l_class := l_classes.item (i)
										if attached l_class.filename as l_class_filename and then file_system.same_pathnames (l_class_filename, a_filename) then
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
			if attached a_cluster.subclusters as l_subclusters then
				parse_clusters (l_subclusters)
			end
			group := old_group
		end

	parse_clusters (a_clusters: ET_CLUSTERS)
			-- Traverse `a_clusters' (recursively) and parse the classes
			-- they contain. Classes are added to `universe.classes'.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
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

	process_class (a_class: ET_CLASS)
			-- Parse `a_class'.
			-- The class may end up with a syntax error status if its
			-- `filename' didn't contain this class after all (i.e.
			-- if the preparsing phase gave errouneous result).
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
		local
			a_time_stamp: INTEGER
			a_cluster: ET_CLUSTER
			a_file: KL_TEXT_INPUT_FILE
			old_class: ET_CLASS
			old_group: ET_PRIMARY_GROUP
			l_class_text: KL_STRING_INPUT_STREAM
			a_text_filename: STRING
			l_class_filename: detachable STRING
		do
			if a_class.is_none then
				a_class.set_parsed
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is fatal.
				set_fatal_error (a_class)
				error_handler.report_giaaa_error
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				old_class := current_class
				current_class := a_class
				old_group := group
				group := current_class.group
				if not current_class.is_parsed then
					if current_class.is_in_cluster and then attached current_class.filename as a_filename then
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
									error_handler.report_gvscn1b_error (a_class, a_filename)
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
					elseif attached {ET_TEXT_GROUP} current_class.group as l_text_group then
						l_class_filename := current_class.filename
						if l_class_filename /= Void and then not l_class_filename.is_empty then
							a_text_filename := l_class_filename
						else
							a_text_filename := current_class.lower_name + ".e"
						end
						current_class.reset_after_preparsed
						if attached l_text_group.class_text (current_class) as l_text then
							create l_class_text.make (l_text)
						else
							create l_class_text.make ("")
						end
							-- Note that `parse_file' may change the value of `current_class'
							-- if `l_class_text' contains a class other than `a_class'.
						parse_file (l_class_text, a_text_filename, -1, l_text_group)
						if not a_class.is_preparsed then
								-- Make sure that `current_class' is as it was
								-- after it was last preparsed when the file
								-- does not contain this class anymore.
							if l_class_filename /= Void and then not l_class_filename.is_empty then
								a_class.set_filename (l_class_filename)
							else
								a_class.reset_preparsed
							end
							a_class.set_group (l_text_group)
						end
						if not a_class.is_parsed then
							if not syntax_error and current_system.preparse_multiple_mode then
									-- The class text contains other classes, but not `current_class'.
								set_fatal_error (a_class)
								error_handler.report_gvscn1b_error (a_class, a_text_filename)
							end
						end
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

	process_cluster (a_cluster: ET_CLUSTER)
			-- Traverse `a_cluster' (recursively) and parse the classes
			-- it contains. Classes are added to `universe.classes'.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- parsing works. Read the header comments of these features
			-- for more details.
		do
			parse_cluster (a_cluster)
		end

feature {NONE} -- Basic operations

	register_query (a_query: detachable ET_QUERY)
			-- Register `a_query' in `last_class'.
		do
			if a_query /= Void then
				current_system.register_feature (a_query)
				queries.force_last (a_query)
				queries.finish
				if attached last_object_tests as l_last_object_tests then
					a_query.set_object_tests (l_last_object_tests.cloned_object_test_list)
				end
				if attached last_across_components as l_last_across_components then
					a_query.set_across_components (l_last_across_components.cloned_across_component_list)
				end
			end
				-- Reset local variables, formal arguments, object-tests
				-- and across components before reading the next feature.
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
			wipe_out_last_across_components_stack
		end

	register_query_synonym (a_query: detachable ET_QUERY)
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

	register_procedure (a_procedure: detachable ET_PROCEDURE)
			-- Register `a_procedure' in `last_class'.
		do
			if a_procedure /= Void then
				current_system.register_feature (a_procedure)
				procedures.force_last (a_procedure)
				procedures.finish
				if attached last_object_tests as l_last_object_tests then
					a_procedure.set_object_tests (l_last_object_tests.cloned_object_test_list)
				end
				if attached last_across_components as l_last_across_components then
					a_procedure.set_across_components (l_last_across_components.cloned_across_component_list)
				end
			end
				-- Reset local variables, formal arguments, object-tests
				-- and across components before reading the next feature.
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
			wipe_out_last_across_components_stack
		end

	register_procedure_synonym (a_procedure: detachable ET_PROCEDURE)
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

	register_inline_agent (a_inline_agent: detachable ET_INLINE_AGENT)
			-- Register `a_inline_agent'.
		do
			if a_inline_agent /= Void then
				if attached last_object_tests as l_last_object_tests then
					a_inline_agent.set_object_tests (l_last_object_tests.cloned_object_test_list)
				end
				if attached last_across_components as l_last_across_components then
					a_inline_agent.set_across_components (l_last_across_components.cloned_across_component_list)
				end
					-- Clean up after the inline agent has been parsed.
				set_end_closure
			end
		end

	register_constraint (a_constraint: detachable ET_CONSTRAINT_TYPE)
			-- Register generic constraint.
		do
			constraints.force_last (a_constraint)
		ensure
			one_more: constraints.count = old constraints.count + 1
			registered: constraints.last = a_constraint
		end

	dummy_constraint (a_constraint: detachable ET_CONSTRAINT_TYPE): detachable ET_TYPE
			-- Dummy type, or Void if `a_constraint' is Void
		do
			if a_constraint /= Void then
				Result := dummy_type
			end
		ensure
			void_type: a_constraint = Void implies Result = Void
			non_void_type: a_constraint /= Void implies Result /= Void
		end

	set_formal_parameters (a_parameters: detachable ET_FORMAL_PARAMETER_LIST)
			-- Set formal generic parameters of `last_class'.
		require
			no_constraint: a_parameters = Void implies constraints.is_empty
			same_count: a_parameters /= Void implies constraints.count = a_parameters.count
		local
			a_class: like last_class
			a_constraint: detachable ET_CONSTRAINT_TYPE
			a_type: detachable  ET_TYPE
			i, nb: INTEGER
		do
			if a_parameters /= Void then
				a_class := last_class
				if a_class /= Void then
					nb := a_parameters.count
					from i := nb until i < 1 loop
						if attached {ET_CONSTRAINED_FORMAL_PARAMETER} a_parameters.formal_parameter (i) as a_constrained_formal then
							a_constraint := constraints.item (i)
							if a_constraint /= Void then
								a_type := a_constraint.resolved_syntactical_constraint (a_parameters, a_class, Current)
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
					a_class.set_formal_parameters (a_parameters)
				end
			end
			constraints.wipe_out
		end

	set_class_features
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

	set_class_providers
			-- Set providers of `last_class' (when enabled).
		local
			l_providers: DS_HASH_SET [ET_NAMED_CLASS]
			l_class: like last_class
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

	set_class_to_end (a_class: detachable ET_CLASS; an_obsolete: detachable ET_OBSOLETE; a_parents: detachable ET_PARENT_LIST;
		a_creators: detachable ET_CREATOR_LIST; a_convert_features: detachable ET_CONVERT_FEATURE_LIST;
		a_feature_clauses: detachable ET_FEATURE_CLAUSE_LIST; an_invariants: detachable ET_INVARIANTS;
		a_second_indexing: detachable ET_INDEXING_LIST; an_end: detachable ET_KEYWORD)
			-- Set various elements to `a_class'.
		do
			if a_class /= Void then
				a_class.set_obsolete_message (an_obsolete)
				a_class.set_parent_clause (a_parents)
				a_class.set_creators (a_creators)
				a_class.set_convert_features (a_convert_features)
				a_class.set_feature_clauses (a_feature_clauses)
				a_class.set_invariants (an_invariants)
				a_class.set_second_indexing (a_second_indexing)
				if an_end /= Void then
					a_class.set_end_keyword (an_end)
				end
			end
		end

	set_class_to_inheritance_end (a_class: detachable ET_CLASS; an_obsolete: detachable ET_OBSOLETE; a_parents: detachable ET_PARENT_LIST)
			-- Set various elements to `a_class'.
			-- Note: This is the case where the following class declaration:
			--		class FOO inherit BAR end
			-- produces a grammar ambiguity and where, through shift/reduce
			-- conflicts, it has been parsed with 'end' being recognized as
			-- the end of the feature adaptation of BAR instead of as the
			-- end of the class FOO.
		local
			a_parent: ET_PARENT
			an_end: detachable ET_KEYWORD
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

	set_inline_agent_actual_arguments (a_inline_agent: detachable ET_INLINE_AGENT; a_actual_arguments: detachable ET_AGENT_ARGUMENT_OPERANDS)
			-- Set actual arguments of inline agent.
		do
			if a_inline_agent /= Void and a_actual_arguments /= Void then
				a_inline_agent.set_actual_arguments (a_actual_arguments)
			end
		end

	add_expression_assertion (an_expression: detachable ET_EXPRESSION; a_semicolon: detachable ET_SYMBOL)
			-- Add `an_expression' assertion, optionally followed
			-- by `a_semicolon', to `assertions'.
		local
			an_assertion: detachable ET_ASSERTION_ITEM
			done: BOOLEAN
		do
			if not assertions.is_empty then
				if attached {ET_TAGGED_ASSERTION} assertions.last as l_tagged and then l_tagged.expression = Void then
					if an_expression /= Void then
						l_tagged.set_expression (an_expression)
						if a_semicolon /= Void then
							an_assertion := ast_factory.new_assertion_semicolon (l_tagged, a_semicolon)
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

	add_tagged_assertion (a_tag: detachable ET_IDENTIFIER; a_colon: detachable ET_SYMBOL; a_semicolon: detachable ET_SYMBOL)
			-- Add tagged assertion, optionally followed
			-- by `a_semicolon', to `assertions'.
		local
			an_assertion: detachable ET_TAGGED_ASSERTION
			an_assertion_item: detachable ET_ASSERTION_ITEM
			l_position: ET_POSITION
			l_file_position: ET_FILE_POSITION
		do
			if current_system.is_ise then
					-- ISE does not accept assertions of the form:
					--      a_tag: -- a comment assertion
					-- when followed by another tagged assertion.
				if not assertions.is_empty then
					if attached {ET_TAGGED_ASSERTION} assertions.last as l_tagged and then l_tagged.expression = Void then
						if a_tag = Void then
							l_position := current_position
						else
							l_position := a_tag.position
							if not l_position.is_null then
								create l_file_position.make (filename, l_position.line, l_position.column)
								l_position := l_file_position
							else
								l_position := current_position
							end
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

	add_to_actual_parameter_list (a_parameter: detachable ET_ACTUAL_PARAMETER_ITEM; a_list: detachable ET_ACTUAL_PARAMETER_LIST)
			-- Add `a_parameter' at the beginning of `a_list'.
		do
			if a_list /= Void and a_parameter /= Void then
				a_list.put_first (a_parameter)
			end
		end

	add_to_constraint_actual_parameter_list (a_parameter: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM; a_list: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST)
			-- Add `a_parameter' at the beginning of `a_list'.
		do
			if a_list /= Void and a_parameter /= Void then
				a_list.put_first (a_parameter)
			end
		end

	set_start_closure (a_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST)
			-- Indicate the we just parsed the formal arguments of a
			-- new closure (i.e. feature, invariant or inline agent).
			-- Keep track of the values of `last_formal_arguments',
			-- `last_local_variables', `last_object_tests' and
			-- `last_across_components' for the enclosing closure.
			-- They will be restored when we reach the end of the
			-- closure by `set_end_closure'.
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
			if not last_across_components_stack.is_empty or last_across_components /= Void then
				last_across_components_stack.force (last_across_components)
			end
			last_across_components := Void
		end

	set_end_closure
			-- Indicate that the end of the closure (i.e. feature, invariant
			-- or inline agent) being parsed has been reached. Restore
			-- `last_formal_arguments', `last_local_variables',
			-- `last_object_tests' and `last_across_components'
			-- for the enclosing closure if any.
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
			if not last_across_components_stack.is_empty then
				last_across_components := last_across_components_stack.item
				last_across_components_stack.remove
			else
				last_across_components := Void
			end
		end

	start_check_instruction
			-- Indicate that we start parsing a check-instruction.
		do
			check_assertion_counters.force_last (assertions.count)
		end

feature {ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM, ET_CONSTRAINT_ACTUAL_PARAMETER_LIST} -- Generic constraints

	resolved_constraint_named_type (a_constraint: ET_CONSTRAINT_NAMED_TYPE;
		a_formals: ET_FORMAL_PARAMETER_LIST; a_class: ET_CLASS): detachable ET_TYPE
			-- Version of `a_constraint', appearing in the constraint of one
			-- of the formal generic parameters in `a_formals' of `a_class',
			-- where class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
			a_class_not_void: a_class /= Void
		local
			a_name: ET_IDENTIFIER
			a_formal: detachable ET_FORMAL_PARAMETER
			a_type_mark: detachable ET_TYPE_MARK
			a_base_class: ET_MASTER_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			a_name := a_constraint.name
			a_type_mark := a_constraint.type_mark
			a_formal := a_formals.formal_parameter_by_name (a_name)
			if a_formal /= Void then
				if a_type_mark /= Void and then not a_type_mark.is_attachment_mark then
						-- A formal parameter type is not a class type.
						-- It cannot be prefixed by 'expanded' or 'reference'.
						-- But it can be prefixed by 'attached', 'detachable', '!' or '?'.
					report_syntax_error (a_type_mark.position)
					Result := ast_factory.new_formal_parameter_type (Void, a_name, a_formal.index, a_class)
				else
					Result := ast_factory.new_formal_parameter_type (a_type_mark, a_name, a_formal.index, a_class)
				end
			else
				a_base_class := current_universe.master_class (a_name)
				if providers_enabled then
					providers.force_last (a_base_class)
				end
				a_base_class.set_in_system (True)
				l_type_mark := a_type_mark
				if l_type_mark = Void then
					l_type_mark := current_universe.implicit_attachment_type_mark
				end
				if a_base_class.name.same_class_name (tokens.tuple_class_name) then
					if a_type_mark /= Void and then not a_type_mark.is_attachment_mark then
							-- A TUPLE type is not a class type. It cannot
							-- be prefixed by 'expanded' or 'reference'.
							-- But it can be prefixed by 'attached', 'detachable', '!' or '?'.
						report_syntax_error (a_type_mark.position)
						Result := ast_factory.new_tuple_type (Void, a_name, Void, a_base_class)
					else
						Result := ast_factory.new_tuple_type (l_type_mark, a_name, Void, a_base_class)
					end
				else
					Result := ast_factory.new_class_type (l_type_mark, a_name, a_base_class)
				end
			end
		end

	resolved_constraint_generic_named_type (a_constraint: ET_CONSTRAINT_GENERIC_NAMED_TYPE;
		a_formals: ET_FORMAL_PARAMETER_LIST; a_class: ET_CLASS): detachable ET_TYPE
			-- Version `a_constraint', appearing in the constraint of one
			-- of the formal generic parameters in `a_formals' of `a_class',
			-- where class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
			a_class_not_void: a_class /= Void
		local
			a_name: ET_IDENTIFIER
			a_type_mark: detachable ET_TYPE_MARK
			a_formal: detachable ET_FORMAL_PARAMETER
			a_base_class: ET_MASTER_CLASS
			a_parameters: detachable ET_ACTUAL_PARAMETER_LIST
			l_type_mark: detachable ET_TYPE_MARK
		do
			a_name := a_constraint.name
			a_type_mark := a_constraint.type_mark
			a_formal := a_formals.formal_parameter_by_name (a_name)
			if a_formal /= Void then
				if a_type_mark /= Void and then not a_type_mark.is_attachment_mark then
						-- A formal parameter type is not a class type.
						-- It cannot be prefixed by 'expanded' or 'reference'.
						-- But it can be prefixed by 'attached', 'detachable', '!' or '?'.
					report_syntax_error (a_type_mark.position)
				end
					-- A formal parameter cannot have actual generic parameters.
				report_syntax_error (a_constraint.actual_parameters.position)
				Result := ast_factory.new_formal_parameter_type (a_type_mark, a_name, a_formal.index, a_class)
			else
				a_base_class := current_universe.master_class (a_name)
				a_parameters := a_constraint.actual_parameters.resolved_syntactical_constraint (a_formals, a_class, Current)
				if a_parameters /= Void then
					if providers_enabled then
						providers.force_last (a_base_class)
					end
					a_base_class.set_in_system (True)
					l_type_mark := a_type_mark
					if l_type_mark = Void then
						l_type_mark := current_universe.implicit_attachment_type_mark
					end
					if a_base_class.name.same_class_name (tokens.tuple_class_name) then
						if a_type_mark /= Void and then not a_type_mark.is_attachment_mark then
								-- A TUPLE type is not a class type. It cannot
								-- be prefixed by 'expanded' or 'reference'.
								-- But it can be prefixed by 'attached', 'detachable', '!' or '?'.
							report_syntax_error (a_type_mark.position)
							Result := ast_factory.new_tuple_type (Void, a_name, a_parameters, a_base_class)
						else
							Result := ast_factory.new_tuple_type (l_type_mark, a_name, a_parameters, a_base_class)
						end
					else
						Result := ast_factory.new_generic_class_type (l_type_mark, a_name, a_parameters, a_base_class)
					end
				end
			end
		end

	resolved_constraint_actual_parameter_list (a_constraint: ET_CONSTRAINT_ACTUAL_PARAMETER_LIST;
		a_formals: ET_FORMAL_PARAMETER_LIST; a_class: ET_CLASS): detachable ET_ACTUAL_PARAMETER_LIST
			-- Version of `a_constraint', appearing in the constraint of one
			-- of the formal generic parameters in `a_formals' of `a_class',
			-- where class names and formal generic parameter names have been
			-- resolved (i.e. replaced by the corresponding Class_type,
			-- Tuple_type and Formal_parameter_type)
		require
			a_constraint_not_void: a_constraint /= Void
			a_formals_not_void: a_formals /= Void
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
			l_type: ET_CONSTRAINT_TYPE
			l_other_type: detachable ET_CONSTRAINT_TYPE
			l_resolved_type: detachable ET_TYPE
			l_parameter: detachable ET_ACTUAL_PARAMETER_ITEM
			l_actual: ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
		do
			nb := a_constraint.count
			Result := ast_factory.new_actual_parameters (a_constraint.left_bracket, a_constraint.right_bracket, nb)
			if Result /= Void then
				from i := nb until i < 1 loop
					l_actual := a_constraint.item (i)
					l_type := l_actual.type
					if l_type /= l_other_type then
						l_resolved_type := l_type.resolved_syntactical_constraint (a_formals, a_class, Current)
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
		a_type: detachable ET_TYPE): detachable ET_ACTUAL_PARAMETER_ITEM
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		local
			a_parameter: detachable ET_ACTUAL_PARAMETER
		do
			a_parameter := a_constraint.actual_parameter.resolved_syntactical_constraint_with_type (a_type, Current)
			Result := ast_factory.new_actual_parameter_comma (a_parameter, a_constraint.comma)
		end

	resolved_constraint_labeled_actual_parameter (a_constraint: ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER;
		a_type: detachable ET_TYPE): detachable ET_LABELED_ACTUAL_PARAMETER
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		do
			Result := ast_factory.new_labeled_actual_parameter (a_constraint.label, ast_factory.new_colon_type (a_constraint.colon, a_type))
		end

	resolved_constraint_labeled_comma_actual_parameter (a_constraint: ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER;
		a_type: detachable ET_TYPE): detachable ET_LABELED_ACTUAL_PARAMETER
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		do
			Result := ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (a_constraint.label, a_constraint.comma), a_type)
		end

	resolved_constraint_labeled_actual_parameter_semicolon (a_constraint: ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER_SEMICOLON;
		a_type: detachable ET_TYPE): detachable ET_ACTUAL_PARAMETER_ITEM
			-- Version of `a_constraint', where its type has been replaced by `a_type'
		require
			a_constraint_not_void: a_constraint /= Void
		local
			l_parameter: detachable ET_LABELED_ACTUAL_PARAMETER
		do
			l_parameter := a_constraint.actual_parameter.resolved_syntactical_constraint_with_type (a_type, Current)
			Result := ast_factory.new_labeled_actual_parameter_semicolon (l_parameter, a_constraint.semicolon)
		end

feature {NONE} -- AST factory

	new_across_all_expression (a_across_header: detachable ET_ACROSS_EXPRESSION; an_invariant: detachable ET_LOOP_INVARIANTS;
			an_until_conditional: detachable ET_CONDITIONAL; a_all_conditional: detachable ET_CONDITIONAL;
			a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_EXPRESSION
				-- New across all expression
			do
				if a_across_header /= Void and a_all_conditional /= Void then
					Result := a_across_header
					Result.set_until_conditional (an_until_conditional)
					Result.set_iteration_conditional (a_all_conditional)
					Result.set_all (True)
					Result.set_invariant_part (an_invariant)
					Result.set_variant_part (a_variant)
					if an_end /= Void then
						Result.set_end_keyword (an_end)
					end
						-- We set 'cursor_name.is_across_cursor' to False when
						-- parsing within its scope.
					Result.cursor_name.set_across_cursor (True)
				end
			end

	new_across_expression_header (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
		a_as: detachable ET_KEYWORD; a_cursor_name: detachable ET_IDENTIFIER): detachable ET_ACROSS_EXPRESSION
				-- New across expression header
		local
			l_last_across_components: like last_across_components
			l_cursor_name: ET_IDENTIFIER
		do
			Result := ast_factory.new_across_all_expression (a_across, a_iterable_expression, a_as, a_cursor_name, Void, Void, tokens.true_keyword, Void, Void)
			if Result /= Void then
				l_last_across_components := last_across_components
				if l_last_across_components = Void then
					l_last_across_components := new_across_component_list
					last_across_components := l_last_across_components
				end
				l_last_across_components.force_last (Result)
					-- We set 'cursor_name.is_across_cursor' to False when
					-- parsing within its scope.
				l_cursor_name := Result.cursor_name
				l_cursor_name.set_across_cursor (False)
				l_cursor_name.set_seed (l_last_across_components.count)
			end
		end

	new_across_instruction (a_across_header: detachable ET_ACROSS_INSTRUCTION;
		a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_loop_compound: detachable ET_COMPOUND;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_INSTRUCTION
			-- New across instruction
		do
			if a_across_header /= Void then
				Result := a_across_header
				Result.set_from_compound (a_from_compound)
				Result.set_until_conditional (an_until_conditional)
				Result.set_loop_compound (a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
					-- We set 'cursor_name.is_across_cursor' to False when
					-- parsing within its scope.
				Result.cursor_name.set_across_cursor (True)
			end
		end

	new_across_instruction_header (a_across: detachable ET_KEYWORD;
		a_iterable_expression: detachable ET_EXPRESSION; a_as: detachable ET_KEYWORD;
		a_cursor_name: detachable ET_IDENTIFIER): detachable ET_ACROSS_INSTRUCTION
			-- New across instruction header
		local
			l_last_across_components: like last_across_components
			l_cursor_name: ET_IDENTIFIER
		do
			Result := ast_factory.new_across_instruction (a_across, a_iterable_expression, a_as, a_cursor_name, Void, Void, Void, Void, Void, Void)
			if Result /= Void then
				l_last_across_components := last_across_components
				if l_last_across_components = Void then
					l_last_across_components := new_across_component_list
					last_across_components := l_last_across_components
				end
				l_last_across_components.force_last (Result)
					-- We set 'cursor_name.is_across_cursor' to False when
					-- parsing within its scope.
				l_cursor_name := Result.cursor_name
				l_cursor_name.set_across_cursor (False)
				l_cursor_name.set_seed (l_last_across_components.count)
			end
		end

	new_across_some_expression (a_across_header: detachable ET_ACROSS_EXPRESSION;
		an_invariant: detachable ET_LOOP_INVARIANTS;
			an_until_conditional: detachable ET_CONDITIONAL;
			a_some_conditional: detachable ET_CONDITIONAL;
			a_variant: detachable ET_VARIANT;
			an_end: detachable ET_KEYWORD): detachable ET_ACROSS_EXPRESSION
				-- New across some expression
			do
				if a_across_header /= Void and a_some_conditional /= Void then
					Result := a_across_header
					Result.set_until_conditional (an_until_conditional)
					Result.set_iteration_conditional (a_some_conditional)
					Result.set_some (True)
					Result.set_invariant_part (an_invariant)
					Result.set_variant_part (a_variant)
					if an_end /= Void then
						Result.set_end_keyword (an_end)
					end
						-- We set 'cursor_name.is_across_cursor' to False when
						-- parsing within its scope.
					Result.cursor_name.set_across_cursor (True)
				end
			end

	new_agent_identifier_target (an_identifier: detachable ET_IDENTIFIER): detachable ET_EXPRESSION
			-- New agent identifier target
		local
			a_seed: INTEGER
		do
			if an_identifier /= Void then
				if attached last_formal_arguments as l_last_formal_arguments then
					a_seed := l_last_formal_arguments.index_of (an_identifier)
					if a_seed /= 0 then
						an_identifier.set_seed (a_seed)
						an_identifier.set_argument (True)
						l_last_formal_arguments.formal_argument (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_local_variables as l_last_local_variables then
					a_seed := l_last_local_variables.index_of (an_identifier)
					if a_seed /= 0 then
						an_identifier.set_seed (a_seed)
						an_identifier.set_local (True)
						l_last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_across_components as l_last_across_components then
					a_seed := l_last_across_components.index_of_name (an_identifier)
					if a_seed /= 0 and then not l_last_across_components.across_component (a_seed).cursor_name.is_across_cursor then
							-- We set 'cursor_name.is_across_cursor' to False when
							-- parsing withing its scope.
						an_identifier.set_across_cursor (True)
					end
				end
				if a_seed = 0 and then attached last_object_tests as l_last_object_tests then
					a_seed := l_last_object_tests.index_of_name (an_identifier)
					if a_seed /= 0 then
						an_identifier.set_object_test_local (True)
					end
				end
				if a_seed = 0 then
					Result := ast_factory.new_unqualified_call_expression (an_identifier, Void)
				else
					Result := an_identifier
				end
			end
		end

	new_alias_free_name (an_alias: detachable ET_KEYWORD;
		a_string: detachable ET_MANIFEST_STRING): detachable ET_ALIAS_FREE_NAME
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

	new_any_clients (a_keyword: detachable ET_KEYWORD): detachable ET_CLIENT_LIST
			-- Implicit client list (when preceded by `a_keyword')
			-- with only one client: "ANY"
		local
			l_name: ET_IDENTIFIER
			l_position: ET_POSITION
			l_client: detachable ET_CLIENT
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

	new_check_instruction (a_check: detachable ET_KEYWORD; a_then_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD): detachable ET_CHECK_INSTRUCTION
			-- New check instruction
		local
			i, nb: INTEGER
			l_old_count: INTEGER
			l_first: INTEGER
		do
			if not check_assertion_counters.is_empty then
				l_old_count := check_assertion_counters.last
				check_assertion_counters.remove_last
			end
			i := assertions.count
			nb := i - l_old_count
			if nb <= 0 then
				Result := ast_factory.new_check_instruction (a_check, a_then_compound, an_end, 0)
			else
				Result := ast_factory.new_check_instruction (a_check, a_then_compound, an_end, nb)
				if Result /= Void then
					l_first := l_old_count + 1
					from until i < l_first loop
						Result.put_first (assertions.item (i))
						assertions.remove_last
						i := i - 1
					end
				else
					l_first := l_old_count + 1
					from until i < l_first loop
						assertions.remove_last
						i := i - 1
					end
				end
			end
		end

	new_choice_attribute_constant (a_name: detachable ET_IDENTIFIER): detachable ET_CHOICE_CONSTANT
			-- New choice constant which is supposed to be the name of
			-- a constant attribute or unique attribute
		local
			a_seed: INTEGER
		do
			if a_name /= Void then
				if attached last_formal_arguments as l_last_formal_arguments then
					a_seed := l_last_formal_arguments.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_argument (True)
						l_last_formal_arguments.formal_argument (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_local_variables as l_last_local_variables then
					a_seed := l_last_local_variables.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_local (True)
						l_last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_across_components as l_last_across_components then
					a_seed := l_last_across_components.index_of_name (a_name)
					if a_seed /= 0 and then not l_last_across_components.across_component (a_seed).cursor_name.is_across_cursor then
							-- We set 'cursor_name.is_across_cursor' to False when
							-- parsing within its scope.
						a_name.set_across_cursor (True)
					end
				end
				if a_seed = 0 and then attached last_object_tests as l_last_object_tests then
					a_seed := l_last_object_tests.index_of_name (a_name)
					if a_seed /= 0 then
						a_name.set_object_test_local (True)
					end
				end
				if a_seed = 0 then
					Result := ast_factory.new_unqualified_call_expression (a_name, Void)
				else
					Result := a_name
				end
			end
		end

	new_client (a_name: detachable ET_CLASS_NAME): detachable ET_CLIENT
			-- New client
		local
			l_base_class: ET_MASTER_CLASS
		do
			if a_name /= Void then
				l_base_class := current_universe.master_class (a_name)
				Result := ast_factory.new_client (a_name, l_base_class)
			end
		end

	new_client_comma (a_name: detachable ET_CLASS_NAME; a_comma: detachable ET_SYMBOL): detachable ET_CLIENT_ITEM
			-- New client followed by a comma
		local
			l_base_class: ET_MASTER_CLASS
		do
			if a_name /= Void then
				l_base_class := current_universe.master_class (a_name)
				Result := ast_factory.new_client_comma (a_name, l_base_class, a_comma)
			end
		end

	new_constraint_named_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER;
		a_parameters: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST): detachable ET_CONSTRAINT_NAMED_TYPE
			-- New Eiffel class type or formal generic paramater
			-- appearing in a generic constraint
		do
			if a_parameters /= Void then
				Result := ast_factory.new_constraint_generic_named_type (a_type_mark, a_name, a_parameters)
			else
				Result := ast_factory.new_constraint_named_type (a_type_mark, a_name)
			end
		end

	new_external_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_EXTERNAL_FUNCTION
			-- New external function
		do
			Result := ast_factory.new_external_function (a_name, args, a_type, an_assigner, an_is, a_first_indexing,
				an_obsolete, a_preconditions, a_language, an_alias, a_postconditions,
				an_end, a_semicolon, a_clients, a_feature_clause, a_class)
		end

	new_external_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE; an_alias: detachable ET_EXTERNAL_ALIAS;
		a_postconditions: detachable ET_POSTCONDITIONS; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_EXTERNAL_PROCEDURE
			-- New external procedure
		do
			Result := ast_factory.new_external_procedure (a_name, args, an_is, a_first_indexing,
				an_obsolete, a_preconditions, a_language, an_alias, a_postconditions,
				an_end, a_semicolon, a_clients, a_feature_clause, a_class)
		end

	new_feature_address (d: detachable ET_SYMBOL; a_name: detachable ET_FEATURE_NAME): detachable ET_FEATURE_ADDRESS
			-- New feature address
		local
			l_seed: INTEGER
		do
			if attached {ET_IDENTIFIER} a_name as l_identifier then
				if attached last_formal_arguments as l_last_formal_arguments then
					l_seed := l_last_formal_arguments.index_of (l_identifier)
					if l_seed /= 0 then
						l_identifier.set_seed (l_seed)
						l_identifier.set_argument (True)
						l_last_formal_arguments.formal_argument (l_seed).set_used (True)
					end
				end
				if l_seed = 0 and then attached last_local_variables as l_last_local_variables then
					l_seed := l_last_local_variables.index_of (l_identifier)
					if l_seed /= 0 then
						l_identifier.set_seed (l_seed)
						l_identifier.set_local (True)
						l_last_local_variables.local_variable (l_seed).set_used (True)
					end
				end
				if l_seed = 0 and then attached last_across_components as l_last_across_components then
					l_seed := l_last_across_components.index_of_name (l_identifier)
					if l_seed /= 0 and then not l_last_across_components.across_component (l_seed).cursor_name.is_across_cursor then
							-- We set 'cursor_name.is_across_cursor' to False when
							-- parsing withing its scope.
						l_identifier.set_across_cursor (True)
					end
				end
				if l_seed = 0 and then attached last_object_tests as l_last_object_tests then
					l_seed := l_last_object_tests.index_of_name (l_identifier)
					if l_seed /= 0 then
						l_identifier.set_object_test_local (True)
					end
				end
			end
			Result := ast_factory.new_feature_address (d, a_name)
		end

	new_formal_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_FORMAL_ARGUMENT_LIST
			-- New formal argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			Result := ast_factory.new_formal_arguments (a_left, a_right, nb)
		end

	new_invalid_alias_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_ALIAS_FREE_NAME
			-- New invalid alias feature name
		do
-- ERROR
			Result := new_alias_free_name (an_alias, a_string)
		end

	new_invalid_infix_name (an_infix: detachable ET_KEYWORD; an_operator: detachable ET_MANIFEST_STRING): detachable ET_INFIX_FREE_NAME
			-- New invalid infix feature name
		do
-- ERROR
			Result := new_infix_free_name (an_infix, an_operator)
		end

	new_invalid_prefix_name (a_prefix: detachable ET_KEYWORD; an_operator: detachable ET_MANIFEST_STRING): detachable ET_PREFIX_FREE_NAME
			-- New invalid prefix feature name
		do
-- ERROR
			Result := new_prefix_free_name (a_prefix, an_operator)
		end

	new_infix_free_name (an_infix: detachable ET_KEYWORD; an_operator: detachable ET_MANIFEST_STRING): detachable ET_INFIX_FREE_NAME
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

	new_invariants (an_invariant: detachable ET_KEYWORD): detachable ET_INVARIANTS
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
			if Result /= Void then
				if attached last_object_tests as l_last_object_tests then
					Result.set_object_tests (l_last_object_tests.cloned_object_test_list)
				end
				if attached last_across_components as l_last_across_components then
					Result.set_across_components (l_last_across_components.cloned_across_component_list)
				end
			end
				-- Reset local variables, formal arguments, object-tests
				-- and across components before reading the next closure.
			wipe_out_last_formal_arguments_stack
			wipe_out_last_local_variables_stack
			wipe_out_last_object_tests_stack
			wipe_out_last_across_components_stack
		end

	new_local_variables (a_local: detachable ET_KEYWORD; nb: INTEGER): detachable ET_LOCAL_VARIABLE_LIST
			-- New local variable list with given capacity
		require
			nb_positive: nb >= 0
		do
			Result := ast_factory.new_local_variables (a_local, nb)
			last_local_variables := Result
		end

	new_loop_invariants (an_invariant: detachable ET_KEYWORD): detachable ET_LOOP_INVARIANTS
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

	new_named_object_test (a_attached: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_expression: detachable ET_EXPRESSION; a_as: detachable ET_KEYWORD;
		a_name: detachable ET_IDENTIFIER): detachable ET_NAMED_OBJECT_TEST
			-- New named object-test expression
		local
			l_name: ET_IDENTIFIER
			l_last_object_tests: like last_object_tests
		do
			Result := ast_factory.new_named_object_test (a_attached, a_type, a_expression, a_as, a_name)
			if Result /= Void then
				l_last_object_tests := last_object_tests
				if l_last_object_tests = Void then
					l_last_object_tests := new_object_test_list
					last_object_tests := l_last_object_tests
				end
				l_last_object_tests.force_last (Result)
				l_name := Result.name
				l_name.set_object_test_local (True)
				l_name.set_seed (l_last_object_tests.count)
			end
		end

	new_named_type (a_type_mark: detachable ET_TYPE_MARK; a_name: detachable ET_IDENTIFIER;
		a_generics: detachable ET_ACTUAL_PARAMETER_LIST): detachable ET_TYPE
			-- New Eiffel class type or formal generic paramater
		local
			a_parameter: detachable ET_FORMAL_PARAMETER
			a_last_class: like last_class
			l_class: ET_MASTER_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			a_last_class := last_class
			if a_last_class /= Void and a_name /= Void then
				a_parameter := a_last_class.formal_parameter (a_name)
				if a_parameter /= Void then
					if a_generics /= Void then
						-- TODO: Error
					end
					if a_type_mark /= Void and then not a_type_mark.is_attachment_mark then
						-- TODO: Error
					end
					Result := ast_factory.new_formal_parameter_type (a_type_mark, a_name, a_parameter.index, a_last_class)
				else
					l_class := current_universe.master_class (a_name)
					if providers_enabled then
						providers.force_last (l_class)
					end
					l_class.set_in_system (True)
					l_type_mark := a_type_mark
					if l_type_mark = Void then
						l_type_mark := current_universe.implicit_attachment_type_mark
					end
					if a_generics /= Void then
						Result := ast_factory.new_generic_class_type (l_type_mark, a_name, a_generics, l_class)
					else
						Result := ast_factory.new_class_type (l_type_mark, a_name, l_class)
					end
				end
			end
		end

	new_parent (a_name: detachable ET_IDENTIFIER; a_generic_parameters: detachable ET_ACTUAL_PARAMETER_LIST;
		a_renames: detachable ET_RENAME_LIST; an_exports: detachable ET_EXPORT_LIST; an_undefines, a_redefines,
		a_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST; an_end: detachable ET_KEYWORD): detachable ET_PARENT
			-- New parent
		local
			a_type: detachable ET_CLASS_TYPE
			a_last_class: like last_class
			l_class: ET_MASTER_CLASS
		do
			a_last_class := last_class
			if a_last_class /= Void and a_name /= Void then
				if a_last_class.has_formal_parameter (a_name) then
					-- Error
				end
				l_class := current_universe.master_class (a_name)
				if providers_enabled then
					providers.force_last (l_class)
				end
				l_class.set_in_system (True)
				if a_generic_parameters /= Void then
					a_type := ast_factory.new_generic_class_type (Void, a_name, a_generic_parameters, l_class)
				else
					a_type := ast_factory.new_class_type (Void, a_name, l_class)
				end
				Result := ast_factory.new_parent (a_type, a_renames, an_exports,
					an_undefines, a_redefines, a_selects, an_end)
			end
		end

	new_old_object_test (a_left_brace: detachable ET_SYMBOL; a_name: detachable ET_IDENTIFIER;
		a_colon: detachable ET_SYMBOL; a_type: detachable ET_TYPE; a_right_brace: detachable ET_SYMBOL;
		a_expression: detachable ET_EXPRESSION): detachable ET_OLD_OBJECT_TEST
			-- New object-test expression
		local
			l_name: ET_IDENTIFIER
			l_last_object_tests: like last_object_tests
		do
			Result := ast_factory.new_old_object_test (a_left_brace, a_name, a_colon, a_type, a_right_brace, a_expression)
			if Result /= Void then
				l_last_object_tests := last_object_tests
				if l_last_object_tests = Void then
					l_last_object_tests := new_object_test_list
					last_object_tests := l_last_object_tests
				end
				l_last_object_tests.force_last (Result)
				l_name := Result.name
				l_name.set_object_test_local (True)
				l_name.set_seed (l_last_object_tests.count)
			end
		end

	new_once_manifest_string (a_once: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_ONCE_MANIFEST_STRING
			-- New once manifest string
		do
			Result := ast_factory.new_once_manifest_string (a_once, a_string)
			if Result /= Void then
				current_system.register_inline_constant (Result)
			end
		end

	new_postconditions (an_ensure: detachable ET_KEYWORD; a_then: detachable ET_KEYWORD): detachable ET_POSTCONDITIONS
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

	new_preconditions (a_require: detachable ET_KEYWORD; an_else: detachable ET_KEYWORD): detachable ET_PRECONDITIONS
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

	new_prefix_free_name (a_prefix: detachable ET_KEYWORD; an_operator: detachable ET_MANIFEST_STRING): detachable ET_PREFIX_FREE_NAME
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

	new_prefix_minus_expression (a_sign: detachable ET_SYMBOL_OPERATOR; an_expression: detachable ET_EXPRESSION): detachable ET_EXPRESSION
			-- New prefix minus expression
		do
			if a_sign /= Void and an_expression /= Void then
				if attached {ET_INTEGER_CONSTANT} an_expression as l_integer then
					if l_integer.sign = Void then
						l_integer.set_sign (a_sign)
						Result := l_integer
					end
				elseif attached {ET_REAL_CONSTANT} an_expression as l_real then
					if l_real.sign = Void then
						l_real.set_sign (a_sign)
						Result := l_real
					end
				end
			end
			if Result = Void then
				Result := ast_factory.new_prefix_expression (ast_factory.new_prefix_minus_operator (a_sign), an_expression)
			end
		end

	new_prefix_plus_expression (a_sign: detachable ET_SYMBOL_OPERATOR; an_expression: detachable ET_EXPRESSION): detachable ET_EXPRESSION
			-- New prefix plus expression
		do
			if a_sign /= Void and an_expression /= Void then
				if attached {ET_INTEGER_CONSTANT} an_expression as l_integer then
					if l_integer.sign = Void then
						l_integer.set_sign (a_sign)
						Result := l_integer
					end
				elseif attached {ET_REAL_CONSTANT} an_expression as l_real then
					if l_real.sign = Void then
						l_real.set_sign (a_sign)
						Result := l_real
					end
				end
			end
			if Result = Void then
				Result := ast_factory.new_prefix_expression (ast_factory.new_prefix_plus_operator (a_sign), an_expression)
			end
		end

	new_tuple_type (a_type_mark: detachable ET_TYPE_MARK; a_tuple: detachable ET_IDENTIFIER;
		a_generics: detachable ET_ACTUAL_PARAMETER_LIST): detachable ET_TUPLE_TYPE
			-- New 'TUPLE' type
		local
			a_class: ET_NAMED_CLASS
			l_type_mark: detachable ET_TYPE_MARK
		do
			if a_tuple /= Void then
				a_class := current_universe.master_class (a_tuple)
				if providers_enabled then
					providers.force_last (a_class)
				end
				a_class.set_in_system (True)
				l_type_mark := a_type_mark
				if l_type_mark = Void then
					l_type_mark := current_universe.implicit_attachment_type_mark
				end
				Result := ast_factory.new_tuple_type (l_type_mark, a_tuple, a_generics, a_class)
			end
		end

	new_unqualified_call_expression (a_name: detachable ET_IDENTIFIER; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_EXPRESSION
			-- New unqualified call expression
		local
			a_seed: INTEGER
		do
			if a_name /= Void then
				if attached last_formal_arguments as l_last_formal_arguments then
					a_seed := l_last_formal_arguments.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_argument (True)
						l_last_formal_arguments.formal_argument (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_local_variables as l_last_local_variables then
					a_seed := l_last_local_variables.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_local (True)
						l_last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_across_components as l_last_across_components then
					a_seed := l_last_across_components.index_of_name (a_name)
					if a_seed /= 0 and then not l_last_across_components.across_component (a_seed).cursor_name.is_across_cursor then
							-- We set 'cursor_name.is_across_cursor' to False when
							-- parsing within its scope.
						a_name.set_across_cursor (True)
					end
				end
				if a_seed = 0 and then attached last_object_tests as l_last_object_tests then
					a_seed := l_last_object_tests.index_of_name (a_name)
					if a_seed /= 0 then
						a_name.set_object_test_local (True)
					end
				end
				if a_seed = 0 or args /= Void then
					Result := ast_factory.new_unqualified_call_expression (a_name, args)
				else
					Result := a_name
				end
			end
		end

	new_unqualified_call_instruction (a_name: detachable ET_IDENTIFIER; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_INSTRUCTION
			-- New unqualified call instruction
		local
			a_seed: INTEGER
		do
			if a_name /= Void then
				if attached last_formal_arguments as l_last_formal_arguments then
					a_seed := l_last_formal_arguments.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_argument (True)
						l_last_formal_arguments.formal_argument (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_local_variables as l_last_local_variables then
					a_seed := l_last_local_variables.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_local (True)
						l_last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
				if a_seed = 0 and then attached last_across_components as l_last_across_components then
					a_seed := l_last_across_components.index_of_name (a_name)
					if a_seed /= 0 and then not l_last_across_components.across_component (a_seed).cursor_name.is_across_cursor then
							-- We set 'cursor_name.is_across_cursor' to False when
							-- parsing within its scope.
						a_name.set_across_cursor (True)
					end
				end
				if a_seed = 0 and then attached last_object_tests as l_last_object_tests then
					a_seed := l_last_object_tests.index_of_name (a_name)
					if a_seed /= 0 then
						a_name.set_object_test_local (True)
					end
				end
				if a_seed = 0 or args /= Void then
					Result := ast_factory.new_unqualified_call_instruction (a_name, args)
				else
					Result := a_name
				end
			end
		end

	new_writable (a_name: detachable ET_IDENTIFIER): detachable ET_WRITABLE
			-- New writable
		local
			a_seed: INTEGER
		do
			if a_name /= Void then
				Result := a_name
				if attached last_local_variables as l_last_local_variables then
					a_seed := l_last_local_variables.index_of (a_name)
					if a_seed /= 0 then
						a_name.set_seed (a_seed)
						a_name.set_local (True)
						l_last_local_variables.local_variable (a_seed).set_used (True)
					end
				end
			end
		end

	new_class (a_name: detachable ET_IDENTIFIER): detachable ET_CLASS
			-- New Eiffel class
		local
			old_current_class: ET_CLASS
			l_basename: STRING
			l_class_name: ET_IDENTIFIER
			l_master_class: ET_MASTER_CLASS
			l_new_class: ET_CLASS
		do
			if a_name /= Void then
				l_master_class := current_universe.master_class (a_name)
				if current_class.name.same_class_name (a_name) then
					Result := current_class
				elseif l_master_class.has_local_class (current_class) then
					Result := current_class
				elseif attached l_master_class.first_local_class as l_first_local_class then
					Result := l_first_local_class
				else
					Result := tokens.unknown_class
				end
				if not current_system.preparse_multiple_mode and then not current_class.is_unknown and then Result /= current_class then
						-- We are parsing another class than the one we want to parse.
					set_fatal_error (current_class)
					error_handler.report_gvscn1a_error (current_class, a_name, filename)
						-- Stop the parsing.
					accept
				elseif current_system.preparse_shallow_mode and then current_class.is_unknown and then not file_system.basename (filename).as_lower.same_string (a_name.lower_name + ".e") then
						-- The file does not contain the expected class
						-- (whose name is supposed to match the filename).
					l_basename := file_system.basename (filename).as_lower
					if l_basename.ends_with (".e") then
						l_basename := l_basename.substring (1, l_basename.count - 2)
					end
					create l_class_name.make (l_basename)
					create l_new_class.make (l_class_name)
					l_new_class.set_filename (filename)
					l_new_class.set_group (group)
					set_fatal_error (l_new_class)
					error_handler.report_gvscn1a_error (l_new_class, a_name, filename)
						-- Stop the parsing.
					accept
				else
					if not Result.is_unknown and then ((Result = current_class) or (Result.is_in_cluster and then (Result.group = group and attached Result.filename as l_result_filename and then file_system.same_pathnames (l_result_filename, filename)))) then
							-- This is the class we want to parse.
						if Result.is_parsed then
-- TODO: find a way to check whether two classes in the same file don't have the same name.
							if Result = l_master_class.actual_class then
								l_master_class.set_modified (True)
							end
							Result.reset
						end
						Result.set_name (a_name)
						Result.set_group (group)
					else
						create Result.make (a_name)
						current_system.register_class (Result)
						Result.set_group (group)
						if group.is_cluster then
							l_master_class.add_last_local_class (Result)
						end
					end
					Result.set_filename (filename)
					Result.set_parsed
					Result.set_time_stamp (time_stamp)
					Result.set_in_system (True)
					old_current_class := current_class
					current_class := Result
					error_handler.report_compilation_status (Current, current_class)
					current_class := old_current_class
					queries.wipe_out
					procedures.wipe_out
				end
			end
		end

	new_query_synonym (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_query: detachable ET_QUERY): detachable ET_QUERY
			-- New synomym for feature `a_query'
		do
			if a_name /= Void and a_query /= Void then
				Result := a_query.new_synonym (a_name)
			end
		end

	new_procedure_synonym (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_procedure: detachable ET_PROCEDURE): detachable ET_PROCEDURE
			-- New synomym for feature `a_procedure'
		do
			if a_name /= Void and a_procedure /= Void then
				Result := a_procedure.new_synonym (a_name)
			end
		end

feature -- Error handling

	report_error (a_message: STRING)
			-- Print error message.
		do
			report_syntax_error (current_position)
		end

	set_syntax_error
			-- Set syntax error flag in class being parsed, if already known.
		do
			if attached last_class as l_last_class then
				set_fatal_error (l_last_class)
			end
		end

	set_fatal_error (a_class: ET_CLASS)
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

	last_clients: detachable ET_CLIENT_LIST
			-- Last clients read

	last_export_clients: detachable ET_CLIENTS
			-- Last clients read in New_export clauses

	last_feature_clause: detachable ET_FEATURE_CLAUSE
			-- Last feature clause read

	last_class: detachable ET_CLASS
			-- Class being parsed

	assertions: DS_ARRAYED_LIST [ET_ASSERTION_ITEM]
			-- List of assertions currently being parsed

	check_assertion_counters: DS_ARRAYED_LIST [INTEGER]
			-- List of counters when parsing nested check-instructions

	queries: DS_ARRAYED_LIST [ET_QUERY]
			-- List of queries currently being parsed

	procedures: DS_ARRAYED_LIST [ET_PROCEDURE]
			-- List of procedures currently being parsed

	constraints: DS_ARRAYED_LIST [detachable ET_CONSTRAINT_TYPE]
			-- List of generic constraints currently being parsed

	providers: DS_HASH_SET [ET_NAMED_CLASS]
			-- Provider classes already read (when enabled)

feature {NONE} -- Local variables

	last_local_variables: detachable ET_LOCAL_VARIABLE_LIST
			-- Last local variable clause read for the closure
			-- (i.e. feature or inline agent) being parsed

	last_local_variables_stack: DS_ARRAYED_STACK [detachable ET_LOCAL_VARIABLE_LIST]
			-- Stack of last local variable clauses read
			-- for the enclosing closures (i.e. feature or
			-- inline agents) of the closure being parsed

	wipe_out_last_local_variables_stack
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

	last_object_tests: detachable ET_OBJECT_TEST_LIST
			-- Object-tests already found in the closure (i.e. feature,
			-- invariant or inline agent) being parsed

	last_object_tests_stack: DS_ARRAYED_STACK [detachable ET_OBJECT_TEST_LIST]
			-- Stack of object-tests already found in the enclosing
			-- closures (i.e. feature, invariant or inline agents)
			-- of the closure being parsed

	last_object_tests_pool: DS_ARRAYED_STACK [ET_OBJECT_TEST_LIST]
			-- Pool of object-test lists available for usage
			-- whenever needed

	new_object_test_list: ET_OBJECT_TEST_LIST
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

	wipe_out_last_object_tests_stack
			-- Wipe out `last_object_tests_stack' and
			-- set `last_object_tests' to Void.
		local
			l_object_test_list: detachable ET_OBJECT_TEST_LIST
			i, nb: INTEGER
		do
			if attached last_object_tests as l_last_object_tests then
				l_last_object_tests.wipe_out
				last_object_tests_pool.force (l_last_object_tests)
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

feature {NONE} -- Across components

	last_across_components: detachable ET_ACROSS_COMPONENT_LIST
			-- Across components already found in the closure (i.e. feature,
			-- invariant or inline agent) being parsed

	last_across_components_stack: DS_ARRAYED_STACK [detachable ET_ACROSS_COMPONENT_LIST]
			-- Stack of across components already found in the enclosing
			-- closures (i.e. feature, invariant or inline agents)
			-- of the closure being parsed

	last_across_components_pool: DS_ARRAYED_STACK [ET_ACROSS_COMPONENT_LIST]
			-- Pool of across component lists available for usage
			-- whenever needed

	new_across_component_list: ET_ACROSS_COMPONENT_LIST
			-- New across component list;
			-- Reuse items from `last_across_components_pool' if available.
		do
			if not last_across_components_pool.is_empty then
				Result := last_across_components_pool.item
				last_across_components_pool.remove
			else
				create Result.make_with_capacity (Initial_last_across_components_capacity)
			end
		ensure
			new_across_component_list_not_void: Result /= Void
		end

	wipe_out_last_across_components_stack
			-- Wipe out `last_across_components_stack' and
			-- set `last_across_components' to Void.
		local
			l_across_component_list: detachable ET_ACROSS_COMPONENT_LIST
			i, nb: INTEGER
		do
			if attached last_across_components as l_last_across_components then
				l_last_across_components.wipe_out
				last_across_components_pool.force (l_last_across_components)
				last_across_components := Void
			end
			nb := last_across_components_stack.count
			from i := 1 until i > nb loop
				l_across_component_list := last_across_components_stack.i_th (i)
				if l_across_component_list /= Void then
					l_across_component_list.wipe_out
					last_across_components_pool.force (l_across_component_list)
				end
				i := i + 1
			end
			last_across_components_stack.wipe_out
		ensure
			last_across_components_stack_wiped_out: last_across_components_stack.is_empty
			last_across_components_void: last_across_components = Void
		end

feature {NONE} -- Formal arguments

	last_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			-- Last formal argument clause read for the closure
			-- (i.e. feature or inline agent) being parsed

	last_formal_arguments_stack: DS_ARRAYED_STACK [detachable ET_FORMAL_ARGUMENT_LIST]
			-- Stack of last formal argument clauses read
			-- for the enclosing closures (i.e. feature or
			-- inline agents) of the closure being parsed

	wipe_out_last_formal_arguments_stack
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

	last_keyword: detachable ET_KEYWORD
			-- Last keyword read
		require
			last_keywords_not_empty: not last_keywords.is_empty
		do
			Result := last_keywords.item
		end

	add_keyword (a_keyword: detachable ET_KEYWORD)
			-- Add `a_keyword' to `last_keywords'.
		do
			last_keywords.force (a_keyword)
		ensure
			one_more: last_keywords.count = old last_keywords.count + 1
			keyword_added: last_keyword = a_keyword
		end

	remove_keyword
			-- Remove `last_keyword' from `last_keywords'.
		require
			last_keywords_not_empty: not last_keywords.is_empty
		do
			last_keywords.remove
		ensure
			one_less: last_keywords.count = old last_keywords.count - 1
		end

	last_keywords: DS_ARRAYED_STACK [detachable ET_KEYWORD]
			-- Last keywords read

feature {NONE} -- Last symbol

	last_symbol: detachable ET_SYMBOL
			-- Last symbol read
		require
			last_symbols_not_empty: not last_symbols.is_empty
		do
			Result := last_symbols.item
		end

	add_symbol (a_symbol: detachable ET_SYMBOL)
			-- Add `a_symbol' to `last_symbols'.
		do
			last_symbols.force (a_symbol)
		ensure
			one_more: last_symbols.count = old last_symbols.count + 1
			keyword_added: last_symbol = a_symbol
		end

	remove_symbol
			-- Remove `last_symbol' from `last_symbols'.
		require
			last_symbols_not_empty: not last_symbols.is_empty
		do
			last_symbols.remove
		ensure
			one_less: last_symbols.count = old last_symbols.count - 1
		end

	last_symbols: DS_ARRAYED_STACK [detachable ET_SYMBOL]
			-- Last symbols read

feature {NONE} -- Counters

	counter_value: INTEGER
			-- Value of the last counter registered
		require
			counters_not_empty: not counters.is_empty
		do
			Result := counters.item
		ensure
			value_positive: Result >= 0
		end

	add_counter
			-- Register a new counter.
		do
			counters.force (0)
		ensure
			one_more: counters.count = old counters.count + 1
			value_zero: counter_value = 0
		end

	remove_counter
			-- Unregister last registered counter.
		require
			counters_not_empty: not counters.is_empty
		do
			counters.remove
		ensure
			one_less: counters.count = old counters.count - 1
		end

	increment_counter
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

	Initial_eiffel_buffer_size: INTEGER = 50000
			-- Initial size for `eiffel_buffer'

	Initial_counters_capacity: INTEGER = 10
			-- Initial capacity for `counters'

	Initial_last_formal_arguments_stack_capacity: INTEGER = 5
			-- Initial capacity for `last_formal_arguments_stack'

	Initial_last_local_variables_stack_capacity: INTEGER = 5
			-- Initial capacity for `last_local_variables_stack'

	Initial_last_keywords_capacity: INTEGER = 5
			-- Initial capacity for `last_keywords'

	Initial_last_symbols_capacity: INTEGER = 5
			-- Initial capacity for `last_symbols'

	Initial_last_object_tests_capacity: INTEGER = 50
			-- Initial capacity for `last_object_tests'

	Initial_last_across_components_capacity: INTEGER = 50
			-- Initial capacity for `last_across_components'

	Initial_assertions_capacity: INTEGER = 20
			-- Initial capacity for `assertions'

	Initial_check_assertion_counters_capacity: INTEGER = 10
			-- Initial capacity for `check_assertion_counters'

	Initial_queries_capacity: INTEGER = 100
			-- Initial capacity for `queries'

	Initial_procedures_capacity: INTEGER = 100
			-- Initial capacity for `procedures'

	Initial_constraints_capacity: INTEGER = 10
			-- Initial capacity for `constraints'

	Initial_providers_capacity: INTEGER = 100
			-- Initial capacity for `providers'

	dummy_type: ET_TYPE
			-- Dummy type
		once
			Result := tokens.unknown_class
		ensure
			dummy_type_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	tmp_directory: KL_DIRECTORY
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

	shared_directory: KL_DIRECTORY
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
	no_void_assertion: not assertions.has_void
	check_assertion_counters_not_void: check_assertion_counters /= Void
	queries_not_void: queries /= Void
	no_void_query: not queries.has_void
	-- queries_registered: forall f in queries, f.is_registered
	procedures_not_void: procedures /= Void
	no_void_procedure: not procedures.has_void
	-- procedures_registered: forall f in procedures, f.is_registered
	constraints_not_void: constraints /= Void
	providers_not_void: providers /= Void
	no_void_provider: not providers.has_void
		-- Object-tests.
	last_object_tests_stack_not_void: last_object_tests_stack /= Void
	last_object_tests_pool_not_void: last_object_tests_pool /= Void
	no_void_last_object_tests_in_pool: not last_object_tests_pool.has_void
		-- Across components.
	last_across_components_stack_not_void: last_across_components_stack /= Void
	last_across_components_pool_not_void: last_across_components_pool /= Void
	no_void_last_across_components_in_pool: not last_across_components_pool.has_void
		-- Input buffer.
	eiffel_buffer_not_void: eiffel_buffer /= Void

end
