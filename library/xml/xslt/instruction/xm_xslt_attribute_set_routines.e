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

	expand_attribute_sets (a_executable: XM_XSLT_EXECUTABLE; a_set: DS_ARRAYED_LIST [INTEGER]; a_context: XM_XPATH_CONTEXT) is
			-- Expand attribute sets to their constituents.
		require
			a_executable_not_void: a_executable /= Void
			context_not_void: a_context /= Void
			attribute_sets_not_void: a_set /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				l_cursor := a_set.new_cursor; l_cursor.start
			variant
				a_set.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				a_executable.attribute_sets.item (l_cursor.item).expand (a_executable, a_context)
				l_cursor.forth
			end
		end

end
