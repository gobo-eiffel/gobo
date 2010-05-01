note

	description:

		"Sequence values implemented extensionally (i.e. memory is allocated to each item in the sequence)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
			copy, is_equal, count
		redefine
			item_type, calculate_effective_boolean_value, is_sequence_extent, as_sequence_extent,
			item_at, simplify, reduce, is_node_sequence
		end

	DS_ARRAYED_LIST [XM_XPATH_ITEM]
		rename
			make as make_array,
			make_default as make_array_default
		undefine
			is_equal
		end

create

	make, make_as_view, make_from_list, make_default

feature {NONE} -- Initialization

	make (a_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Create from an iterator.
		require
			iterator_before: a_iterator /= Void and then a_iterator.before and then not a_iterator.is_error
		local
			l_counter, l_other_counter: INTEGER
			l_value: DS_ARRAYED_LIST [XM_XPATH_ITEM]
			l_invalid_item: XM_XPATH_INVALID_ITEM
		do
			make_value
			create l_value.make (Estimated_item_count)
			from
				l_counter := 1
				a_iterator.start
			until
				a_iterator.is_error or else a_iterator.after
			loop
				if not l_value.extendible (1) then
					l_value.resize (2 * l_value.count)
				end
				l_value.put_last (a_iterator.item)
				l_counter := l_counter + 1
				a_iterator.forth
			end
			if a_iterator.is_error then
				create l_invalid_item.make (a_iterator.error_value)
				l_value.force_last (l_invalid_item)
				set_last_error (a_iterator.error_value)
			end

			-- Drop all trailing `Void' entries to preserve semantics of item_at and iterator

			make_array (l_counter - 1)
			from
				l_other_counter := 1
			until
				l_other_counter = l_counter
			loop
				put (l_value.item (l_other_counter), l_other_counter)
				l_other_counter := l_other_counter + 1
			end
			set_cardinality_from_count
		end

	make_as_view (a_extent: XM_XPATH_SEQUENCE_EXTENT; a_start, a_length: INTEGER) is
			-- Create as a view over `an_extent'.
		require
			a_extent_not_void: a_extent /= Void
			a_start_large_enough: a_start > 0
			a_start_small_enough: (a_start - 1) <= a_extent.count
		do
			make_value
			make_from_linear (a_extent)
			if a_start > 1 then
				prune_first (a_start - 1)
			end
			if a_length < count then
				keep_first (a_length)
			end
			set_cardinality_from_count
		end

	make_from_list (a_list: DS_LIST [XM_XPATH_ITEM]) is
			-- Create from a list of items.
		require
			list_not_void: a_list /= Void
			no_void_items: not a_list.has_void
		do
			make_value
			make_from_linear (a_list)
			set_cardinality_from_count
		end

	make_default is
        -- Create an empty container.
		do
			make_value
			make_array_default
			set_cardinality_from_count
		end

	set_cardinality_from_count is
			-- Set cardinality from `count'
		do
			if count = 0 then
				set_cardinality_empty
			elseif count = 1 then
				set_cardinality_exactly_one
			else
				set_cardinality_one_or_more
			end
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
			l_counter: INTEGER
		do
			if cached_item_type = Void then
				if count <= 1 then
					cached_item_type := any_item
				else
					cached_item_type := item (1).item_type
					from
						l_counter := 2
					until
						l_counter > count
					loop
						if cached_item_type = any_item then
							l_counter := count + 1 -- make a quick exit
						else
							cached_item_type := common_super_type (cached_item_type, item (l_counter).item_type)
							l_counter := l_counter + 1
						end
					variant
						count + 1 - l_counter
					end
				end
			end
			Result := cached_item_type
		end

	item_at (a_index: INTEGER): XM_XPATH_ITEM is
			-- Item at `a_index'
		do
			Result := item (a_index)
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
			l_counter: INTEGER
			an_item, another_item: XM_XPATH_ITEM
		do
			if other.is_sequence_extent then
				a_sequence_extent := other.as_sequence_extent
				if count = a_sequence_extent.count then
					from
						Result := True
						l_counter := 1
					until
						Result = False or else l_counter > count
					loop
						an_item := item_at (l_counter)
						if an_item.is_node then
							another_item := a_sequence_extent.item_at (l_counter)
							if not another_item.is_node then
								Result := False
							else
								Result := an_item.as_node.is_same_node (another_item.as_node)
							end
						else
							check
								item_is_atomic_value: an_item.is_atomic_value
							end
							if not a_sequence_extent.item_at (l_counter).is_atomic_value then
								Result := False
							else
								Result := an_item.as_atomic_value.same_expression (a_sequence_extent.item_at (l_counter).as_atomic_value)
							end
						end

						l_counter := l_counter + 1
					variant
						count + 1 - l_counter
					end
				end
			end
		end

feature -- Status report

	is_node_sequence: BOOLEAN is
			-- Is `Current' a node-sequence?
		local
			l_index: INTEGER
		do
			from
				l_index := 1
				Result := True
			until
				not Result or else l_index > count
			loop
				Result := item_at (l_index).is_node
				l_index := l_index + 1
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations.
		local
			l_count: INTEGER
			l_item: XM_XPATH_ITEM
			l_singleton_node: XM_XPATH_SINGLETON_NODE
		do
			l_count := count
			if l_count = 0 then
				set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
			elseif l_count = 1 then
				l_item := item_at (1)
				if l_item.is_atomic_value then
					set_replacement (a_replacement, l_item.as_atomic_value)
				else
					create l_singleton_node.make (l_item.as_node)
					set_replacement (a_replacement, l_singleton_node)
				end
			else
				a_replacement.put (Current)
			end
		end

	reduce is
			-- Reduce a value to its simplest form.
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			simplify (l_replacement)
			if l_replacement.item /= Void then
				check
					still_a_value: l_replacement.item.is_value
					-- Values never become non-values
				end
				last_reduced_value := l_replacement.item.as_value
				if last_reduced_value.is_error then
					set_last_error (last_reduced_value.error_value)
				end
			else
				last_reduced_value := Current
			end
		end


feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		local
			l_item: XM_XPATH_ITEM
		do
			if count = 0 then
				create {XM_XPATH_BOOLEAN_VALUE} last_boolean_value.make (False)
			else
				l_item := item (1)
				if l_item.is_node then
					create {XM_XPATH_BOOLEAN_VALUE} last_boolean_value.make (True)
				elseif count > 1 then
					last_boolean_value := effective_boolean_value_in_error ("sequence of two or more items starting with an atomic value")
				else
					l_item.as_atomic_value.calculate_effective_boolean_value (a_context)
					if l_item.is_error then
						set_last_error (l_item.error_value)
					end
					last_boolean_value := l_item.as_atomic_value.last_boolean_value
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- An iterator over the values of a sequence
		do
			if count = 0 then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} last_iterator.make
			elseif is_node_sequence then
				last_iterator := node_iterator (False)
			else
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (Current)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			last_node_iterator := node_iterator (False)
		end

	reverse_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence in reverse order
		do
			if is_node_sequence then
				Result := node_iterator (True)
			elseif count = 0 then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
			else
				create {XM_XPATH_REVERSE_ARRAY_LIST_ITERATOR [XM_XPATH_ITEM]} Result.make (Current)
			end
		end

	node_iterator (in_reverse: BOOLEAN): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An iterator over the nodes of a node-sequence
		require
			is_node_sequence
		local
			a_node_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_ITEM]
		do
			if count = 0 then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
			else
				create a_node_list.make (count)
				from
					a_cursor := new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					check
						is_node: a_cursor.item.is_node
						-- from pre-condition
					end
					a_node_list.put_last (a_cursor.item.as_node)
					a_cursor.forth
				variant
					count + 1 - a_cursor.index
				end
				if in_reverse then
					create {XM_XPATH_REVERSE_ARRAY_NODE_LIST_ITERATOR} Result.make (a_node_list)
				else
					create {XM_XPATH_ARRAY_NODE_LIST_ITERATOR} Result.make (a_node_list)
				end
			end
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

