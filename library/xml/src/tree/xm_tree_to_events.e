note

	description:

		"Emit events from a tree"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_TREE_TO_EVENTS

inherit

	XM_NODE_PROCESSOR
		redefine
			process_document,
			process_element,
			process_character_data,
			process_processing_instruction,
			process_comment,
			process_attribute
		end

create

	make

feature {NONE} -- Creation

	make (an_events: like events)
			-- Set events sink.
		require
			an_events_not_void: an_events /= Void
		do
			events := an_events
		ensure
			set: events = an_events
		end

feature -- Status

	events: XM_CALLBACKS

feature -- Node processor

	process_document (a_document: XM_DOCUMENT)
		do
			events.on_start
			a_document.process_children (Current)
			events.on_finish
		end

	process_element (an_element: XM_ELEMENT)
			-- Process element.
		do
			process_start_tag_finish

			events.on_start_tag (an_element.namespace.uri, an_element.namespace.ns_prefix, an_element.name)
			in_attributes := True

			an_element.process_children (Current)

			process_start_tag_finish
			events.on_end_tag (an_element.namespace.uri, an_element.namespace.ns_prefix, an_element.name)
		end

	process_attribute (an_attribute: XM_ATTRIBUTE)
		do
			check in_attributes: in_attributes end
			events.on_attribute (an_attribute.namespace.uri, an_attribute.namespace.ns_prefix,
					an_attribute.name, an_attribute.value)
		end

	process_character_data (a_data: XM_CHARACTER_DATA)
			-- Process character data .
		do
			process_start_tag_finish
			events.on_content (a_data.content)
		end

	process_processing_instruction (a_pi: XM_PROCESSING_INSTRUCTION)
			-- Process processing instruction `a_pi'.
		do
			process_start_tag_finish
			events.on_processing_instruction (a_pi.target, a_pi.data)
		end

	process_comment (a_comment: XM_COMMENT)
		do
			process_start_tag_finish
			events.on_comment (a_comment.data)
		end

feature {NONE} -- Implementation

	in_attributes: BOOLEAN
			-- Within attribute nodes?

	process_start_tag_finish
			-- End of start tag event.
			-- (Requires that all attribute tags are clustered together
			-- at the start of element's list of children.)
		do
			if in_attributes then
				events.on_start_tag_finish
				in_attributes := False
			end
		end

end
