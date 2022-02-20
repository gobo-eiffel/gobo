note

	description:

		"Receivers that indent HTML by adding whitespace to character data"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_HTML_INDENTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, end_element, notify_characters, notify_comment
		end

create

	make

feature {NONE} -- Initialization

	make (a_serializer: XM_XSLT_SERIALIZER; a_receiver: XM_XSLT_EMITTER; some_output_properties: XM_XSLT_OUTPUT_PROPERTIES)
			-- Establish invariant.
		require
			serializer_not_void: a_serializer /= Void
			output_properties_not_void: some_output_properties /= Void
		do
			base_receiver := a_receiver
			indent_spaces := some_output_properties.indent_spaces
			is_after_formatted := True
			document_uri := base_receiver.document_uri
			base_uri := base_receiver.base_uri
			create property_stack.make (20)
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		local
			a_property: INTEGER
		do
			a_property := tag_properties (a_name_code)
			property_stack.force (a_property)
			is_inline_tag := is_inline_property (a_property)
			in_formatted_tag := in_formatted_tag or else is_formatted_property (a_property)
			if not is_inline_tag and then not in_formatted_tag and then
				not is_after_inline and then not is_after_formatted then
				indent
			end
			Precursor (a_name_code, a_type_code, properties)
			level := level + 1
			same_line := True
			is_after_inline := False
			is_after_formatted := False
		end

	end_element
			-- Notify the end of an element.
		local
			a_property: INTEGER
			this_inline, this_formatted: BOOLEAN
		do
			level := level - 1
			a_property := property_stack.item
			this_inline := is_inline_property (a_property)
			this_formatted := is_formatted_property (a_property)
			if not this_inline and then not this_formatted and then
				not is_after_inline and then not same_line and then
				not is_after_formatted and then not in_formatted_tag then
				indent
				is_after_formatted := False
				is_after_inline := False
			else
				is_after_formatted := this_formatted
				is_after_inline := this_inline
			end
			property_stack.remove
			Precursor
			in_formatted_tag := in_formatted_tag and then not this_formatted
			same_line := False
		end

	notify_characters (a_chars: STRING; a_properties: INTEGER)
			-- Notify character data.
		local
			a_last_newline, an_index: INTEGER
		do
			if in_formatted_tag or are_null_markers_used (a_properties) then
				Precursor (a_chars, a_properties)
			else
				from
					a_last_newline := 1
					an_index := 1
				until
					an_index > a_chars.count
				loop
					if a_chars.code (an_index) = 10 or else
						(an_index - a_last_newline > 120 and then a_chars.code (an_index) = 32) then
						same_line := False
						Precursor (a_chars.substring (a_last_newline, an_index - 1), a_properties)
						indent
						a_last_newline := an_index + 1
						from
						until
							a_last_newline > a_chars.count or else a_chars.code (a_last_newline) /= 32
						loop
							a_last_newline := a_last_newline + 1
						end
					end
					an_index := an_index + 1
				variant
					a_chars.count + 1 - an_index
				end
				if a_last_newline <= a_chars.count then
					Precursor (a_chars.substring (a_last_newline, a_chars.count), a_properties)
				end
			end
			mark_as_written
			is_after_inline := False
		end

	notify_comment (a_content_string: STRING; a_properties: INTEGER)
			-- Notify a comment.
		do
			indent
			Precursor (a_content_string, a_properties)
		end

