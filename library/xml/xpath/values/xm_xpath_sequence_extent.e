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

	XM_XPATH_SEQUENCE_VALUE
		redefine
			item_type, effective_boolean_value
		end

creation

	make, make_as_view

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
		end

	make_as_view (an_extent: XM_XPATH_SEQUENCE_EXTENT; a_start, a_length: INTEGER) is
			-- TODO
		do
			todo ("make-as-view" ,False)
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
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
			create {XM_XPATH_ARRAY_ITERATOR [XM_XPATH_ITEM]} Result.make (value, 1, value.count)
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

feature {NONE} -- Implementation

	Estimated_item_count: INTEGER is 20
			-- Guess at number of items in sequence

	value: ARRAY [XM_XPATH_ITEM]
			-- Value
	
	cached_item_type: XM_XPATH_ITEM_TYPE
			-- Cached result for `item_type'

invariant

	value_not_void: value /= Void -- and then all values are non-void

end
	
