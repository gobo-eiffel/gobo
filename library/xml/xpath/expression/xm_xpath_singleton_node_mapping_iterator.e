note

	description:

		"[
        Objects that merge a sequence of node sequences into a single flat sequence.
        The resulting sequence is never longer than the number of input sequences.
      ]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_NODE_MAPPING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: like base_iterator; a_mapping_function: like mapping_function) is
			-- Establish invariant.
		require
			base_iterator_before: a_base_iterator /= Void and then not a_base_iterator.is_error and then a_base_iterator.before
			mapping_function_not_void: a_mapping_function /= Void
		do
			base_iterator := a_base_iterator
			mapping_function := a_mapping_function
		ensure
			base_set: base_iterator = a_base_iterator
			mapping_function_set: mapping_function = a_mapping_function
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Node at the current position

feature -- Status report

	is_node_iterator: BOOLEAN is
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := base_iterator.after
		end

feature -- Cursor movement

	forth is
			-- Move to next position
		do
			index := index + 1
			from
				item := Void
			until
				item /= Void or (not base_iterator.before and then base_iterator.after)
			loop
				if base_iterator.before then
					base_iterator.start
				else
					base_iterator.forth
				end
				if not base_iterator.after then
					item := mapping_function.mapped_node (base_iterator.item)
				end
			end
		end

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		do
			Result ?= ANY_.to_any (Current)
		end
	
feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (base_iterator.another, mapping_function)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- The underlying iterator

	mapping_function: XM_XPATH_SINGLETON_NODE_MAPPING_FUNCTION
			-- The mapping function

invariant

	base_iterator_not_void: base_iterator /= Void
	mapping_function_not_void: mapping_function /= Void

end
