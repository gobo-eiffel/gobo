indexing

	description:

		"Stop forwarding events on first error"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_STOP_ON_ERROR_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_finish,
			on_error,
			on_processing_instruction,
			on_comment,
			on_start_tag,
			on_attribute,
			on_start_tag_finish,
			on_end_tag,
			on_content
		end

creation

	set_next,
	make_null

feature -- Status

	has_error: BOOLEAN
			-- Has an error occurred?

	last_error: STRING
			-- Error message.

feature -- Document

	on_start is
			-- Called when parsing starts.
		do
			has_error := False
			last_error := Void
			
			Precursor
		end

	on_finish is
			-- Called when parsing finished.
		do
			if not has_error then
				Precursor
			end
		end

feature -- Errors

	on_error (a_message: STRING) is
			-- Event producer detected an error.
			-- Default: forward event to 'next'.
		do
			has_error := True
			last_error := a_message
			Precursor (a_message)
		end

feature -- Meta

	on_processing_instruction (a_name: UC_STRING; a_content: UC_STRING) is
			-- Processing instruction.
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor (a_name, a_content)
			end
		end

	on_comment (a_content: UC_STRING) is
			-- Comment
			-- Atomic: single comment produces single event
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor (a_content)
			end
		end

feature -- Tag

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Start of start tag.
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor (a_namespace, a_prefix, a_local_part)
			end
		end

	on_attribute (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING; a_value: UC_STRING) is
			-- Attribute.
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor (a_namespace, a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish is
			-- End of start tag.
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor
			end
		end

	on_end_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- End tag.
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor (a_namespace, a_prefix, a_local_part)
			end
		end

feature -- Content

	on_content (a_content: UC_STRING) is
			-- Text content.
			-- Default: forward event to 'next'.
		do
			if not has_error then
				Precursor (a_content)
			end
		end

end
