indexing

	description:

		"Eiffel parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EIFFEL_PARSER_SKELETON

inherit

	YY_PARSER_SKELETON [ANY]
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
			reset
		end

	ET_SHARED_EIFFEL_BUFFER
		export {NONE} all end

	ET_SHARED_FEATURE_NAME_TESTER

feature {NONE} -- Initialization

	make (a_universe: ET_UNIVERSE; an_error_handler: like error_handler) is
			-- Create a new Eiffel parser.
		require
			a_universe_not_void: a_universe /= Void
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			!! a_factory.make
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
			universe := a_universe
			!! counters.make (Initial_counters_capacity)
			!! last_keywords.make (Initial_last_keywords_capacity)
			!! last_symbols.make (Initial_last_symbols_capacity)
			!! assertions.make (Initial_assertions_capacity)
			!! features.make (Initial_features_capacity)
			make_eiffel_scanner_with_factory ("unknown file", a_factory, an_error_handler)
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
			counters.wipe_out
			last_keywords.wipe_out
			last_symbols.wipe_out
			assertions.wipe_out
			features.wipe_out
			last_class := Void
			last_clients := Void
			last_export_clients := Void
			last_feature_clause := Void
			cluster := Void
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Eiffel class universe

	cluster: ET_CLUSTER
			-- Cluster containing the class being parsed

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

