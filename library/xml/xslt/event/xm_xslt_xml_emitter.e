indexing

	description:

	"Emitters that write XML."

library: "Gobo Eiffel XSLT Library"
copyright: "Copyright (c) 2004, Colin Adams and others"
license: "Eiffel Forum License v2 (see forum.txt)"
date: "$Date$"
revision: "$Revision$"

class XM_XSLT_XML_EMITTER

inherit

	XM_XSLT_EMITTER
		redefine
			is_xml_emitter, as_xml_emitter
		end

	XM_UNICODE_CHARACTERS_1_1

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	UT_URL_ENCODING
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_transformer: XM_XSLT_TRANSFORMER; an_outputter: XM_OUTPUT; some_output_properties: XM_XSLT_OUTPUT_PROPERTIES; a_character_map_expander: XM_XSLT_CHARACTER_MAP_EXPANDER) is
			-- Establish invariant.
		require
			transformer_not_void: a_transformer /= Void
			outputter_not_void: an_outputter /= Void
			output_properties_not_void: some_output_properties /= Void
		do
			transformer := a_transformer
			raw_outputter := an_outputter
			output_properties := some_output_properties
			character_map_expander := a_character_map_expander
			is_empty := True
			create element_qname_stack.make_default
			element_qname_stack.set_equality_tester (string_equality_tester)
			create name_lookup_table.make (0, name_lookup_table_size - 1)
			make_specials
			system_id := "" -- TODO - set_system_id
			encoder_factory := transformer.configuration.encoder_factory
			set_normalization_form
		ensure
			transformer_set: transformer = a_transformer
			outputter_set: raw_outputter = an_outputter
			output_properties_set: output_properties = some_output_properties
			character_map_expander_set: character_map_expander = a_character_map_expander
		end

feature -- Conversion

	is_xml_emitter: BOOLEAN is
			-- Is `Current' an XML emitter?
		do
			Result := True
		end

	as_xml_emitter: XM_XSLT_XML_EMITTER is
			-- `Current' seen as an XML emitter
		do
			Result := Current
		end

