indexing

	description:

		"A numeric XPath value"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NUMERIC_VALUE

inherit

	XM_XPATH_ATOMIC_VALUE

feature -- Access

	as_integer: INTEGER is -- TODO should be INTEGER_64, or EDA_INTEGER or something
		do
			-- TODO
		end

feature -- Status_report

	is_nan: BOOLEAN is
			-- Is value Not-a-number?
		do
			Result := False
		end

	is_whole_number: BOOLEAN is
			-- Is value integral?
		do
			-- TODO
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			-- TODO - awaiting final decision on numeric structure
		end
	
end
