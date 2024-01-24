note

	description:

	"Objects that can be returned from {XM_XPATH_MAPPING_FUNCTION}.map"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_MAPPED_ITEM

create

	make_item, make_sequence

feature {NONE} -- Initialization

	make_item (an_item: XM_XPATH_ITEM)
			-- Create an item result.
		require
			item_not_void: an_item /= Void
		do
			item_result := an_item
		ensure
			item_set: item_result = an_item
		end

	make_sequence (a_sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM])
			-- Create a sequence result.
		require
			sequence_not_void: a_sequence /= void
		do
			sequence_result := a_sequence
			is_sequence := True
		ensure
			sequence_set: sequence_result = a_sequence
		end

feature -- Access

	item: XM_XPATH_ITEM
			-- Encapsulated item
		require
			item_result: not is_sequence
		do
			check precondition_not_is_sequence: attached item_result as l_item_result then
				Result := l_item_result
			end
		ensure
			item_not_void: Result /= Void
		end

	sequence: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Encapsulated sequence
		require
			sequence_result: is_sequence
		do
			check precondition_is_sequence: attached sequence_result as l_sequence_result then
				Result := l_sequence_result
			end
		ensure
			sequence_not_void: Result /= Void
		end

feature -- Status setting

	is_sequence: BOOLEAN
			-- Does `Current' encapsulate a sequence iterator?

feature {NONE} -- Implementation

	item_result: detachable XM_XPATH_ITEM

	sequence_result: detachable XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]

invariant

	sequence_result: is_sequence implies sequence_result /= Void and item_result = Void
	item_result: not is_sequence implies sequence_result = Void and item_result /= Void

end
