indexing

	description:
		"Test Expat callbacks through well-known XML file."

	library: "Gobo Eiffel XML Library test"
	copyright: "Copyright (c) 2002, Berend de Boer and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class

	TEST_CALLBACK

inherit

	TS_TEST_CASE
		rename
			name as test_name
		redefine
			set_up
		end

	XM_EXPAT_PARSER
		rename
			make as make_expat
		export
			{ANY} all
		redefine
			on_element_declaration,
			on_attribute_declaration,
			on_xml_declaration,
			on_entity_declaration,
			on_start_tag,
			on_end_tag,
			on_content,
			on_processing_instruction,
			on_comment,
			on_doctype,
			on_end_doctype,
			on_notation_declaration,
			on_start_namespace_declaration,
			on_end_namespace_declaration,
			on_not_standalone
		end

	KL_IMPORTED_STRING_ROUTINES

feature -- Tests

	set_up is
		do
			make_expat
		end

	test_callback is
		do
			-- report version
			print ("Expat version: ")
			print (version)
			print ("%N")

			-- also it should be namespace aware
			parse_from_file_name ("test.xml")
			if not is_correct then
				print ("XML parsing failed with: ")
				print (last_error_description)
				print ("%N")
			end

			-- report results
			assert("on_xml_declaration called.", on_xml_declaration_called)
			if not on_xml_declaration_matches then
				print ("on_xml_declaration did not match input.%N")
			end

			if not on_doctype_called then
				print ("on_doctype not called.%N")
			end
			if not on_doctype_matches then
				print ("on_doctype did not match input.%N")
			end
			if not on_end_doctype_called then
				print ("on_end_doctype not called.%N")
			end

			if on_not_standalone_called then
				print ("on_not_standalone unexpectedly called.%N")
			end

			if not on_element_declaration_called then
				print ("on_element_declaration not called.%N")
			end
			if not on_element_declaration_matches then
				print ("on_element_declaration did not match input.%N")
			end

			if not on_attribute_declaration_called then
				print ("on_attribute_declaration not called.%N")
			end
			if not on_attribute_declaration_matches then
				print ("on_attribute_declaration did not match input.%N")
			end

			if not on_entity_declaration_called then
				print ("on_entity_declaration not called.%N")
			end
			if not on_entity_declaration_matches then
				print ("on_entity_declaration did not match input.%N")
			end

			if not on_notation_declaration_called then
				print ("on_notation_declaration not called.%N")
			end
			if not on_notation_declaration_matches then
				print ("on_notation_declaration did not match input.%N")
			end

			if not on_processing_instruction_called then
				print ("on_processing_instruction not called.%N")
			end
			if not on_processing_instruction_matches then
				print ("on_processing_instruction did not match input.%N")
			end

			if not on_comment_called then
				print ("on_comment not called.%N")
			end
			if not on_comment_matches then
				print ("on_comment did not match input.%N")
			end

			if not on_start_tag_called then
				print ("on_start_tag not called.%N")
			end
			if not on_start_tag_matches then
				print ("on_start_tag did not see the <root> tag.%N")
			end

			if not on_end_tag_called then
				print ("on_end_tag not called.%N")
			end
			if not on_end_tag_matches then
				print ("on_end_tag did not see the </root> tag.%N")
			end

			if not on_start_namespace_called then
				print ("on_start_namespace not called.%N")
			end
			if not on_start_namespace_matches then
				print ("on_start_namespace did not see the <root> tag.%N")
			end

			if not on_end_namespace_called then
				print ("on_end_namespace not called.%N")
			end
			if not on_end_namespace_matches then
				print ("on_end_namespace did not see the root prefix.%N")
			end

			if not on_content_called then
				print ("on_content not called.%N")
			end
			if not on_content_matches then
				print ("on_content did not match input.%N")
			end

			print ("End test callback.%N")
		end


