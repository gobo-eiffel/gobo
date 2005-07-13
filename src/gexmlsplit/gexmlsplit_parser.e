indexing

	description:

		"Gobo Eiffel XML Splitter Parser"

	system: "Gobo Eiffel XML Splitter"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEXMLSPLIT_PARSER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_start_tag,
			on_start_tag_finish,
			on_attribute,
			on_end_tag
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_gexmlsplit_dispatcher: GEXMLSPLIT_DISPATCHER) is
			-- Create a new gexmlsplit parser.
			-- Notifications will go to `a_gexmlsplit_dispatcher'.
		require
			a_gexmlsplit_dispatcher_not_void: a_gexmlsplit_dispatcher /= Void
		do
			make_null
			gexmlsplit_dispatcher := a_gexmlsplit_dispatcher
		ensure
			a_gexmlsplit_dispatcher_set: gexmlsplit_dispatcher = a_gexmlsplit_dispatcher
		end

feature -- XML Callback handling

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Check for "element" start tags, be sure not to let
			-- them through to the dispatcher, as they should not
			-- appear in any of the output documents.
		do
			current_element_name := STRING_.cloned_string (a_local_part)
			current_href_value := Void

			if not STRING_.same_string (a_local_part, uc_document) then
				Precursor (a_namespace, a_prefix, a_local_part)
			end
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Check for "href" attribute of "element" start tags, be
			-- sure not to let any attributes of element "document"
			-- through to the dispatcher, as they should not appear in
			-- any of the output documents.
		do
			if STRING_.same_string (current_element_name, uc_document) then
				if STRING_.same_string (a_local_part, uc_href) then
					current_href_value := STRING_.cloned_string (a_value)
				end
			else
				Precursor (a_namespace, a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish is
			-- Check for "element" end tags and be sure to not let
			-- them through to the dispatcher as they should not
			-- appear in any of the output documents.
		do
			if current_href_value /= Void then
				gexmlsplit_dispatcher.put (current_href_value)
			else
				Precursor
			end
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Check of "element" end tags and be sure to not let
			-- them through to the dispatcher as they should not
			-- appear in any of the output documents.
		do
			if STRING_.same_string (a_local_part, uc_document) then
				gexmlsplit_dispatcher.remove
			else
				Precursor (a_namespace, a_prefix, a_local_part)
			end
		end

feature {NONE} -- Access

	gexmlsplit_dispatcher: GEXMLSPLIT_DISPATCHER
			-- Dispatcher to notify of found "document" elements

	current_element_name: STRING
			-- Current element name in input document

	current_href_value: STRING
			-- Current "href" attribute of "document" element in
			-- input document

feature {NONE} -- XML Element and Attibute names

	uc_document: STRING is
			-- Constant for the "document" element
		once
			Result := "document"
		ensure
			uc_document_not_void: Result /= Void
			uc_document_not_empty: Result.count > 0
		end

	uc_href: STRING is
			-- Constant for the "href" attribute of the "document" element
		once
			Result := "href"
		ensure
			uc_file_name_not_void: Result /= Void
			uc_file_name_not_empty: Result.count > 0
		end

end
