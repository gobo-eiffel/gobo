indexing

	description:

		"XPath Expressions, other than values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COMPUTED_EXPRESSION

	-- There are two principal routines for evaluating an expression:
	--  `create_iterator', which yields an iterator over the result of the expression
	--  as a sequence, and `evaluate_item', which sets an XM_XPATH_ITEM.
	-- Both routines take an XM_XPATH_CONTEXT object to supply the evaluation context;
	--  for an expression that is a Value, this argument is ignored and may be `Void'.
	-- This base class provides an implementation of `create_iterator' in terms of evaluate_item
	--  that works only for singleton expressions, and an implementation
	--  of evaluate_item in terms of `create_iterator' that works only for non-singleton expressions.
	-- Sub-classes of expression must therefore provide either `create_iterator' or evaluate_item:
	--  they do not have to provide both.

inherit

	XM_XPATH_EXPRESSION
		redefine
			is_computed_expression, as_computed_expression
		end

	XM_XPATH_EXPRESSION_CONTAINER
		undefine
			as_computed_expression
		end

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

feature -- Access
	
	is_computed_expression: BOOLEAN is
			-- Is `Current' a computed expression?
		do
			Result := True
		end

	as_computed_expression: XM_XPATH_COMPUTED_EXPRESSION is
			-- `Current' seen as a computed expression
		do
			Result := Current
		end

	line_number: INTEGER is
			-- Line number of `Current' within source document
		do
			if location_identifier = 0 then
				if parent /= Void then
					Result := parent.line_number
				end
			else
				Result := INTEGER_.bit_and (location_identifier, line_number_mask)
			end
		end

	system_id: STRING is
			-- System identifier of module containg `Current'
		local
			a_module_number: INTEGER
		do
			if was_expression_replaced then -- WHY is this necessary ??
				Result := ""
			elseif location_identifier /= 0 then
				a_module_number := INTEGER_.bit_shift_right (location_identifier, module_number_shift)
				check
					strictly_positive_module_number: a_module_number > 0
				end
				Result := system_id_from_module_number (a_module_number)
			elseif container = Void then
				Result := ""
			else
				Result := container.system_id
			end
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING is
			-- System identifier
		do

			-- Default implementation - redefined by top-level containers

			if was_expression_replaced then -- WHY is this necessary ??
				Result := ""
			elseif container = Void then
				Result := ""
			else
				Result := container.system_id_from_module_number (a_module_number)
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do

			-- Default implementation returns an empty list;
			-- Suitable for an expression without sub-expressions.
			
			create Result.make_default
			Result.set_equality_tester (expression_tester)
		end
	
	container: XM_XPATH_EXPRESSION_CONTAINER is
			-- Containing parent
		do
			Result := parent
		end

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER is
			-- Approximate count of references by parameters of `Current' to `a_binding'
		do
			-- pre-condition cannot be met
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		require
			child_not_void: a_child /= Void
		do
			Result := False -- default implementation
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := Current = other
		end

feature -- Status report
	
	frozen is_user_function: BOOLEAN is
			-- Is `Current' a compiled user function?
		do
			-- `False'
		end

	sub_expressions_have_cardinality: BOOLEAN is
			-- Is `are_cardinalities_computed' satisfied for all `sub_expressions'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := True
			from a_cursor := sub_expressions.new_cursor; a_cursor.start; until a_cursor.after loop
				Result := a_cursor.item.are_cardinalities_computed
				if Result then	a_cursor.forth else a_cursor.go_after end
			end
		end

	sub_expressions_have_intrinsic_dependencies: BOOLEAN is
			-- Is `are_intrinsic_dependencies_computed' satisfied for all `sub_expressions'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := True
			from a_cursor := sub_expressions.new_cursor; a_cursor.start; until a_cursor.after loop
				Result := a_cursor.item.are_intrinsic_dependencies_computed
				if Result then	a_cursor.forth else a_cursor.go_after end
			end
		end

	sub_expressions_have_dependencies: BOOLEAN is
			-- Is `are_dependencies_computed' satisfied for all `sub_expressions'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := True
			from a_cursor := sub_expressions.new_cursor; a_cursor.start; until a_cursor.after loop
				Result := a_cursor.item.are_dependencies_computed
				if Result then	a_cursor.forth else a_cursor.go_after end
			end
		end

	sub_expressions_have_special_properties: BOOLEAN is
			-- Is `are_special_properties_computed' satisfied for all `sub_expressions'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			Result := True
			from a_cursor := sub_expressions.new_cursor; a_cursor.start; until a_cursor.after loop
				Result := a_cursor.item.are_special_properties_computed
				if Result then	a_cursor.forth else a_cursor.go_after end
			end
		end

