indexing

	description:

		"Objects that use a set of rules to implement an XSLT mode"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_MODE

feature -- Access

	rule (an_element: XM_XPATH_ELEMENT; a_transformer: XM_XSLT_TRANSFORMER): XM_XSLT_RULE_VALUE is
			-- Rule for `an_element'
		require
			element_not_void: an_element /= Void
			transformer_not_void: a_transformer /= Void
		local
		do
			-- TODO
		ensure
			Maybe_no_rule_matches: True
		end
end
	
