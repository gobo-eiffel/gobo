indexing

	description:

		"XPath sequences of atomic values and nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SEQUENCE_VALUE

inherit

	XM_XPATH_VALUE

feature -- Access

		item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Any_item
		end

feature -- Evaluation

		evaluate_item (context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate an expression as a single item
		local
			iter: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			iter := iterator (context)
			if not iter.before then
				Result := iter.item_for_iteration
			end
		end

end