feature -- Parsing

	parse (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_cluster: ET_CLUSTER) is
			-- Parse Eiffel file `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			debug ("GELINT")
				std.error.put_string ("Parse file '")
				std.error.put_string (a_filename)
				std.error.put_line ("%'")
			end
			filename := a_filename
			cluster := a_cluster
			input_buffer := Eiffel_buffer
			Eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			yyparse
			reset
		rescue
			reset
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
		end

	register_synonym (a_feature: ET_FEATURE) is
			-- Register `a_feature' in `last_class'.
		do
			if a_feature /= Void then
				universe.register_feature (a_feature)
				if features.before then
					features.forth
				end
				features.put_left (a_feature)
				features.back
			end
		end

	set_formal_generic_parameters (a_generics: ET_FORMAL_PARAMETER_LIST) is
			-- Set formal generic parameters of `last_class'.
		require
			a_generics_not_void: a_generics /= Void
		local
			a_class: like last_class
		do
			a_class := last_class
			if a_class /= Void then
				a_class.set_generic_parameters (a_generics)
				a_generics.resolve_named_types (a_class, ast_factory)
			end
		end

	set_named_features is
			-- Set named features of `last_class'.
		local
			a_class: like last_class
			named_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			a_feature, other_feature: ET_FEATURE
			a_name: ET_FEATURE_NAME
			i, nb: INTEGER
		do
			a_class := last_class
			if a_class /= Void then
				nb := features.count
				!! named_features.make_map (nb)
				named_features.set_key_equality_tester (feature_name_tester)
				from i := 1 until i > nb loop
					a_feature := features.item (i)
					a_name := a_feature.name
					named_features.search (a_name)
					if not named_features.found then
						named_features.put_last (a_feature, a_name)
					else
						other_feature := named_features.found_item
						error_handler.report_vmfna_error (a_class, other_feature, a_feature)
						a_class.set_flatten_error
					end
					i := i + 1
				end
				a_class.set_named_features (named_features)
			end
			features.wipe_out
		end

	set_class_to_end (a_class: ET_CLASS; an_obsolete: ET_OBSOLETE; a_parents: ET_PARENT_LIST;
		a_creators: ET_CREATOR_LIST; a_feature_clauses: ET_FEATURE_CLAUSE_LIST;
		an_invariants: ET_INVARIANTS; a_second_indexing: ET_INDEXING_LIST;
		an_end: ET_KEYWORD) is
			-- Set various elements to `a_class'.
		local
			named_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
		do
			if a_class /= Void then
				if a_class.named_features = Void then
					!! named_features.make_map (0)
					named_features.set_key_equality_tester (feature_name_tester)
					a_class.set_named_features (named_features)
				end
				a_class.set_obsolete_message (an_obsolete)
				a_class.set_parents (a_parents)
				a_class.set_creators (a_creators)
				a_class.set_feature_clauses (a_feature_clauses)
				a_class.set_invariants (an_invariants)
				a_class.set_second_indexing (a_second_indexing)
				if an_end /= Void then
					a_class.set_end_keyword (an_end)
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
			set_class_to_end (a_class, an_obsolete, a_parents, Void, Void, Void, Void, an_end)
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

feature {NONE} -- AST factory

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

	new_constraint_named_type (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER;
		a_generics: ET_ACTUAL_PARAMETER_LIST): ET_NAMED_TYPE is
			-- New Eiffel class type or formal generic paramater
			-- appearing in a generic constraint
		do
			if a_generics /= Void then
				Result := ast_factory.new_generic_named_type (a_type_mark, a_name, a_generics)
			else
				Result := ast_factory.new_named_type (a_type_mark, a_name)
			end
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

	new_infix_free_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New infix free feature name
		do
			if an_operator /= Void then
				an_operator.compute (error_handler)
				if an_operator.computed then
					if an_operator.value.count > 0 then
						Result := ast_factory.new_infix_free_name (a_prefix, an_operator)
					else
						-- TODO: error.
					end
				end
			else
				Result := ast_factory.new_infix_free_name (a_prefix, an_operator)
			end
		end

	new_invariants (an_invariant: ET_KEYWORD): ET_INVARIANTS is
			-- New invariants
		local
			i: INTEGER
		do
			i := assertions.count
			if i = 0 then
				Result := ast_factory.new_invariants (an_invariant, 0)
			else
				Result := ast_factory.new_invariants (an_invariant, i)
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
				a_parameter := a_last_class.generic_parameter (a_name)
				if a_parameter /= Void then
					if a_generics /= Void then
						-- Error
					end
					if a_type_mark /= Void then
						-- ERROR
					end
					Result := ast_factory.new_formal_parameter_type (a_name, a_parameter.index)
				else
					a_class := universe.eiffel_class (a_name)
					if a_last_class.in_system then
						a_class.add_to_system
					end
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
				if a_last_class.has_generic_parameter (a_name) then
					-- Error
				end
				a_class := universe.eiffel_class (a_name)
				if a_last_class.in_system then
					a_class.add_to_system
				end
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
				an_operator.compute (error_handler)
				if an_operator.computed then
					if an_operator.value.count > 0 then
						Result := ast_factory.new_prefix_free_name (a_prefix, an_operator)
					else
						-- TODO: error.
					end
				end
			else
				Result := ast_factory.new_prefix_free_name (a_prefix, an_operator)
			end
		end







	new_call_agent (an_agent: ET_KEYWORD): ET_CALL_AGENT is
			-- New call agent
		require
			an_agent_not_void: an_agent /= Void
		do
			Result := ast_factory.new_call_agent (an_agent)
		ensure
			call_agent_not_void: Result /= Void
		end

	new_class (a_name: ET_IDENTIFIER): ET_CLASS is
			-- New Eiffel class
		require
			a_name_not_void: a_name /= Void
			cluster_not_void: cluster /= Void
		do
			Result := universe.eiffel_class (a_name)
			Result.set_filename (filename)
			Result.set_cluster (cluster)
			Result.set_name (a_name)
			Result.set_parsed
			features.wipe_out

			debug ("GELINT")
				std.error.put_string ("Parse class '")
				std.error.put_string (a_name.name)
				std.error.put_line ("%'")
			end
		ensure
			class_not_void: Result /= Void
		end

	new_synonym_feature (a_name: ET_FEATURE_NAME_ITEM; a_feature: ET_FEATURE): ET_FEATURE is
			-- New synomym for feature `a_feature'
		require
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
		do
			Result := a_feature.new_synonym (a_name)
		ensure
			synonym_not_void: Result /= Void
		end

feature -- Error handling

	report_error (a_message: STRING) is
			-- Print error message.
		do
			error_handler.report_syntax_error (current_position)
			if last_class /= Void then
				last_class.set_syntax_error (True)
			end
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

	dummy_type: ET_TYPE is
			-- Dummy type
		once
			Result := universe.any_type
		ensure
			dummy_type_not_void: Result /= Void
		end

invariant

	universe_not_void: universe /= Void
	counters_not_void: counters /= Void
	last_keywords_not_void: last_keywords /= Void
	last_symbols_not_void: last_symbols /= Void
	assertions_not_void: assertions /= Void
	no_void_assertion: not assertions.has (Void)
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)
	-- features_registered: forall f in features, f.is_registered

end
