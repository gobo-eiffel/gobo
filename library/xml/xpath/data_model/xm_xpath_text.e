note

	description:

		"XPath Text nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEXT

inherit

	XM_XPATH_NODE

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			Result := "text"
		ensure then
			node_kind_is_text: STRING_.same_string (Result, "text")
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			Result := text_node_kind_test
		end

	path: STRING is
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		local
			l_preceding_path: STRING
		do
			Result := STRING_.concat ("/text()[", simple_number)
			Result := STRING_.appended_string (Result, "]")
			if parent /= Void then
				l_preceding_path := parent.path
				if not STRING_.same_string (l_preceding_path, "/") then
					Result := STRING_.appended_string (l_preceding_path, Result)
				end
			end
		end

invariant

	type: item_type /= Void
	
end
