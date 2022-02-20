note

	description:

		"Emitters that write XML."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_XML_EMITTER

inherit

	XM_XSLT_EMITTER
		redefine
			is_xml_emitter, as_xml_emitter
		end

	XM_UNICODE_CHARACTERS_1_1

	ST_STRING_ROUTINES
		export {NONE} all end

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

	make (a_serializer: XM_XSLT_SERIALIZER; an_outputter: XM_OUTPUT; some_output_properties: XM_XSLT_OUTPUT_PROPERTIES)
			-- Initialize `Current'.
		require
			serializer_not_void: a_serializer /= Void
			outputter_not_void: an_outputter /= Void
			output_properties_not_void: some_output_properties /= Void
		do
			serializer := a_serializer
			raw_outputter := an_outputter
			output_properties := some_output_properties
			is_empty := True
			create element_qname_stack.make_default
			element_qname_stack.set_equality_tester (string_equality_tester)
			create name_lookup_table.make_filled (Void, 0, name_lookup_table_size - 1)
			make_specials
			base_uri := "" -- TODO - set `base_uri'
			encoder_factory := serializer.encoder_factory
		ensure
			serializer_set: serializer = a_serializer
			outputter_set: raw_outputter = an_outputter
			output_properties_set: output_properties = some_output_properties
		end

feature -- Conversion

	is_xml_emitter: BOOLEAN
			-- Is `Current' an XML emitter?
		do
			Result := True
		end

	as_xml_emitter: XM_XSLT_XML_EMITTER
			-- `Current' seen as an XML emitter
		do
			Result := Current
		end

