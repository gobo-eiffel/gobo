indexing

	description:

		"xml:id DTD validator"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_DTD_XMLID_VALIDATOR

inherit

	XM_DTD_CALLBACKS_FILTER
		redefine
			on_doctype,
			on_attribute_declaration
		end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

create

	make_null,
	set_next

feature -- Callbacks

	on_doctype (a_name: STRING; an_id: XM_DTD_EXTERNAL_ID; has_internal_subset: BOOLEAN) is
			-- Document type declaration.
		do
			has_error := False
			id_attributes := Void
			Precursor (a_name, an_id, has_internal_subset)
		end

	on_attribute_declaration (an_element_name, a_name: STRING; a_model: XM_DTD_ATTRIBUTE_CONTENT) is
			-- Attribute declaration, one event per attribute.
		do
			if a_name.same_string (Xml_id_with_prefix) and then not a_model.is_id then
				on_invalid_id_declaration
			end
			if a_model.is_id then
				on_id_attribute_declaration (an_element_name, a_name)
			end
			Precursor (an_element_name, a_name, a_model)
		end

feature -- ID callbacks

	on_invalid_id_declaration is
			-- An invalid xml:id declaration has another type has occurred
		do
			has_error := True
		end

	on_id_attribute_declaration  (an_element_name, a_name: STRING) is
			-- An attribute has been declared of type ID.
		require
			an_element_name_not_void: an_element_name /= Void
			a_name_not_void: a_name /= Void
		local
			a_set: DS_HASH_SET [STRING]
		do
			if id_attributes = Void then
				create id_attributes.make_map_default
				id_attributes.set_key_equality_tester (string_equality_tester)
			end
			if not id_attributes.has (an_element_name) then
				create a_set.make_default
				a_set.set_equality_tester (string_equality_tester)
				id_attributes.force_new (a_set, an_element_name)
			end
			id_attributes.item (an_element_name).force (a_name)
		ensure
			done: is_id_attribute (an_element_name, a_name)
		end

feature -- Access

	has_error: BOOLEAN
			-- Is xml:id incorrectly declared to be other than ID type?

	id_attributes: DS_HASH_TABLE [DS_SET [STRING], STRING]
			-- List of ID attributes other than xml:id

	is_id_attribute (an_element_name, a_name: STRING): BOOLEAN is
			-- Is this attribute declared with type ID?
		require
			an_element_name_not_void: an_element_name /= Void
			a_name_not_void: a_name /= Void
		do
			Result := id_attributes /= Void and then
					(id_attributes.has (an_element_name) and then
						id_attributes.item (an_element_name).has (a_name))
		end

end

