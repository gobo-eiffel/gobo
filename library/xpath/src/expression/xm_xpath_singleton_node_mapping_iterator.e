note

	description:

		"[
			Objects that merge a sequence of node sequences into a single flat sequence.
			The resulting sequence is never longer than the number of input sequences.
        ]"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2007-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_SINGLETON_NODE_MAPPING_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

create

	make

feature {NONE} -- Initialization

	make (a_base_iterator: like base_iterator; a_mapping_function: like mapping_function)
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
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end

feature -- Status report

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node_sequence?
		do
			Result := True
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := base_iterator.after
		end

feature -- Cursor movement

	forth
			-- Move to next position
		do
			index := index + 1
			from
				internal_item := Void
			until
				internal_item /= Void or (not base_iterator.before and then base_iterator.after)
			loop
				if base_iterator.before then
					base_iterator.start
				else
					base_iterator.forth
				end
				if not base_iterator.after then
					internal_item := mapping_function.mapped_node (base_iterator.item)
				end
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
			create Result.make (base_iterator.another, mapping_function)
		end

feature {NONE} -- Implementation

	base_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- The underlying iterator

	mapping_function: XM_XPATH_SINGLETON_NODE_MAPPING_FUNCTION
			-- The mapping function

	internal_item: detachable XM_XPATH_NODE
			-- Node at the current position

invariant

	base_iterator_not_void: base_iterator /= Void
	mapping_function_not_void: mapping_function /= Void

end