feature -- State

	on_xml_declaration_called,
	on_xml_declaration_matches: BOOLEAN

	on_doctype_called,
	on_end_doctype_called,
	on_doctype_matches: BOOLEAN

	on_not_standalone_called: BOOLEAN

	on_element_declaration_called,
	on_element_declaration_matches: BOOLEAN

	on_attribute_declaration_called,
	on_attribute_declaration_matches: BOOLEAN

	on_entity_declaration_called,
	on_entity_declaration_matches: BOOLEAN

	on_notation_declaration_called,
	on_notation_declaration_matches: BOOLEAN

	on_processing_instruction_called,
	on_processing_instruction_matches: BOOLEAN

	on_comment_called,
	on_comment_matches: BOOLEAN

	on_start_tag_called,
	on_start_tag_matches: BOOLEAN

	on_end_tag_called,
	on_end_tag_matches: BOOLEAN

	on_start_namespace_called,
	on_start_namespace_matches: BOOLEAN

	on_end_namespace_called,
	on_end_namespace_matches: BOOLEAN

	on_content_called,
	on_content_matches: BOOLEAN

	Version10: UC_STRING is
		once
			create Result.make_from_string ("1.0")
		end

	ISO_8859_1: UC_STRING is
		once
			create Result.make_from_string ("ISO-8859-1")
		end

	TestDTD: UC_STRING is
		once
			create Result.make_from_string ("test.dtd")
		end

	EntityName: UC_STRING is
		once
			create Result.make_from_string ("filename")
		end

	Entity_notation: UC_STRING is
		once
			create Result.make_from_string ("gif")
		end

	Gimp: UC_STRING is
		once
			create Result.make_from_string ("gimp")
		end

	MyInstruction: UC_STRING is
		once
			create Result.make_from_string ("myinstruction")
		end

	MyData: UC_STRING is
		once
			create Result.make_from_string ("mydata")
		end

	XMLSchema: UC_STRING is
		once
			create Result.make_from_string ("http://www.w3.org/2000/10/XMLSchema-instance")
		end

	Root: UC_STRING is
		once
			create Result.make_from_string ("root")
		end

	HelloWorld: UC_STRING is
		once
			create Result.make_from_string ("Hello World!")
		end

	Comment: UC_STRING is
		once
			create Result.make_from_string (" yes, this is XML ")
		end


feature -- Handlers

	on_element_declaration (a_name: STRING; a_model: XM_DTD_ELEMENT_CONTENT) is
		do
			on_element_declaration_called := True
			on_element_declaration_matches :=
				STRING_.same_unicode_string (a_name, Root) and
				a_model.is_content_empty
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
		do
			on_attribute_declaration_called := True
			on_attribute_declaration_matches :=
				STRING_.same_unicode_string (an_element_name, Root)
		end

	on_xml_declaration (xml_version, encoding: STRING; is_standalone: BOOLEAN) is
		do
			-- we need everything for this debug class
			register_all_callbacks
			on_xml_declaration_called := True
			on_xml_declaration_matches :=
				STRING_.same_unicode_string (xml_version, Version10) and
				STRING_.same_unicode_string (encoding, ISO_8859_1) and
				not is_standalone
		end

	on_entity_declaration (
			entity_name: STRING;
			is_parameter_entity: BOOLEAN;
			value: STRING;
			an_id: XM_DTD_EXTERNAL_ID;
			notation_name: STRING) is
		do
			on_entity_declaration_called := True
			on_entity_declaration_matches :=
				STRING_.same_unicode_string (entity_name, EntityName) and
				STRING_.same_unicode_string (notation_name, Entity_notation)
		end

	on_start_tag (a_namespace, a_prefix, a_local_part: STRING) is
		do
			on_start_tag_called := True
			on_start_tag_matches := STRING_.same_unicode_string (a_local_part, Root)
		end

	on_end_tag (a_namespace, a_prefix, a_local_part: STRING) is
			-- called whenever the parser findes an end element
		do
			on_end_tag_called := True
			on_end_tag_matches := STRING_.same_unicode_string (a_local_part, Root)
		end

	on_content (chr_data: STRING) is
		do
			on_content_called := True
			on_content_matches := STRING_.same_unicode_string (chr_data, HelloWorld)
		end

	on_processing_instruction (target, data: STRING) is
		do
			on_processing_instruction_called := True
			on_processing_instruction_matches :=
				STRING_.same_unicode_string (target, MyInstruction) and
				STRING_.same_unicode_string (data, MyData)
		end

	on_comment (com: STRING) is
		do
			on_comment_called := True
			on_comment_matches := STRING_.same_unicode_string (com, Comment)
		end

	on_doctype (name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
		do
			on_doctype_called := True
			on_doctype_matches :=
				STRING_.same_unicode_string (name, Root) and
				an_id.system_id = Void and an_id.public_id = Void and
				has_internal_subset
		end

	on_end_doctype is
		do
			on_end_doctype_called := True
		end

	on_notation_declaration (notation_name: STRING; an_id: XM_DTD_EXTERNAL_ID) is
		do
			on_notation_declaration_called := True
			on_notation_declaration_matches :=
				STRING_.same_unicode_string (notation_name, Entity_notation) and
				STRING_.same_unicode_string (an_id.system_id, Gimp)
		end

	on_start_namespace_declaration (namespace_prefix, uri: STRING) is
		do
			on_start_namespace_called := True
			on_start_namespace_matches :=
				STRING_.same_unicode_string (namespace_prefix, Root) and
				STRING_.same_unicode_string (uri, XMLSchema)
		end

	on_end_namespace_declaration (namespace_prefix: STRING) is
		do
			on_end_namespace_called := True
			on_end_namespace_matches :=
				STRING_.same_unicode_string (namespace_prefix, Root)
		end

	on_not_standalone: BOOLEAN is
		do
			-- error is no problem for this test
			on_not_standalone_called := True
			Result := True
		end


end
