note

	description:

		"Emitters that write plain text."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_TEXT_EMITTER

inherit

	XM_XSLT_XML_EMITTER
		redefine
			open, start_document, notify_characters, start_element,
			notify_namespace, notify_attribute, end_element,
			notify_processing_instruction, notify_comment,
			write_declaration
		end

create

	make

feature -- Events

	start_document
			-- New document
		do
			is_document_started := True
		end

	open
			-- Notify start of event stream.
		do
			-- Prevent `open_document' from writing an XML declaration.

			is_declaration_written := True
			open_document

			if is_output_open then

				-- Write a BOM if requested

				check is_output_open: attached outputter as l_outputter then
					if l_outputter.byte_order_mark_permitted then
						if output_properties.byte_order_mark_required
							or (not output_properties.is_byte_order_mark_set and l_outputter.is_byte_order_mark_default) then
							output_ignoring_error (l_outputter.byte_order_mark)
						end
					end
				end
			end
			is_open := True
		end

	notify_characters (chars: STRING; properties: INTEGER)
			-- Notify character data.
			-- Special characters are not escaped
		local
			a_bad_character: NATURAL_32
			a_message: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if not is_error then
				if not is_output_open then open_document end
				if not are_no_special_characters (properties) then
					a_bad_character := bad_character_code (chars)
					if a_bad_character = 0 then
						output (chars)
					else
						a_message := STRING_.concat ("Output character not available in this encoding (decimal ", a_bad_character.out)
						a_message := STRING_.appended_string (a_message, ")")
						create an_error.make_from_string (a_message, Xpath_errors_uri, "XTDE1190",Dynamic_error)
						if not base_uri.is_empty then an_error.set_location (base_uri, 0) end
						serializer.report_fatal_error (an_error)
						is_error := True
					end
				else
					output (chars)
				end
			end
			mark_as_written
		end

	-- Remaining events are no-ops

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		do
			mark_as_written
		end

	end_element
			-- Notify the end of an element.
		do
			mark_as_written
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace declaration.
		do
			mark_as_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute.
		do
			mark_as_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		do
			mark_as_written
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
		do
			mark_as_written
		end

feature {NONE} -- Implementation

	write_declaration
			-- Write XML declaration
		do
			-- No declaration is ever written for text method.
		end

end

