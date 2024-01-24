note

	description:

		"Objects that concatenate the results of two node iterators."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_NODE_APPEND_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator, a_second_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_context: XM_XPATH_CONTEXT)
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then a_base_iterator.before
			second_iterator_before: a_second_iterator /= Void and then a_second_iterator.before
		do
			base_iterator := a_base_iterator
			second_iterator := a_second_iterator
			if attached base_iterator.error_value as l_error_value then
				check is_error: base_iterator.is_error end
				set_last_error (l_error_value)
			elseif attached second_iterator.error_value as l_error_value then
				check is_error: second_iterator.is_error end
				set_last_error (l_error_value)
			else
				second_iterator.start
			end
			context := a_context
			current_iterator := base_iterator
			if attached current_iterator.error_value as l_error_value then
				check is_error: current_iterator.is_error end
				set_last_error (l_error_value)
			end
			initialized := True
		ensure
			base_set: base_iterator = a_base_iterator
			second_iterator_set: second_iterator = a_second_iterator
			context_set: context = a_context
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Node at the current position
		do
			Result := current_iterator.item
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := not current_iterator.before and then current_iterator.after
			if Result and then current_iterator = base_iterator then
				Result := not second_iterator.before and then second_iterator.after
			end
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node sequence?
		do
			Result := True
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			if current_iterator.before then
				current_iterator.start
			elseif current_iterator.after then
				if second_iterator.before then
					second_iterator.start
					current_iterator := second_iterator
				end
			else
				current_iterator.forth
			end
			if attached current_iterator.error_value as l_error_value then
				check is_erorr: current_iterator.is_error end
				set_last_error (l_error_value)
			end
			if base_iterator.after and then second_iterator.before then
				current_iterator := second_iterator
				current_iterator.start
			end
		end

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, second_iterator.another, context)
		end

feature {NONE} -- Implementation

	initialized: BOOLEAN
			-- Has creation procedure completed?

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- The underlying iterator

	context: XM_XPATH_CONTEXT
			-- Optional dynamic context

	second_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Iterator over second expression

	current_iterator: like base_iterator
			-- Iterator currently being used

invariant

	base_iterator_not_void: base_iterator /= Void
	second_iterator_not_before: initialized and then second_iterator /= Void and then not second_iterator.is_error implies not second_iterator.before
	current_iterator_not_void: current_iterator /= Void

end