feature -- Status setting

	frozen compute_static_properties is
			-- Compute the static properties
		require
			not_yet_computed: not are_static_properties_computed
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			an_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if not are_dependencies_computed then
				from
					a_cursor := sub_expressions.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					an_expression ?= a_cursor.item
					if an_expression /= Void and then not an_expression.are_dependencies_computed then
						an_expression.compute_dependencies
					end
					a_cursor.forth
				end
				compute_dependencies
			end
			if not are_cardinalities_computed then
				from
					a_cursor := sub_expressions.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					an_expression ?= a_cursor.item
					if an_expression /= Void and then not an_expression.are_cardinalities_computed then
						an_expression.compute_cardinality
					end
					a_cursor.forth
				end
				compute_cardinality
			end
			if not are_special_properties_computed then
				from
					a_cursor := sub_expressions.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					an_expression ?= a_cursor.item
					if an_expression /= Void and then not an_expression.are_special_properties_computed then
						an_expression.compute_special_properties
					end
					a_cursor.forth
				end
				compute_special_properties
			end
		ensure
			computed: are_static_properties_computed
			dependencies_not_void: dependencies /= Void
			intrisic_dependencies_not_void: intrinsic_dependencies /= Void
			cardinalities_not_void: cardinalities /= Void
			special_properties_not_void: special_properties /= Void
		end


	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		require
			not_yet_computed: not are_intrinsic_dependencies_computed
-- removed 10/08/05 as it is surely wrong			all_sub_expressions_computed: sub_expressions_have_intrinsic_dependencies
		do
			initialize_intrinsic_dependencies
		ensure
			computed: are_intrinsic_dependencies_computed and then intrinsic_dependencies /= Void
		end
			
	compute_dependencies is
			-- Compute dependencies on context.
			-- This default implementation computes them as
			-- the union of the sub-expressions' dependencies.
		require
			not_yet_computed: not are_dependencies_computed
			all_sub_expressions_computed: sub_expressions_have_dependencies
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if not are_intrinsic_dependencies_computed then compute_intrinsic_dependencies end
			dependencies := BOOLEAN_ARRAY_.cloned_array (intrinsic_dependencies)
			are_dependencies_computed := True
			from
				a_cursor := sub_expressions.new_cursor
				a_cursor.start
			variant
				sub_expressions.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				merge_dependencies (a_cursor.item.dependencies)
				a_cursor.forth
			end
		ensure
			intrinsic_computed: are_intrinsic_dependencies_computed and then intrinsic_dependencies /= Void
			computed: are_dependencies_computed and then dependencies /= Void
		end

	reset_static_properties is
			-- Re-compute all static properties.
		require
			static_properties_previously_computed: are_static_properties_computed
		do
			are_dependencies_computed := False
			are_intrinsic_dependencies_computed := False
			are_cardinalities_computed := False
			are_special_properties_computed := False
			compute_static_properties
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			-- do nothing
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			-- do nothing
		end
	
