indexing

	description:

		"XML comment nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_COMMENT

inherit

	XM_NODE

creation

	make

feature {NONE} -- Initialization

	make (a_parent: like parent; a_data: like data) is
			-- Create a new comment node.
		require
			a_parent_not_void: a_parent /= Void
			a_data_not_void: a_data /= Void
		do
			parent := a_parent
			data := a_data
		ensure
			parent_set: parent = a_parent
			data_set: data = a_data
		end

feature -- Access

	data: STRING
			-- Comment's character data

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_comment (Current)
		end

invariant

	data_not_void: data /= Void

end
