indexing

	description:

		"Positions in Eiffel classes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLASS_POSITION

inherit

	ET_POSITION

creation

	make

feature {NONE} -- Initialization

	make (a_class: like base_class; l, c: INTEGER) is
			-- Create a new position in `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_class_parsed: a_class.filename /= Void
		do
			base_class := a_class
			line := l
			column := c
		ensure
			base_class_set: base_class = a_class
			line_set: line = l
			column_set: column = c
		end

feature -- Access

	base_class: ET_CLASS
			-- Class from where position is extracted

	filename: STRING is
			-- Filename of `base_class'
		do
			Result := base_class.filename
		ensure then
			definition: Result = base_class.filename
		end

invariant

	base_class_not_void: base_class /= Void
	base_class_parsed: base_class.filename /= Void

end -- class ET_CLASS_POSITION
