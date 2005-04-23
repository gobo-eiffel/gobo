indexing

	description:

		"Sequence values implemented extensionally (i.e. memory is allocated to each item in the sequence)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SEQUENCE_EXTENT

inherit

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		undefine
			copy, is_equal
		end

	XM_XPATH_SEQUENCE_VALUE
		undefine
			copy, is_equal, item
		redefine
			item_type, calculate_effective_boolean_value, is_sequence_extent, as_sequence_extent
		end

	DS_ARRAYED_LIST [XM_XPATH_ITEM]
		rename
			make as make_array,
			make_default as make_array_default
		undefine
			is_equal
		end

creation

	make, make_as_view, make_from_list, make_default

feature {NONE} -- Initialization

	make (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Create from an iterator.
		require
			iterator_before: an_iterator /= Void and then an_iterator.before
		local
			counter, another_counter: INTEGER
			a_value: DS_ARRAYED_LIST [XM_XPATH_ITEM]
		do
			make_value
			create a_value.make (Estimated_item_count)
			from
				counter := 1
				an_iterator.start
			until
				an_iterator.after
			loop
				a_value.force_last (an_iterator.item)

				counter := counter + 1
				an_iterator.forth
			end

			-- Drop all trailing `Void' entries to preserve semantics of item_at and iterator

			make_array (counter - 1)
			from
				another_counter := 1
			until
				another_counter = counter 
			loop
				put (a_value.item (another_counter), another_counter)
				another_counter := another_counter + 1
			end
			if count = 0 then
				set_cardinality_empty
			elseif count = 1 then
				set_cardinality_exactly_one
			else
				set_cardinality_one_or_more
			end
		end

	make_as_view (an_extent: XM_XPATH_SEQUENCE_EXTENT; a_start, a_length: INTEGER) is
			-- TODO
		do
			make_from_linear (an_extent)
			if a_start > 1 then
				prune_first (a_start - 1)
			end
			if a_length < count then
				keep_first (a_length)
			end
		end

	make_from_list (a_list: DS_LIST [XM_XPATH_ITEM]) is
			-- Create from a list of items.
		require
			list_not_void: a_list /= Void
		do
			make_from_linear (a_list)
		end

	make_default is
        -- Create an empty container.
		do
			make_value
			make_array_default
		end

feature -- Access

	is_sequence_extent: BOOLEAN is
			-- Is `Current' a sequence extent?
		do
			Result := True
		end

	as_sequence_extent: XM_XPATH_SEQUENCE_EXTENT is
			-- `Current' seen as a sequence extent
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression
		local
			counter: INTEGER
		do
			if cached_item_type = Void then
				if count = 1 then
					Result := any_item
				else
					cached_item_type := item (1).item_type
					from
						counter := 2
					variant
						count + 1 - counter
					until
						counter > count
					loop
						if cached_item_type = any_item then
							counter := count + 1 -- make a quick exit
						else
							cached_item_type := common_super_type (cached_item_type, item (counter).item_type)
							counter := counter + 1
						end
					end
				end
			end
			Result := cached_item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	item_at (an_index: INTEGER) :XM_XPATH_ITEM is
			-- Item at `an_index'
		require
			index_in_range: an_index > 0 and then an_index <= count
		do
			Result := item (an_index)
		ensure
			item_not_void: Result /= void
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
			-- Is current container equal to other?
		do
			Result := same_expression (other)
		end

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_sequence_extent: XM_XPATH_SEQUENCE_EXTENT
			counter: INTEGER
			an_item, another_item: XM_XPATH_ITEM
			a_value, another_value: XM_XPATH_ATOMIC_VALUE
		do
			if other.is_sequence_extent then
				a_sequence_extent := other.as_sequence_extent
				if count = a_sequence_extent.count then
					from
						Result := True
						counter := 1
					variant
						count + 1 - counter
					until
						Result = False or else counter > count
					loop
						an_item := item_at (counter)
						if an_item.is_node then
							another_item := a_sequence_extent.item_at (counter)
							if not another_item.is_node then
								Result := False
							else
								Result := an_item.as_node.is_same_node (another_item.as_node)
							end
						else
							check
								item_is_atomic_value: an_item.is_atomic_value
							end
							if not a_sequence_extent.item_at (counter).is_atomic_value then
								Result := False
							else
								Result := an_item.as_atomic_value.same_expression (a_sequence_extent.item_at (counter).as_atomic_value)
							end
						end

						counter := counter + 1
					end
				end
			end
		end

feature -- Status report

	is_node_sequence: BOOLEAN is
			-- Is `Current' a node-sequence?
		local
			an_index: INTEGER
		do
			from
				an_index := 1; Result := True
			until
				not Result or else an_index > count
			loop
				Result := item_at (an_index).is_node
				an_index := an_index + 1
			end
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			-- TODO
			todo ("effective-boolean-value" ,False)
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		local
			counter: INTEGER
			an_item: XM_XPATH_ITEM
		do
			debug ("Xpath sequence extent")
				from
					counter := 1
				until
					counter > count
				loop
					an_item := item (counter)
					if an_item = Void then
						std.error.put_string ("Item number ")
						std.error.put_string (counter.out)
						std.error.put_string (" was void.%N")
					end
					counter := counter + 1
				end
			end
			if count = 0 then
				create {XM_XPATH_EMPTY_ITERATOR} last_iterator.make
			else
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (Current)
			end
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence in reverse order
		do
			create {XM_XPATH_REVERSE_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (Current)
		end

	node_iterator : XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An iterator over the nodes of a node-sequence
		require
			is_node_sequence
		local
			a_node_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_ITEM]
		do
			create a_node_list.make (count)
			from
				a_cursor := new_cursor; a_cursor.start
			variant
				count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				check
					is_node: a_cursor.item.is_node
					-- from pre-condition
				end
				a_node_list.put_last (a_cursor.item.as_node)
				a_cursor.forth
			end
			create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_NODE]} Result.make (a_node_list)
		end

feature {XM_XPATH_SEQUENCE_EXTENT} -- Implementation

	Estimated_item_count: INTEGER is 20
			-- Guess at number of items in sequence

	cached_item_type: XM_XPATH_ITEM_TYPE
			-- Cached result for `item_type'

feature {XM_XPATH_EXPRESSION} -- Restricted

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_iterator
		end

end
	
