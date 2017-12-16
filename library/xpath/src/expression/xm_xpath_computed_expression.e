note

	description:

		"XPath Expressions, other than values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
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

	XM_XPATH_LOCATOR

	KL_IMPORTED_ARRAY_ROUTINES
		export {NONE} all end

feature -- Access

	is_computed_expression: BOOLEAN
			-- Is `Current' a computed expression?
		do
			Result := True
		end

	as_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			-- `Current' seen as a computed expression
		do
			Result := Current
		end

	line_number: INTEGER
			-- Line number of `Current' within source document
		do
			if location_identifier = 0 then
				if attached parent as l_parent then
					Result := l_parent.line_number
				end
			else
				Result := INTEGER_.bit_and (location_identifier, line_number_mask)
			end
		end

	system_id: STRING
			-- System identifier of module containg `Current'
		local
			a_module_number: INTEGER
		do
			if location_identifier /= 0 then
				a_module_number := INTEGER_.bit_shift_right (location_identifier, module_number_shift)
				if a_module_number > 0 then
					Result := system_id_from_module_number (a_module_number)
				elseif not attached container as l_container then
					Result := ""
				else
					Result := l_container.system_id
				end
			elseif not attached container as l_container then
				Result := ""
			else
				Result := l_container.system_id
			end
		end

	system_id_from_module_number (a_module_number: INTEGER): STRING
			-- System identifier
		do

			-- Default implementation - redefined by top-level containers

			if not attached container as l_container then
				Result := ""
			else
				Result := l_container.system_id_from_module_number (a_module_number)
			end
		end

	location_message: STRING
			-- Location text for messages
		do
			Result := "line " + line_number.out + " in module " + system_id
		ensure
			location_message_not_void: Result /= Void
			location_message_not_empty: not Result.is_empty
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		do

			-- Default implementation returns an empty list;
			-- Suitable for an expression without sub-expressions.

			create Result.make_default
			Result.set_equality_tester (expression_tester)
		end

	container: detachable XM_XPATH_EXPRESSION_CONTAINER
			-- Containing parent
		do
			Result := parent
		end

	parameter_references (a_binding: XM_XPATH_BINDING): INTEGER
			-- Approximate count of references by parameters of `Current' to `a_binding'
		do
			-- pre-condition cannot be met
		end

	is_repeated_sub_expression (a_child: XM_XPATH_EXPRESSION): BOOLEAN
			-- Is `a_child' a repeatedly-evaluated sub-expression?
		require
			child_not_void: a_child /= Void
		do
			Result := False -- default implementation
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		do
			Result := Current = other
		end

feature -- Status report

	initialized: BOOLEAN
			-- Has creation procedure completed?

	frozen is_user_function: BOOLEAN
			-- Is `Current' a compiled user function?
		do
			-- `False'
		end

	sub_expressions_have_cardinality: BOOLEAN
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

	sub_expressions_have_intrinsic_dependencies: BOOLEAN
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

	sub_expressions_have_dependencies: BOOLEAN
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

	sub_expressions_have_special_properties: BOOLEAN
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

	frozen compute_static_properties
			-- Compute the static properties
		require
			not_yet_computed: not are_static_properties_computed
			not_in_error: not is_error
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if not are_dependencies_computed then
				from
					a_cursor := sub_expressions.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					if attached {XM_XPATH_COMPUTED_EXPRESSION} a_cursor.item as an_expression and then not an_expression.are_dependencies_computed then
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
					if attached {XM_XPATH_COMPUTED_EXPRESSION} a_cursor.item as an_expression and then not an_expression.are_cardinalities_computed then
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
					if attached {XM_XPATH_COMPUTED_EXPRESSION} a_cursor.item as an_expression and then not an_expression.are_special_properties_computed then
						an_expression.compute_special_properties
					end
					a_cursor.forth
				end
				compute_special_properties
			end
		ensure
			computed: are_static_properties_computed
		end


	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		require
			not_yet_computed: not are_intrinsic_dependencies_computed
			not_in_error: not is_error
		do
			initialize_intrinsic_dependencies
		ensure
			computed: are_intrinsic_dependencies_computed
		end

	compute_dependencies
			-- Compute dependencies on context.
			-- This default implementation computes them as
			-- the union of the sub-expressions' dependencies.
		require
			not_yet_computed: not are_dependencies_computed
			all_sub_expressions_computed: sub_expressions_have_dependencies
			not_in_error: not is_error
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			if not are_intrinsic_dependencies_computed then
				compute_intrinsic_dependencies
			end
			initialize_dependencies_from_intrinsic_dependencies
			from
				a_cursor := sub_expressions.new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				merge_dependencies (a_cursor.item)
				a_cursor.forth
			variant
				sub_expressions.count + 1 - a_cursor.index
			end
		ensure
			intrinsic_computed: are_intrinsic_dependencies_computed
			computed: are_dependencies_computed
		end

	reset_dependencies
			-- Re-compute dependencies.
		require
			dependencies_previously_computed: are_dependencies_computed
			not_in_error: not is_error
		do
			are_dependencies_computed := False
			compute_dependencies
		ensure
			intrinsic_computed: are_intrinsic_dependencies_computed
			computed: are_dependencies_computed
		end

	reset_static_properties
			-- Re-compute all static properties.
		require
			static_properties_previously_computed: are_static_properties_computed
			not_in_error: not is_error
		do
			reinitialize_all_static_properties
			compute_static_properties
			if attached container as l_container and then l_container.is_computed_expression
				and then l_container.as_computed_expression.are_static_properties_computed
				and then not l_container.as_computed_expression.is_error then
				l_container.as_computed_expression.reset_static_properties
			end
		ensure
			recomputed: are_static_properties_computed
		end

	conditionally_set_error_location
			-- Copy location information into `error_value' if not set.
		require
			error_value_not_void: error_value /= Void
		local
			l_id: like system_id
		do
			check precondition: attached error_value as l_error_value then
				l_id := system_id
				if l_id /= Void and then not l_id.is_empty then
					l_error_value.set_location (l_id, line_number)
				end
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		do
			-- do nothing
			a_replacement.put (Current)
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		do
			-- do nothing
			a_replacement.put (Current)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			create_iterator (a_context)
			check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
				if attached l_last_iterator.error_value as l_error_value then
					check is_error: l_last_iterator.is_error end
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
				else
					l_last_iterator.start
					if attached l_last_iterator.error_value as l_error_value then
						check is_error: l_last_iterator.is_error end
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
					elseif l_last_iterator.after then
						a_result.put (Void) -- Empty sequence
					else
						a_result.put (l_last_iterator.item) -- the assumption in cardinality is zero-or-one
					end
				end
			end
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT)
			-- Evaluate `Current' as a String
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_last_evaluated_string: like last_evaluated_string
		do
			create l_result.make (Void)
			evaluate_item (l_result, a_context)
			if not attached l_result.item as l_result_item then
				create last_evaluated_string.make ("")
			elseif attached l_result_item.error_value as l_error_value then
				check is_error: l_result_item.is_error end
				create l_last_evaluated_string.make ("")
				l_last_evaluated_string.set_last_error (l_error_value)
				last_evaluated_string := l_last_evaluated_string
			elseif not l_result_item.is_string_value then
				create last_evaluated_string.make ("")
			else
				last_evaluated_string := l_result_item.as_string_value
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)

			-- The value of every expression can be regarded as a sequence, s
			--  so this routine is supported for all expressions.
			-- This default implementation handles iteration for expressions that
			--  return singleton values: for non-singleton expressions, the subclass must
			--  provide its own imple%mentation.

			check
				singleton_expression: not cardinality_allows_many
			end
			evaluate_item (l_result, a_context)
			if not attached l_result.item as l_result_item then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif attached l_result_item.error_value as l_error_value then
				check is_error: l_result_item.is_error end
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (l_error_value)
			elseif l_result_item.is_node then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (l_result_item.as_node)
			else
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_result_item)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			create l_result.make (Void)

			-- The value of every expression can be regarded as a sequence, s
			--  so this routine is supported for all expressions.
			-- This default implementation handles iteration for expressions that
			--  return singleton values: for non-singleton expressions, the subclass must
			--  provide its own implementation.

			check
					singleton_expression: not cardinality_allows_many
			end
			evaluate_item (l_result, a_context)
			if not attached l_result.item as l_result_item then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_node_iterator.make
			elseif attached l_result_item.error_value as l_error_value then
				check is_error: l_result_item.is_error end
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_error_value)
			else
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (l_result_item.as_node)
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT)
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
		do
			if is_evaluate_supported then
				create l_result.make (Void)
				evaluate_item (l_result, a_context)
				if attached l_result.item as l_result_item then
					if attached l_result_item.error_value as l_error_value then
						check is_error: l_result_item.is_error end
						a_context.report_fatal_error (l_error_value)
					else
						check precondition_has_push_processing: attached a_context.current_receiver as l_current_receiver then
							l_result_item.send (l_current_receiver)
						end
					end
				end
			elseif is_iterator_supported then
				create_iterator (a_context)
				check postcondition_of_create_iterator: attached last_iterator as l_last_iterator then
					if attached l_last_iterator.error_value as l_error_value then
						check is_error: l_last_iterator.is_error end
						if not l_error_value.is_location_known and then not system_id.is_empty then
							l_error_value.set_location (system_id, line_number)
						end
						a_context.report_fatal_error (l_error_value)
					else
						from
							l_last_iterator.start
						until
							l_last_iterator.is_error or else l_last_iterator.after
						loop
							check precondition_has_push_processing: attached a_context.current_receiver as l_current_receiver then
								l_last_iterator.item.send (l_current_receiver)
							end
							l_last_iterator.forth
						end
						if attached l_last_iterator.error_value as l_error_value then
							check is_error: l_last_iterator.is_error end
							if not l_error_value.is_location_known and then not system_id.is_empty then
								l_error_value.set_location (system_id, line_number)
							end
							a_context.report_fatal_error (l_error_value)
						end
					end
				end
			else
				check
					not_supported: False
				end
			end
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE
			-- Eager evaluation via `generate_events'
		do
			check
				not_called: not is_process_supported
				-- Precondition assumed not met for this implementation.
				-- Descendants must redefine if this is not the case
			end
			check False then end
		end

