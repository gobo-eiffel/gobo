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
		redefine
			item_type, compute_dependencies, creates_new_nodes, promote_instruction,
			sub_expressions, create_iterator
		end

	XM_XSLT_FOR_EACH_GROUP_CONSTANTS

	XM_XPATH_MAPPING_FUNCTION

		-- TODO: use XM_XSLT_PATTERN_EXPRESSION, when it is completed

create

	make, make_pattern

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, an_action: XM_XPATH_EXPRESSION; a_key_expression: XM_XPATH_EXPRESSION;
		an_algorithm: INTEGER; some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION];
		a_collation_name: XM_XPATH_EXPRESSION; a_default_collation_name: STRING) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			action_not_void: an_action /= Void
			key_expression_not_void: a_key_expression /= Void
			expression_algorithm: an_algorithm = Group_by_algorithm  or an_algorithm = Group_adjacent_algorithm
			sort_keys: some_sort_keys /= Void
			default_collation_name_not_void: a_default_collation_name /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
			action := an_action
			adopt_child_expression (action)
			key_expression := a_key_expression
			adopt_child_expression (key_expression)
			algorithm := an_algorithm
			sort_keys := some_sort_keys
			collation_name := a_collation_name
			default_collation_name := a_default_collation_name
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			action_set: action = an_action
			key_expression_set: key_expression = a_key_expression
			algorithm_set: algorithm = an_algorithm
			sort_keys_set: sort_keys = some_sort_keys
			collation_name_set: collation_name = a_collation_name
			default_collation_name_set: default_collation_name = a_default_collation_name
		end

	-- TODO: use XM_XSLT_PATTERN_EXPRESSION
	
	make_pattern (an_executable: XM_XSLT_EXECUTABLE; a_select_expression, an_action: XM_XPATH_EXPRESSION; a_key_pattern: XM_XSLT_PATTERN;
		an_algorithm: INTEGER; some_sort_keys: DS_ARRAYED_LIST [XM_XSLT_SORT_KEY_DEFINITION];
		a_collation_name: XM_XPATH_EXPRESSION; a_default_collation_name: STRING) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			select_expression_not_void: a_select_expression /= Void
			action_not_void: an_action /= Void
			key_expression_not_void: a_key_pattern /= Void
			expression_algorithm: an_algorithm = Group_starting_with_algorithm  or an_algorithm = Group_ending_with_algorithm
			sort_keys: some_sort_keys /= Void
			default_collation_name_not_void: a_default_collation_name /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			adopt_child_expression (select_expression)
			action := an_action
			adopt_child_expression (action)
			key_pattern := a_key_pattern
			-- TODO: adopt_child_expression (key_pattern)
			algorithm := an_algorithm
			sort_keys := some_sort_keys
			collation_name := a_collation_name
			default_collation_name := a_default_collation_name
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			action_set: action = an_action
			key_pattern_set: key_pattern = a_key_pattern
			algorithm_set: algorithm = an_algorithm
			sort_keys_set: sort_keys = some_sort_keys
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
			create Result.make (3 + sort_keys.count * 5)
			Result.set_equality_tester (expression_tester)
			Result.put (select_expression, 1)
			Result.put (action, 2)
			if key_expression /= Void then
				Result.put (key_expression, 3)
-- TODO:			else
--				Result.put (key_pattern, 3)
			end
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
		end

