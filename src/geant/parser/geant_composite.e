indexing

	description:

		"Composite objects"

	note:       "Taken from the Eiffel Design Patterns book with small modifications"
	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_COMPOSITE [G]

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new composite.
		do
			!! children.make (10)
		end

feature -- Access

	parent: GEANT_COMPOSITE [G] is do end
			-- Optional parent, default to Void
			-- (If an explicit reference to the parent
			-- is needed, redefine as an attribute.)

	children: DS_ARRAYED_LIST [G]
			-- Children

feature -- Status report

	has (a_child: G): BOOLEAN is
			-- Does 'a_child' belong to composite?
		require
			a_child_not_void: a_child /= Void
		do
			Result := children.has (a_child)
		end

feature -- Element change

	add (new_child: G) is
		-- Add `new_child' to composite.
		require
			new_child_not_void: new_child /= Void
		do
			children.force_last (new_child)
		ensure
			added: has (new_child)
		end

feature -- Removal

	remove (a_child: G) is
			-- Remove `a_child' from composite.
		require
			a_child_not_void: a_child /= Void
		do
			children.delete (a_child)
		end

invariant

	children_not_void: children /= Void
	no_void_child: not children.has (Void)

end -- class GEANT_COMPOSITE
