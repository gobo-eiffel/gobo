note

	description:

		"Pretty print filter with indentation; for tags not separated by content (see XM_WHITESPACE_NORMALIZER)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_INDENT_PRETTY_PRINT_FILTER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			on_start,
			on_attribute,
			on_start_tag,
			on_end_tag,
			on_content
		end

create

	make_null,
	set_next

feature -- Indent

	indent: STRING
			-- Indentation string.

	set_indent (an_indent: STRING)
			-- Set indent string.
		require
			an_indent_not_void: an_indent /= Void
		do
			indent := an_indent
		end

	Default_indent: STRING = " "
			-- Default indent.

feature -- Events

	on_start
			-- Start of document.
		do
			if indent = Void then
				indent := Default_indent
			end
			create space_preserved.make_default
			space_preserved.force (Default_space_preserve)

			has_content := False

			is_root := True

			Precursor
		ensure then
			space_preserved_not_void: space_preserved /= Void
			indent_not_void: indent /= Void
		end

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING)
			-- Start of start tag.
		do
			check space_preserved_not_void: space_preserved /= Void end

			flush_pending_tag_end

			if not has_content then
				if is_root then
					is_root := False
				else
					output_indent_new_line
				end
				output_indent
			end
			has_content := False

			depth := depth + 1

			Precursor (a_namespace, a_prefix, a_local_part)

			space_preserved.force (space_preserved.item)
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING)
			-- Handle xml:space.
		do
			check space_preserved_not_void: space_preserved /= Void end

			if has_xml_space (a_prefix, a_local_part) then
					--Replace value for current element.
				space_preserved.remove
				space_preserved.force (STRING_.same_string (Xml_space_preserve, a_value))
			end
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING)
			-- End tag.
		do
			depth := depth - 1

			if last_call_was_start_tag_finish and empty_element_tags_enabled then
				Precursor (a_namespace, a_prefix, a_local_part)
			else
				if not has_content then
					output_indent_new_line
					output_indent
				end

				Precursor (a_namespace, a_prefix, a_local_part)
			end

			has_content := False
			space_preserved.remove
		end

	on_content (a_content: STRING)
			-- Test if we had a content event.
		do
			has_content := True
			Precursor (a_content)
		end

feature {NONE} -- Implementation

	has_content: BOOLEAN
			-- Was there a content event since last tag?

	is_root: BOOLEAN
			-- Are we before the root element?

feature {NONE} -- Space preserve

	has_xml_space (a_prefix: STRING; a_local_part: STRING): BOOLEAN
			-- Is this attribute xml:space?
		do
			Result := has_prefix (a_prefix)
				and then STRING_.same_string (Xml_prefix, a_prefix)
					and then STRING_.same_string (Xml_space, a_local_part)
		end

	space_preserved: DS_ARRAYED_STACK [BOOLEAN]
			-- Space preserved value.

	Default_space_preserve: BOOLEAN
			-- Initial space preserve value.
			-- May be redefined.
			-- Default: False.
		do
		end

feature {NONE} -- Indent

	depth: INTEGER
			-- Depth.

	output_indent
			-- Append indent before element.
		require
			space_preserve_not_void: space_preserved /= Void
			space_preserve_not_empty: not space_preserved.is_empty
			indent_not_void: indent /= Void
		local
			i: INTEGER
		do
			if not space_preserved.item then
				from
					i := 1
				until
					i > depth
				loop
					output (indent)
					i := i + 1
				end
			end
		end

	output_indent_new_line
			-- Append indent after element.
		require
			space_preserve_not_void: space_preserved /= Void
		do
			if not space_preserved.item then
				output (Lf_s)
			end
		end

end
