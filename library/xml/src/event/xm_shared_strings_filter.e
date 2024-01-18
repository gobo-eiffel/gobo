note

	description:

		"Event filters to share identical strings (clients should not later change strings)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

class XM_SHARED_STRINGS_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
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
	make_next

feature {NONE} -- Initialize

	initialize
			-- Initialize current callbacks.
		do
			strings := new_string_set
		end

feature -- Document events

	on_start
			-- Called when parsing starts.
		do
			initialize
			Precursor
		end

feature -- Meta information

	on_processing_instruction (a_name: STRING; a_content: STRING)
			-- Processing instruction.
		do
			next.on_processing_instruction (shared_string (a_name), shared_string (a_content))
		end

	on_comment (a_content: STRING)
			-- Process comment.
			-- Atomic: single comment produces single event
		do
			next.on_comment (shared_string (a_content))
		end

feature -- Tag

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Start of start tag.
		do
			next.on_start_tag (shared_detachable_string (a_namespace),
				shared_detachable_string (a_prefix),
				shared_string (a_local_part))
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Start of start tag.
		do
			next.on_attribute (shared_detachable_string (a_namespace),
				shared_detachable_string (a_prefix),
				shared_string (a_local_part),
				shared_string (a_value))
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- End tag.
		do
			next.on_end_tag (shared_detachable_string (a_namespace),
				shared_detachable_string (a_prefix),
				shared_string (a_local_part))
		end

feature -- Content

	on_content (a_content: STRING)
			-- Text content.
			-- NOT atomic: successive content may be different.
			-- Default: forward event to 'next'.
		do
			next.on_content (shared_string (a_content))
		end

feature {NONE} -- Share

	strings: DS_HASH_SET [STRING]
			-- Strings to be shared

	shared_detachable_string (a_string: detachable STRING): detachable STRING
			-- If string known return the previous occurrence
		do
			if a_string /= Void then
				Result := shared_string (a_string)
			else
				Result := a_string
			end
		end

	shared_string (a_string: STRING): STRING
			-- If string known return the previous occurrence
		require
			a_string_not_void: a_string /= Void
		do
			strings.search (a_string)
			if strings.found then
				Result := strings.found_item
			else
				strings.force_new (a_string)
				Result := a_string
			end
		ensure
			shared_string_not_void: Result /= Void
		end

invariant

	strings_not_void: strings /= Void
	no_void_string: not strings.has_void

end
