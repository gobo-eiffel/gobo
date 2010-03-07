indexing

	description:

	"Emitters that write HTML."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "MIT License"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_HTML_EMITTER

inherit

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_XSLT_XML_EMITTER
		rename
			make as make_xml
		redefine
			open_document, start_content, output_attribute,
			output_escape, end_element, notify_processing_instruction, start_element,
			notify_characters, maximal_ordinary_string
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_serializer: XM_XSLT_SERIALIZER; a_outputter: XM_OUTPUT; a_output_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Initialize `Current'.
		require
			serializer_not_void: a_serializer /= Void
			a_outputter_not_void: a_outputter /= Void
			a_output_properties_not_void: a_output_properties /= Void
		do
			make_xml (a_serializer, a_outputter, a_output_properties)
			make_boolean_attributes
		ensure
			serializer_set: serializer = a_serializer
			outputter_set: raw_outputter = a_outputter
			output_properties_set: output_properties = a_output_properties
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			Precursor (a_name_code, a_type_code, properties)
			if not is_error then
				element_name := element_qname_stack.item.as_lower
				element_uri_code := shared_name_pool.uri_code_from_name_code (a_name_code)
				if element_uri_code = Default_uri_code and then
					(STRING_.same_string (element_name, "script") or else
						STRING_.same_string (element_name, "style")) then
					in_script := 0
				end
				check
					huge_element_nesting_level: in_script /= -1
				end
				in_script := in_script + 1
			end
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			if is_open_start_tag then
				close_start_tag ("", False) -- prevent <xxx/> syntax
			end
			mark_as_written
		end

	end_element is
			-- Notify the end of an element.
		do
			in_script := in_script - 1
			if in_script <= 0 then in_script := -1000000 end
			if is_empty_tag (element_name) and then element_uri_code = Default_uri_code then
				element_qname_stack.remove
				element_name := element_qname_stack.item.as_lower
			else
				Precursor
			end
			mark_as_written
		end

	notify_characters (a_chars: STRING; a_properties: INTEGER) is
			-- Notify character data.
		local
			l_options: INTEGER
		do
			if in_script > 0 and then not is_output_escaping_disabled (a_properties) then
				l_options := INTEGER_.bit_and (a_properties, INTEGER_.bit_not (No_special_characters))
				l_options := l_options + Disable_escaping -- <script> and <style> contents must not be escaped
			else
				l_options := a_properties
			end
			Precursor (a_chars, l_options)
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_string: STRING
		do
			if not is_error then
				if a_data_string.has ('>') then
					serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("HTML processing instructions may not conatina '>'", Xpath_errors_uri, "SERE0015", Dynamic_error))
					is_error := True
				else
					if not is_output_open then
						open_document
					end
					a_string := STRING_.concat ("<?", a_name)
					a_string := STRING_.appended_string (a_string, " ")
					a_string := STRING_.appended_string (a_string, a_data_string)
					a_string := STRING_.appended_string (a_string, ">")
					output (a_string)
				end
			end
			mark_as_written
		end

feature {NONE} -- Implementation

	boolean_attributes_set: DS_HASH_SET [STRING] is
			-- Names of attributes that are sometimes boolean valued

		once
			create Result.make (17)
			Result.set_equality_tester (string_equality_tester)
		end

	boolean_combinations_set: DS_HASH_SET [STRING] is
		-- Names of elements-attribute pairs that are boolean valued
		once
			create Result.make (24)
			Result.set_equality_tester (string_equality_tester)
		end

	media_type: STRING
			-- Mime type

	escape_uri_attributes: BOOLEAN
			-- Should the html and xhtml methods escape non-ASCII charaters in URI attribute values?

	Native_representation: INTEGER is 1
	Entity_representation: INTEGER is 2
	Decimal_representation: INTEGER is 3
	Hexadecimal_representation: INTEGER is 4
			-- Character representation methods

	non_ascii_representation: INTEGER
			-- Method for representing non-ASCII characters

	excluded_representation: INTEGER
			-- Method for representing characters excluded from the encoding

	in_script: INTEGER
			-- nested depth of elements withn script or style elements

	element_name: STRING
			-- Name of current element

	element_uri_code: INTEGER -- _16
			-- Namespace URI of current element

	latin1_entities: ARRAY [STRING] is
			-- latin-1 entity names
		once
			create Result.make (161, 255)
			Result.put ("iexcl", 161)
			Result.put ("cent", 162)
			Result.put ("pound", 163)
			Result.put ("curren", 164)
			Result.put ("yen", 165)
			Result.put ("brvbar", 166)
			Result.put ("sect", 167)
			Result.put ("uml", 168)
			Result.put ("copy", 169)
			Result.put ("ordf", 170)
			Result.put ("laquo", 171)
			Result.put ("not", 172)
			Result.put ("shy", 173)
			Result.put ("reg", 174)
			Result.put ("macr", 175)
			Result.put ("deg", 176)
			Result.put ("plusmn", 177)
			Result.put ("sup2", 178)
			Result.put ("sup3", 179)
			Result.put ("acute", 180)
			Result.put ("micro", 181)
			Result.put ("para", 182)
			Result.put ("middot", 183)
			Result.put ("cedil", 184)
			Result.put ("sup1", 185)
			Result.put ("ordm", 186)
			Result.put ("raquo", 187)
			Result.put ("frac14", 188)
			Result.put ("frac12", 189)
			Result.put ("frac34", 190)
			Result.put ("iquest", 191)
			Result.put ("Agrave", 192)
			Result.put ("Aacute", 193)
			Result.put ("Acirc", 194)
			Result.put ("Atilde", 195)
			Result.put ("Auml", 196)
			Result.put ("Aring", 197)
			Result.put ("AElig", 198)
			Result.put ("Ccedil", 199)
			Result.put ("Egrave", 200)
			Result.put ("Eacute", 201)
			Result.put ("Ecirc", 202)
			Result.put ("Euml", 203)
			Result.put ("Igrave", 204)
			Result.put ("Iacute", 205)
			Result.put ("Icirc", 206)
			Result.put ("Iuml", 207)
			Result.put ("ETH", 208)
			Result.put ("Ntilde", 209)
			Result.put ("Ograve", 210)
			Result.put ("Oacute", 211)
			Result.put ("Ocirc", 212)
			Result.put ("Otilde", 213)
			Result.put ("Ouml", 214)
			Result.put ("times", 215)
			Result.put ("Oslash", 216)
			Result.put ("Ugrave", 217)
			Result.put ("Uacute", 218)
			Result.put ("Ucirc", 219)
			Result.put ("Uuml", 220)
			Result.put ("Yacute", 221)
			Result.put ("THORN", 222)
			Result.put ("szlig", 223)
			Result.put ("agrave", 224)
			Result.put ("aacute", 225)
			Result.put ("acirc", 226)
			Result.put ("atilde", 227)
			Result.put ("auml", 228)
			Result.put ("aring", 229)
			Result.put ("aelig", 230)
			Result.put ("ccedil", 231)
			Result.put ("egrave", 232)
			Result.put ("eacute", 233)
			Result.put ("ecirc", 234)
			Result.put ("euml", 235)
			Result.put ("igrave", 236)
			Result.put ("iacute", 237)
			Result.put ("icirc", 238)
			Result.put ("iuml", 239)
			Result.put ("eth", 240)
			Result.put ("ntilde", 241)
			Result.put ("ograve", 242)
			Result.put ("oacute", 243)
			Result.put ("ocirc", 244)
			Result.put ("otilde", 245)
			Result.put ("ouml", 246)
			Result.put ("divide", 247)
			Result.put ("oslash", 248)
			Result.put ("ugrave", 249)
			Result.put ("uacute", 250)
			Result.put ("ucirc", 251)
			Result.put ("uuml", 252)
			Result.put ("yacute", 253)
			Result.put ("thorn", 254)
			Result.put ("yuml", 255)
		end

	set_boolean_attribute (an_element, an_attribute: STRING) is
			-- Mark `an_attribute' as boolean when used with `an_element'.
		require
			element_name_not_void: an_element /= Void
			attribute_name_not_void: an_attribute /= Void
		do
			if not boolean_attributes_set.has (an_attribute.as_lower) then
				boolean_attributes_set.put (an_attribute.as_lower)
			end
			boolean_combinations_set.put ((an_element + "+" + an_attribute).as_lower)
		end

	is_boolean_attribute (an_element, an_attribute, a_value: STRING): BOOLEAN is
			-- Is `an_attribute' boolean valued?
		require
			element_name_not_void: an_element /= Void
			attribute_name_not_void: an_attribute /= Void
			value_not_void: a_value /= Void
		do
			if STRING_.same_case_insensitive (an_attribute, a_value) then
				if boolean_attributes_set.has (an_attribute.as_lower) then
					Result := boolean_combinations_set.has ((an_element + "+" + an_attribute).as_lower)
				end
			end
		end

	make_boolean_attributes is
			-- Build sets for determining boolean-valued attributes
		once
			set_boolean_attribute ("area", "nohref")
			set_boolean_attribute ("button", "disabled")
			set_boolean_attribute ("dir", "compact")
			set_boolean_attribute ("dl", "compact")
			set_boolean_attribute ("frame", "noresize")
			set_boolean_attribute ("hr", "noshade")
			set_boolean_attribute ("img", "ismap")
			set_boolean_attribute ("input", "checked")
			set_boolean_attribute ("input", "disabled")
			set_boolean_attribute ("input", "readonly")
			set_boolean_attribute ("menu", "compact")
			set_boolean_attribute ("object", "declare")
			set_boolean_attribute ("ol", "compact")
			set_boolean_attribute ("optgroup", "disabled")
			set_boolean_attribute ("option", "selected")
			set_boolean_attribute ("option", "disabled")
			set_boolean_attribute ("script", "defer")
			set_boolean_attribute ("select", "multiple")
			set_boolean_attribute ("select", "disabled")
			set_boolean_attribute ("td", "nowrap")
			set_boolean_attribute ("textarea", "disabled")
			set_boolean_attribute ("textarea", "readonly")
			set_boolean_attribute ("th", "nowrap")
			set_boolean_attribute ("ul", "compact")
		end

	open_document is
			-- Open output document.
		local
			a_system_id, a_public_id: STRING
			a_character_representation, a_non_ascii_representation, an_excluded_representation: STRING
			an_index: INTEGER
			an_error: XM_XPATH_ERROR_VALUE
		do
			if STRING_.same_string (output_properties.version, "4.0") then
				-- ok
			elseif not STRING_.same_string (output_properties.version, "4.01") then
				serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Only versions 4.0 and 4.01 of HTML are supported", Xpath_errors_uri, "SESU0013", Dynamic_error))
				is_error := True
			end
			encoding := output_properties.encoding.as_upper

			outputter := encoder_factory.outputter (encoding, raw_outputter)
			if outputter = Void then
				create an_error.make_from_string (STRING_.concat ("Trying UTF-8 as unable to open output stream in encoding ", encoding),
															 Xpath_errors_uri, "SESU0007", Dynamic_error)
				serializer.report_recoverable_error (an_error)
				if not serializer.is_error then
					outputter := encoder_factory.outputter (encoding, raw_outputter)
					if outputter = Void then
						create an_error.make_from_string ("Failed to recover",
																	 Xpath_errors_uri, "SESU0007", Dynamic_error)
						serializer.report_fatal_error (an_error)
					end
				end
			else
				is_output_open := True

				media_type := STRING_.cloned_string (output_properties.media_type)

				if outputter.byte_order_mark_permitted then
					if output_properties.byte_order_mark_required
						or (not output_properties.is_byte_order_mark_set and outputter.is_byte_order_mark_default) then
						output_ignoring_error (outputter.byte_order_mark)
					end
				end
				escape_uri_attributes := output_properties.escape_uri_attributes

				a_system_id := output_properties.doctype_system
				a_public_id := output_properties.doctype_public
				if a_system_id /= Void or else a_public_id /= Void then
					write_doctype ("html", a_system_id, a_public_id)
				end
				is_empty := False
				in_script := -1000000 -- safe to assume we will not increment up to zero!

				a_character_representation := output_properties.character_representation
				an_index := a_character_representation.index_of (';', 1)
				if an_index = 0 or else an_index = a_character_representation.count then
					a_non_ascii_representation := a_character_representation
					an_excluded_representation := a_character_representation
				else
					a_non_ascii_representation := a_character_representation.substring (1, an_index - 1)
					a_non_ascii_representation.left_adjust
					a_non_ascii_representation.right_adjust
					an_excluded_representation := a_character_representation.substring (an_index + 1, a_character_representation.count)
					an_excluded_representation.left_adjust
					an_excluded_representation.right_adjust
				end
				non_ascii_representation := representation_code (a_non_ascii_representation, False)
				excluded_representation := representation_code (an_excluded_representation, True)
			end
			if serializer.is_error then
				is_error := True
			end
		end

	representation_code (a_representation: STRING; for_excluded: BOOLEAN): INTEGER is
			-- Representation code for character representations
		require
			representation_string_not_void: a_representation /= Void
		do
			if STRING_.same_string (a_representation, "decimal") then
				Result := Decimal_representation
			elseif STRING_.same_string (a_representation, "hex") then
				Result := Hexadecimal_representation
			elseif STRING_.same_string (a_representation, "native") and then not for_excluded then
				Result := Native_representation
			elseif STRING_.same_string (a_representation, "entity") then
				Result := Entity_representation
			else
				on_error ("Illegal value for gexslt:character-representation: " + a_representation)
			end
		end

	output_attribute (an_element_name_code: INTEGER; an_attribute_qname: STRING; a_value: STRING; properties: INTEGER) is
			-- Output attribute.
			-- Overrides the XML behaviour if the name and value are the same
			--  (we assume this is a boolean attribute to be minimised), or if the value is a URL.
		do
			if element_uri_code = Default_uri_code then
				if is_boolean_attribute (element_name, an_attribute_qname, a_value) then
					output (an_attribute_qname)
				else
					Precursor (an_element_name_code, an_attribute_qname, a_value, properties)
				end
			else
				Precursor (an_element_name_code, an_attribute_qname, a_value, properties)
			end
		end

	hex_characters: STRING is "0123456789ABCDEF"
			-- Hexadecimal characters

	output_escape (a_character_string: STRING; in_attribute: BOOLEAN) is
			-- Output `a_character_string', escaping special characters.
		local
			disabled: BOOLEAN
			a_start_index, a_beyond_index, a_code, another_code: INTEGER
			special_characters: ARRAY [BOOLEAN]
		do
			if in_attribute then
				special_characters := specials_in_attributes
			else
				special_characters := specials_in_text
			end
			from
				a_start_index := 1;
			until
				is_error or a_start_index > a_character_string.count
			loop
				a_beyond_index := maximal_ordinary_string (a_character_string, a_start_index, special_characters)

				if a_beyond_index > a_start_index then
					output (a_character_string.substring (a_start_index, a_beyond_index - 1))
				end
				if a_beyond_index <= a_character_string.count then
					a_code := a_character_string.item_code (a_beyond_index)
					if a_code = 0 then -- enable/disable escaping toggle
						disabled := not disabled
					elseif disabled then
						output (a_character_string.substring (a_beyond_index, a_beyond_index))
					elseif a_code < 127 then -- special ASCII
						if a_beyond_index = a_character_string.count then
							another_code := 0
						else
							another_code := a_character_string.item_code (a_beyond_index + 1)
						end
						output_special_ascii (a_code, another_code, in_attribute)
					elseif a_code = 160 then
						output ("&nbsp;")
					elseif a_code >= 127 and a_code < 160 then
						serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Characters between x7F and x9F inclusive are not allowed in HTML", Xpath_errors_uri, "SERE0014", Dynamic_error))
						is_error := True
					elseif a_code >= 55296 and then a_code <= 56319 then
						-- this can't happen, unless we were to use UTF-16 internally.
						-- Never in a million aeons!
						todo ("output_escape (surrogates)", True)
					else
						if not outputter.is_bad_character_code (a_code) then
							output_non_ascii (a_code, in_attribute)
						else
							is_hex_preferred := excluded_representation = Hexadecimal_representation
							output_character_reference (a_code)
						end
					end
				end
				a_start_index := a_beyond_index + 1
			variant
				a_character_string.count + 2 - a_start_index
			end
		end

	output_special_ascii (a_character_code, a_second_character_code: INTEGER; in_attribute: BOOLEAN) is
			-- Output `a_character_code'.
		do
			if in_attribute then
				if a_character_code = 60 then
					output ("<")                    -- not escaped
				elseif a_character_code = 62 then
					output ("&gt;")                 -- recommended for older browsers
				elseif a_character_code = 38 then
					if a_second_character_code = 40 then
						output ("&")                 -- not escaped if followed by '{'
					else
						output ("&amp;")
					end
				elseif a_character_code = 34 then
					output ("&#34;")                -- double quote
				elseif a_character_code = 10 then
					output ("&#xA;")                -- LF
				elseif a_character_code = 13 then
					output ("&#xD;")                -- CR
				elseif a_character_code = 9 then
					output ("&#9;")                 -- TAB					
				end
			else -- not in attribute
				if a_character_code = 60 then
					output ("&lt;")
				elseif a_character_code = 62 then
					output ("&gt;")                 -- changed to allow for "]]>" ???
				elseif a_character_code = 38 then
					output ("&amp;")
				elseif a_character_code = 13 then
					output ("&#xD;")                -- CR
				end
			end
		end

	output_non_ascii (a_character_code: INTEGER; in_attribute: BOOLEAN) is
			-- Output non-ASCII character.
		require
			non_ascii_character: a_character_code > 127
		do
			inspect
				non_ascii_representation
			when Native_representation then
				output (unicode.code_to_string (a_character_code))
			when Entity_representation then
				if a_character_code > 160 and then a_character_code <= 255 then

					-- if chararacter in iso-8859-1, use an entity reference

					output ("&")
					if not is_error then output (latin1_entities.item (a_character_code)) end
					if not is_error then output (";") end
				else
					output_character_reference (a_character_code)
				end
			when Decimal_representation then
				is_hex_preferred := False
				output_character_reference (a_character_code)
			when Hexadecimal_representation then
				is_hex_preferred := True
				output_character_reference (a_character_code)
			end
		end

	maximal_ordinary_string (a_character_string: STRING; a_start_index: INTEGER; special_characters: ARRAY [BOOLEAN]): INTEGER is
			-- Maximal sequence of ordinary characters
		local
			an_index, a_code: INTEGER
			finished: BOOLEAN
		do
			from
				an_index := a_start_index
			until
				finished or else an_index > a_character_string.count
			loop
				a_code := a_character_string.item_code (an_index)
				if a_code < 128 then -- ASCII
					if special_characters.item (a_code) then
						finished := True
					else
						an_index := an_index + 1
					end
				else
					if not outputter.is_bad_character_code (a_code) then
						if non_ascii_representation = Native_representation and then
							a_code /= 160 then
							an_index := an_index + 1
						else
							finished := True
						end
					else
						finished := True
					end
				end
			end
			Result := an_index
		end

invariant

	empty_tags_set_not_void: empty_tags_set /= Void
	boolean_combinations_set_not_void: boolean_combinations_set /= Void
	boolean_attributes_set_not_void: boolean_attributes_set /= Void

end

