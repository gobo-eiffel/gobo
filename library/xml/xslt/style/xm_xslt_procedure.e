indexing

	description:

	"Element nodes in an XSLT stylesheet that can contain local variable declaration.%
%Specifically, xsl:template, xsl:variable, xsl:param, xsl:function or xsl:attribute-sets"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PROCEDURE

feature -- Access

	number_of_variables: INTEGER
			-- Number of variables (size of stack frame)

feature -- Element change

	set_number_of_variables (a_number: INTEGER) is
			-- Set the number of variables.
		require
			strictly_positive_number: a_number > 0
		do
			number_of_variables := a_number
		end

	allocate_slot_number is
			-- Allocate a slot number for a variable.
		do
			number_of_variables := number_of_variables + 1
		ensure
			one_more_variable_allocated: number_of_variables = old number_of_variables + 1
		end

invariant

	positive_number_of_variables: number_of_variables >= 0

end