feature -- Events

	open is
			-- Notify start of event stream.
		do
			is_open := True
		end

	start_document is
			-- New document
		do
			is_document_started := True
			--  The opening of the output
			--  file is deferred until some content is written to it.
		end

	end_document is
			-- Notify the end of the document
		do
			is_document_started := False
		end

	close is
			-- Notify end of event stream.
		do
			is_open := False
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		local
			a_display_name, a_system_id, a_public_id: STRING
			a_bad_character_code: INTEGER
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if not is_error then
				if not is_output_open then
					open_document
				end

				-- Have we've seen this name before?

				if a_name_code < name_lookup_table_size then
					a_display_name := name_lookup_table.item (a_name_code)
				end
				if a_display_name = Void then
					a_display_name := shared_name_pool.display_name_from_name_code (a_name_code)
					if a_name_code < name_lookup_table_size then
						name_lookup_table.put (a_display_name, a_name_code)
					end
					a_bad_character_code := bad_character_code (a_display_name)
					if a_bad_character_code /= 0 then
						a_message := "Element name contains a character (decimal" + a_bad_character_code.out + ") not available in the selected encoding"
						create an_error.make_from_string (a_message, Xpath_errors_uri, "SERE0008", Dynamic_error)
						transformer.report_fatal_error (an_error)
					end
				end
				if not is_error then
					element_qname_stack.force (a_display_name)
					current_element_name_code := a_name_code
					if is_empty then
						a_system_id := output_properties.doctype_system
						a_public_id := output_properties.doctype_public
						if a_system_id /= Void then write_doctype (a_display_name, a_system_id, a_public_id) end
						is_empty := False
					end
					if is_open_start_tag then
						close_start_tag (a_display_name, False)
					end
					output ("<")
					output (a_display_name)
					is_open_start_tag := True
				end
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace declaration.
		local
			a_namespace_prefix, a_namespace_uri: STRING
			a_bad_character: INTEGER
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if is_output_open and then not is_error then
				a_namespace_prefix := shared_name_pool.prefix_from_namespace_code (a_namespace_code)
				a_namespace_uri := shared_name_pool.uri_from_namespace_code (a_namespace_code)

				if a_namespace_prefix.count = 0 then
					output (" ")
					output_attribute (current_element_name_code, "xmlns", a_namespace_uri, 0)
				else
					a_bad_character := bad_character_code (a_namespace_prefix)
					if a_bad_character /= 0 then
						a_message := "Namespace prefix contains a character (decimal + " + a_bad_character.out + ") not available in the selected encoding"
						create an_error.make_from_string (a_message, Xpath_errors_uri, "SERE0008", Dynamic_error)
						transformer.report_fatal_error (an_error)
					else
						if allow_undeclare_prefixes or else a_namespace_uri.count /= 0 then
							output (" ")
							output_attribute (current_element_name_code, STRING_.concat ("xmlns:", a_namespace_prefix), a_namespace_uri, 0)
						end
					end
				end
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			a_display_name: STRING
			a_bad_character: INTEGER
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if is_output_open and then not is_error then

				-- Have we've seen this name before?

				if a_name_code < name_lookup_table_size then
					a_display_name := name_lookup_table.item (a_name_code)
				end
				if a_display_name = Void then
					a_display_name := shared_name_pool.display_name_from_name_code (a_name_code)
					if a_name_code < name_lookup_table_size then
						name_lookup_table.put (a_display_name, a_name_code)
					end
					a_bad_character := bad_character_code (a_display_name)
					if a_bad_character /= 0 then
						a_message := "Attribute name contains a character (decimal + " + a_bad_character.out + ") not available in the selected encoding"
						create an_error.make_from_string (a_message, Xpath_errors_uri, "SERE0008", Dynamic_error)
						transformer.report_fatal_error (an_error)
					end
				end
				if not is_error then
					output (" ")
					if not is_error then output_attribute (current_element_name_code, a_display_name, a_value, properties) end
				end
			end
		end


	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			-- Don't add ">" to the start tag until we know whether the element has content.
		end

	end_element is
			-- Notify the end of an element.
		local
			a_display_name: STRING
		do
			if is_output_open and then not is_error then
				a_display_name := element_qname_stack.item
				element_qname_stack.remove
				if is_open_start_tag then
					close_start_tag (a_display_name, True)
				else
					output ("</")
					if not is_error then output (a_display_name) end
					if not is_error then output (">") end
				end
			end
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		local
			a_bad_character: INTEGER
			a_mapped_string: STRING
		do
			debug ("XSLT stripper")
				std.error.put_string ("Is start tag open? " + is_open_start_tag.out)
				std.error.put_new_line
			end
			if not is_error then
				if not is_output_open then
					open_document
				end
				if is_open_start_tag then
					close_start_tag ("", False)
				end
				if is_output_escaping_disabled (properties) then
					a_bad_character := bad_character_code (chars)
					if a_bad_character = 0 then
						output (chars)
					else

						-- Ignore disable output escaping with characters
                  --  that are not available in the target encoding

						output_escape (chars, False)
					end
				elseif character_map_expander /= Void then
					a_mapped_string := character_map_expander.mapped_string (chars)
					output_escape (normalized_string (a_mapped_string), False)
				elseif are_no_special_characters (properties) then
					output (chars)
				else
					debug ("XSLT stripper")
						std.error.put_string ("Emitting " + normalized_string (chars) + "###")
						std.error.put_new_line
					end
					output_escape (normalized_string (chars), False)
				end
			end
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		local
			a_string: STRING
		do
			if not is_error then
				if not is_output_open then
					open_document
				end
				if is_open_start_tag then
					close_start_tag ("", False)
				end
				a_string := STRING_.concat ("<?", a_name)
				if a_data_string.count > 0 then
					a_string := STRING_.appended_string (a_string, " ")
					a_string := STRING_.appended_string (a_string, a_data_string)
				end
				a_string := STRING_.appended_string (a_string, "?>")
				output (a_string)
			end
		end

	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			if not is_error then
				if not is_output_open then
					open_document
				end
				if is_open_start_tag then
					close_start_tag ("", False)
				end
				output ("<!--")
				if not is_error then output (a_content_string) end
				if not is_error then output ("-->") end
			end
		end