feature -- Events

	open
			-- Notify start of event stream.
		do
			is_open := True
		end

	start_document
			-- New document
		do
			is_document_started := True
			--  The opening of the output
			--  file is deferred until some content is written to it.
		end

	end_document
			-- Notify the end of the document
		do
			is_document_started := False
		end

	close
			-- Notify end of event stream.
		do
			if not is_error and not is_output_open and not is_no_declaration_on_close then
				open_document
			end
			if attached outputter as l_outputter then
				l_outputter.outputter.flush
			end
			is_open := False
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		local
			l_display_name: detachable STRING
			l_system_id, l_public_id: detachable STRING
			l_bad_character_code: NATURAL_32
			l_message: STRING
		do
			if not is_error then
				if not is_output_open then
					open_document
				end

				if is_well_formed_document_required and not is_empty and element_qname_stack.is_empty then
					serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("More than one document element present", Xpath_errors_uri, "SEPM0004", Dynamic_error))
				end
				-- Have we've seen this name before?

				if a_name_code < name_lookup_table_size then
					l_display_name := name_lookup_table.item (a_name_code)
				end
				if l_display_name = Void then
					l_display_name := shared_name_pool.display_name_from_name_code (a_name_code)
					if a_name_code < name_lookup_table_size then
						name_lookup_table.put (l_display_name, a_name_code)
					end
					l_bad_character_code := bad_character_code (l_display_name)
					if l_bad_character_code /= 0 then
						l_message := "Element name contains a character (decimal" + l_bad_character_code.out + ") not available in the selected encoding"
						serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (l_message, Xpath_errors_uri, "SERE0008", Dynamic_error))
					end
				end
				if not is_error then
					element_qname_stack.force (l_display_name)
					current_element_name_code := a_name_code
					if is_empty then
						l_system_id := output_properties.doctype_system
						l_public_id := output_properties.doctype_public
						if l_system_id /= Void then
							is_well_formed_document_required := True

							write_doctype (l_display_name, l_system_id, l_public_id)
						end
						is_empty := False
					end
					if is_open_start_tag then
						close_start_tag (l_display_name, False)
					end
					output ("<")
					output (l_display_name)
					is_open_start_tag := True
				end
			end
			mark_as_written
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace declaration.
		local
			a_namespace_prefix, a_namespace_uri: STRING
			a_bad_character: NATURAL_32
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
						serializer.report_fatal_error (an_error)
					else
						if allow_undeclare_prefixes or else a_namespace_uri.count /= 0 then
							output (" ")
							output_attribute (current_element_name_code, STRING_.concat ("xmlns:", a_namespace_prefix), a_namespace_uri, 0)
						end
					end
				end
			end
			mark_as_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		local
			a_display_name: detachable STRING
			a_bad_character: NATURAL_32
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
						serializer.report_fatal_error (an_error)
					end
				end
				if not is_error then
					output (" ")
					if not is_error then output_attribute (current_element_name_code, a_display_name, a_value, properties) end
				end
			end
			mark_as_written
		end


	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			-- Don't add ">" to the start tag until we know whether the element has content.
			mark_as_written
		end

	end_element
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
			mark_as_written
		end

	notify_characters (a_chars: STRING; a_properties: INTEGER)
			-- Notify character data.
		local
			l_bad_character: NATURAL_32
		do
			debug ("XSLT stripper")
				std.error.put_string ("Is start tag open? " + is_open_start_tag.out)
				std.error.put_new_line
			end
			if not is_error then
				if not is_output_open then
					open_document
					if not is_all_whitespace (a_chars) then
						if is_well_formed_document_required or output_properties.doctype_system /= Void then
							serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Topl-level text node present when well-formed document is required", Xpath_errors_uri, "SEPM0004", Dynamic_error))
						end
					end
				end
				if is_well_formed_document_required and element_qname_stack.is_empty and not is_all_whitespace (a_chars) then
					serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Topl-level text node present when well-formed document is required", Xpath_errors_uri, "SEPM0004", Dynamic_error))
				end
				if is_open_start_tag then
					close_start_tag ("", False)
				end
				if are_no_special_characters (a_properties) then
					output (a_chars)
				elseif not is_output_escaping_disabled (a_properties) then
					output_escape (a_chars, False)
				else
					l_bad_character := bad_character_code (a_chars)
					if l_bad_character = 0 then
						output (a_chars)
					else

						-- Ignore disable output escaping with characters
                  --  that are not available in the target encoding

						output_escape (a_chars, False)
					end
				end
			end
			mark_as_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		local
			l_string, l_message: STRING
			l_bad_character_code: NATURAL_32
			l_error: XM_XPATH_ERROR_VALUE
		do
			if not is_error then
				if not is_output_open then
					open_document
				end
				if is_open_start_tag then
					close_start_tag ("", False)
				end
				l_bad_character_code := bad_character_code (a_name)
				if l_bad_character_code > 0 then
					l_message := "Processing instruction target contains a character (decimal" + l_bad_character_code.out + ") not available in the selected encoding"
					create l_error.make_from_string (l_message, Xpath_errors_uri, "SERE0008", Dynamic_error)
					serializer.report_fatal_error (l_error)
				else
					l_string := STRING_.concat ("<?", a_name)
					l_bad_character_code := bad_character_code (a_data_string)
					if l_bad_character_code > 0 then
						l_message := "Processing instruction data contains a character (decimal" + l_bad_character_code.out + ") not available in the selected encoding"
						create l_error.make_from_string (l_message, Xpath_errors_uri, "SERE0008", Dynamic_error)
						serializer.report_fatal_error (l_error)
					else
						if a_data_string.count > 0 then
							l_string := STRING_.appended_string (l_string, " ")
							l_string := STRING_.appended_string (l_string, a_data_string)
						end
						l_string := STRING_.appended_string (l_string, "?>")
						output (l_string)
					end
				end
			end
			mark_as_written
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		local
			l_bad_character_code: NATURAL_32
			l_message: STRING
			l_error: XM_XPATH_ERROR_VALUE
		do
			if not is_error then
				if not is_output_open then
					open_document
				end
				if is_open_start_tag then
					close_start_tag ("", False)
				end
				output ("<!--")
				l_bad_character_code := bad_character_code (a_content_string)
				if l_bad_character_code > 0 then
					l_message := "Comment contains a character (decimal" + l_bad_character_code.out + ") not available in the selected encoding"
					create l_error.make_from_string (l_message, Xpath_errors_uri, "SERE0008", Dynamic_error)
					serializer.report_fatal_error (l_error)
				else
					if not is_error then
						output (a_content_string)
					end
					if not is_error then
						output ("-->")
					end
				end
			end
			mark_as_written
		end


feature {XM_XSLT_HTML_INDENTER} -- Restricted

	element_qname_stack: DS_ARRAYED_STACK [STRING]
			-- QNames of open elements in scope

