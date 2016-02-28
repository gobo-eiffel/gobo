note

	description:

		"Routines operating on attribute sets"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_ATTRIBUTE_SET_ROUTINES

feature {NONE} -- Implementation

	expand_attribute_sets (a_executable: XM_XSLT_EXECUTABLE; a_set: DS_ARRAYED_LIST [INTEGER]; a_context: XM_XPATH_CONTEXT)
			-- Expand attribute sets to their constituents.
		require
			a_executable_not_void: a_executable /= Void
			context_not_void: a_context /= Void
			attribute_sets_not_void: a_set /= Void
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_cursor_2: DS_LIST_CURSOR [XM_XSLT_COMPILED_ATTRIBUTE_SET]
		do
			from
				l_cursor := a_set.new_cursor; l_cursor.start
			until
				l_cursor.after
			loop
				from
					check
						attribute_set_exists: a_executable.attribute_set_manager.has (l_cursor.item)
						-- Compilation assures this
					end
					l_cursor_2 := a_executable.attribute_set_manager.attribute_sets (l_cursor.item).new_cursor
					l_cursor_2.start
				until
					l_cursor_2.after
				loop
					l_cursor_2.item.expand (a_executable, a_context)
					l_cursor_2.forth
				end
				l_cursor.forth
			variant
				a_set.count + 1 - l_cursor.index
			end
		end

end