feature -- Evaluation

	lazily_evaluate (a_context: XM_XPATH_CONTEXT; a_reference_count: INTEGER) is
			-- Lazily evaluate `Current'.
			-- This will set a value, which may optionally be an XM_XPATH_CLOSURE,
			--  which is a wrapper around an iterator over the value of the expression.
		local
			a_count: INTEGER
		do
			check
				context_not_void: a_context /= Void
				-- We are not evaluating a value, as XM_XPATH_VALUE redefines this routine
			end
			if depends_upon_position or else depends_upon_last
				or else depends_upon_current_item or else depends_upon_current_group
				or else depends_upon_regexp_group then
				
				-- We can't save these values in the closure, so we evaluate
				-- the expression now if they are needed
				
				eagerly_evaluate (a_context)
			elseif is_lazy_expression then

				-- A LazyExpression is always evaluated lazily (if at all possible) to
            --  prevent spurious errors

				if a_reference_count = 1 then
					a_count := Many_references
				else
					a_count := a_reference_count
				end
				expression_factory.create_closure (Current, a_context, a_count)
				last_evaluation := expression_factory.last_created_closure
			elseif not cardinality_allows_many then

				-- Singletons are always evaluated eagerly
				
				eagerly_evaluate (a_context)
			else
				
				-- Create a Closure, a wrapper for the expression and its context
				
				expression_factory.create_closure (Current, a_context, a_reference_count)
				last_evaluation := expression_factory.last_created_closure
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			last_evaluated_item := Void
			create_iterator (a_context)
			if last_iterator.is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (last_iterator.error_value)
			else
				last_iterator.start
				if last_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (last_iterator.error_value)
				elseif last_iterator.after then
					last_evaluated_item := Void -- Empty sequence
				else
					last_evaluated_item := last_iterator.item
				end
			end
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a String
		do
			evaluate_item (a_context)
			if last_evaluated_item = Void then
				create last_evaluated_string.make ("")
			elseif last_evaluated_item.is_error then
				create last_evaluated_string.make ("")
				last_evaluated_string.set_last_error (last_evaluated_item.error_value)
			elseif not last_evaluated_item.is_string_value then
				create last_evaluated_string.make ("")
			else
				last_evaluated_string := last_evaluated_item.as_string_value
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			
			-- The value of every expression can be regarded as a sequence, s
			--  so this routine is supported for all expressions.
			-- This default implementation handles iteration for expressions that
			--  return singleton values: for non-singleton expressions, the subclass must
			--  provide its own implementation.

			check
					singleton_expression: not cardinality_allows_many
					-- Not a prefect check, as cardinality may not have been set!
				end
			evaluate_item (a_context)
			if last_evaluated_item = Void then
				create {XM_XPATH_EMPTY_ITERATOR} last_iterator.make
			elseif last_evaluated_item.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (last_evaluated_item.error_value)
			elseif last_evaluated_item.is_node then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (last_evaluated_item.as_node) 
			else
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (last_evaluated_item) 
			end
		end

	process (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			if is_evaluate_item_supported then
				evaluate_item (a_context)
				if last_evaluated_item /= Void then
					a_context.current_receiver.append_item (last_evaluated_item)
				end
			elseif is_iterator_supported then
				create_iterator (a_context)
				if last_iterator.is_error then
					a_context.report_fatal_error (last_iterator.error_value)
				else
					from
						last_iterator.start
					until
						last_iterator.is_error or else last_iterator.after
					loop
						a_context.current_receiver.append_item (last_iterator.item)
						last_iterator.forth
					end
					if last_iterator.is_error then
						a_context.report_fatal_error (last_iterator.error_value)
					end
				end
			else
				check
					not_supported: False
				end
			end
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Eager evaluation via `process'
		do
			-- pre-condition will not be met for this implementation
		end

