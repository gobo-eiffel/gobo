indexing

	description:

		"Objects that define one component of a sort key"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SORT_KEY_DEFINITION

	-- Note that most attributes defining the sort key can be attribute value templates,
	-- and can therefore vary from one invocation to another. We hold them as expressions. As
	-- soon as they are all known (which in general is only at run-time), the XM_XSLT_SORT_KEY_DEFINITION
	-- is replaced by a XM_XSLT_FIXED_SORT_KEY_DEFINITION in which all these values are fixed.

	-- TODO - optimizations (Review - see comments in Saxon 8.0 code for details)

	-- TODO Sequence constructor - in the mean time, a select expression is assumed to be the sort key

creation

	make

feature {NONE} -- Initialization

	make (a_sort_key, an_order, a_case_order, a_language, a_data_type, a_collation_name: XM_XPATH_EXPRESSION; ) is
			-- Establish invariant.
		require
			sort_key_not_void: a_sort_key /= Void			
		do
			sort_key := a_sort_key
			order := an_order
			case_order := a_case_order
			language := a_language
			data_type := a_data_type
			collation_name := a_collation_name
		ensure
		end

feature -- Access

	sort_key: XM_XPATH_EXPRESSION
			-- Sort key

feature {NONE} -- Implementation

	order: XM_XPATH_EXPRESSION
			-- Order (ascending or descending)

	case_order: XM_XPATH_EXPRESSION
			-- Case order (upper-first or lower-first)

	language: XM_XPATH_EXPRESSION
			-- Language

	data_type: XM_XPATH_EXPRESSION
			-- Data type to which sort-key-values will be coerced (text, number or QName (but not NCName)

	collation_name: XM_XPATH_EXPRESSION
			-- Name of collation (a URI)

invariant

	sort_key_not_void: sort_key /= Void -- for now - this will have to change to support a sequence constructor

end

