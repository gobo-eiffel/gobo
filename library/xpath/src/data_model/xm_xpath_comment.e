﻿note

	description:

		"XPath Comment nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_COMMENT

inherit

	XM_XPATH_NODE
		redefine
			typed_value
		end

feature -- Access

	node_kind: STRING
			-- Kind of node
		do
			Result := "comment"
		ensure then
			node_kind_is_comment: STRING_.same_string ( Result, "comment")
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		do
			Result := comment_node_kind_test
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			-- Typed value
		local
			l_value: XM_XPATH_STRING_VALUE
		do
			create  l_value.make (string_value)
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_STRING_VALUE]} Result.make (l_value)
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		local
			l_preceding_path: STRING
		do
			Result := STRING_.concat ("/comment()[", simple_number)
			Result := STRING_.appended_string (Result, "]")
			if attached parent as l_parent then
				l_preceding_path := l_parent.path
				if not STRING_.same_string (l_preceding_path, "/") then
					Result := STRING_.appended_string (l_preceding_path, Result)
				end
			end
		end

end