feature {NONE} -- Implementation

	indent_spaces: INTEGER
			-- Number of spaces to use when indenting

	same_line, is_inline_tag, in_formatted_tag, is_after_inline, is_after_formatted: BOOLEAN
			-- Flags that affect the decision to indent

	indentation_characters: STRING = "                                                                                   "
			--

	level: INTEGER
			-- Element nesting level

	property_stack: DS_ARRAYED_STACK [INTEGER]
			-- Stack of element properties

	Inline_tag: INTEGER = 1
			-- Inline property for an element

	Formatted_tag: INTEGER = 2
			-- Formatted property for an element

	inline_tags: DS_HASH_SET [STRING]
			-- Tags to be treated as an inline elements;
			-- List of inline tags is from the HTML 4.0 (loose) spec.
			-- The significance is that we mustn't add spaces
			--  immediately before or after one of these elements.
			-- INS and DEL are not actually inline elements,
			--  but the SGML DTD for HTML (apparently) permits them
			--  to be used as if they were.
		once
			create Result.make (40)
			Result.set_equality_tester (string_equality_tester)
			Result.put ("tt")
			Result.put ("i")
			Result.put ("b")
			Result.put ("u")
			Result.put ("s")
			Result.put ("strike")
			Result.put ("big")
			Result.put ("small")
			Result.put ("em")
			Result.put ("strong")
			Result.put ("dfn")
			Result.put ("code")
			Result.put ("samp")
			Result.put ("kbd")
			Result.put ("var")
			Result.put ("cite")
			Result.put ("abbr")
			Result.put ("acronym")
			Result.put ("a")
			Result.put ("img")
			Result.put ("applet")
			Result.put ("object")
			Result.put ("font")
			Result.put ("basefont")
			Result.put ("br")
			Result.put ("script")
			Result.put ("map")
			Result.put ("q")
			Result.put ("sub")
			Result.put ("sup")
			Result.put ("span")
			Result.put ("bdo")
			Result.put ("iframe")
			Result.put ("input")
			Result.put ("select")
			Result.put ("textarea")
			Result.put ("label")
			Result.put ("button")
			Result.put ("ins")
			Result.put ("del")
		ensure
			inline_tags_not_void: Result /= Void
		end

	formatted_tags: DS_HASH_SET [STRING]
			-- Table of preformatted elements
		once
			create Result.make (5)
			Result.set_equality_tester (string_equality_tester)
			Result.put ("pre")
			Result.put ("script")
			Result.put ("style")
			Result.put ("textarea")

			-- xmp is obsolete, but still encountered.
			-- Note that the spec doesn not FORCE you to indent other tags,
			--  so it is legitimate to include it here

			Result.put ("xmp")
		ensure
			formatted_tags_not_void: Result /= Void
		end

	indent
			-- Output white space to reflect the current indentation level.
		local
			a_spaces_count: INTEGER
		do
			a_spaces_count := level * indent_spaces
			from
			until
				a_spaces_count <= indentation_characters.count
			loop
				indentation_characters.append_string (indentation_characters)
			end
			base_receiver.notify_characters ("%N", 0)
			base_receiver.notify_characters (indentation_characters.substring (1, a_spaces_count), 0)
			same_line := False
		end

	tag_properties (a_name_code: INTEGER): INTEGER
			-- Properties for element named by `a_name_code'
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
		local
			is_formatted, is_inline: BOOLEAN
			a_local_name: STRING
		do
			if shared_name_pool.namespace_code_from_name_code (a_name_code) = Default_uri_code then
				a_local_name := shared_name_pool.local_name_from_name_code (a_name_code).as_lower
				is_inline := inline_tags.has (a_local_name)
				is_formatted := formatted_tags.has (a_local_name)
				if is_inline then Result := Result + Inline_tag end
				if is_formatted then Result := Result + Formatted_tag end
			end
		ensure
			result_in_range: Result >= 0 and then Result <= (Inline_tag + Formatted_tag)
		end

	is_inline_property (a_property: INTEGER): BOOLEAN
			-- Does `a_property' encompass inline-tag?
		require
			property_in_range: a_property >= 0 and then a_property <= (Inline_tag + Formatted_tag)
		do
			Result := a_property = Inline_tag or else a_property = Inline_tag + Formatted_tag
		end

	is_formatted_property (a_property: INTEGER): BOOLEAN
			-- Does `a_property' encompass formatted-tag?
		require
			property_in_range: a_property >= 0 and then a_property <= (Inline_tag + Formatted_tag)
		do
			Result := a_property = Formatted_tag or else a_property = Inline_tag + Formatted_tag
		end

invariant

	strictly_positive_indent_spaces: indent_spaces > 0
	property_stack_not_void: property_stack /= Void

end

