indexing

	description:

		"Do nothing callback event interface"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_CALLBACKS_NULL

inherit

	XM_CALLBACKS

create

	make

feature {NONE} -- Initialization

	make is
			-- Do nothing.
		do
		end

feature -- Document

	on_start is
			-- Called when parsing starts.
		do
		end

	on_finish is
			-- Called when parsing finished.
		do
		end

	on_xml_declaration (a_version: STRING; an_encoding: STRING; a_standalone: BOOLEAN) is
			-- XML declaration.
		do
		end

feature -- Errors

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		do
		end

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do
		end

	on_comment (a_content: STRING) is
			-- Processing comment.
			-- Atomic: single comment produces single event
		do
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		do
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of attribute.
		do
		end

	on_start_tag_finish is
			-- End of start tag.
		do
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		do
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content.
		do
		end

end
