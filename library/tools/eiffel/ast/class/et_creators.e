indexing

	description:

		"Eiffel creation clause lists"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CREATORS

creation

	make

feature {NONE} -- Initialization

	make (a_creator: ET_CREATOR) is
			-- Create a new creation clause list with initially
			-- one clause `a_creator'.
		require
			a_creator_not_void: a_creator /= Void
		do
			!! creators.make
			creators.put_last (a_creator)
		ensure
			creators_set: creators.last = a_creator
		end

feature -- Status report

	is_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clauses
			-- and is it exported to `a_class'?
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [ET_CREATOR]
		do
			a_cursor := creators.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.is_exported_to (a_name, a_class) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature -- Access

	creators: DS_LINKED_LIST [ET_CREATOR]
			-- Creation clauses

feature -- Element change

	put_last (a_creator: ET_CREATOR) is
			-- Add `a_creator' to the list of creators.
		require
			a_creator_not_void: a_creator /= Void
		do
			creators.put_last (a_creator)
		ensure
			one_more: creators.count = old creators.count + 1
			creators_set: creators.last = a_creator
		end

invariant

	creators_not_void: creators /= Void
	creators_not_empty: not creators.is_empty
	no_void_creator: not creators.has (Void)

end -- class ET_CREATORS