feature -- Element change

	set_source_location (a_module_number, a_line_number: INTEGER)
			-- Set source location information.
		require
			positive_module_number: a_module_number >= 0
			positive_line_number: a_line_number >= 0
		do
			location_identifier := INTEGER_.bit_shift_left (a_module_number, module_number_shift) + a_line_number
		end

	set_location_identifier (a_location_identifier: INTEGER)
			-- Set source location information.
		do
			location_identifier := a_location_identifier
		ensure
			location_identifier_set: location_identifier = a_location_identifier
		end

	copy_location_identifier (a_destination: XM_XPATH_EXPRESSION)
			-- Copy source location information.
		require
			a_destination_not_void: a_destination /= Void
		do
			if a_destination.is_computed_expression then
				a_destination.as_computed_expression.set_location_identifier (location_identifier)
			end
		end

	set_parent (a_container: detachable XM_XPATH_EXPRESSION_CONTAINER)
			-- Set `a_container' to be parent of `Current'.
		require
			not_self: a_container /= Current
		do
			parent := a_container
		ensure
			parent_set: parent = a_container
		end

	adopt_child_expression (a_child: XM_XPATH_EXPRESSION)
			-- Adopt `a_child' if it is a computed expression.
		require
			a_child_not_void: a_child /= Void
			not_self: a_child /= Current
		local
			a_computed_expression: XM_XPATH_COMPUTED_EXPRESSION
			a_module_number, a_line_number: INTEGER
		do
			if a_child.is_computed_expression then
				a_computed_expression := a_child.as_computed_expression
				if a_computed_expression.container /= Current then
					a_computed_expression.set_parent (Current)
					if location_identifier = 0 then
						a_computed_expression.copy_location_identifier (Current)
					else

						-- maybe just the line number is known

						a_module_number := INTEGER_.bit_shift_right (location_identifier, module_number_shift)
						if a_module_number = 0  then
							a_line_number := INTEGER_.bit_and (location_identifier, line_number_mask)
							a_module_number := INTEGER_.bit_shift_right (a_computed_expression.location_identifier, module_number_shift)
							set_source_location (a_module_number, a_line_number)
						else

							-- everything known, so copy unknown information to child

							if a_computed_expression.location_identifier = 0 then
								copy_location_identifier (a_computed_expression)
							else
								a_module_number := INTEGER_.bit_shift_right (a_computed_expression.location_identifier, module_number_shift)
								if a_module_number = 0  then
									a_line_number := INTEGER_.bit_and (a_computed_expression.location_identifier, line_number_mask)
									a_module_number := INTEGER_.bit_shift_right (location_identifier, module_number_shift)
									a_computed_expression.set_source_location (a_module_number, a_line_number)
								end
							end
						end
					end
					if are_static_properties_computed then
						reset_static_properties
					end
				end
			elseif are_static_properties_computed then
				reset_static_properties
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER
			-- Natively-supported evaluation routines
		do
			if cardinality_allows_many then
				Result := Supports_iterator
			else
				Result := Supports_evaluate
			end
		end

	compute_cardinality
			-- Compute cardinality.
		require
			not_yet_computed: not are_cardinalities_computed
			all_sub_expressions_computed: sub_expressions_have_cardinality
		deferred
		ensure
			computed: are_cardinalities_computed
		end

	compute_special_properties
			-- Compute special properties.
		require
			not_yet_computed: not are_special_properties_computed
			all_sub_expressions_computed: sub_expressions_have_special_properties
		do
			initialize_special_properties
		ensure
			computed: are_special_properties_computed
		end

feature {XM_XPATH_COMPUTED_EXPRESSION} -- Local

	location_identifier: INTEGER
			-- Index into SYSTEM ID array

	accumulate_slots_used (a_set: DS_HASH_SET [INTEGER])
			-- Add all slot numbers used by `Current' to `a_set'.
		require
			set_not_void: a_set /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
		do
			from
				a_cursor := sub_expressions.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				if attached {XM_XPATH_COMPUTED_EXPRESSION} a_cursor.item as a_computed_expression then
					a_computed_expression.accumulate_slots_used (a_set)
				end
				a_cursor.forth
			end
		ensure
			no_fewer: a_set.count >= old a_set.count
		end


