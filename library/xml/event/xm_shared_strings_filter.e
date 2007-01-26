indexing

	description:

		"Event filters to share identical strings (clients should not later change strings)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_SHARED_STRINGS_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_processing_instruction,
			on_comment,
			on_start_tag,
			on_attribute,
			on_end_tag,
			on_content
		end

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

create

	make_null,
	set_next

feature -- Document events

	on_start is
			-- Called when parsing starts.
		do
			strings := new_string_set
			Precursor
		end

feature -- Meta information

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Processing instruction.
		do
			next.on_processing_instruction (shared_string (a_name), shared_string (a_content))
		end

	on_comment (a_content: STRING) is
			-- Process comment.
			-- Atomic: single comment produces single event
		do
			next.on_comment (shared_string (a_content))
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		do
			next.on_start_tag (shared_string (a_namespace),
				shared_string (a_prefix),
				shared_string (a_local_part))
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Start of start tag.
		do
			next.on_attribute (shared_string (a_namespace),
				shared_string (a_prefix),
				shared_string (a_local_part),
				shared_string (a_value))
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		do
			next.on_end_tag (shared_string (a_namespace),
				shared_string (a_prefix),
				shared_string (a_local_part))
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content.
			-- NOT atomic: successive content may be different.
			-- Default: forward event to 'next'.
		do
			next.on_content (shared_string (a_content))
		end

feature {NONE} -- Share

	strings: DS_HASH_SET [STRING]
			-- Strings to be shared

	shared_string (a_string: STRING): STRING is
			-- If string known return the previous occurrence
		do
			if a_string /= Void then
				if strings /= Void then
					strings.search (a_string)
					if strings.found then
						Result := strings.found_item
					else
						strings.force_new (a_string)
						Result := a_string
					end
				else
					Result := a_string
				end
			end
		end

end
