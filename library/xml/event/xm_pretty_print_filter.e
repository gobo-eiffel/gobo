indexing

	description:

		"Pretty printer, output as XML document"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_PRETTY_PRINT_FILTER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_comment,
			on_processing_instruction,
			on_start_tag,
			on_attribute,
			on_start_tag_finish,
			on_end_tag,
			on_content
		end

	XM_OUTPUT

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make_null,
	set_next

feature -- Meta

	on_processing_instruction (a_name: STRING; a_content: STRING) is
			-- Print processing instruction.
		do
			output_constant (Pi_start)
			output (a_name)
			output_constant (Space_s)
			output (a_content)
			output_constant (Pi_end)
			Precursor (a_name, a_content)
		end

	on_comment (a_content: STRING) is
			-- Print comment.
		do
			output_constant (Comment_start)
			output (a_content)
			output_constant (Comment_end)
			Precursor (a_content)
		end

feature -- Tag

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Print start of start tag.
		do
			output_constant (Stag_start)
			output_name (a_prefix, a_local_part)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Print attribute.
		do
			output_constant (Space_s)
			output_name (a_prefix, a_local_part)
			output_constant (Eq_s)
			output_constant (Quot_s)
			output_quote_escaped (a_value)
			output_constant (Quot_s)
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_start_tag_finish is
			-- Print end of start tag.
		do
			output_constant (Stag_end)
			Precursor
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Print end tag.
		do
			output_constant (Etag_start)
			output_name (a_prefix, a_local_part)
			output_constant (Etag_end)
			Precursor (a_namespace, a_prefix, a_local_part)
		end

feature -- Content

	on_content (a_content: STRING) is
			-- Text content.
			-- NOT atomic: successive content may be different.
			-- Default: forward event to 'next'.
		do
			output_escaped (a_content)
			Precursor (a_content)
		end

feature {NONE} -- Escaped

	is_escaped (a_char: INTEGER): BOOLEAN is
			-- Is this an escapable character?
		do
			Result := a_char = Lt_char.code
				or a_char = Gt_char.code
				or a_char = Amp_char.code
				or a_char >= 128
		end

	escaped_char (a_char: INTEGER): STRING is
			-- Escape char.
		require
			is_escaped: is_escaped (a_char)
		do
			if a_char = Lt_char.code then
				Result := Lt_entity
			elseif a_char = Gt_char.code then
				Result := Gt_entity
			elseif a_char = Amp_char.code then
				Result := Amp_entity
			else
				Result := STRING_.concat ("&#", a_char.out)
				Result := STRING_.concat (Result, ";")
			end
		end

feature {NONE} -- Output

	output_constant (a_string: STRING) is
			-- Output constant string.
		require
			a_string_not_void: a_string /= Void
		do
			output (a_string)
		end

	output_quote_escaped (a_string: STRING) is
			-- Like output escaped with quote also escaped for
			-- attribute values.
		require
			a_string_not_void: a_string /= Void
		local
			last_escaped: INTEGER
			i: INTEGER
			cnt: INTEGER
		do
			from
				last_escaped := 0
				i := 1
				cnt := a_string.count
			invariant
				last_escaped <= i
			until
				i > cnt
			loop
				if a_string.item_code (i) = Quot_char.code then
					if last_escaped < i - 1 then
						output_escaped (a_string.substring (last_escaped + 1, i - 1))
					end
					output_constant (Quot_entity)
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				output_escaped (a_string)
			elseif last_escaped < i - 1 then
				output_escaped (a_string.substring (last_escaped + 1, i - 1))
			end
		end

	output_escaped (a_string: STRING) is
			-- Escape and output content string.
		require
			a_string_not_void: a_string /= Void
		local
			last_escaped: INTEGER
			i: INTEGER
			cnt: INTEGER
			a_char: INTEGER
		do
			from
				last_escaped := 0
				i := 1
				cnt := a_string.count
			invariant
				last_escaped <= i
			until
				i > cnt
			loop
				a_char := a_string.item_code (i)
				if is_escaped (a_char) then
					if last_escaped < i - 1 then
						output (a_string.substring (last_escaped + 1, i - 1))
					end
					output_constant (escaped_char (a_char))
					last_escaped := i
				end
				i := i + 1
			end
				-- At exit.
			if last_escaped = 0 then
				output (a_string)
			elseif last_escaped < i - 1 then
				output (a_string.substring (last_escaped + 1, i - 1))
			end
		end

	output_name (a_prefix: STRING; a_local_part: STRING) is
			-- Output prefix:name.
		require
			a_local_part_not_void: a_local_part /= Void
		do
			if has_prefix (a_prefix) then
				output (a_prefix)
				output_constant (Prefix_separator)
			end
			output (a_local_part)
		end

end
