indexing

	description:

		"Objects for creating XPath Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_EXPRESSION_FACTORY

feature -- Creation

	make_treat_expression (sequence: XM_XPATH_EXPRESSION; sequence_type: XM_XPATH_SEQUENCE_TYPE): XM_XPATH_EXPRESSION is
			-- Create a treat expression
		require
			sequence_not_void: sequence /= Void
			sequence_type_not_void: sequence_type /= Void
		do
			-- TODO
		ensure
			result_not_void: Result /= Void
		end
end
