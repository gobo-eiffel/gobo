indexing

	description: "Objects that represent an xsl:for-each-group,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_FOR_EACH_GROUP

inherit
	
	XM_XSLT_INSTRUCTION

	XM_XSLT_FOR_EACH_GROUP_CONSTANTS

creation

	make, make_with_pattern

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, a_key_expression: XM_XPATH_EXPRESSION; an_algorithm: INTEGER; some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]; a_collation_name: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			key_expression_not_void: a_key_expression /= Void
			expression_algorithm: an_algorithm = Group_by_algorithm  or an_algorithm = Group_adjacent_algorithm
			sort_keys: some_sort_keys /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			key_expression := a_key_expression
			algorithm := an_algorithm
			sort_keys := some_sort_keys
			collation_name := a_collation_name
			instruction_name := "for-each-group"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			key_expression_set: key_expression = a_key_expression
			algorithm_set: algorithm = an_algorithm
			sort_keys_set: sort_keys = some_sort_keys
			collation_name_set: collation_name = a_collation_name
		end

	make_with_pattern (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; a_key_pattern: XM_XSLT_PATTERN; an_algorithm: INTEGER; some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			key_pattern_not_void: a_key_pattern /= Void
			pattern_algorithm: an_algorithm = Group_starting_with_algorithm  or an_algorithm = Group_ending_with_algorithm
			sort_keys: some_sort_keys /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			key_pattern := a_key_pattern
			algorithm := an_algorithm
			sort_keys := some_sort_keys
			instruction_name := "for-each-group"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			key_pattern_set: key_pattern = a_key_pattern
			algorithm_set: algorithm = an_algorithm
			sort_keys_set: sort_keys = some_sort_keys
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_group_iterator, a_saved_group_iterator: XM_XSLT_GROUP_ITERATOR
			a_population, a_saved_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_saved_template: XM_XSLT_COMPILED_TEMPLATE
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
			reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			a_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
		do
			a_transformer := a_context.transformer
			a_saved_group_iterator := a_transformer.current_group_iterator
			a_saved_iterator := a_transformer.current_iterator
			a_saved_template := a_transformer.current_template
			a_transformer.set_current_template (Void)

			a_population := select_expression.iterator (a_context)

			-- Obtain am iterator over the groups in order of first appearance

			inspect
				algorithm
			when Group_by_algorithm then
				a_new_context := a_context.new_context
				a_new_context.set_current_iterator (a_population)
				create {XM_XSLT_GROUP_BY_ITERATOR} a_group_iterator.make (a_population, key_expression, a_new_context, collator (a_new_context))
			when Group_adjacent_algorithm then
				a_new_context := a_context.new_context
				a_new_context.set_current_iterator (a_population)
				check
					croup_adjacent_NYI: False
				end
				--				create {XM_XSLT_GROUP_ADJACENT_ITERATOR} a_group_iterator.make (a_population, key_expression, a_new_context, collator)
			when Group_starting_with_algorithm then
				check
					group_starting_with_NYI: False
				end
				--create {XM_XSLT_GROUP_STARTING_WITH_ITERATOR} a_group_iterator.make (a_population, key_expression, a_transformer)
			when Group_ending_with_algorithm then
				check
					group_ending_with_NYI: False
				end
				--create {XM_XSLT_GROUP_ENDING_WITH_ITERATOR} a_group_iterator.make (a_population, key_expression, a_transformer)
			end

			-- Now iterate over the leading nodes of the groups.

			if sort_keys.count > 0 then
				create reduced_sort_keys.make (sort_keys.count)
				a_new_context := a_transformer.new_xpath_context
				from
					a_cursor := sort_keys.new_cursor; a_cursor.start
				variant
					sort_keys.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_cursor.item.evaluate_expressions (a_new_context)
					a_fixed_sort_key:= a_cursor.item.reduced_definition (a_new_context)
					reduced_sort_keys.put_last (a_fixed_sort_key)
					a_cursor.forth
				end
				create {XM_XSLT_SORTED_GROUP_ITERATOR} a_group_iterator.make (a_new_context, a_group_iterator, reduced_sort_keys)
			end

			a_transformer.set_current_iterator (a_group_iterator)
			a_transformer.set_current_group_iterator (a_group_iterator)
			a_new_context := a_context.new_context
			a_new_context.set_current_iterator (a_group_iterator)
			if a_transformer.is_tracing then
				todo ("process_leaving_tail", True)
			else
				from
					a_group_iterator.start
				until
					a_group_iterator.after
				loop
					process_children (a_new_context)
					a_group_iterator.forth
				end
			end
			a_transformer.set_current_iterator (a_saved_iterator)
			a_transformer.set_current_group_iterator (a_saved_group_iterator)
			a_transformer.set_current_template (a_saved_template)
			last_tail_call := Void
		end

feature {NONE} -- Implementation

	algorithm: INTEGER
			-- Grouping algoritm

	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

	key_expression: XM_XPATH_EXPRESSION
			-- Key for Group_by or Group_adjacent

	key_pattern: XM_XSLT_PATTERN
			-- Key for Group_starting/ending_with

	sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			-- Sort keys

	unicode_codepoint_collation_name: STRING is "http://www.w3.org/2003/11/xpath-functions/collation/codepoint"
		-- Unicode code-point collator name
		
	collation_name: XM_XPATH_EXPRESSION
			-- Collation name

	cached_collator: ST_COLLATOR
			-- Caced result from `collator'
	
	collator (a_context: XM_XSLT_EVALUATION_CONTEXT): ST_COLLATOR is
			-- Collator (memo function)
		require
			context_not_void: a_context /= Void
		local
			a_collation_name: STRING
		do
			if cached_collator /= Void then
				Result := cached_collator
			else
				if collation_name /= Void then
					collation_name.evaluate_item (a_context)
					a_collation_name := collation_name.last_evaluated_item.string_value
					Result := a_context.collation (a_collation_name)
				else
					Result := a_context.default_collation
				end

			end
			cached_collator := Result
		end
		
invariant

	select_expression_not_void: select_expression /= Void
	key: key_expression /= Void xor key_pattern /= Void
	sort_keys: sort_keys /= Void
	algorithm: algorithm >= Group_by_algorithm and then algorithm <= Group_ending_with_algorithm
	collation: algorithm >= Group_starting_with_algorithm implies collation_name = Void

end
	
