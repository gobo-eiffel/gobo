indexing

	description:

		"Objects that represent XML comment nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_COMMENT

inherit

	XM_NODE

creation

	make

feature {NONE} -- Initialisation

	make (a_parent: XM_COMPOSITE; a_data: UC_STRING) is
		require
			a_data_not_void: a_data /= Void
			a_parent_not_void: a_parent /= Void
		do
			data := a_data
			parent := a_parent
		end

feature {ANY} -- Access

	data: UC_STRING
			--Actual character data of this comment.

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
			-- Visitor process.
		do
			x.process_comment (Current)
		end

feature {ANY} -- Element change

invariant

	data_not_void: data /= Void

end -- class XM_COMMENT
