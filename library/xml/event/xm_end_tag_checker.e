indexing

	description:

		"Checks that end tag name balances"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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

creation

	make_null,
	set_next

feature -- Document

	on_start is
			-- Initialize.
		do
			!! prefixes.make_default
			!! local_parts.make_default
			Precursor
		end

feature -- Tag

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Start of start tag.
		do
			prefixes.force (a_prefix)
			local_parts.force (a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_end_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- End tag.
		do
			if prefixes.count >= 0 then
				if not (
					prefixes.item = a_prefix 
					or else ((a_prefix /= Void and prefixes.item /= Void) 
						and then prefixes.item.is_equal (a_prefix)))
				or
					not local_parts.item.is_equal (a_local_part) 
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

feature {NONE} -- Mean version of STACK[PREFIX+NAME]

	prefixes: DS_LINKED_STACK [UC_STRING]
	local_parts: DS_LINKED_STACK [UC_STRING]

feature {NONE} -- Errors

	End_tag_mismatch_error: STRING is "End tag does not match start tag"
	Extra_end_tag_error: STRING is "End tag without start tag"

end
