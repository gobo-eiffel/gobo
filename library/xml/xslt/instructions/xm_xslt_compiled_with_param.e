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

	make (an_executable: XM_XSLT_EXECUTABLE) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
		do
			executable := an_executable
			instruction_name := "with-param"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do

			-- not used

			check
				process_leaving_tail_not_used: False
			end
		end

end
