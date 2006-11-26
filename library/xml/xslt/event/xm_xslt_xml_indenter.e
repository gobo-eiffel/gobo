indexing

	description:

	"Receivers that indent XML by adding ignorable whitespace."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_XML_INDENTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, end_element, notify_attribute,
			notify_processing_instruction, notify_characters, notify_comment
		end

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER; a_receiver: XM_XSLT_XML_EMITTER; some_output_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			receiver_is_xml_emitter: a_receiver /= Void and then a_receiver.is_xml_emitter
			output_properties_not_void: some_output_properties /= Void
		do
			base_receiver := a_receiver
			emitter := a_receiver.as_xml_emitter
			indent_spaces := some_output_properties.indent_spaces
			if shared_name_pool.is_name_code_allocated ("xml", Xml_uri, "space") then
				xml_space_code := shared_name_pool.name_code ("xml", Xml_uri, "space")
			else
				shared_name_pool.allocate_name ("xml", Xml_uri, "space")
				xml_space_code := shared_name_pool.last_name_code
			end
			xml_space_code := fingerprint_from_name_code (xml_space_code)
			is_after_tag := True
			is_allwhite := True
			suppressed_at_level := -1
			document_uri := base_receiver.document_uri
			base_uri := base_receiver.base_uri
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			if is_after_tag then indent end
			Precursor (a_name_code, a_type_code, properties)
			level := level + 1
			is_same_line := True
			is_after_tag := True
			is_allwhite := True
			line := 0
		end

	end_element is
			-- Notify the end of an element.
		do
			level := level - 1
			if is_after_tag and then not is_same_line then indent end
			Precursor
			is_same_line := False
			is_after_tag := True
			is_allwhite := True
			line := 0
			if level = suppressed_at_level - 1 then

				-- Remove suppression of indentation.

				suppressed_at_level := -1
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			if fingerprint_from_name_code (a_name_code) = xml_space_code and then
				STRING_.same_string (a_value, "preserve") then
				suppressed_at_level := level
			end
			Precursor (a_name_code, a_type_code, a_value, properties)
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			Precursor (a_name, a_data_string, properties)
			is_after_tag := True
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			an_index, a_character_code: INTEGER
		do
			from
				an_index := 1
			variant
				chars.count + 1 - an_index
			until
				an_index > chars.count
			loop
				a_character_code := chars.item_code (an_index)
				if a_character_code = 10 then -- LF
					is_same_line := False
					line := line + 1
					column := 0
				elseif not is_whitespace (a_character_code) then
					is_allwhite := False
				end
				column := column + 1
				an_index := an_index + 1
			end
			Precursor (chars, properties)
			if not is_allwhite then is_after_tag := False end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			Precursor (a_content_string, properties)
			is_after_tag := True
		end

feature {NONE} -- Implementation

	indent_spaces: INTEGER
			-- Number of spaces to use when indenting

	emitter: XM_XSLT_XML_EMITTER
			-- Base receiver

	is_same_line, is_after_tag, is_allwhite: BOOLEAN
			-- Flags that affect the decision to indent

	line, column: INTEGER
			-- Number of lines and columns  in whitespace text nodes between tags

	indentation_characters: STRING is "                                                                                   "
			--

	level: INTEGER
			-- Element nesting level

	suppressed_at_level: INTEGER
			-- Level at which whitespace is preserved

	xml_space_code: INTEGER
			-- name code for xml:space

	indent is
			-- Output white space to reflect the current indentation level.
		local
			a_spaces_count: INTEGER
		do
			if suppressed_at_level < 0 then
				a_spaces_count := level * indent_spaces
				if line = 0 or else column <= a_spaces_count then
					from
					until
						a_spaces_count <= indentation_characters.count
					loop
						indentation_characters.append_string (indentation_characters)
					end
					base_receiver.notify_characters ("%N", 0)
					base_receiver.notify_characters (indentation_characters.substring (1, a_spaces_count), No_special_characters)
					is_same_line := False
				end
			end
		end

	is_whitespace (a_character_code: INTEGER): BOOLEAN is
			-- Is `a_character_code' XML white space?
		do
			Result := a_character_code = 10 or else a_character_code = 13 or else
			a_character_code = 9 or else a_character_code = 32
		end

invariant

	strictly_positive_indent_spaces: indent_spaces > 0
	emitter_is_base_receiver: emitter = base_receiver

end
	