feature -- Element change

	set_source_location (a_module_number, a_line_number: INTEGER) is
			-- Set source location information.
		require
			strictly_positive_module_number: a_module_number > 0
			positive_line_number: a_line_number >= 0
		do
			location_identifier := INTEGER_.bit_shift_left (a_module_number, module_number_shift) + a_line_number
		end

	set_location_identifier (a_location_identifier: INTEGER) is
			-- Set source location information.
		do
			location_identifier := a_location_identifier
		ensure
			location_identifier_set: location_identifier = a_location_identifier
		end

	copy_location_identifier (a_destination: XM_XPATH_EXPRESSION) is
			-- Copy source location information.
		require
			destination_not_replaced: a_destination /= Void and then not a_destination.was_expression_replaced
		do
			if a_destination.is_computed_expression then
				a_destination.as_computed_expression.set_location_identifier (location_identifier)
			end
		end

	set_parent (a_container: XM_XPATH_EXPRESSION_CONTAINER) is
			-- Set `a_container' to be parent of `Current'.
		require
			not_self: a_container /= Current
		do
			parent := a_container
		ensure
			parent_set: parent = a_container
		end

	adopt_child_expression (a_child: XM_XPATH_EXPRESSION) is
			-- Adopt `a_child' if it is a computed expression.
		require
			child_expression_not_replaced: a_child /= Void and then not a_child.was_expression_replaced
			not_self: a_child /= Current
		local
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			if not a_child.is_error then a_child.mark_unreplaced end
			if a_child.is_computed_expression then
				a_computed_expression := a_child.as_computed_expression
				if parent = Void and then a_computed_expression.container /= Current then
					parent := a_computed_expression.container
				end
				a_computed_expression.set_parent (Current)
				if location_identifier = 0 then
					a_computed_expression.copy_location_identifier (Current)
				else
					copy_location_identifier (a_computed_expression)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			if cardinality_allows_many then
				Result := Supports_iterator
			else
				Result := Supports_evaluate_item
			end
		end

	compute_cardinality is
			-- Compute cardinality.
		require
			not_yet_computed: not are_cardinalities_computed
			all_sub_expressions_computed: sub_expressions_have_cardinality
		deferred
		ensure
			computed: are_cardinalities_computed and then cardinalities /= Void
		end

	compute_special_properties is
			-- Compute special properties.
		require
			not_yet_computed: not are_special_properties_computed
			all_sub_expressions_computed: sub_expressions_have_special_properties
		do
			initialize_special_properties
		ensure
			computed: are_special_properties_computed and then special_properties /= Void
		end

feature {XM_XPATH_COMPUTED_EXPRESSION} -- Local

	accumulate_slots_used (a_set: DS_HASH_SET [INTEGER]) is
			-- Add all slot numbers used by `Current' to `a_set'.
		require
			set_exists: a_set /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
		do
			from
				a_cursor := sub_expressions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				a_computed_expression ?= a_cursor.item
				if a_computed_expression /= Void then
					a_computed_expression.accumulate_slots_used (a_set)
				end
				a_cursor.forth
			end
		ensure
			no_fewer: a_set.count >= old a_set.count
		end


feature {XM_XPATH_CLOSURE} -- Restricted

	slots_used: DS_ARRAYED_LIST [INTEGER] is
			-- Slot numbers in use
		require
			dependency_on_local_variables: depends_upon_local_variables
		local
			a_set: DS_HASH_SET [INTEGER]
			a_cursor: DS_HASH_SET_CURSOR [INTEGER]
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_QUICK_SORTER [INTEGER]
		do
			if cached_slots_used = Void then
				create a_set.make_default
				accumulate_slots_used (a_set)
				create cached_slots_used.make (a_set.count)
				from
					a_cursor := a_set.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					cached_slots_used.put_last (a_cursor.item)
					a_cursor.forth
				end
				create a_comparator.make
				create a_sorter.make (a_comparator)
				cached_slots_used.sort (a_sorter)
			end
			Result := cached_slots_used
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation
	
	parent: XM_XPATH_EXPRESSION_CONTAINER
			-- Containing parent

	location_identifier: INTEGER
			-- Index into SYSTEM ID array

	initialized: BOOLEAN
			-- Has creation procedure completed?

	cached_slots_used: DS_ARRAYED_LIST [INTEGER]
			-- Cached result of `slots_used'

	line_number_mask: INTEGER is
			-- Bit mask for extracting line number from `location_identifer'
		once
			Result := 1048575
		end

	module_number_shift: INTEGER is 20
			-- Number of bits to shift `location_identifer' for module number

invariant

		positive_location_identifier: location_identifier >= 0

end
	
