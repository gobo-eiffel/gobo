indexing

	description:

		"Routines operating on attribute sets"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ATTRIBUTE_SET_ROUTINES

feature {NONE} -- Implementation

	expand_attribute_sets (a_set: DS_ARRAYED_LIST [XM_XSLT_COMPILED_ATTRIBUTE_SET]; a_context: XM_XPATH_CONTEXT) is
			-- Expand attribute sets to their constituents.
		require
			context_not_void: a_context /= Void
			attribute_sets_not_void: a_set /= Void
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_COMPILED_ATTRIBUTE_SET]
		do
			from
				a_cursor := a_set.new_cursor; a_cursor.start
			variant
				a_set.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_cursor.item.expand (a_context)
				a_cursor.forth
			end
		end

end
