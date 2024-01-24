note

	description:

		"Checks that end tag name balances"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"

class XM_END_TAG_CHECKER

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
			on_start,
			on_start_tag,
			on_end_tag
		end

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

create

	make_null,
	make_next

feature {NONE} -- Initialization

	initialize
			-- Initialize current callbacks.
		do
			prefixes := new_string_stack
			local_parts := new_string_stack
		end

feature -- Document

	on_start
			-- Initialize.
		do
			initialize
			Precursor
		end

feature -- Tag

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Start of start tag.
		do
			prefixes.force (a_prefix)
			local_parts.force (a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- End tag.
		do
			if prefixes.count > 0 then
				if not (
					prefixes.item = a_prefix
					or else ((a_prefix /= Void and attached prefixes.item as l_prefixes_item)
						and then same_string (l_prefixes_item, a_prefix)))
				or
					not same_string (local_parts.item, a_local_part)
				then
					on_error (End_tag_mismatch_error)
				end
				prefixes.remove
				local_parts.remove
			else
				on_error (Extra_end_tag_error)
			end
			Precursor (a_namespace, a_prefix, a_local_part)
		end

feature {NONE} -- Mean version of STACK [PREFIX+NAME]

	prefixes: DS_LINKED_STACK [detachable STRING]
	local_parts: DS_LINKED_STACK [STRING]

feature {NONE} -- Errors

	End_tag_mismatch_error: STRING = "End tag does not match start tag"
	Extra_end_tag_error: STRING = "End tag without start tag"
			-- Error messages

invariant

	prefixes_not_void: prefixes /= Void
	local_parts_not_void: local_parts /= Void
	no_void_local_part: not local_parts.has_void

end
