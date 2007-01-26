indexing
	description:

		"Objects that flatten recusive calls to xsl:functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_FUNCTION_CALL_FLATTENER

inherit

	XM_XPATH_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make is
			-- Do nothing.
		do
		end

feature -- Evaluation

	map (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `an_item' to a sequence
		local
			a_function_call_package: XM_XSLT_FUNCTION_CALL_PACKAGE
		do
			if an_item.is_function_package then
				a_function_call_package ?= an_item
				a_function_call_package.create_results_iterator (a_context)
				create last_mapped_item.make_sequence (a_function_call_package.last_iterator)
			else
				create last_mapped_item.make_item (an_item)
			end
		end

end
