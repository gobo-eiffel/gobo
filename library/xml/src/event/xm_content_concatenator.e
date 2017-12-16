note

	description:

		"Event filter that concatenates successive on_content events"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CONTENT_CONCATENATOR

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_processing_instruction,
			on_comment,
			on_start_tag,
			on_attribute,
			on_end_tag,
			on_content,
			on_finish
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_null,
	make_next

feature {NONE} -- Content

	last_content: detachable STRING
			-- Current content

	flush_content
			-- Generate content event if there is pending content.
		do
			if attached last_content as l_last_content and then l_last_content.count > 0 then
				next.on_content (l_last_content)
			end
			last_content := Void
		end

feature -- Content

	on_content (a_content: STRING)
			-- Aggregate content events so that two content events
			-- never follow each other.
		do
			if not attached last_content as l_last_content then
				last_content := STRING_.cloned_string (a_content)
			else
				last_content := STRING_.appended_string (l_last_content, a_content)
			end
		end

	on_comment (a_comment: STRING)
			-- Eat comment when in content, otherwise the event would be
			-- out of order.
		do
			flush_content
			Precursor (a_comment)
		end

feature -- Events

	on_processing_instruction (a_name: STRING; a_content: STRING)
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_name, a_content)
		end

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Flush content and forward.
		do
			flush_content
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_finish
				-- Flush content and forward.
		do
			flush_content
			Precursor
		end

end
