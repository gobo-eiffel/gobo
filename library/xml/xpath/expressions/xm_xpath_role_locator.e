indexing

	description:

		"Objects that identify the role in which an expression is used"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROLE_LOCATOR

inherit

	XM_XPATH_ROLE


creation

	make

feature {NONE} -- Initialization

	make (a_kind: INTEGER; a_container: STRING; an_operand: INTEGER) is
			-- TODO
		require
			strictly_positive_operand: an_operand > 0
		do
		end
	
feature  -- Access

	message: STRING
			-- TODO

end