feature {XM_XSLT_HTML_INDENTER} -- Restricted

	element_qname_stack: DS_ARRAYED_STACK [STRING]
			-- QNames of open elements in scope

feature {NONE} -- Implementation

	is_output_open: BOOLEAN
			-- Has the output document been opened yet

	is_declaration_written: BOOLEAN
			-- Has the XML declaration been written yet?

	is_empty: BOOLEAN
			-- Has the document element been written yet?

	is_open_start_tag: BOOLEAN
			-- Is a start tag open?

	raw_outputter: XM_OUTPUT
			-- Writer of encoded strings

	encoder_factory: XM_XSLT_ENCODER_FACTORY
			-- Encoder factory

	encoding: STRING
			-- Actual encoding to be used

	current_element_name_code: INTEGER
			-- Name code of the current element

	is_hex_preferred: BOOLEAN
			-- When writing characters entities, is hexadecimal notation preferred?

	allow_undeclare_prefixes: BOOLEAN
			-- Are namespace undeclarations allowed?

	name_lookup_table: ARRAY [STRING]
			-- Cache for frequent QNames, indexed by name code

	name_lookup_table_size: INTEGER
			-- Size of `name_lookup_table'

	warning_issued: BOOLEAN
			-- Has a warning for disabled character escaping problems been issued?

	empty_tags_set: DS_HASH_SET [STRING] is
			-- Names of tags that should not be closed
		once
			create Result.make (13)
			Result.set_equality_tester (string_equality_tester)
			Result.put ("area")
			Result.put ("base")
			Result.put ("basefont")
			Result.put ("br")
			Result.put ("col")
			Result.put ("frame")
			Result.put ("hr")
			Result.put ("img")
			Result.put ("input")
			Result.put ("isindex")
			Result.put ("link")
			Result.put ("meta")
			Result.put ("param")
		end

	is_empty_tag (a_tag: STRING): BOOLEAN is
			-- Is `a_tag' an empty tag?
		require
			tag_not_void: a_tag /= Void
		do
			Result := empty_tags_set.has (a_tag.as_lower)
		end

	url_attributes_set: DS_HASH_SET [STRING] is
			-- Names of attributes that are sometimes URL valued
		once
			create Result.make (15)
			Result.set_equality_tester (string_equality_tester)
		end

	url_combinations_set: DS_HASH_SET [STRING] is
		-- Names of elements-attribute pairs that are URL valued
		once
			create Result.make (37)
			Result.set_equality_tester (string_equality_tester)
		end

	is_url_attribute (an_element, an_attribute: STRING): BOOLEAN is
			-- Is `an_attribute' url-valued when used with `an_element'.?
		require
			element_name_not_void: an_element /= Void
			attribute_name_not_void: an_attribute /= Void
		do
			if url_attributes_set.has (an_attribute) then
				Result := url_combinations_set.has (an_element + "+" + an_attribute)
			end
		end

	specials_in_text: ARRAY [BOOLEAN] is
			-- Lookup table for ASCII characters that need escaping in text
		once
			create Result.make (0, 127)
		end

	specials_in_attributes: ARRAY [BOOLEAN] is
			-- Lookup table for ASCII characters that need escaping in attributes
		once
			create Result.make (0, 127)
		end

	make_specials is
			-- Initialize `specials_in_text' and `specials_in_attributes'.
		once
			specials_in_text.put (True, 0)
			specials_in_text.put (True, 13) -- CR
			specials_in_text.put (True, 60) -- '<'
			specials_in_text.put (True, 62) -- '>'
			specials_in_text.put (True, 38) -- '&'
			specials_in_attributes.put (True, 0)
			specials_in_attributes.put (True, 13) -- CR
			specials_in_attributes.put (True, 60) -- '<'
			specials_in_attributes.put (True, 62) -- '>'
			specials_in_attributes.put (True, 38) -- '&'
			specials_in_attributes.put (True, 10) -- 'LF'
			specials_in_attributes.put (True, 9) -- 'TAB'
			specials_in_attributes.put (True, 34) -- '"'
		end

	write_declaration is
			-- Write XML declaration
		require
			not_yet_written: not is_declaration_written
		local
			omit: BOOLEAN
		do
			if outputter.byte_order_mark_permitted then
				if output_properties.byte_order_mark_required
					or (not output_properties.is_byte_order_mark_set and outputter.is_byte_order_mark_default) then
					output_ignoring_error (outputter.byte_order_mark)
				end
			end
			omit := output_properties.omit_xml_declaration
			if
				omit and then
				not (STRING_.same_string (encoding, "UTF-8") or else
				STRING_.same_string (encoding, "UTF-16") or else
				STRING_.same_string (encoding, "US-ASCII") or else
				STRING_.same_string (encoding, "ASCII"))
			then
				omit := False
			end

			if not omit then
				output ("<?xml version=%"" + output_properties.version + "%" " + "encoding=%"" + encoding + "%"")
				if output_properties.standalone /= Void then
					output (" standalone=%"" + output_properties.standalone + "%"")
				end
				output ("?>")

				-- Don't write a newline character: it's wrong if the output is an
				--  external general parsed entity

			end
			is_declaration_written := True
		ensure
			written: is_declaration_written
		end

	output (a_character_string: STRING) is
			-- Output `a_character_string'.
		require
			document_opened: is_output_open
			valid_string: outputter.is_valid_string (a_character_string)
		do
			if not is_error then
				outputter.output (a_character_string)
				if outputter.is_error then
					on_error ("Failed to write to output stream")
				end
			end
		end

	output_ignoring_error (a_character_string: STRING) is
			-- Output `a_character_string', ignoring any error.
		require
			valid_string: outputter.is_valid_string (a_character_string)
			document_opened: is_output_open
		do
			outputter.output_ignoring_error (a_character_string)
		end

	output_attribute (an_element_name_code: INTEGER; an_attribute_qname: STRING; a_value: STRING; properties: INTEGER) is
			-- Output attribute.
		require
			attribute_name_is_qname: an_attribute_qname /= Void and then is_qname (an_attribute_qname)
			value_not_void: a_value /= Void
			document_opened: is_output_open
		local
			a_delimiter, a_mapped_string: STRING
		do
			if not is_error then
				output (an_attribute_qname)
				if not is_error then
					if character_map_expander = Void then
						a_mapped_string := a_value
					else
						a_mapped_string := character_map_expander.mapped_string (a_value)
					end
					if a_mapped_string = a_value and then are_no_special_characters (properties) then
						output ("=")
						if not is_error then output ("%"") end
						if not is_error then output (normalized_string (a_value)) end
						if not is_error then output ("%"") end
					elseif a_mapped_string /= a_value then

						-- Null (0) characters will be used before and after any section of
						--  the value where escaping is to be disabled

						output ("=")
						if not is_error then
							if a_mapped_string.index_of ('%"', 1) = 0 then
								a_delimiter := "%""
							else
								a_delimiter := "'"
							end
							output (a_delimiter)
							if not is_error then output_escape (a_mapped_string, True) end
							if not is_error then output (a_delimiter) end
						end
					else
						output ("=%"")
						if not is_error then output_escape (a_value, True) end
						if not is_error then output ("%"") end
					end
				end
			end
		end

	output_escape (a_character_string: STRING; is_attribute: BOOLEAN) is
			-- Output `a_character_string', escaping special characters.
		require
			string_not_void: a_character_string /= Void
			document_opened: is_output_open
		local
			disabled: BOOLEAN
			a_start_index, a_beyond_index, a_code: INTEGER
			special_characters: ARRAY [BOOLEAN]
		do
			if is_attribute then
				special_characters := specials_in_attributes
			else
				special_characters := specials_in_text
			end
			from
				a_start_index := 1;
			variant
				a_character_string.count + 2 - a_start_index
			until
				a_start_index > a_character_string.count
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
					elseif a_code > 127 then -- non-ASCII
						output_character_reference (a_code)
					else -- ASCII character needs escaping
						if a_code = 60 then
							output ("&lt;")
						elseif a_code = 62 then
							output ("&gt;")
						elseif a_code = 38 then
							output ("&amp;")
						elseif a_code = 34 then
							output ("&#34;")
						elseif a_code = 10 then
							output ("&#xA;")
						elseif a_code = 13 then
							output ("&#xD;")
						elseif a_code = 9 then
							output ("&#0;")
						else
							check
								error_in_escaping_logic: False
							end
						end
					end
				end
				a_start_index := a_beyond_index + 1
			end
		end

	maximal_ordinary_string (a_character_string: STRING; a_start_index: INTEGER; special_characters: ARRAY [BOOLEAN]): INTEGER is
			-- Maximal sequence of ordinary characters
		require
			string_not_void: a_character_string /= Void
			special_characters_not_void: special_characters /= Void
			strictly_positive_start_index: a_start_index > 0
			document_opened: is_output_open
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
				-- TODO: (high) surrogates - I don't think so.
				elseif outputter.is_bad_character_code (a_code) then
					--todo ("maximal_ordinary_string (surrogate characters)", True)
					finished := True
				else
					an_index := an_index + 1
				end
			end
			Result := an_index
		end

	output_character_reference (a_code: INTEGER) is
			-- Output a character reference.
		require
			strictly_positive_code: a_code > 0
			document_opened: is_output_open
		local
			a_string: STRING
		do
			if not is_error then
				create a_string.make (10)
				if is_hex_preferred then
					a_string := "&#x"
					a_string.append_string (INTEGER_.to_hexadecimal (a_code, True))
				else
					a_string := "&#"
					a_string.append_string (a_code.out)
				end
				output (a_string)
			end
		end

	open_document is
			-- Open output document.
		require
			document_not_yet_opened: not is_output_open
		local
			a_character_representation: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			encoding := output_properties.encoding.as_upper

			outputter := encoder_factory.outputter (encoding, raw_outputter)
			if outputter = Void then
				create an_error.make_from_string (STRING_.concat ("Trying UTF-8 as unable to open output stream in encoding ", encoding),
															 Xpath_errors_uri, "SESU0007", Dynamic_error)
				transformer.report_recoverable_error (an_error)
				if not transformer.is_error then
					outputter := encoder_factory.outputter (encoding, raw_outputter)
					if outputter = Void then
						create an_error.make_from_string ("Failed to recover",
																	 Xpath_errors_uri, "SESU0007", Dynamic_error)
						transformer.report_fatal_error (an_error)
					end
				end
			end
			if not transformer.is_error then
				is_output_open := True
				if not is_declaration_written then write_declaration end

				a_character_representation := output_properties.character_representation
				if STRING_.same_string (a_character_representation, "hex") then
					is_hex_preferred := True
				elseif STRING_.same_string (a_character_representation, "decimal") then
					on_error ("Illegal value for gexslt:character-representation: " + a_character_representation)
				end

				if STRING_.same_string (output_properties.version, "1.1") then
					allow_undeclare_prefixes := output_properties.undeclare_prefixes
				end
			end
		ensure
			document_opened: is_error or else is_output_open
		end

	write_doctype (a_type, a_system_id, a_public_id: STRING ) is
			-- Write DOCTYPE.
		require
			doctype_not_void: a_type /= Void
		do
			if is_declaration_written then
				output ("%N")
			end
			output ("<!DOCTYPE ")
			output (a_type)
			output ("%N")
			if a_system_id /= Void then
				if a_public_id = Void then
					output ("  SYSTEM %"")
					output (a_system_id)
					output ("%">%N")
				else
					output ("  PUBLIC %"")
					output (a_public_id)
					output ("%" %"")
					output (a_system_id)
					output ("%">%N")
				end
			elseif a_public_id /= Void then -- for HTML
				output ("  PUBLIC %"")
				output (a_public_id)
				output ("%">%N")
			end
		end

	bad_character_code (a_character_string: STRING): INTEGER is
			-- Code point of first bad character in `a_character_string' (or 0)
		require
			string_not_void: a_character_string /= Void
		local
			an_index, a_code: INTEGER
			finished: BOOLEAN
		do
			from
				an_index := 1
			variant
				a_character_string.count + 1 - an_index
			until
				finished or else an_index > a_character_string.count
			loop
				a_code := a_character_string.item_code (an_index)
				if a_code > 127 then
					if outputter.is_bad_character_code (a_code) then
						Result := a_code
						finished := True
					end
				end
				an_index := an_index + 1
			end
		end

	close_start_tag (a_name: STRING; empty_tag: BOOLEAN) is
		-- Close start tag.
		require
			name_not_void: a_name /= Void
			start_tag_open: is_open_start_tag
		do
			if empty_tag then
				output (empty_element_tag_closer (a_name))
			else
				output (">")
			end
			is_open_start_tag := False
		ensure
			start_tag_not_open: not is_open_start_tag
		end

	empty_element_tag_closer (a_name: STRING): STRING is
			-- String to close an empty tag
		require
			name_not_void: a_name /= Void
		do
			Result := "/>"
		ensure
			empty_element_tag_closer_not_void: Result /= Void
		end

	make_url_attributes is
			-- Build sets for determining URL-valued attributes
		once
			set_url_attribute ("form", "action")
			set_url_attribute ("body", "background")
			set_url_attribute ("q", "cite")
			set_url_attribute ("blockquote", "cite")
			set_url_attribute ("del", "cite")
			set_url_attribute ("ins", "cite")
			set_url_attribute ("object", "classid")
			set_url_attribute ("object", "codebase")
			set_url_attribute ("applet", "codebase")
			set_url_attribute ("object", "data")
			set_url_attribute ("object", "datasrc")
			set_url_attribute ("button", "datasrc")
			set_url_attribute ("div", "datasrc")
			set_url_attribute ("input", "datasrc")
			set_url_attribute ("select", "datasrc")
			set_url_attribute ("span", "datasrc")
			set_url_attribute ("table", "datasrc")
			set_url_attribute ("textarea", "datasrc")
			set_url_attribute ("a", "href")
			set_url_attribute ("a", "name")
			set_url_attribute ("area", "href")
			set_url_attribute ("link", "href")
			set_url_attribute ("base", "href")
			set_url_attribute ("img", "longdesc")
			set_url_attribute ("frame", "longdesc")
			set_url_attribute ("iframe", "longdesc")
			set_url_attribute ("head", "profile")
			set_url_attribute ("script", "src")
			set_url_attribute ("script", "for")
			set_url_attribute ("input", "src")
			set_url_attribute ("frame", "src")
			set_url_attribute ("iframe", "src")
			set_url_attribute ("img", "src")
			set_url_attribute ("img", "usemap")
			set_url_attribute ("input", "usemap")
			set_url_attribute ("object", "usemap")
			set_url_attribute ("object", "archive")
		end

	set_url_attribute (an_element, an_attribute: STRING) is
			-- Mark `an_attribute' as url-valued when used with `an_element'.
		require
			element_name_not_void: an_element /= Void
			attribute_name_not_void: an_attribute /= Void
		do
			if not url_attributes_set.has (an_attribute.as_lower) then
				url_attributes_set.put (an_attribute.as_lower)
			end
			url_combinations_set.put ((an_element + "+" + an_attribute).as_lower)
		end

	unescaped_html_characters: DS_HASH_SET [CHARACTER] is
			-- Characters to escape for fn:iri-to-uri()
		local
			an_index: INTEGER
		once
			create Result.make (95)
			from an_index := 32 until an_index > 126 loop
				Result.force (INTEGER_.to_character (an_index))
				an_index := an_index + 1
			end
		end

	escaped_url (a_url: STRING): STRING is
			-- Escaped version of `a_url'.
		require
			url_not_void: a_url /= Void
		do

			-- NULs are added to prevent further escaping

			Result := STRING_.concat ("%U", escape_custom (utf8.to_utf8 (a_url), unescaped_html_characters, False))
			Result := STRING_.appended_string (Result, "%U")
		end

invariant

	outputter_not_void: is_output_open implies outputter /= Void
	encoder_factory_not_void: encoder_factory /= Void

end

