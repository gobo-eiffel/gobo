indexing

	description:

		"Objects that represent the compiled form of xsl:with-param"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_WITH_PARAM

inherit

	XM_XSLT_COMPILED_GENERAL_VARIABLE

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			instruction_name := "with-param"
			create children.make (0)
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
		end

end
