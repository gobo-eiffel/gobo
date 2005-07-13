indexing
	
	description:
	
		"Objects that select a named xml-stylsheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_PI_CHOOSER_BY_NAME

inherit

	XM_XSLT_PI_CHOOSER

	KL_IMPORTED_STRING_ROUTINES

create
	make

feature {NONE} -- Initialization

	make (a_name: STRING) is
			-- Set name of stylesheet to be chosen.
		require
			name_not_void: a_name /= Void
		do
			set_name (a_name)
		ensure
			name_set: STRING_.same_string (name, a_name)
		end

feature -- Access

	name: STRING
			-- Name of stylesheet to be chosen;
			-- Empty string means select preferred stylesheet.

	selected_index (a_list: DS_LIST [STRING]): INTEGER is
			-- Index of chosen xml-stylesheet from within `a_list'
		local
			a_cursor: DS_LIST_CURSOR [STRING]
			selected: BOOLEAN
		do
			if name.count = 0 then
				Result := 1
			else
				from
					Result := 1
					a_cursor := a_list.new_cursor; a_cursor.start
				variant
					a_list.count + 1 - a_cursor.index
				until
					selected or else a_cursor.after 
				loop
					if STRING_.same_string (a_cursor.item, name) then selected := True end
					if selected then
						Result := a_cursor.index
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
			end
		end

feature -- Element change

	set_name (a_name: STRING) is
			-- Set name of stylesheet to be chosen.
		require
			name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: STRING_.same_string (name, a_name)
		end

invariant

	name_not_void: name /= Void

end
	
