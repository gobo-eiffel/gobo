indexing

	description:

		"Objects that filter our comments and processing-instructions."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_COMMENT_STRIPPER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, end_element, notify_comment, notify_characters, notify_processing_instruction
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	-- This class also concatenates text nodes split by comments and processing instructions

create

	make

feature {NONE} -- Initialization

	make (an_underlying_receiver: XM_XPATH_RECEIVER) is
			-- Establish invariant.
		require
			underlying_receiver_not_void: an_underlying_receiver /= Void
		do
			base_receiver := an_underlying_receiver
			system_id := an_underlying_receiver.system_id
			create character_buffer.make (80)
		ensure
			base_receiver_set: base_receiver = an_underlying_receiver
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			flush
			Precursor (a_name_code, a_type_code, properties)
		end

	end_element is
			-- Notify the end of an element.
		do
			flush
			Precursor
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			character_buffer := STRING_.appended_string (character_buffer, chars)
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			-- strip
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			-- strip
		end
	
feature {NONE} -- Implementation

	character_buffer: STRING
			-- Accumulated character data
	
	flush is
			-- Flush `character_buffer'.
		do
			if character_buffer /= Void and then not character_buffer.is_empty then
				base_receiver.notify_characters (character_buffer, 0)
			end
			create character_buffer.make (80)
		end

invariant

	character_buffer_not_void: character_buffer /= Void

end
	
