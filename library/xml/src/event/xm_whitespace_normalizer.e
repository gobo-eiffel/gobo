note

	description:

		"Remove head and tail whitespace (as defined by XML) from content; accounting for xml:space"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_WHITESPACE_NORMALIZER

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
			on_start,
			on_content,
			on_comment,
			on_processing_instruction,
			on_start_tag,
			on_attribute,
			on_end_tag,
			on_finish
		end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_null,
	make_next

feature {NONE} -- Initialization

	initialize
			-- Initialize current callbacks.
		do
			last_content := Void
			create is_space_preserved.make_default
			is_space_preserved.force (default_space_preserved)
		end

feature -- Content

	on_content (a_content: STRING)
			-- Process content event with whitespace removal
			-- if heading/trailing the content events.
		do
			if is_space_preserved.item then
				next.on_content (a_content)
			else
				if attached last_content as l_last_content then
					if is_space (l_last_content.item.item_code (l_last_content.item.count)) then
							-- We don't know if we are at the end, so this could
							-- be tail whitespace.
						l_last_content.append_string (a_content)
					else
							-- No tail whitespace, so can be processed now.
						next.on_content (l_last_content.item)
						create last_content.make (a_content)
					end
				else
						-- First (non-space) content event.
					create last_content.make (a_content)
					normalize_content_head
						-- The content event is not processed further
						-- because it is not known whether it needs
						-- tail normalisation (if it is the last
						-- content event of a sequence)
				end
			end
		end

feature {NONE} -- Content

	is_space_preserved: DS_ARRAYED_STACK [BOOLEAN]
			-- Is xml:space="preserve" mode set?

	last_content: detachable ST_COPY_ON_WRITE_STRING
			-- Last unprocessed content event.

	default_space_preserved: BOOLEAN
			-- Initial xml:space mode, can be redefined.
			-- Default: False.
		do
		end

feature {NONE} -- Content

	in_content: BOOLEAN
			-- Is there a pending unprocessed content event?
		do
			Result := last_content /= Void
		ensure
			definition: Result = (last_content /= Void)
		end

	end_content
			-- New non-content event; process pending
			-- content first.
		do
			if in_content then
				normalize_content_tail
				if attached last_content as l_last_content then
					next.on_content (l_last_content.item)
					last_content := Void
				end
			end
		ensure
			last_content_void: last_content = Void
		end

	is_space (a_code: INTEGER): BOOLEAN
			-- Is `a_code' the character code of a white space character?
		do
			Result := a_code = Lf_char.code
				or a_code = Cr_char.code
				or a_code = Tab_char.code
				or a_code = Space_char.code
		end

	normalize_content_head
			-- Remove whitespace from beginning of content.
		require
			in_content: in_content
		local
			i: INTEGER
		do
			check is_content: attached last_content as l_last_content then
				from
					i := 1
				until
					i > l_last_content.item.count or else not is_space (l_last_content.item.item_code (i))
				loop
					i := i + 1
				variant
					l_last_content.item.count - i + 1
				end

				if i > l_last_content.item.count then
						-- All content is whitespace
					last_content := Void
				elseif i > 1 then
						-- Remove whitespace.
					create last_content.make (l_last_content.item.substring (i, l_last_content.item.count))
				else
						-- Unchanged, no whitespace.
				end
			end
		ensure
			no_whitespace_at_head: attached last_content as l_last_content implies not is_space (l_last_content.item.item_code (1))
		end

	normalize_content_tail
			-- Remove whitespace at end of content.
		require
			in_content: in_content
		local
			i: INTEGER
		do
			check in_content: attached last_content as l_last_content then
				from
					i := l_last_content.item.count
				until
					i = 0 or else not is_space (l_last_content.item.item_code (i))
				loop
					i := i - 1
				variant
					i
				end

				if i = 0 then
					last_content := Void
				elseif i < l_last_content.item.count then
					create last_content.make (l_last_content.item.substring (1, i))
				end
			end
		end

feature -- Events

	on_start
			-- Reset.
		do
			initialize
			Precursor
		end

	on_processing_instruction (a_name: STRING; a_content: STRING)
			-- Clear content and forward.
		do
			end_content
			Precursor (a_name, a_content)
		end

	on_comment (a_comment: STRING)
			-- Clear content and forward.
		do
			end_content
			Precursor (a_comment)
		end

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Clear content and forward.
		do
			end_content
			is_space_preserved.force (is_space_preserved.item) -- Unchanged.
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Process xml:space attribute
		do
			if a_prefix /= Void and then has_prefix (a_prefix)
				and then STRING_.same_string (Xml_prefix, a_prefix)
				and STRING_.same_string (Xml_space, a_local_part)
			then
					--Replace value for current element.
				is_space_preserved.remove
				is_space_preserved.force (STRING_.same_string (Xml_space_preserve, a_value))
			end
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Clear content and forward.
		do
			end_content
			is_space_preserved.remove
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_finish
			-- Clear content and forward.
		do
			end_content
			Precursor
		end

invariant

	is_space_preserved_not_void: is_space_preserved /= Void
	is_space_preserved_not_empty: not is_space_preserved.is_empty
	last_content_not_empty: not attached last_content as l_last_content or else l_last_content.item.count > 0

end
