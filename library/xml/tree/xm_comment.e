indexing

	description:

		"XML comment nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_COMMENT

inherit

	XM_DOCUMENT_NODE

	XM_ELEMENT_NODE
	
create

	make,
	make_last,
	make_last_in_document

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

	make_last (a_parent: XM_ELEMENT; a_data: like data) is
			-- Create a new comment node.
			-- and add it to parent.
		require
			a_parent_not_void: a_parent /= Void
			a_data_not_void: a_data /= Void
		do
			data := a_data
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: parent.last = Current
			data_set: data = a_data
		end
		
	make_last_in_document (a_parent: XM_DOCUMENT; a_data: like data) is
			-- Create a new comment node,
			-- and add it to parent.
		require
			a_parent_not_void: a_parent /= Void
			a_data_not_void: a_data /= Void
		do
			data := a_data
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: parent.last = Current
			data_set: data = a_data
		end
		
feature -- Access

	data: STRING
			-- Comment's character data

feature -- Setting

	set_data (a_data: STRING) is
			-- Set comment's data.
		require
			a_data_not_void: a_data /= Void
		do
			data := a_data
		ensure
			set: data = a_data
		end
		
feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_comment (Current)
		end

invariant

	data_not_void: data /= Void

end
