note

	description:

		"XML processing instruction nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_PROCESSING_INSTRUCTION

inherit

	XM_DOCUMENT_NODE

	XM_ELEMENT_NODE

create

	make,
	make_last,
	make_last_in_document

feature {NONE} -- Initialization

	make (a_parent: like parent; a_target: like target; a_data: like data)
			-- Create a new processing instruction node.
		require
			a_parent_not_void: a_parent /= Void
			a_target_not_void: a_target /= Void
			a_data_not_void: a_data /= Void
		do
			target := a_target
			data := a_data
			parent := a_parent
		ensure
			parent_set: parent = a_parent
			target_set: target = a_target
			data_set: data = a_data
		end

	make_last (a_parent: XM_ELEMENT; a_target: like target; a_data: like data)
			-- Create a new processing instruction node,
			-- and add it to parent.
		require
			a_parent_not_void: a_parent /= Void
			a_target_not_void: a_target /= Void
			a_data_not_void: a_data /= Void
		do
			target := a_target
			data := a_data
			parent := a_parent
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: a_parent.last = Current
			target_set: target = a_target
			data_set: data = a_data
		end

	make_last_in_document (a_parent: XM_DOCUMENT; a_target: like target; a_data: like data)
			-- Create a new processing instruction node.
			-- and add it to parent.
		require
			a_parent_not_void: a_parent /= Void
			a_target_not_void: a_target /= Void
			a_data_not_void: a_data /= Void
		do
			target := a_target
			data := a_data
			parent := a_parent
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: a_parent.last = Current
			target_set: target = a_target
			data_set: data = a_data
		end

feature -- Access

	target: STRING
			-- Target of current processing instruction;
			-- XML defines this as being the first token following
			-- the markup that begins the processing instruction.

	data: STRING
			-- Content of current processing instruction;
			-- This is from the first non white space character after
			-- the target to the character immediately preceding the ?>.

feature -- Setting

	set_target (a_target: STRING)
			-- Set target.
		require
			a_target_not_void: a_target /= Void
		do
			target := a_target
		ensure
			set: target = a_target
		end

	set_data (a_data: STRING)
			-- Set data.
		require
			a_data_not_void: a_data /= Void
		do
			data := a_data
		ensure
			set: data = a_data
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR)
			-- Process current node with `a_processor'.
		do
			a_processor.process_processing_instruction (Current)
		end

invariant

	target_not_void: target /= Void
	data_not_void: data /= Void

end
