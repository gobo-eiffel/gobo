indexing

	description:

		"XPath Processing-instruction nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_PROCESSING_INSTRUCTION

inherit

	XM_XPATH_TYPELESS_NODE

	XM_XPATH_NODE_WITH_BASE_URI_OR_FROM_PARENT

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			Result := "processing-instruction"
		ensure then
			node_kind_is_processing_instruction: STRING_.same_string (Result, "processing-instruction")
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make_processing_instruction_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end
	
end
