indexing

	description:

		"Objects that represent XML element nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_ELEMENT

inherit

	XI_COMPOSITE

	XI_NAMED_NODE

feature {ANY} -- Access

feature {ANY} -- Element change

	add_attributes (a_attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]; a_parent: XM_ELEMENT) is
			-- Add `a_attributes' to this element.
			-- `parent' is the parent of all attribute nodes added
		require
			a_attributes_not_void: a_attributes /= Void
			a_parent_not_void: a_parent /= Void
		deferred
		end

end -- class XI_ELEMENT

