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
			copy, is_equal
		redefine
			item_type, effective_boolean_value
		end

	DS_SORTABLE [XM_XPATH_ITEM]

creation

	make, make_as_view, make_from_list, make_default

feature {NONE} -- Initialization

	make (an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]) is
			-- Create from an iterator.
		require
			iterator_before: an_iterator /= Void and then an_iterator.before
		local
			counter, another_counter: INTEGER
			a_value: like value
		do
			make_value
			create a_value.make (1, Estimated_item_count)
			from
				counter := 1
				an_iterator.start
			until
				an_iterator.after
			loop
				if counter > a_value.count then
					a_value.resize (1, 2 * value.count)
				end
				a_value.put (an_iterator.item, counter)

				counter := counter + 1
				an_iterator.forth
			end

			-- Drop all trailing `Void' entries to preserve semantics of item_at and iterator

			create value.make (1, counter - 1)
			from
				another_counter := 1
			until
				another_counter = counter 
			loop
				value.put (a_value.item (another_counter), another_counter)
				another_counter := another_counter + 1
			end
			if value.count = 0 then
				set_cardinality_empty
			elseif value.count = 1 then
				set_cardinality_exactly_one
			else
				set_cardinality_one_or_more
			end
		end

	make_as_view (an_extent: XM_XPATH_SEQUENCE_EXTENT; a_start, a_length: INTEGER) is
			-- TODO
		do
			todo ("make-as-view" ,False)
		end

	make_from_list (a_list: DS_LIST [XM_XPATH_ITEM]) is
			-- Create from a list of items.
		require
			list_not_void: a_list /= Void
		local
			a_cursor: DS_LIST_CURSOR [XM_XPATH_ITEM]
		do
			create value.make (1, a_list.count)
			from
				a_cursor := a_list.new_cursor; a_cursor.start
			variant
				a_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				value.put (a_cursor.item, a_cursor.index)
				a_cursor.forth
			end
		end

	make_default is
        -- Create an empty container.
		do
			create value.make (1, 1)
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression
		local
			counter: INTEGER
		do
			if cached_item_type = Void then
				if count = 1 then
					Result := any_item
				else
					cached_item_type := value.item (1).item_type
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
							cached_item_type := common_super_type (cached_item_type, value.item (counter).item_type)
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

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		local
			counter: INTEGER
			an_item: XM_XPATH_ITEM
		do
			debug ("Xpath sequence extent")
				from
					counter := 1
				until
					counter > value.count
				loop
					an_item := value.item (counter)
					if an_item = Void then
						std.error.put_string ("Item number ")
						std.error.put_string (counter.out)
						std.error.put_string (" was void.%N")
					end
					counter := counter + 1
				end
			end
			if value.count = 0 then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_ITEM]} Result.make
			else
				create {XM_XPATH_ARRAY_ITERATOR [XM_XPATH_ITEM]} Result.make (value, 1, value.count)
			end
		end

	item_at (an_index: INTEGER) :XM_XPATH_ITEM is
			-- Item at `an_index'
		require
			index_in_range: an_index > 0 and then an_index <= count
		do
			Result := value.item (an_index)
		ensure
			item_not_void: Result /= void
		end

feature -- Measurement

	count: INTEGER is
		do
			Result := value.count
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
			an_item: XM_XPATH_ITEM
			a_node, another_node: XM_XPATH_NODE
			a_value, another_value: XM_XPATH_ATOMIC_VALUE
		do
			a_sequence_extent ?= other
			if a_sequence_extent /= Void then
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
						a_node ?= an_item
						if a_node /= Void then
							another_node ?= a_sequence_extent.item_at (counter)
							if another_node = Void then
								Result := False
							else
								Result := a_node.is_same_node (another_node)
							end
						else
							a_value ?= an_item
								check
									item_is_atomic_value: a_value /= Void
								end
							another_value ?= a_sequence_extent.item_at (counter)
							if another_value = Void then
								Result := False
							else
								Result := a_value.same_expression (another_value)
							end
						end

						counter := counter + 1
					end
				end
			end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			-- TODO
			todo ("effective-boolean-value" ,False)
		end

feature -- Duplication

	copy (other: like Current) is
			-- Copy other to current container.
		do
			value.copy (other.value)
		end

feature -- Removal

	wipe_out is
			-- Remove all items from container
		do
			value.clear_all
		end

feature {XM_XPATH_SEQUENCE_EXTENT} -- Implementation

	Estimated_item_count: INTEGER is 20
			-- Guess at number of items in sequence

	value: ARRAY [XM_XPATH_ITEM]
			-- Value
	
	cached_item_type: XM_XPATH_ITEM_TYPE
			-- Cached result for `item_type'

invariant

	value_not_void: value /= Void -- and then all values are non-void

end
	
