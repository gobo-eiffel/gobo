note

	description:

		"XML character data nodes (plain text)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CHARACTER_DATA

inherit

	XM_ELEMENT_NODE

	KL_IMPORTED_STRING_ROUTINES

create

	make,
	make_last

feature {NONE} -- Initialization

	make (a_parent: XM_ELEMENT; c: like content)
			-- Create a new character data node.
		require
			a_parent_not_void: a_parent /= Void
			c_not_void: c /= Void
		do
			parent := a_parent
			content := c
		ensure
			parent_set: parent = a_parent
			content_set: content = c
		end

	make_last (a_parent: XM_ELEMENT; c: like content)
			-- Create a new character data node,
			-- and add it to parent.
		require
			a_parent_not_void: a_parent /= Void
			c_not_void: c /= Void
		do
			content := c
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: parent.last = Current
			content_set: content = c
		end

feature -- Access

	content: STRING
			-- Actual character data

feature -- Element change

	set_content (a_content: STRING)
			-- Set content.
		require
			a_content_not_void: a_content /= Void
		do
			content := a_content
		ensure
			set: content = a_content
			same_string: STRING_.same_string (content, a_content)
		end

	append_content (other: like Current)
			-- Append the content of 'other' to
			-- the content of `Current'.
		require
			other_not_void: other /= Void
		do
			content := STRING_.appended_string (content, other.content)
		ensure
			appended_count: content.count = other.content.count + old (content.count)
			appended: STRING_.same_string (other.content,
					content.substring (content.count - other.content.count + 1, content.count))
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR)
			-- Process current node with `a_processor'.
		do
			a_processor.process_character_data (Current)
		end

invariant

	content_not_void: content /= Void

end
