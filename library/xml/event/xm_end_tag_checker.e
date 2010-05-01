note

	description:

		"Checks that end tag name balances"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_END_TAG_CHECKER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start,
			on_start_tag,
			on_end_tag
		end

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

create

	make_null,
	set_next

feature -- Document

	on_start is
			-- Initialize.
		do
			prefixes := new_string_stack
			local_parts := new_string_stack
			Precursor
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start of start tag.
		do
			prefixes.force (a_prefix)
			local_parts.force (a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- End tag.
		do
			if prefixes.count >= 0 then
				if not (
					prefixes.item = a_prefix
					or else ((a_prefix /= Void and prefixes.item /= Void)
						and then same_string (prefixes.item, a_prefix)))
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

	prefixes: DS_LINKED_STACK [STRING]
	local_parts: DS_LINKED_STACK [STRING]

feature {NONE} -- Errors

	End_tag_mismatch_error: STRING is "End tag does not match start tag"
	Extra_end_tag_error: STRING is "End tag without start tag"
			-- Error messages

end
