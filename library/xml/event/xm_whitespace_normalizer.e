indexing
	
	description:
		
		"Remove head and tail whitespace (as defined by XML) from content; accounting for xml:space"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_WHITESPACE_NORMALIZER

inherit

	XM_CALLBACKS_FILTER
		redefine
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
	set_next

feature -- Content

	on_content (a_content: STRING) is
			-- Process content event with whitespace removal
			-- if heading/trailing the content events.
		do
			if is_space_preserved.item then
				next.on_content (a_content)
			else
				if in_content then
					if is_space (last_content.item_code (last_content.count)) then
							-- We don't know if we are at the end, so this could 
							-- be tail whitespace.
						last_content := STRING_.appended_string (last_content, a_content)
					else
							-- No tail whitespace, so can be processed now.
						next.on_content (last_content)
						last_content := a_content
					end
				else
						-- First (non-space) content event.
					last_content := a_content
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

	last_content: STRING
			-- Last unprocessed content event.
	
	default_space_preserved: BOOLEAN is
			-- Initial xml:space mode, can be redefined.
			-- Default: False.
		do
		end
		 
feature {NONE} -- Content

	in_content: BOOLEAN is
			-- Is there a pending unprocessed content event?
		do
			Result := last_content /= Void
		end
		
	end_content is
			-- New non-content event; process pending
			-- content first.
		do
			if in_content then
				normalize_content_tail
				if last_content /= Void then
					next.on_content (last_content)
					last_content := Void
				end
			end
		ensure
			last_content_void: last_content = Void
		end

	is_space (a_code: INTEGER): BOOLEAN is
			-- Is `a_code' the character code of a white space character?
		do
			Result := a_code = Lf_char.code
				or a_code = Cr_char.code
				or a_code = Tab_char.code
				or a_code = Space_char.code
		end

	normalize_content_head is
			-- Remove whitespace from beginning of content.
		require
			in_content: in_content
		local
			i: INTEGER
		do
			from
				i := 1
			variant
				last_content.count - i + 1
			until
				i > last_content.count or else not is_space (last_content.item_code (i))
			loop
				i := i + 1
			end
			
			if i > last_content.count then
					-- All content is whitespace
				last_content := Void
			elseif i > 1 then
					-- Remove whitespace.
				last_content := last_content.substring (i, last_content.count)
			else
					-- Unchanged, no whitespace.
			end
		ensure
			no_whitespace_at_head: in_content implies not is_space (last_content.item_code (1))
		end
		
	normalize_content_tail is
			-- Remove whitespace at end of content.
		require
			in_content: in_content
		local
			i: INTEGER
		do
			from
				i := last_content.count
			variant
				i
			until
				i = 0 or else not is_space (last_content.item_code (i))
			loop
				i := i - 1
			end
			
			if i = 0 then
				last_content := Void
			elseif i < last_content.count then
				last_content := last_content.substring (1, i)
			end
		end
			
feature -- Events

	on_start is
			-- Reset.
		do
			last_content := Void
			create is_space_preserved.make_default
			is_space_preserved.force (default_space_preserved)
			Precursor
		end
		
	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Clear content and forward.
		do
			end_content
			Precursor (a_name, a_content)
		end
		
	on_comment (a_comment: STRING) is
			-- Clear content and forward.
		do
			end_content
			Precursor (a_comment)
		end

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Clear content and forward.
		do
			end_content
			is_space_preserved.force (is_space_preserved.item) -- Unchanged.
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Process xml:space attribute
		do
			if has_prefix (a_prefix)
				and then STRING_.same_string (Xml_prefix, a_prefix)
				and STRING_.same_string (Xml_space, a_local_part)
			then
					--Replace value for current element.
				is_space_preserved.remove
				is_space_preserved.force (STRING_.same_string (Xml_space_preserve, a_value))
			end
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end
		
	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Clear content and forward.
		do
			end_content
			is_space_preserved.remove
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_finish is
			-- Clear content and forward.
		do
			end_content
			Precursor
		end

invariant

	last_content_not_empty: last_content = Void or else last_content.count > 0

end
