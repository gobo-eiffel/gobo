note

	description:

		"Descendant of callbacks interface forwarding to a client interface"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

deferred class XM_FORWARD_CALLBACKS

inherit

	XM_CALLBACKS_SOURCE

	XM_CALLBACKS

feature -- Access

	callbacks: XM_CALLBACKS
			-- Callbacks event interface to which events are forwarded;
			-- Null callbacks by default

feature -- Setting

	set_callbacks (a_callbacks: like callbacks)
			-- Set `callbacks' to `a_callbacks'.
		do
			callbacks := a_callbacks
		ensure then
			callbacks_set: callbacks = a_callbacks
		end

feature -- Document

	on_start
			-- Forward start.
		do
			callbacks.on_start
		end

	on_finish
			-- Forward finish.
		do
			callbacks.on_finish
		end

	on_xml_declaration (a_version: STRING; an_encoding: detachable STRING; a_standalone: BOOLEAN)
			-- XML declaration.
		do
			callbacks.on_xml_declaration (a_version, an_encoding, a_standalone)
		end

feature -- Errors

	on_error (a_message: STRING)
			-- Event producer detected an error.
		do
			callbacks.on_error (a_message)
		end

feature -- Meta

	on_processing_instruction (a_name, a_content: STRING)
			-- Forward PI.
		do
			callbacks.on_processing_instruction (a_name, a_content)
		end

	on_comment (a_content: STRING)
			-- Forward comment.
		do
			callbacks.on_comment (a_content)
		end

feature -- Tag

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Start of start tag.
		do
			callbacks.on_start_tag (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Process attribute.
		do
			callbacks.on_attribute (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_start_tag_finish
			-- End of start tag.
		do
			callbacks.on_start_tag_finish
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- End tag.
		do
			callbacks.on_end_tag (a_namespace, a_prefix, a_local_part)
		end

feature -- Content

	on_content (a_content: STRING)
			-- Forward content.
		do
			callbacks.on_content (a_content)
		end

invariant

	callbacks_not_void: callbacks /= Void

end
