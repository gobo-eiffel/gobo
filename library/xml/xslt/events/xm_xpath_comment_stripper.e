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

	XM_STRING_MODE

	-- This class also concatenates text nodes split by comments and processing instructions
	
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
			character_buffer.append_string (chars)
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.

		do
			do_nothing
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			do_nothing
		end
	
feature {NONE} -- Implementation

	character_buffer: STRING
			-- Accumulated character data
	
	an_estimated_character_count: INTEGER is 2048
			-- Guess for size of `character_buffer'

	flush is
			-- Flush `character_buffer'.
		do
			base_receiver.	notify_characters (character_buffer, 0)
			if is_string_mode_ascii then
				create character_buffer.make (an_estimated_character_count)
			else
				create {UC_UTF8_STRING} character_buffer.make (an_estimated_character_count)
			end
		end

end
	