feature {NONE} -- Implementation

	is_well_formed_document_required: BOOLEAN
			-- Do serialization parameters imply a well-formed document is required?

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

	encoding: detachable STRING
			-- Actual encoding to be used

	current_element_name_code: INTEGER
			-- Name code of the current element

	is_hex_preferred: BOOLEAN
			-- When writing characters entities, is hexadecimal notation preferred?

	allow_undeclare_prefixes: BOOLEAN
			-- Are namespace undeclarations allowed?

	name_lookup_table: ARRAY [detachable STRING]
			-- Cache for frequent QNames, indexed by name code

	name_lookup_table_size: INTEGER
			-- Size of `name_lookup_table'

	warning_issued: BOOLEAN
			-- Has a warning for disabled character escaping problems been issued?

	empty_tags_set: DS_HASH_SET [STRING]
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

	is_empty_tag (a_tag: STRING): BOOLEAN
			-- Is `a_tag' an empty tag?
		require
			tag_not_void: a_tag /= Void
		do
			Result := empty_tags_set.has (a_tag.as_lower)
		end

	specials_in_text: ARRAY [BOOLEAN]
			-- Lookup table for ASCII characters that need escaping in text
		once
			create Result.make_filled (False, 0, 127)
		end

	specials_in_attributes: ARRAY [BOOLEAN]
			-- Lookup table for ASCII characters that need escaping in attributes
		once
			create Result.make_filled (False, 0, 127)
		end

	make_specials
			-- Initialize `specials_in_text' and `specials_in_attributes'.
		local
			i: INTEGER
		once
			from
				i := 0
			until
				i = 32
			loop
				-- All are allowed in XML 1.1 as character references
				specials_in_text.put (True, i)
				specials_in_attributes.put (True, i)
				i := i + 1
			end
			specials_in_text.put (False, 9) -- TAB
			specials_in_text.put (False, 10) -- LF
			specials_in_text.put (True, 60) -- '<'
			specials_in_text.put (True, 62) -- '>'
			specials_in_text.put (True, 38) -- '&'
			specials_in_attributes.put (True, 60) -- '<'
			specials_in_attributes.put (True, 62) -- '>'
			specials_in_attributes.put (True, 38) -- '&'
			specials_in_attributes.put (True, 34) -- '"'
		end

	write_declaration
			-- Write XML declaration
		require
			not_yet_written: not is_declaration_written
		local
			l_omit: BOOLEAN
			l_version: STRING
		do
			check
				attached outputter as l_outputter
				attached encoding as l_encoding
			then
				if l_outputter.byte_order_mark_permitted then
					if output_properties.byte_order_mark_required
						or (not output_properties.is_byte_order_mark_set and l_outputter.is_byte_order_mark_default) then
						output_ignoring_error (l_outputter.byte_order_mark)
					end
				end
				l_omit := output_properties.omit_xml_declaration
				if l_omit and then
					not (STRING_.same_string (l_encoding, "UTF-8") or else
					STRING_.same_string (l_encoding, "UTF-16") or else
					STRING_.same_string (l_encoding, "US-ASCII") or else
					STRING_.same_string (l_encoding, "ASCII"))
				then
					l_omit := False
				end

				l_version := output_properties.version
				if l_version.same_string ("1.0") and output_properties.undeclare_prefixes then
					serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("XML version 1.0 does not permit undeclaring namespaces",
						Xpath_errors_uri, "SEPM0010", Dynamic_error))
				elseif not l_omit then
					if l_version.same_string ("1.0") or l_version.same_string ("1.1") then
						-- ok
					else
						serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("XML version must be 1.0 or 1.1", Xpath_errors_uri, "SEUS0013", Dynamic_error))
					end
					if not serializer.is_error then
						output ("<?xml version=%"" + l_version + "%" " + "encoding=%"" + l_encoding + "%"")
						if attached output_properties.standalone as l_output_properties_standalone then
							is_well_formed_document_required := True
							output (" standalone=%"" + l_output_properties_standalone + "%"")
						end
						output ("?>")

						-- Don't write a newline character: it's wrong if the output is an
						--  external general parsed entity

					end
				else
					if not l_version.same_string ("1.0") and output_properties.doctype_system /= Void then
						serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("XML declaration may not be omitted when version is not 1.0 and a DOCTYPE has been requested",
							Xpath_errors_uri, "SEPM0009", Dynamic_error))
					else
						if output_properties.standalone /= Void then
							serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("XML declaration may not be omitted when standalone=yes",
							Xpath_errors_uri, "SEPM0009", Dynamic_error))
						end
					end
				end
				is_declaration_written := True
			end
		ensure
			written: is_declaration_written
		end

	output (a_character_string: STRING)
			-- Output `a_character_string'.
		require
			document_opened: is_output_open
			valid_string: attached outputter as l_outputter and then l_outputter.is_valid_string (a_character_string)
		do
			check precondition_document_opened: attached outputter as l_outputter then
				if not is_error then
					l_outputter.output (a_character_string)
					if l_outputter.is_error then
						on_error ("Failed to write to output stream")
					end
				end
			end
		end

	output_ignoring_error (a_character_string: STRING)
			-- Output `a_character_string', ignoring any error.
		require
			document_opened: is_output_open
			valid_string: attached outputter as l_outputter and then l_outputter.is_valid_string (a_character_string)
		do
			check precondition_is_output_open: attached outputter as l_outputter then
				l_outputter.output_ignoring_error (a_character_string)
			end
		end

	output_attribute (a_element_name_code: INTEGER; a_attribute_qname: STRING; a_value: STRING; a_properties: INTEGER)
			-- Output attribute.
		require
			attribute_name_is_qname: a_attribute_qname /= Void and then is_qname (a_attribute_qname)
			value_not_void: a_value /= Void
			document_opened: is_output_open
		local
			l_delimiter: STRING
		do
			if not is_error then
				output (a_attribute_qname)
				if not is_error then
					if are_no_special_characters (a_properties) then
						output ("=")
						if not is_error then output ("%"") end
						if not is_error then output (a_value) end
						if not is_error then output ("%"") end
					else
						if a_value.index_of ('%"', 1) > 0 then
							l_delimiter := "'"
						else
							l_delimiter := "%""
						end
						output ("=")
						output (l_delimiter)
						if not is_error then output_escape (a_value, True) end
						if not is_error then output (l_delimiter) end
					end
				end
			end
		end

	output_escape (a_character_string: STRING; a_is_attribute: BOOLEAN)
			-- Output `a_character_string', escaping special characters.
		require
			string_not_void: a_character_string /= Void
			document_opened: is_output_open
		local
			l_disabled: BOOLEAN
			l_start_index, l_beyond_index: INTEGER
			l_code: NATURAL_32
			l_special_characters: ARRAY [BOOLEAN]
		do
			if a_is_attribute then
				l_special_characters := specials_in_attributes
			else
				l_special_characters := specials_in_text
			end
			from
				l_start_index := 1
			until
				l_start_index > a_character_string.count
			loop
				l_beyond_index := maximal_ordinary_string (a_character_string, l_start_index, l_special_characters)
				if l_beyond_index > l_start_index then
					output (a_character_string.substring (l_start_index, l_beyond_index - 1))
				end
				if l_beyond_index <= a_character_string.count then
					l_code := a_character_string.code (l_beyond_index)
					if l_code = 0 then -- enable/disable escaping toggle
						l_disabled := not l_disabled
					elseif l_disabled then
						output (a_character_string.substring (l_beyond_index, l_beyond_index))
					elseif l_code > 127 then -- non-ASCII
						output_character_reference (l_code)
					else -- ASCII character needs escaping
						if l_code = 60 then
							output ("&lt;")
						elseif l_code = 62 then
							output ("&gt;")
						elseif l_code = 38 then
							output ("&amp;")
						elseif l_code = 34 then
							output ("&#34;")
						elseif l_code = 10 then
							output ("&#xA;")
						elseif l_code = 13 then
							output ("&#xD;")
						elseif l_code = 9 then
							output ("&#9;")
						else
							-- C0 control code
							output_character_reference (l_code)
						end
					end
				end
				l_start_index := l_beyond_index + 1
			variant
				a_character_string.count + 2 - l_start_index
			end
		end

	maximal_ordinary_string (a_character_string: STRING; a_start_index: INTEGER; a_special_characters: ARRAY [BOOLEAN]): INTEGER
			-- Maximal sequence of ordinary characters
		require
			string_not_void: a_character_string /= Void
			a_special_characters_not_void: a_special_characters /= Void
			strictly_positive_start_index: a_start_index > 0
			document_opened: is_output_open
		local
			l_index: INTEGER
			l_code: NATURAL_32
			l_finished: BOOLEAN
		do
			check attached outputter as l_outputter then
				from
					l_index := a_start_index
				until
					l_finished or l_index > a_character_string.count
				loop
					l_code := a_character_string.code (l_index)
					if l_code < 127 then -- ASCII
						if a_special_characters.item (l_code.to_integer_32) then
							l_finished := True
						else
							l_index := l_index + 1
						end
					elseif l_code < 160 then -- required as character references
						l_finished := True
					elseif l_code = 8232  then -- Line Separator
						l_finished := True
					elseif l_outputter.is_bad_character_code (l_code) then
						l_finished := True
					else
						l_index := l_index + 1
					end
				end
				Result := l_index
			end
		end

	output_character_reference (a_code: NATURAL_32)
			-- Output a character reference.
		require
			strictly_positive_code: a_code > 0
			document_opened: is_output_open
		local
			l_string: STRING
		do
			if not is_error then
				create l_string.make (10)
				if is_hex_preferred then
					l_string := "&#x"
					l_string.append_string ({KL_NATURAL_32_ROUTINES}.to_hexadecimal (a_code, True))
				else
					l_string := "&#"
					l_string.append_string (a_code.out)
				end
				l_string.append_character (';')
				output (l_string)
			end
		end

	open_document
			-- Open output document.
		require
			document_not_yet_opened: not is_output_open
		local
			l_character_representation: STRING
			l_encoding: like encoding
		do
			is_well_formed_document_required := False
			l_encoding := output_properties.encoding.as_upper
			encoding := l_encoding

			outputter := encoder_factory.outputter (l_encoding, raw_outputter)
			if outputter = Void then
				serializer.report_recoverable_error (create {XM_XPATH_ERROR_VALUE}.make_from_string (STRING_.concat ("Trying UTF-8 as unable to open output stream in encoding ", l_encoding),
					Xpath_errors_uri, "SESU0007", Dynamic_error))
				if not serializer.is_error then
					outputter := encoder_factory.outputter (l_encoding, raw_outputter)
					if outputter = Void then
						serializer.report_fatal_error (create {XM_XPATH_ERROR_VALUE}.make_from_string ("Failed to recover", Xpath_errors_uri, "SESU0007", Dynamic_error))
					end
				end
			end
			if serializer.is_error then
				is_error := True
			else
				is_output_open := True

				if STRING_.same_string (output_properties.version, "1.1") then
					allow_undeclare_prefixes := output_properties.undeclare_prefixes
				end
			end
			if not is_error then
				if not is_declaration_written then
					write_declaration
				end
				if not is_error then
					l_character_representation := output_properties.character_representation
					if STRING_.same_string (l_character_representation, "hex") then
						is_hex_preferred := True
					elseif STRING_.same_string (l_character_representation, "decimal") then
						on_error ("Illegal value for gexslt:character-representation: " + l_character_representation)
					end
				end
			end
		ensure
			document_opened: is_error or is_output_open
		end

	write_doctype (a_type: STRING; a_system_id, a_public_id: detachable STRING)
			-- Write DOCTYPE.
		require
			doctype_not_void: a_type /= Void
		do
			if is_declaration_written then
				output ("%N")
			end
			output ("<!DOCTYPE ")
			output (a_type)
			if a_system_id /= Void then
				if a_public_id = Void then
					output (" SYSTEM %"")
					output (a_system_id)
					output ("%">%N")
				else
					output (" PUBLIC %"")
					output (a_public_id)
					output ("%" %"")
					output (a_system_id)
					output ("%">%N")
				end
			elseif a_public_id /= Void then -- for HTML
				output (" PUBLIC %"")
				output (a_public_id)
				output ("%">%N")
			end
		end

	bad_character_code (a_character_string: STRING): NATURAL_32
			-- Code point of first bad character in `a_character_string' (or 0)
		require
			string_not_void: a_character_string /= Void
		local
			l_index: INTEGER
			a_code: NATURAL_32
			l_finished: BOOLEAN
		do
			from
				l_index := 1
			until
				l_finished or else l_index > a_character_string.count
			loop
				a_code := a_character_string.code (l_index)
				if a_code > 127 then
					check attached outputter as l_outputter then
						if l_outputter.is_bad_character_code (a_code) then
							Result := a_code
							l_finished := True
						end
					end
				end
				l_index := l_index + 1
			variant
				a_character_string.count + 1 - l_index
			end
		end

	close_start_tag (a_name: STRING; empty_tag: BOOLEAN)
		-- Close start tag.
		require
			name_not_void: a_name /= Void
			start_tag_open: is_open_start_tag
		do
			if empty_tag then
				output (empty_element_tag_closer (a_name, current_element_name_code))
			else
				output (">")
			end
			is_open_start_tag := False
		ensure
			start_tag_not_open: not is_open_start_tag
		end

	empty_element_tag_closer (a_name: STRING; a_name_code: INTEGER): STRING
			-- String to close an empty tag
		require
			name_not_void: a_name /= Void
			strictly_positive_name_code: a_name_code > 0
		do
			Result := "/>"
		ensure
			empty_element_tag_closer_not_void: Result /= Void
		end

invariant

	outputter_not_void: is_output_open implies outputter /= Void
	encoder_factory_not_void: encoder_factory /= Void

end

