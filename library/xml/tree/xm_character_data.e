indexing

	description:

		"Objects that represent character data XML nodes (plain text)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_CHARACTER_DATA

inherit

	XM_NODE
	
creation

	make

feature {NONE} -- Initialisation

	make (a_parent: XM_COMPOSITE; c: STRING) is
			-- Make a new object from a string.
		require
			a_parent_not_void: a_parent /= Void
			c_not_void: c /= Void
		do
			parent := a_parent
			content := c
		ensure
			content_set: same_string (content, c)
		end

feature {ANY} -- Access

	content: STRING
			-- Actual character data of this node.

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
			-- Processing procedure for visitor pattern.
		do
			x.process_character_data (Current)
		end

feature {ANY} -- Element change

	append_content (other: like Current) is
			-- Append the content of 'other' to
			-- the content of Current.
		require
			other /= Void
		do
			if not is_unicode_string (content) and then is_unicode_string (other.content) then
				content := forced_unicode_string (content)
			end
			content.append_string (other.content)
		end

invariant

	content_not_void: content /= Void

end
