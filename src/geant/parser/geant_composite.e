indexing

	description:

		"a generic composite class taken from the eiffel design patterns book with small modifications"

	library:    "Gobo Eiffel Ant"
    author:     "mostly by the authors of the eiffel design patterns book, Sven Ehrke"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_COMPOSITE [T]
creation
	make

feature {ANY} -- Creation
---------------------------------------------------------------
make is
	do
	!!children.make(10)
	end

feature {ANY} -- Queries
---------------------------------------------------------------
parent : GEANT_COMPOSITE [T] is do end
	 -- optional parent, default to Void. If an explicit reference
	 -- to the parent is needed, redefine as an attribute.

---------------------------------------------------------------
has (child : T) : BOOLEAN is
	 -- does 'child' belong to the composite?
	require
		child_not_void: child /= Void
	do
	Result := children.has(child) -- identity comparison, see 'make'
	end -- has

feature {ANY} -- Commands
---------------------------------------------------------------
add (new_child : T) is
	-- add `new_child' to the composite
	require
		new_child_not_void: new_child /= Void
	do
		children.force_last(new_child)
	end
---------------------------------------------------------------
remove (child : T) is
	-- remove T from the composite
	require child_not_void: child /= Void
	local
	i, cnt	: INTEGER
	found	: BOOLEAN
	do
		if children.has(child) then
			children.start
			children.search_forth(child)
			children.remove(children.index)
		end
	end -- remove

	children	: DS_ARRAYED_LIST [T]

feature {NONE} -- Private
---------------------------------------------------------------
invariant
	children_not_void		: children /= Void
end

