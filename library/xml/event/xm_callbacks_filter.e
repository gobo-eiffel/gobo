indexing

	description:

		"Event filters that can forward event to 'next' filter"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_CALLBACKS_FILTER

inherit

	XM_CALLBACKS

	XM_CALLBACKS_SOURCE
		rename
			set_callbacks as set_next
		end

creation

	make_null,
	set_next

feature {NONE} -- Initialization

	make_null is
			-- Next is null processor.
		do
			!XM_CALLBACKS_NULL! next.make
		end

feature -- Chain

	set_next (a_callback: XM_CALLBACKS) is
			-- Set next callback processor in chain/stream.
		do
			next := a_callback
		ensure then
			definition: next = a_callback
		end

	next: XM_CALLBACKS
			-- Next callbacks event consumer

feature -- Document

	on_start is
			-- Called when parsing starts.
		do
			next.on_start
		end

	on_finish is
			-- Called when parsing finished.
			-- Default: forward event to 'next'.
		do
			next.on_finish
		end

	on_xml_declaration (a_version: STRING; an_encoding: STRING; a_standalone: BOOLEAN) is
			-- XML declaration.
		do
			next.on_xml_declaration (a_version, an_encoding, a_standalone)
		end

feature -- Errors

	on_error (a_message: STRING) is
			-- Event producer detected an error.
			-- Default: forward event to 'next'.
		do
			next.on_error (a_message)
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
			-- Default: forward event to 'next'.
		do
			next.on_processing_instruction (a_name, a_content)
		end

	on_comment (a_content: STRING) is
			-- Processing comment.
			-- Atomic: single comment produces single event
			-- Default: forward event to 'next'.
		do
			next.on_comment (a_content)
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
			-- Default: forward event to 'next'.
		do
			next.on_start_tag (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Attribute.
			-- Default: forward event to 'next'.
		do
			next.on_attribute (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_start_tag_finish is
			-- End of start tag.
			-- Default: forward event to 'next'.
		do
			next.on_start_tag_finish
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
			-- Default: forward event to 'next'.
		do
			next.on_end_tag (a_namespace, a_prefix, a_local_part)
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content.
			-- NOT atomic: successive content may be different.
			-- Default: forward event to 'next'.
		do
			next.on_content (a_content)
		end

invariant

	next_not_void: next /= Void

end
