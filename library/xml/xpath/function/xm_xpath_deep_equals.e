indexing

	description:

		"Objects that implement the XPath deep-equals() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DEEP_EQUALS

inherit

	XM_XPATH_SYSTEM_FUNCTION
		undefine
			pre_evaluate, check_static_type
		redefine
			evaluate_item
		end

	XM_XPATH_COLLATING_FUNCTION

	XM_XPATH_AXIS

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "deep-equals"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Deep_equal_function_type_code
			minimum_argument_count := 2
			maximum_argument_count := 3
			create arguments.make (3)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 3 then
				create Result.make_single_string
			else
				create Result.make_any_sequence
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_comparer: XM_XPATH_ATOMIC_COMPARER
			an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			a_comparer := atomic_comparer (3, a_context)
			if a_comparer = Void then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Unsupported collation", Xpath_errors_uri, "FOCH0002", Dynamic_error)
			else
				arguments.item (1).create_iterator (a_context)
				an_iterator := arguments.item (1).last_iterator
				if an_iterator.is_error then
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				else
					arguments.item (2).create_iterator (a_context)
					another_iterator := arguments.item (2).last_iterator
					if another_iterator.is_error then
						create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (another_iterator.error_value)
					else
						a_comparer.set_dynamic_context (a_context)
						create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (deep_equals (an_iterator, another_iterator, a_comparer))
						if is_error then
							last_evaluated_item.set_last_error (error_value)
						end
					end
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	deep_equals (an_iterator, another_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]; a_comparer: XM_XPATH_ATOMIC_COMPARER): BOOLEAN is
			-- Are two sequences deep-equal?
			-- Not 100% pure - may set `Current' into error status.
		require
			first_sequence_not_in_error: an_iterator /= Void and then not an_iterator.is_error
			second_sequence_not_in_error: another_iterator /= Void and then not another_iterator.is_error
			comparer_not_void: a_comparer /= Void
		local
			finished, first_sequence_exhausted, second_sequence_exhausted: BOOLEAN
			an_item, another_item: XM_XPATH_ITEM
		do
			Result := True -- innocent untily proven guilty
			from
				an_iterator.start; another_iterator.start
			until
				finished
			loop
				first_sequence_exhausted := an_iterator.after
				second_sequence_exhausted := another_iterator.after
				if first_sequence_exhausted /= second_sequence_exhausted  then
					Result := False; finished := True
				elseif first_sequence_exhausted then
					finished := True
				else
					an_item := an_iterator.item
					if an_item.is_error then
						Result := False; finished := True
					else
						another_item := another_iterator.item
						if another_item.is_error then
							Result := False; finished := True
						end
					end
					if not finished then
						if an_item.is_node then
							if another_item.is_node then
								if not nodes_are_deep_equal (an_item.as_node, another_item.as_node, a_comparer) then
									Result := False; finished := True
								end
							else
								Result := False; finished := True
							end
						else
							if another_item.is_node then
								Result := False; finished := True
							else
								check
									first_item_atomic: an_item.is_atomic_value
									second_item_atomic: another_item.is_atomic_value 
									-- as they are not nodes
								end
								if not a_comparer.are_comparable (an_item.as_atomic_value, another_item.as_atomic_value) then
									Result := False; finished := True
								elseif a_comparer.three_way_comparison (an_item.as_atomic_value, another_item.as_atomic_value) /= 0 then
									Result := False; finished := True
								end
							end
						end
					end
					if not finished then
						an_iterator.forth; another_iterator.forth
						if an_iterator.is_error then
							finished := True
							Result := False
							set_last_error (an_iterator.error_value)
						elseif another_iterator.is_error then
							finished := True
							Result := False
							set_last_error (another_iterator.error_value)
						end
					end
				end
			end
		end

	nodes_are_deep_equal (a_node, another_node: XM_XPATH_NODE; a_comparer: XM_XPATH_ATOMIC_COMPARER): BOOLEAN is
			-- Is `a_node' deep-equal to `another_node'?
		require
			first_node_not_void: a_node /= Void
			second_node_not_void: another_node /= Void
			comparer_not_void: a_comparer /= Void
		do
			if a_node.is_same_node (another_node) then
				Result := True
			elseif a_node.node_type /= another_node.node_type then
				Result := False
			else
				inspect
					a_node.node_type
				when Document_node then
					Result := are_contents_equal (a_node, another_node, a_comparer)
				when Element_node then
					Result := are_elements_equal (a_node, another_node, a_comparer)
				when Attribute_node then
					Result := are_attributes_equal (a_node, another_node, a_comparer)
				when Processing_instruction_node then
					if a_node.fingerprint /= another_node.fingerprint then
						Result := False
					else
						Result := a_comparer.collator.three_way_comparison (a_node.string_value, another_node.string_value) = 0
					end
				when Comment_node, Text_node then
					Result := a_comparer.collator.three_way_comparison (a_node.string_value, another_node.string_value) = 0
				end
			end
		end


	are_elements_equal (a_node, another_node: XM_XPATH_NODE; a_comparer: XM_XPATH_ATOMIC_COMPARER): BOOLEAN is
			-- Is `a_node' deep-equal to `another_node' ?
		require
			first_node_is_element: a_node /= Void and then a_node.node_type = Element_node
			second_node_is_element: another_node /= Void and then another_node.node_type = Element_node
			comparer_not_void: a_comparer /= Void
		do
			if a_node.fingerprint /= another_node.fingerprint then
				Result := False
			elseif not are_attribute_collections_equal (a_node, another_node, a_comparer) then
				Result := False
			else
				Result := are_contents_equal (a_node, another_node, a_comparer)
			end
		end
	
	are_contents_equal (a_node, another_node: XM_XPATH_NODE; a_comparer: XM_XPATH_ATOMIC_COMPARER): BOOLEAN is
			-- Is the contents of `a_node' deep-equal to `another_node'?
		require
			first_node_not_void: a_node /= Void
			second_node_not_void: another_node /= Void
			comparer_not_void: a_comparer /= Void
		local
			a_child_iterator, another_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			finished, first_sequence_exhausted, second_sequence_exhausted: BOOLEAN
			a_child_node, another_child_node: XM_XPATH_NODE
		do
			from
				Result := True -- innocent until proved guilty
				a_child_iterator := a_node.new_axis_iterator (Child_axis); a_child_iterator.start
				another_child_iterator := another_node.new_axis_iterator (Child_axis); another_child_iterator.start
			until
				finished
			loop
				first_sequence_exhausted := a_child_iterator.after
				second_sequence_exhausted := another_child_iterator.after
				if first_sequence_exhausted /= second_sequence_exhausted  then
					Result := False; finished := True
				elseif first_sequence_exhausted then
					finished := True
				else
					from
						a_child_node := a_child_iterator.item
					until
						(a_child_node.node_type /= Processing_instruction_node and then a_child_node.node_type /= Comment_node)
							or else a_child_iterator.after
					loop
						a_child_iterator.forth
					end
					if a_child_iterator.after then
						a_child_node := Void
					else
						a_child_node := a_child_iterator.item
					end
					from
						another_child_node := another_child_iterator.item
					until
						(another_child_node.node_type /= Processing_instruction_node and then another_child_node.node_type /= Comment_node)
							or else another_child_iterator.after
					loop
						another_child_iterator.forth
					end
					if another_child_iterator.after then
						another_child_node := Void
					else
						another_child_node := another_child_iterator.item
					end
					if a_child_node = Void or else another_child_node = Void then
						finished := True; Result := a_child_node = another_child_node
					elseif not nodes_are_deep_equal (a_child_node, another_child_node, a_comparer) then
						Result := False; finished := True
					else
						a_child_iterator.forth; another_child_iterator.forth
					end
				end
			end
		end

	are_attributes_equal (a_node, another_node: XM_XPATH_NODE; a_comparer: XM_XPATH_ATOMIC_COMPARER): BOOLEAN is
			-- Is attribute `a_node' deep-equal to `another_node'?
		require
			first_node_is_element: a_node /= Void and then a_node.node_type = Attribute_node
			second_node_is_element: another_node /= Void and then another_node.node_type = Attribute_node
			comparer_not_void: a_comparer /= Void		
		do
			if a_node.fingerprint = another_node.fingerprint then
				Result := deep_equals (a_node.typed_value, another_node.typed_value, a_comparer) 
			end
		end

	are_attribute_collections_equal (a_node, another_node: XM_XPATH_NODE; a_comparer: XM_XPATH_ATOMIC_COMPARER): BOOLEAN is
			-- Are attribute chlidren of `a_node' deep-equal to attribute children of `another_node'?
		require
			first_node_is_element: a_node /= Void and then a_node.node_type = Element_node
			second_node_is_element: another_node /= Void and then another_node.node_type = Element_node
			comparer_not_void: a_comparer /= Void
		local
			an_attribute_iterator, another_attribute_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			finished, first_sequence_exhausted, second_sequence_exhausted: BOOLEAN
			an_attribute: XM_XPATH_NODE
			a_name_test: XM_XPATH_NAME_TEST
		do
			from
				Result := True -- innocent until proved guilty
				an_attribute_iterator := a_node.new_axis_iterator (Attribute_axis); an_attribute_iterator.start
				another_attribute_iterator := another_node.new_axis_iterator (Attribute_axis); another_attribute_iterator.start
			until
				finished
			loop
				first_sequence_exhausted := an_attribute_iterator.after
				second_sequence_exhausted := another_attribute_iterator.after
				if first_sequence_exhausted /= second_sequence_exhausted  then
					Result := False; finished := True
				elseif first_sequence_exhausted then
					finished := True
				else
					an_attribute_iterator.forth; another_attribute_iterator.forth
				end
			end
			if Result then -- same number of attributes
				from
					finished := False
					an_attribute_iterator := a_node.new_axis_iterator (Attribute_axis); an_attribute_iterator.start
				until
					finished
				loop
					if an_attribute_iterator.after then
						finished := True
					else
						an_attribute := an_attribute_iterator.item
						create a_name_test.make (Attribute_node, an_attribute.fingerprint, "dummy-text")
						another_attribute_iterator := another_node.new_axis_iterator_with_node_test (Attribute_axis, a_name_test); another_attribute_iterator.start
						if another_attribute_iterator.after then
							finished := False; Result := False
						elseif not deep_equals (an_attribute.typed_value, another_attribute_iterator.item.typed_value, a_comparer) then
							finished := False; Result := False
						end
						if not finished then an_attribute_iterator.forth end
					end
				end
			end
		end

end
	
