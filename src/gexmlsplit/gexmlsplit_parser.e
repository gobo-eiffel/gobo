indexing

	description:

		"Gobo Eiffel XML Spliter Parser"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT_PARSER

inherit

	UT_STRING_ROUTINES
		export {NONE} all end

	XM_CALLBACKS_FILTER
		redefine
			on_start_tag,
			on_start_tag_finish,
			on_attribute,
			on_end_tag
		end

	UC_UNICODE_FACTORY
		export {NONE} all end

creation

	make

feature

	make (a_gexmlsplit_dispatcher: GEXMLSPLIT_DISPATCHER) is
			-- create instance of gexmlsplit parser
			-- notifications will go to `a_gexmlsplit_dispatcher'
		require
			a_gexmlsplit_dispatcher_not_void: a_gexmlsplit_dispatcher /= Void
		do
			make_null
			gexmlsplit_dispatcher := a_gexmlsplit_dispatcher
		ensure
			a_gexmlsplit_dispatcher_set: gexmlsplit_dispatcher = a_gexmlsplit_dispatcher
		end


feature {NONE}

	gexmlsplit_dispatcher: GEXMLSPLIT_DISPATCHER
			-- dispatcher to notify of found "document" elements

	current_element_name: UC_STRING
			-- current element name in input document

	current_href_value: UC_STRING
			-- current "href" attribute of "document" element in
			-- input document

feature -- XML Element and Attibute names



	uc_document: UC_STRING is
			-- constant for the "document" element
		once
			Result := new_unicode_string ("document")
		ensure
			uc_document_not_void: Result /= Void
			uc_document_not_empty: Result.count > 0
		end

	uc_href: UC_STRING is
			-- constant for the "href" attribute of the "document" element
		once
			Result := new_unicode_string ("href")
		ensure
			uc_file_name_not_void: Result /= Void
			uc_file_name_not_empty: Result.count > 0
		end

feature -- XML Callback handling

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- check for "element" start tags, be sure not to let
			-- them through to the dispatcher, as they should not
			-- appear in any of the output documents
		do
			current_element_name := clone (a_local_part)
			current_href_value := Void

			if not (a_local_part.is_equal (uc_document)) then
					Precursor (a_namespace, a_prefix, a_local_part)
			end
		end

	on_attribute (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING; a_value: UC_STRING) is
			-- check for "href" attribute of "element" start tags, be
			-- sure not to let any attributes of element "document"
			-- through to the dispatcher, as they should not appear in
			-- any of the output documents
		do
			if current_element_name.is_equal (uc_document) then
				if a_local_part.is_equal (uc_href) then
					current_href_value := clone (a_value)
				end
			else
				Precursor (a_namespace, a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish is
			-- check for "element" end tags and be sure to not let
			-- them through to the dispatcher as they should not
			-- appear in any of the output documents.
		local
			a_out_file: KL_TEXT_OUTPUT_FILE
		do
			if current_href_value /= Void then
				!! a_out_file.make (current_href_value)
				a_out_file.open_write
				if a_out_file.is_open_write then
					gexmlsplit_dispatcher.put (a_out_file)
				else
					-- TODO: report error
				end
			else
				Precursor
			end
		end

	on_end_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- check of "element" end tags and be sure to not let
			-- them through to the dispatcher as they should not
			-- appear in any of the output documents.
		do
			if a_local_part.is_equal (uc_document) then
				gexmlsplit_dispatcher.remove
			else
				Precursor (a_namespace, a_prefix, a_local_part)
			end
		end

end
