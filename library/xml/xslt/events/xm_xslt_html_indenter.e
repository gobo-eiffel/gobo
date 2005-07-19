indexing

	description:

	"Receivers that indent HTML by adding whitespace to character data"

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_HTML_INDENTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, end_element, notify_characters, notify_comment
		end

create

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER; a_receiver: XM_XSLT_EMITTER; some_output_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			receiver_is_xml_emitter: a_receiver /= Void and then a_receiver.is_xml_emitter
			output_properties_not_void: some_output_properties /= Void
		do
			base_receiver := a_receiver
			emitter := a_receiver.as_xml_emitter
			indent_spaces := some_output_properties.indent_spaces
			is_after_formatted := True
			system_id := a_receiver.system_id
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			a_tag: STRING
		do
			a_tag := shared_name_pool.display_name_from_name_code (a_name_code)
			is_inline_tag := is_inline (a_tag)
			in_formatted_tag := in_formatted_tag or else is_formatted (a_tag)
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

	end_element is
			-- Notify the end of an element.
		local
			a_tag: STRING
			this_inline, this_formatted: BOOLEAN
		do
			level := level - 1
			a_tag := emitter.element_qname_stack.item
			this_inline := is_inline (a_tag)
			this_formatted := is_formatted (a_tag)
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
			Precursor
			in_formatted_tag := in_formatted_tag and then not this_formatted
			same_line := False
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_last_newline, an_index: INTEGER
		do
			if in_formatted_tag then
				Precursor (chars, properties)
			else
				from
					a_last_newline := 1
					an_index := 1
				variant
					chars.count + 1 - an_index
				until
					an_index > chars.count
				loop
					if chars.item_code (an_index) = 10 or else
						(an_index - a_last_newline > 120 and then chars.item_code (an_index) = 32) then
						same_line := False
						Precursor (chars.substring (a_last_newline, an_index - 1), properties)
						indent
						a_last_newline := an_index + 1
						from
						until
							a_last_newline > chars.count or else chars.item_code (a_last_newline) /= 32
						loop
							a_last_newline := a_last_newline + 1
						end
					end
					an_index := an_index + 1
				end
				if a_last_newline <= chars.count then
					Precursor (chars.substring (a_last_newline, chars.count), properties)
				end
			end
			is_after_inline := False
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			indent
			Precursor (a_content_string, properties)
		end

feature {NONE} -- Implementation

	indent_spaces: INTEGER
			-- Number of spaces to use when indenting

	emitter: XM_XSLT_XML_EMITTER
			-- Base receiver

	same_line, is_inline_tag, in_formatted_tag, is_after_inline, is_after_formatted: BOOLEAN
			-- Flags that affect the decision to indent

	indentation_characters: STRING is "                                                                                   "
			--

	level: INTEGER
			-- Element nesting level

	inline_tags: DS_HASH_SET [STRING] is
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

	is_inline (a_tag_name: STRING): BOOLEAN is
			-- Is `a_tag_name' to be treated as an inline element?
		require
			tag_name_not_void: a_tag_name /= Void
		do
			Result := inline_tags.has (a_tag_name.as_lower)
		end

	formatted_tags: DS_HASH_SET [STRING] is
			-- Table of preformatted elements
		once
			create Result.make (5)
			Result.set_equality_tester (string_equality_tester)
			Result.put ("pre")
			Result.put ("script")
			Result.put ("style")
			Result.put ("textarea")
			Result.put ("xmp")
		ensure
			formatted_tags_not_void: Result /= Void
		end

	is_formatted (a_tag_name: STRING): BOOLEAN is
			-- Does `a_tag_name' contain pre-formatted text?
		require
			tag_name_not_void: a_tag_name /= Void
		do
			Result := formatted_tags.has (a_tag_name.as_lower)
		end

	indent is
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

invariant

	strictly_positive_indent_spaces: indent_spaces > 0
	emitter_is_base_receiver: emitter = base_receiver

end
	
