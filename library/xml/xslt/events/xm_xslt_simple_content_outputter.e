indexing
	description:

		"Objects that output simple content."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SIMPLE_CONTENT_OUTPUTTER	

inherit
	
	XM_XSLT_OUTPUTTER	

	XM_XPATH_ERROR_TYPES

	XM_XPATH_AXIS

create

	make

feature {NONE} -- Initialization

	make (a_buffer: STRING; a_transformer: XM_XSLT_TRANSFORMER) is
			-- Establish invariant.
		require
			buffer_not_void: a_buffer /= Void
			transformer_not_void: a_transformer /= Void
		do
			buffer := a_buffer
			transformer := a_transformer
			system_id := ""
		ensure
			buffer_set: buffer = a_buffer
			transformer_set: transformer = a_transformer
		end
		
feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			create an_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "SERIALIZATION_ERROR", Dynamic_error)
			transformer.report_fatal_error (an_error, Void)
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element.
		do
			report_recoverable_error
			ignored_elements := ignored_elements + 1
			previous_atomic := False
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do
			do_nothing
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		do
			report_recoverable_error
			previous_atomic := False
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		do
			do_nothing
		end

	end_element is
			-- Notify the end of an element.
		do
			ignored_elements := ignored_elements - 1
			previous_atomic := False
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
		do
			if ignored_elements = 0 then
				buffer := STRING_.appended_string (buffer, chars)
			end
			previous_atomic := False
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		do
			report_recoverable_error
			previous_atomic := False
		end
	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
		do
			report_recoverable_error
			previous_atomic := False
		end

	end_document is
			-- Notify the end of the document.
		do
			previous_atomic := False
		end

	append_item (an_item: XM_XPATH_ITEM) is
			-- Output an item (atomic value or node) to the sequence.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			if an_item.is_atomic_value then
				if previous_atomic then notify_characters (" ", 0) end
				notify_characters (an_item.as_atomic_value.string_value, 0)
				previous_atomic := True
			elseif an_item.is_document then
				from
					an_iterator := an_item.as_document.new_axis_iterator (Child_axis); an_iterator.start
				until
					an_iterator.after
				loop
					append_item (an_iterator.item)
					an_iterator.forth
				end
				
				-- Now free the document from memory
				
				shared_name_pool.remove_document_from_pool (an_item.as_document.document_number)						
			else
				from
					an_iterator := an_item.typed_value; an_iterator.start
				until
					an_iterator.after
				loop
					notify_characters (an_iterator.item.string_value, 0)
					an_iterator.forth
				end
				previous_atomic := False
			end
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		do
			do_nothing
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR) is
			-- Set the locator.
		do
			do_nothing
		end

feature {NONE} -- Implementation

	buffer: STRING
			-- Output buffer

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	ignored_elements: INTEGER
			-- Nested depth of elements ignored

	report_recoverable_error is
			-- report a recoverable erro
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			create an_error.make_from_string ("Non-text output nodes are ignored when writing a text node, attribute, comment, or PI", Gexslt_eiffel_type_uri, "SERIALIZATION_ERROR", Dynamic_error)
			transformer.report_recoverable_error (an_error, Void)
		end
	
invariant

	buffer_not_void: buffer /= Void
	transformer_not_void: transformer /= Void

end