feature -- Status report

	creates_new_nodes: BOOLEAN is
			-- Can `Current' create new nodes?
		do
			Result := not action.non_creating
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Status setting

	compute_dependencies is
			-- Compute dependencies on context.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			set_dependencies (select_expression.dependencies)
			merge_dependencies (action.dependencies)
			if key_expression /= Void then
				if not select_expression.depends_upon_current_group and then not  key_expression.depends_upon_current_group then
					set_current_group_independent
				end
				merge_dependencies (key_expression.dependencies)
			else
				if not select_expression.depends_upon_current_group then -- TODO: and then not  key_pattern.depends_upon_current_group then
					set_current_group_independent
				end
				-- TODO: merge_dependencies (key_pattern.dependencies)
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
					merge_dependencies (a_computed_expression.dependencies)
				end
				a_cursor.forth
			end
			if not select_expression.depends_upon_context_item then
				set_context_item_independent
			end
			if not select_expression.depends_upon_position then
				set_position_independent
			end
			if not select_expression.depends_upon_last then
				set_last_independent
			end
			if not select_expression.depends_upon_context_document then
				set_context_document_independent
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
			if key_expression /= Void then
				key_expression.simplify
				if key_expression.was_expression_replaced then
					key_expression := key_expression.replacement_expression
					adopt_child_expression (key_expression)
				end
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			mark_unreplaced
			select_expression.check_static_type (a_context)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			an_empty_sequence ?= select_expression
			if an_empty_sequence /= Void then
				set_replacement (an_empty_sequence) -- NOP
			else
				action.check_static_type (a_context)
				if action.was_expression_replaced then
					action := action.replacement_expression
					adopt_child_expression (action)
				end
				an_empty_sequence ?= action
				if an_empty_sequence /= Void then
					set_replacement (an_empty_sequence) -- NOP
				else
					if key_expression /= Void then
						key_expression.check_static_type (a_context)
						if key_expression.was_expression_replaced then
							key_expression := key_expression.replacement_expression
							adopt_child_expression (key_expression)
						end
					end
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		local
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
		do
			mark_unreplaced
			select_expression.optimize (a_context)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			an_empty_sequence ?= select_expression
			if an_empty_sequence /= Void then
				set_replacement (an_empty_sequence) -- NOP
			else
				action.optimize (a_context)
				if action.was_expression_replaced then
					action := action.replacement_expression
					adopt_child_expression (action)
				end
				an_empty_sequence ?= action
				if an_empty_sequence /= Void then
					set_replacement (an_empty_sequence) -- NOP
				else
					if key_expression /= Void then
						key_expression.optimize (a_context)
						if key_expression.was_expression_replaced then
							key_expression := key_expression.replacement_expression
							adopt_child_expression (key_expression)
						end
					end
				end
			end
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		do
			select_expression.promote (an_offer)
			if select_expression.was_expression_replaced then
				select_expression := select_expression.replacement_expression
				adopt_child_expression (select_expression)
			end
			action.promote (an_offer)
			if action.was_expression_replaced then
				action := action.replacement_expression
				adopt_child_expression (action)
			end
		end	
	
feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
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
			if a_group_iterator.is_error then
				a_transformer.report_fatal_error (a_group_iterator.error_value, Current)
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
					action.process (a_new_context)
					if a_transformer.is_tracing then
						a_trace_listener.trace_current_item_finish (a_group_iterator.item)
					end
					a_group_iterator.forth
					if a_group_iterator.is_error then
						a_transformer.report_fatal_error (a_group_iterator.error_value, Current)
					end
				end
			end
			last_tail_call := Void
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
				an_evaluation_context.transformer.report_fatal_error (a_group_iterator.error_value, Current)
			else
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
			-- Key for `Group_by' or `Group_adjacent'

			-- TODO: key_pattern: XM_XSLT_PATTERN_EXPRESSION
	
	key_pattern: XM_XSLT_PATTERN
			-- Key for `Group_starting_with' or `Group_ending_with'

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
			a_collation_name: STRING
		do
			if cached_collator /= Void then
				Result := cached_collator
			else
				if collation_name /= Void then
					collation_name.evaluate_item (a_context)
					a_collation_name := collation_name.last_evaluated_item.string_value
					Result := a_context.collator (a_collation_name)
				else
					Result := a_context.collator (default_collation_name)
				end

			end
			cached_collator := Result
		end

	create_group_iterator (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Group iterator
		require
			context_not_void: a_context /= Void
		local
			a_population: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			reduced_sort_keys: DS_ARRAYED_LIST [XM_XSLT_FIXED_SORT_KEY_DEFINITION]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_SORT_KEY_DEFINITION]
			a_fixed_sort_key: XM_XSLT_FIXED_SORT_KEY_DEFINITION
			a_new_context: XM_XSLT_EVALUATION_CONTEXT
			a_group_iterator: XM_XSLT_GROUP_ITERATOR
		do
			select_expression.create_iterator (a_context)
			a_population := select_expression.last_iterator
			if a_population.is_error then
				a_context.transformer.report_fatal_error (a_population.error_value, Current)
			else
			
				-- Obtain am iterator over the groups in order of first appearance
				
				inspect
					algorithm
				when Group_by_algorithm then
					a_new_context := a_context.new_minor_context
					a_new_context.set_current_iterator (a_population)
					create {XM_XSLT_GROUP_BY_ITERATOR} a_group_iterator.make (a_population, key_expression, a_new_context, collator (a_new_context))
				when Group_adjacent_algorithm then
					check
						croup_adjacent_NYI: False
					end
					--				create {XM_XSLT_GROUP_ADJACENT_ITERATOR} a_group_iterator.make (a_population, key_expression, a_context, collator)
				when Group_starting_with_algorithm then
					create {XM_XSLT_GROUP_STARTING_WITH_ITERATOR} a_group_iterator.make (a_population, key_pattern, a_context, Current)
				when Group_ending_with_algorithm then
					check
						group_ending_with_NYI: False
					end
					--create {XM_XSLT_GROUP_ENDING_WITH_ITERATOR} a_group_iterator.make (a_population, key_expression.pattern, a_context)
				end
				
				-- Now iterate over the leading nodes of the groups.
				
				if sort_keys.count > 0 then
					create reduced_sort_keys.make (sort_keys.count)
					a_new_context := a_context.new_minor_context
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
					create {XM_XSLT_SORTED_GROUP_ITERATOR} last_group_iterator.make (a_new_context, a_group_iterator, reduced_sort_keys)
				else
					last_group_iterator := a_group_iterator
				end
			end
		ensure
			result_not_void: last_group_iterator /= Void
		end


invariant

	select_expression_not_void: initialized implies select_expression /= Void
	key: initialized implies key_expression /= Void xor key_pattern /= Void
	sort_keys: initialized implies sort_keys /= Void
	algorithm: initialized implies algorithm >= Group_by_algorithm and then algorithm <= Group_ending_with_algorithm
	collation: initialized implies algorithm >= Group_starting_with_algorithm implies collation_name = Void
	default_collation_name_not_void: initialized implies default_collation_name /= Void

end
	
