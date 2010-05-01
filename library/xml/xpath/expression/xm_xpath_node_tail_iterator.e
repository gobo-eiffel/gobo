note

	description:

		"Objects that select a tail sequence of nodes."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NODE_TAIL_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			before, start, is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]; a_start_position: INTEGER) is
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			valid_start_position: a_start_position > 0
		do
			base_iterator := a_base_iterator
			start_position := a_start_position
		ensure
			base_iterator_set:base_iterator = a_base_iterator
			start_position_set: start_position = a_start_position
		end

feature -- Access

	item: XM_XPATH_NODE is
			-- Node at the current position
		do
			Result := base_iterator.item
		end

feature -- Status report

	before: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := index = 0
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := base_iterator.after
		end

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node sequence?
		do
			Result := True
		end

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			from
				base_iterator.start
				index :=  1
			until
				index = start_position or else base_iterator.after
			loop
				index := index + 1
				if not base_iterator.after then base_iterator.forth end
			end
			index := 1
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			if base_iterator.before then
				base_iterator.start
			elseif not base_iterator.after then
				base_iterator.forth
			end
			if base_iterator.is_error then
				set_last_error (base_iterator.error_value)
			end
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, start_position)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Underlying sequence

	start_position: INTEGER

invariant

	base_iterator_not_void: base_iterator /= Void
	valid_start_position: start_position > 0

end
