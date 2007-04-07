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
			sub_expressions, create_iterator
		end

	XM_XSLT_FOR_EACH_GROUP_CONSTANTS

	XM_XPATH_MAPPING_FUNCTION

		-- TODO: `create_node_iterator' needs re-defining to avoid possible bugs
	
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
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "xsl:for-each-group")
			std.error.put_string (a_string); std.error.put_new_line
			select_expression.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level), "return")
			std.error.put_string (a_string); std.error.put_new_line
			action.display (a_level + 1)
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			l_focus: BOOLEAN
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			if not select_expression.are_dependencies_computed then select_expression.as_computed_expression.compute_dependencies end
			set_dependencies (select_expression.dependencies)
			if not action.are_dependencies_computed then action.as_computed_expression.compute_dependencies end
			merge_dependencies (action.dependencies)
			if not key_expression.are_dependencies_computed then key_expression.as_computed_expression.compute_dependencies end
			merge_dependencies (key_expression.dependencies)
			if not select_expression.depends_upon_current_group and not key_expression.depends_upon_current_group then
				set_current_group_independent
			end
			if not select_expression.depends_upon_focus then
				set_focus_independent
			end
			from
				a_cursor := sort_keys.new_cursor; a_cursor.start
			variant
				sort_keys.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_computed_expression ?= a_cursor.item.sort_key
				if a_computed_expression /= Void then
					if not a_computed_expression.are_dependencies_computed then a_computed_expression.compute_dependencies end
					l_focus := depends_upon_focus
					merge_dependencies (a_computed_expression.dependencies)
					if not depends_upon_focus then
						set_focus_independent
					end
				end
				a_cursor.forth
			end
			from
				a_cursor := sort_keys.new_cursor; a_cursor.start
			variant
				sort_keys.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_computed_expression ?= a_cursor.item.case_order_expression
				if a_computed_expression /= Void then
					merge_dependencies (a_computed_expression.dependencies)
				end
				a_computed_expression ?= a_cursor.item.language_expression
				if a_computed_expression /= Void then
					merge_dependencies (a_computed_expression.dependencies)
				end
				a_computed_expression ?= a_cursor.item.data_type_expression
				if a_computed_expression /= Void then
					merge_dependencies (a_computed_expression.dependencies)
				end
				a_cursor.forth
			end
			if collation_name /= Void then
				merge_dependencies (collation_name.dependencies)
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			select_expression.simplify
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			action.simplify
			if action.was_expression_replaced then
				action := action.replacement_expression
				adopt_child_expression (action)
			end
			key_expression.simplify
			if key_expression.was_expression_replaced then
				key_expression := key_expression.replacement_expression
				adopt_child_expression (key_expression)
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			mark_unreplaced
			select_expression.check_static_type (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
			end
			an_empty_sequence ?= select_expression
			if an_empty_sequence /= Void then
				set_replacement (an_empty_sequence) -- NOP
			else
				action.check_static_type (a_context, select_expression.item_type)
				if action.was_expression_replaced then
					action := action.replacement_expression
				end
				an_empty_sequence ?= action
				if an_empty_sequence /= Void then
					set_replacement (an_empty_sequence) -- NOP
				else
					key_expression.check_static_type (a_context, select_expression.item_type)
					if key_expression.was_expression_replaced then
						key_expression := key_expression.replacement_expression
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			mark_unreplaced
			select_expression.optimize (a_context, a_context_item_type)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
			end
			an_empty_sequence ?= select_expression
			if an_empty_sequence /= Void then
				set_replacement (an_empty_sequence) -- NOP
			else
				action.optimize (a_context, select_expression.item_type)
				if action.was_expression_replaced then
					action := action.replacement_expression
				end
				an_empty_sequence ?= action
				if an_empty_sequence /= Void then
					set_replacement (an_empty_sequence) -- NOP
				else
					key_expression.optimize (a_context, select_expression.item_type)
					if key_expression.was_expression_replaced then
						key_expression := key_expression.replacement_expression
					end
				end
			end
			if not was_expression_replaced then
				adopt_child_expression (select_expression)
				adopt_child_expression (action)
				adopt_child_expression (key_expression)
			end
		end

	promote_instruction (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (a_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
				reset_static_properties
			end
			action.promote (a_offer)
			if action.was_expression_replaced then
				action := action.replacement_expression
				adopt_child_expression (action)
				reset_static_properties
			end
			key_expression.promote (a_offer)
			if key_expression.was_expression_replaced then
				key_expression := key_expression.replacement_expression
				adopt_child_expression (key_expression)
				reset_static_properties
			end
		end	
	
feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_transformer: XM_XSLT_TRANSFORMER
			a_group_iterator: XM_XSLT_GROUP_ITERATOR
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
			a_trace_listener: XM_XSLT_TRACE_LISTENER
		do
			a_transformer := a_context.transformer
			create_group_iterator (a_context)
			a_group_iterator := last_group_iterator
			if a_group_iterator = Void then
				-- error already reported
			elseif a_group_iterator.is_error then
				a_group_iterator.error_value.set_location (system_id, line_number)
				a_transformer.report_fatal_error (a_group_iterator.error_value)
			else
				a_new_context := a_context.new_context
				a_new_context.set_current_template (Void)
				a_new_context.set_current_iterator (a_group_iterator)
				a_new_context.set_current_group_iterator (a_group_iterator)
				if a_transformer.is_tracing then
					a_trace_listener := a_transformer.trace_listener
				end
				from
					a_group_iterator.start
				until
					a_transformer.is_error or else a_group_iterator.after
				loop
					if a_transformer.is_tracing then
						a_trace_listener.trace_current_item_start (a_group_iterator.item)
					end
					action.generate_events (a_new_context)
					if a_transformer.is_tracing then
						a_trace_listener.trace_current_item_finish (a_group_iterator.item)
					end
					a_group_iterator.forth
					if a_group_iterator.is_error then
						a_group_iterator.error_value.set_location (system_id, line_number)
						a_transformer.report_fatal_error (a_group_iterator.error_value)
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterate over the values of a sequence
		local
			a_group_iterator: XM_XSLT_GROUP_ITERATOR
			a_new_context, an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			an_evaluation_context ?= a_context
			check
				an_evaluation_context /= Void
				-- This is XSLT
			end
			create_group_iterator (an_evaluation_context)
			a_group_iterator := last_group_iterator
			a_new_context := an_evaluation_context.new_context
			a_new_context.set_current_template (Void)
			a_new_context.set_current_iterator (a_group_iterator)
			a_new_context.set_current_group_iterator (a_group_iterator)
			if a_group_iterator.is_error then
				a_group_iterator.error_value.set_location (system_id, line_number)
				an_evaluation_context.transformer.report_fatal_error (a_group_iterator.error_value)
			else
				-- TODO: node_iterator version of XM_XSLT_GROUP_ITERATOR needed
				create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (a_group_iterator, Current, a_new_context)
			end
		end
	
	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		do
			action.create_iterator (a_context)
			create last_mapped_item.make_sequence (action.last_iterator)
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

	cached_collator: ST_COLLATOR
			-- Caced result from `collator'

	last_group_iterator: XM_XSLT_GROUP_ITERATOR
			-- Result from `create_group_iterator'
	
	collator (a_context: XM_XSLT_EVALUATION_CONTEXT): ST_COLLATOR is
			-- Collator (memo function)
		require
			context_not_void: a_context /= Void
		local
			l_collation_name: STRING
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			if cached_collator /= Void then
				Result := cached_collator
			else
				if collation_name /= Void then
					create l_item.make (Void)
					collation_name.evaluate_item (l_item, a_context)
					l_collation_name := l_item.item.string_value
					if a_context.is_known_collation (l_collation_name) then
						Result := a_context.collator (l_collation_name)
					else
						Result := Void
						report_unknown_collator (l_collation_name, a_context.transformer)
					end
				else
					Result := a_context.collator (default_collation_name)
				end
			end
			cached_collator := Result
		end

	report_unknown_collator (a_collation_name: STRING; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Report `collation_name' is unknown to implementation.
		require
			collation_name_not_void: a_collation_name /= Void
			a_transformer_not_void: a_transformer /= Void
		local
			l_error: XM_XPATH_ERROR_VALUE
		do
			create l_error.make_from_string (STRING_.concat (a_collation_name, " is not a known collation"), Xpath_errors_uri, "XTDE1110", Dynamic_error)
			a_transformer.report_fatal_error (l_error)
		end

	create_group_iterator (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Group iterator
		require
			context_not_void: a_context /= Void
		local
			l_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			l_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
			l_new_context: XM_XSLT_EVALUATION_CONTEXT
			l_group_iterator: XM_XSLT_GROUP_ITERATOR
			l_pattern: XM_XSLT_PATTERN_BRIDGE
			l_collator: ST_COLLATOR
		do
			select_expression.create_iterator (a_context)
			l_population := select_expression.last_iterator
			if l_population.is_error then
				l_population.error_value.set_location (system_id, line_number)
				a_context.transformer.report_fatal_error (l_population.error_value)
			else
			
				-- Obtain am iterator over the groups in order of first appearance
				
				inspect
					algorithm
				when Group_by_algorithm then
					l_new_context := a_context.new_minor_context
					l_new_context.set_current_iterator (l_population)
					l_collator := collator (a_context)
					if l_collator /= Void then
						create {XM_XSLT_GROUP_BY_ITERATOR} l_group_iterator.make (l_population, key_expression, l_new_context, l_collator)
					end
				when Group_adjacent_algorithm then
					l_collator := collator (a_context)
					if l_collator /= Void then
						create {XM_XSLT_GROUP_ADJACENT_ITERATOR} l_group_iterator.make (l_population, key_expression, a_context, l_collator)
					end
				when Group_starting_with_algorithm then
					l_pattern ?= key_expression
					create {XM_XSLT_GROUP_STARTING_WITH_ITERATOR} l_group_iterator.make (l_population, l_pattern.pattern, a_context, Current)
				when Group_ending_with_algorithm then
					l_pattern ?= key_expression
					create {XM_XSLT_GROUP_ENDING_WITH_ITERATOR} l_group_iterator.make (l_population, l_pattern.pattern, a_context, Current)
				end
				
				-- Now iterate over the leading nodes of the groups.
				
				if sort_keys.count > 0 then
					create l_reduced_sort_keys.make (sort_keys.count)
					l_new_context := a_context.new_minor_context
					from
						l_cursor := sort_keys.new_cursor; l_cursor.start
					variant
						sort_keys.count + 1 - l_cursor.index
					until
						l_cursor.after
					loop
						l_cursor.item.evaluate_expressions (l_new_context)
						l_fixed_sort_key:= l_cursor.item.reduced_definition (l_new_context)
						l_reduced_sort_keys.put_last (l_fixed_sort_key)
						l_cursor.forth
					end
					create {XM_XSLT_SORTED_GROUP_ITERATOR} last_group_iterator.make (l_new_context, l_group_iterator, l_reduced_sort_keys)
				else
					last_group_iterator := l_group_iterator
				end
			end
		ensure
			result_not_void: not a_context.transformer.is_error implies last_group_iterator /= Void
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
	