feature {XM_XPATH_CLOSURE} -- Restricted

	slots_used: DS_ARRAYED_LIST [INTEGER]
			-- Slot numbers in use
		require
			dependency_on_local_variables: depends_upon_local_variables
		local
			a_set: DS_HASH_SET [INTEGER]
			a_cursor: DS_HASH_SET_CURSOR [INTEGER]
			a_comparator: KL_COMPARABLE_COMPARATOR [INTEGER]
			a_sorter: DS_QUICK_SORTER [INTEGER]
			l_cached_slots_used: like cached_slots_used
		do
			l_cached_slots_used := cached_slots_used
			if l_cached_slots_used = Void then
				create a_set.make_default
				accumulate_slots_used (a_set)
				create l_cached_slots_used.make (a_set.count)
				from
					a_cursor := a_set.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					l_cached_slots_used.put_last (a_cursor.item)
					a_cursor.forth
				end
				create a_comparator.make
				create a_sorter.make (a_comparator)
				l_cached_slots_used.sort (a_sorter)
				cached_slots_used := l_cached_slots_used
			end
			Result := l_cached_slots_used
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	parent: detachable XM_XPATH_EXPRESSION_CONTAINER
			-- Containing parent

	cached_slots_used: detachable DS_ARRAYED_LIST [INTEGER]
			-- Cached result of `slots_used'

	line_number_mask: INTEGER
			-- Bit mask for extracting line number from `location_identifer'
		once
			Result := 1048575
		end

	module_number_shift: INTEGER = 20
			-- Number of bits to shift `location_identifer' for module number

invariant

		positive_location_identifier: location_identifier >= 0
		parent_not_current: attached parent as l_parent implies not (ANY_.same_objects (Current, l_parent))

end

