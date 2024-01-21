note

	description:

		"XPath Text nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_TEXT

inherit

	XM_XPATH_NODE

feature -- Access

	node_kind: STRING
			-- Kind of node
		do
			Result := "text"
		ensure then
			node_kind_is_text: STRING_.same_string (Result, "text")
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		do
			Result := text_node_kind_test
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		local
			l_preceding_path: STRING
		do
			Result := STRING_.concat ("/text()[", simple_number)
			Result := STRING_.appended_string (Result, "]")
			if attached parent as l_parent then
				l_preceding_path := l_parent.path
				if not STRING_.same_string (l_preceding_path, "/") then
					Result := STRING_.appended_string (l_preceding_path, Result)
				end
			end
		end

invariant

	type: item_type /= Void

end
