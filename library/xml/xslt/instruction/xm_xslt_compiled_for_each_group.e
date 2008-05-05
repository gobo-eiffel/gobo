indexing

	description: "Objects that represent an xsl:for-each-group,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_FOR_EACH_GROUP

inherit

	XM_XSLT_INSTRUCTION
		redefine
			item_type, compute_dependencies, creates_new_nodes, promote_instruction,
			sub_expressions, create_iterator, create_node_iterator
		end

	XM_XSLT_FOR_EACH_GROUP_CONSTANTS

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_NODE_MAPPING_FUNCTION

	XM_XSLT_SORT_ROUTINES
		export {NONE} all end

create

	make, make_pattern

feature {NONE} -- Initialization

	make (a_executable: XM_XSLT_EXECUTABLE; a_select_expression, a_action: XM_XPATH_EXPRESSION; a_key_expression: XM_XPATH_EXPRESSION;
		a_algorithm: INTEGER; a_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION];
		a_collation_name: XM_XPATH_EXPRESSION; a_default_collation_name: STRING) is
			-- Establish invariant.
		require
			executable_not_void: a_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			action_not_void: a_action /= Void
			key_expression_not_void: a_key_expression /= Void
			expression_algorithm: a_algorithm >= Group_by_algorithm and a_algorithm <= Group_ending_with_algorithm
			sort_keys: a_sort_keys /= Void
			default_collation_name_not_void: a_default_collation_name /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			executable := a_executable
			select_expression := a_select_expression
			action := a_action
			key_expression := a_key_expression
			algorithm := a_algorithm
			sort_keys := a_sort_keys
			collation_name := a_collation_name
			default_collation_name := a_default_collation_name
			compute_static_properties
			initialized := True
			from l_cursor := sub_expressions.new_cursor; l_cursor.start until l_cursor.after loop
				adopt_child_expression (l_cursor.item)
				l_cursor.forth
			end

		ensure
			executable_set: executable = a_executable
			select_expression_set: select_expression = a_select_expression
			action_set: action = a_action
			key_expression_set: key_expression = a_key_expression
			algorithm_set: algorithm = a_algorithm
			sort_keys_set: sort_keys = a_sort_keys
			collation_name_set: collation_name = a_collation_name
			default_collation_name_set: default_collation_name = a_default_collation_name
		end

	make_pattern (a_executable: XM_XSLT_EXECUTABLE; a_select_expression, a_action: XM_XPATH_EXPRESSION; a_key_pattern: XM_XSLT_PATTERN;
		a_algorithm: INTEGER; a_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION];
		a_collation_name: XM_XPATH_EXPRESSION; a_default_collation_name: STRING) is
			-- Establish invariant.
		require
			executable_not_void: a_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			action_not_void: a_action /= Void
			key_expression_not_void: a_key_pattern /= Void
			expression_algorithm: a_algorithm = Group_starting_with_algorithm  or a_algorithm = Group_ending_with_algorithm
			sort_keys: a_sort_keys /= Void
			default_collation_name_not_void: a_default_collation_name /= Void
		do
			create {XM_XSLT_PATTERN_BRIDGE} key_expression .make (a_key_pattern, Current)
			make (a_executable, a_select_expression, a_action, key_expression, a_algorithm, a_sort_keys, a_collation_name, a_default_collation_name)
		ensure
			executable_set: executable = a_executable
			select_expression_set: select_expression = a_select_expression
			action_set: action = a_action
			algorithm_set: algorithm = a_algorithm
			sort_keys_set: sort_keys = a_sort_keys
			collation_name_set: collation_name = a_collation_name
			default_collation_name_set: default_collation_name = a_default_collation_name
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := action.item_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			an_index: INTEGER
		do
			create Result.make (4 + sort_keys.count * 5)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			Result.put (action, 2)
			Result.put (key_expression, 3)
			from
				an_index := 4
				a_cursor := sort_keys.new_cursor; a_cursor.start
			variant
				sort_keys.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				Result.put (a_cursor.item.sort_key, an_index); an_index := an_index + 1
				Result.put (a_cursor.item.order_expression, an_index); an_index := an_index + 1
				Result.put (a_cursor.item.case_order_expression, an_index); an_index := an_index + 1
				Result.put (a_cursor.item.data_type_expression, an_index); an_index := an_index + 1
				Result.put (a_cursor.item.language_expression, an_index); an_index := an_index + 1
				a_cursor.forth
			end
			if collation_name /= Void then
				Result.put_last (collation_name)
			end
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := not action.non_creating
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			l_string := STRING_.appended_string (indentation (a_level), "xsl:for-each-group ")
			l_string := STRING_.appended_string (l_string, algorithm_name)
			std.error.put_string (l_string)
			std.error.put_new_line
			select_expression.display (a_level + 1)
			key_expression.display (a_level + 1)
			l_string := STRING_.appended_string (indentation (a_level), "return")
			std.error.put_string (l_string)
			std.error.put_new_line
			action.display (a_level + 1)
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			l_focus: BOOLEAN
		do
			if not are_intrinsic_dependencies_computed then
				compute_intrinsic_dependencies
			end
			if not select_expression.are_dependencies_computed then
				select_expression.as_computed_expression.compute_dependencies
			end
			set_dependencies (select_expression)
			if not action.are_dependencies_computed then
				action.as_computed_expression.compute_dependencies
			end
			merge_dependencies (action)
			if not key_expression.are_dependencies_computed then
				key_expression.as_computed_expression.compute_dependencies
			end
			merge_dependencies (key_expression)
			if not select_expression.depends_upon_current_group and not key_expression.depends_upon_current_group then
				set_current_group_independent
			end
			if not select_expression.depends_upon_focus then
				set_focus_independent
			end
			from
				l_cursor := sort_keys.new_cursor
				l_cursor.start
				l_focus := depends_upon_focus
			variant
				sort_keys.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				l_computed_expression ?= l_cursor.item.sort_key
				if l_computed_expression /= Void then
					if not l_computed_expression.are_dependencies_computed then
						l_computed_expression.compute_dependencies
					end
					merge_dependencies (l_computed_expression)
					if not l_focus then
						set_focus_independent
					end
				end
				l_cursor.forth
			end
			from
				l_cursor := sort_keys.new_cursor; l_cursor.start
			variant
				sort_keys.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				l_computed_expression ?= l_cursor.item.case_order_expression
				if l_computed_expression /= Void then
					merge_dependencies (l_computed_expression)
				end
				l_computed_expression ?= l_cursor.item.language_expression
				if l_computed_expression /= Void then
					merge_dependencies (l_computed_expression)
				end
				l_computed_expression ?= l_cursor.item.data_type_expression
				if l_computed_expression /= Void then
					merge_dependencies (l_computed_expression)
				end
				l_cursor.forth
			end
			if collation_name /= Void then
				merge_dependencies (collation_name)
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.simplify (l_replacement)
			set_select_expression (l_replacement.item)
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				action.simplify (l_replacement)
				set_action (l_replacement.item)
				if action.is_error then
					set_replacement (a_replacement, action)
				else
					l_replacement.put (Void)
					key_expression.simplify (l_replacement)
					set_key_expression (l_replacement.item)
					if key_expression.is_error then
						set_replacement (a_replacement, key_expression)
					else
						a_replacement.put (Current)
					end
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
			l_item_type: XM_XPATH_ITEM_TYPE
		do
			create l_replacement.make (Void)
			select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			set_select_expression (l_replacement.item)
			if select_expression.is_error then
				set_replacement (a_replacement, select_expression)
			else
				l_item_type := select_expression.item_type
				if select_expression.is_empty_sequence then
					set_replacement (a_replacement, select_expression)
				else
					l_replacement.put (Void)
					action.check_static_type (l_replacement, a_context, l_item_type)
					set_action (l_replacement.item)
					if action.is_error or else action.is_empty_sequence then
						set_replacement (a_replacement, action)
					else
						l_replacement.put (Void)
						key_expression.check_static_type (l_replacement, a_context, l_item_type)
						set_key_expression (l_replacement.item)
						if key_expression.is_error then
							set_replacement (a_replacement, key_expression)
						else
							sort_keys.do_all (agent check_sort_key (a_replacement, ?, a_context, l_item_type))
							if a_replacement.item = Void then
								a_replacement.put (Current)
							end
						end
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			select_expression.optimize (l_replacement, a_context, a_context_item_type)
			set_select_expression (l_replacement.item)
			if select_expression.is_error or else select_expression.is_empty_sequence then
				set_replacement (a_replacement, select_expression)
			else
				l_replacement.put (Void)
				action.optimize (l_replacement, a_context, select_expression.item_type)
				set_action (l_replacement.item)
				if action.is_error or else action.is_empty_sequence then
					set_replacement (a_replacement, action)
				else
					l_replacement.put (Void)
					key_expression.optimize (l_replacement, a_context, select_expression.item_type)
					set_key_expression (l_replacement.item)
					if key_expression.is_error then
						set_replacement (a_replacement, key_expression)
					else
						a_replacement.put (Current)
					end
				end
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)		
			select_expression.promote (l_replacement, a_offer)
			set_select_expression (l_replacement.item)
			l_replacement.put (Void)
			action.promote (l_replacement, a_offer)
			set_action (l_replacement.item)
			l_replacement.put (Void)
			key_expression.promote (l_replacement, a_offer)
			set_key_expression (l_replacement.item)
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_transformer: XM_XSLT_TRANSFORMER
			l_group_iterator: XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_trace_listener: XM_XSLT_TRACE_LISTENER
			l_result: DS_PAIR [XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM], XM_XPATH_ERROR_VALUE]
		do
			l_transformer := a_context.transformer
			create l_result.make (Void, Void)
			create_group_iterator (l_result, a_context)
			l_group_iterator := l_result.first
			if l_group_iterator = Void then
				l_transformer.report_fatal_error (l_result.second)
			elseif l_group_iterator.is_error then
				l_group_iterator.error_value.set_location (system_id, line_number)
				l_transformer.report_fatal_error (l_group_iterator.error_value)
			else
				l_new_context := a_context.new_context
				l_new_context.set_current_template (Void)
				l_new_context.set_current_iterator (l_group_iterator)
				l_new_context.set_current_group_iterator (l_group_iterator)
				if l_transformer.is_tracing then
					l_trace_listener := l_transformer.trace_listener
				end
				from
					l_group_iterator.start
				until
					l_transformer.is_error or else l_group_iterator.after
				loop
					if l_transformer.is_tracing then
						l_trace_listener.trace_current_item_start (l_group_iterator.item)
					end
					action.generate_events (l_new_context)
					if l_transformer.is_tracing then
						l_trace_listener.trace_current_item_finish (l_group_iterator.item)
					end
					l_group_iterator.forth
					if l_group_iterator.is_error then
						l_group_iterator.error_value.set_location (system_id, line_number)
						l_transformer.report_fatal_error (l_group_iterator.error_value)
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence
		local
			l_group_iterator: XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]
			l_new_context, l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_result: DS_PAIR [XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM], XM_XPATH_ERROR_VALUE]
		do
			l_evaluation_context ?= a_context
			check
				l_evaluation_context /= Void
				-- This is XSLT
			end
			create l_result.make (Void, Void)
			create_group_iterator (l_result, l_evaluation_context)
			if l_result.second = Void then
				l_group_iterator := l_result.first
				l_new_context := l_evaluation_context.new_context
				l_new_context.set_current_template (Void)
				l_new_context.set_current_iterator (l_group_iterator)
				l_new_context.set_current_group_iterator (l_group_iterator)
				if l_group_iterator.is_error then
					l_group_iterator.error_value.set_location (system_id, line_number)
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_group_iterator.error_value)
				else
					create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (l_group_iterator, Current, l_new_context)
				end
			else
				l_result.second.set_location (system_id, line_number)
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_result.second)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over nodes of a sequence
		local
			l_group_iterator: XM_XSLT_GROUP_NODE_ITERATOR
			l_new_context, l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			l_result: DS_PAIR [XM_XSLT_GROUP_NODE_ITERATOR, XM_XPATH_ERROR_VALUE]
		do
			l_evaluation_context ?= a_context
			check
				l_evaluation_context /= Void
				-- This is XSLT
			end
			create l_result.make (Void, Void)
			create_group_node_iterator (l_result, l_evaluation_context)
			l_group_iterator := l_result.first
			if l_group_iterator /= Void then
				l_new_context := l_evaluation_context.new_context
				l_new_context.set_current_template (Void)
				l_new_context.set_current_iterator (l_group_iterator)
				l_new_context.set_current_group_iterator (l_group_iterator)
				if l_group_iterator.is_error then
					l_group_iterator.error_value.set_location (system_id, line_number)
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_group_iterator.error_value)
				else
					create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_group_iterator.as_node_iterator, Current, l_new_context)
				end
			else
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_result.second)
			end
		end

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		do
			action.create_iterator (a_context)
			create last_mapped_item.make_sequence (action.last_iterator)
		end

	map_nodes (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `a_item' to a sequence
		do
			action.create_node_iterator (a_context)
			last_node_iterator := action.last_node_iterator
		end

feature {NONE} -- Implementation

	default_collation_name: STRING
			-- Default collation name

	algorithm: INTEGER
			-- Grouping algoritm

	select_expression: XM_XPATH_EXPRESSION
			-- Nodes to be selected

	action: XM_XPATH_EXPRESSION
			-- Action to be taken for each group

	key_expression: XM_XPATH_EXPRESSION
			-- Key for all algorithms

	sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION]
			-- Sort keys

	collation_name: XM_XPATH_EXPRESSION
			-- Collation name

	set_select_expression (a_replacement: XM_XPATH_EXPRESSION) is
			-- Conditionally set `select_expression' to `a_replacement'.
		require
			a_replacement_not_void: a_replacement /= Void
		do
			if select_expression /= a_replacement then
				select_expression := a_replacement
				adopt_child_expression (select_expression)
				reset_static_properties
			end
		ensure
			select_expression_set: select_expression = a_replacement
		end

	set_action (a_replacement: XM_XPATH_EXPRESSION) is
			-- Conditionally set `action' to `a_replacement'.
		require
			a_replacement_not_void: a_replacement /= Void
		do
			if action /= a_replacement then
				action := a_replacement
				adopt_child_expression (action)
				reset_static_properties
			end
		ensure
			action_set: action = a_replacement
		end

	set_key_expression (a_replacement: XM_XPATH_EXPRESSION) is
			-- Conditionally set `key_expression' to `a_replacement'.
		require
			a_replacement_not_void: a_replacement /= Void
		do
			if key_expression /= a_replacement then
				key_expression := a_replacement
				adopt_child_expression (key_expression)
				reset_static_properties
			end
		ensure
			key_expression_set: key_expression = a_replacement
		end
	
	algorithm_name: STRING is
			-- Name of grouping algorithm
		do
			inspect
				algorithm
			when Group_by_algorithm then
				Result := "group-by"
			when Group_adjacent_algorithm then
				Result := "group-adjacent"
			when Group_starting_with_algorithm then
				Result := "group-starting-with"
			when Group_ending_with_algorithm then
				Result := "group-ending-with"
			end
		ensure
			algorithm_name_not_void: Result /= Void
			algorithm_name_not_empty: not Result.is_empty
		end

	fetch_collator (a_collator: DS_PAIR [ST_COLLATOR, XM_XPATH_ERROR_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Set `a_collator' from `collation_name'.
		require
			a_collator_not_void: a_collator /= Void
			a_collator_empty: a_collator.first = Void and a_collator.second = Void
			a_context_not_void: a_context /= Void
		local
			l_collation_name: STRING
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if collation_name /= Void then
				create l_item.make (Void)
				collation_name.evaluate_item (l_item, a_context)
				l_collation_name := l_item.item.string_value
				if a_context.is_known_collation (l_collation_name) then
					a_collator.put_first (a_context.collator (l_collation_name))
				else
					a_collator.put_second (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_collation_name, " is not a known collation"), Xpath_errors_uri, "XTDE1110", Dynamic_error))
				end
			else
				a_collator.put_first (a_context.collator (default_collation_name))
			end
		ensure
			error_or_collator_not_void: a_collator.first /= Void xor a_collator.second /= Void
		end

	create_group_iterator (a_result: DS_PAIR [XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM], XM_XPATH_ERROR_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Create group iterator in `a_result'.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.first = Void and a_result.second = Void
			a_context_not_void: a_context /= Void
		local
			l_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_result: DS_PAIR [XM_XSLT_SORTED_GROUP_ITERATOR, XM_XPATH_ERROR_VALUE]
		do
			select_expression.create_iterator (a_context)
			l_population := select_expression.last_iterator
			if l_population.is_error then
				l_population.error_value.set_location (system_id, line_number)
				a_result.put_second (l_population.error_value)
			else
				create_new_group_iterator (a_result, l_population, a_context)
				if a_result.second = Void then
					if sort_keys.count > 0 then
						create l_result.make (Void, Void)
						create_new_sorted_group_iterator (l_result, a_result.first, a_context)
						a_result.put_first (l_result.first)
						a_result.put_second (l_result.second)
					end
				end
			end
		ensure
			result_or_error: a_result.first = Void xor a_result.second = Void
		end

	create_group_node_iterator (a_result: DS_PAIR [XM_XSLT_GROUP_NODE_ITERATOR, XM_XPATH_ERROR_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Create group iterator over a node sequence.
		require
			a_context_not_void: a_context /= Void
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.first = Void and a_result.second = Void
		local
			l_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			select_expression.create_node_iterator (a_context)
			l_population := select_expression.last_node_iterator
			if l_population.is_error then
				l_population.error_value.set_location (system_id, line_number)
				a_result.put_second (l_population.error_value)
			else
				create_new_group_node_iterator (a_result, l_population, a_context)
				if a_result.second = Void then
					if sort_keys.count > 0 then
						create_new_sorted_group_node_iterator (a_result, a_context)
					end
				end
			end
		ensure
			result_or_error: a_result.first = Void xor a_result.second = Void
		end

	create_new_sorted_group_iterator (a_result: DS_PAIR [XM_XSLT_SORTED_GROUP_ITERATOR, XM_XPATH_ERROR_VALUE]; a_group_iterator: XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Create sorted version of `a_result.first'
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.first = Void and a_result.second = Void
			a_group_iterator_not_void: a_group_iterator /= Void
			a_context_not_void: a_context /= Void
		local
			l_reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_definition: XM_XSLT_SORT_KEY_DEFINITION
		do
			create l_reduced_sort_keys.make (sort_keys.count)
			l_new_context := a_context.new_minor_context
			from
				l_cursor := sort_keys.new_cursor; l_cursor.start
			variant
				sort_keys.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				l_definition := l_cursor.item
				l_definition.evaluate_expressions (l_new_context)
				if l_definition.collation_name = Void or else l_new_context.is_known_collation (l_definition.collation_name) then
					l_fixed_sort_key:= l_definition.reduced_definition (l_new_context)
					l_reduced_sort_keys.put_last (l_fixed_sort_key)
					l_cursor.forth
				else
					a_result.put_first (Void)
					a_result.put_second (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_definition.collation_name, " is not a known collation"), Xpath_errors_uri, "XTDE1110", Dynamic_error))
					l_cursor.go_after
				end
			end
			if a_result.second = Void then
				a_result.put_first (create {XM_XSLT_SORTED_GROUP_ITERATOR}.make (l_new_context, a_group_iterator, l_reduced_sort_keys))
			end
		ensure
			result_or_error: a_result.first = Void xor a_result.second = Void
		end

	create_new_sorted_group_node_iterator (a_result: DS_PAIR [XM_XSLT_GROUP_NODE_ITERATOR, XM_XPATH_ERROR_VALUE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Create sorted version of `a_result.first'
		require
			a_result_not_void: a_result /= Void
			a_result_without_error: a_result.first /= Void and a_result.second = Void
			a_context_not_void: a_context /= Void
		local
			l_reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_definition: XM_XSLT_SORT_KEY_DEFINITION
		do
			create l_reduced_sort_keys.make (sort_keys.count)
			l_new_context := a_context.new_minor_context
			from
				l_cursor := sort_keys.new_cursor; l_cursor.start
			variant
				sort_keys.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				l_definition := l_cursor.item
				l_definition.evaluate_expressions (l_new_context)
				if l_definition.collation_name = Void or else l_new_context.is_known_collation (l_definition.collation_name) then
					l_fixed_sort_key:= l_definition.reduced_definition (l_new_context)
					l_reduced_sort_keys.put_last (l_fixed_sort_key)
					l_cursor.forth
				else
					a_result.put_first (Void)
					a_result.put_second (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat (l_definition.collation_name, " is not a known collation"), Xpath_errors_uri, "XTDE1110", Dynamic_error))
					l_cursor.go_after
				end
			end
			if a_result.second = Void then
				a_result.put_first (create {XM_XSLT_SORTED_GROUP_NODE_ITERATOR}.make (l_new_context, a_result.first, l_reduced_sort_keys))
			end
		ensure
			result_or_error: a_result.first = Void xor a_result.second = Void
		end

	create_new_group_iterator (a_result: DS_PAIR [XM_XSLT_GROUP_ITERATOR [XM_XPATH_ITEM], XM_XPATH_ERROR_VALUE]; a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Create iterator over groups of `a_population' in order of first appearance.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.first = Void and a_result.second = Void
			a_context_not_void: a_context /= Void
			a_population_not_void: a_population /= Void
			no_error: not a_context.transformer.is_error
		local
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_pattern: XM_XSLT_PATTERN_BRIDGE
			l_collator: DS_PAIR [ST_COLLATOR, XM_XPATH_ERROR_VALUE]
		do
			inspect
				algorithm
			when Group_by_algorithm then
				l_new_context := a_context.new_minor_context
				l_new_context.set_current_iterator (a_population)
				create l_collator.make (Void, Void)
				fetch_collator (l_collator, a_context)
				if l_collator.first /= Void then
					a_result.put_first (create {XM_XSLT_GROUP_BY_ITERATOR}.make (a_population, key_expression, l_new_context, l_collator.first))
				else
					a_result.put_second (l_collator.second)
				end
			when Group_adjacent_algorithm then
				create l_collator.make (Void, Void)
				fetch_collator (l_collator, a_context)
				if l_collator.first /= Void then
					a_result.put_first (create {XM_XSLT_GROUP_ADJACENT_ITERATOR}.make (a_population, key_expression, a_context, l_collator.first))
				else
					a_result.put_second (l_collator.second)
				end
			when Group_starting_with_algorithm then
				l_pattern ?= key_expression
				a_result.put_first (create {XM_XSLT_GROUP_STARTING_WITH_ITERATOR}.make (a_population, l_pattern.pattern, a_context, Current))
			when Group_ending_with_algorithm then
				l_pattern ?= key_expression
				a_result.put_first (create {XM_XSLT_GROUP_ENDING_WITH_ITERATOR}.make (a_population, l_pattern.pattern, a_context, Current))
			end
		ensure
			result_or_error: a_result.first = Void xor a_result.second = Void
		end

	create_new_group_node_iterator (a_result: DS_PAIR [XM_XSLT_GROUP_NODE_ITERATOR, XM_XPATH_ERROR_VALUE]; a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Create iterator over groups of `a_population' in order of first appearance.
		require
			a_result_not_void: a_result /= Void
			a_result_empty: a_result.first = Void and a_result.second = Void
			a_context_not_void: a_context /= Void
			a_population_not_void: a_population /= Void
			no_error: not a_context.transformer.is_error
		local
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_pattern: XM_XSLT_PATTERN_BRIDGE
			l_collator: DS_PAIR [ST_COLLATOR, XM_XPATH_ERROR_VALUE]
		do
			inspect
				algorithm
			when Group_by_algorithm then
				l_new_context := a_context.new_minor_context
				l_new_context.set_current_iterator (a_population)
				create l_collator.make (Void, Void)
				fetch_collator (l_collator, a_context)
				if l_collator.first /= Void then
					a_result.put_first (create {XM_XSLT_GROUP_BY_NODE_ITERATOR}.make (a_population.as_node_iterator, key_expression, l_new_context, l_collator.first))
				else
					a_result.put_second (l_collator.second)
				end
			when Group_adjacent_algorithm then
				create l_collator.make (Void, Void)
				fetch_collator (l_collator, a_context)
				if l_collator.first /= Void then
					a_result.put_first (create {XM_XSLT_GROUP_ADJACENT_NODE_ITERATOR}.make (a_population.as_node_iterator, key_expression, a_context, l_collator.first))
				else
					a_result.put_second (l_collator.second)
				end
			when Group_starting_with_algorithm then
					l_pattern ?= key_expression
					a_result.put_first (create {XM_XSLT_GROUP_STARTING_WITH_NODE_ITERATOR}.make (a_population.as_node_iterator, l_pattern.pattern, a_context, Current))
			when Group_ending_with_algorithm then
					l_pattern ?= key_expression
					a_result.put_first (create {XM_XSLT_GROUP_ENDING_WITH_NODE_ITERATOR}.make (a_population.as_node_iterator, l_pattern.pattern, a_context, Current))
			end
		ensure
			result_or_error: a_result.first = Void xor a_result.second = Void
		end

invariant

	select_expression_not_void: initialized implies select_expression /= Void
	key: initialized implies key_expression /= Void
	sort_keys: initialized implies sort_keys /= Void
	algorithm: initialized implies algorithm >= Group_by_algorithm and algorithm <= Group_ending_with_algorithm
	pattern: (algorithm = Group_ending_with_algorithm or algorithm = Group_starting_with_algorithm) implies key_expression.is_pattern_bridge
	collation: initialized implies algorithm >= Group_starting_with_algorithm implies collation_name = Void
	default_collation_name_not_void: initialized implies default_collation_name /= Void

end

