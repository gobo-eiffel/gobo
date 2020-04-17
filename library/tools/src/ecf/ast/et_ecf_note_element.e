note

	description:

		"ECF note elements"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_NOTE_ELEMENT

inherit

	ANY

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new note element.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			name := a_name
			create attributes.make_map_default
			attributes.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			attributes.set_hash_function (l_hash_function)
			create elements.make_default
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- Element name

	attributes: DS_HASH_TABLE [STRING, STRING]
			-- Attributes

	elements: DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- Subelements

	content: detachable STRING
			-- Text content

feature -- Setting

	set_content (a_content: like content)
			-- Set `content' to `a_content'.
		do
			content := a_content
		ensure
			content_set: content = a_content
		end

feature -- Element change

	add_attribute (a_name, a_value: STRING)
			-- Add attribute named `a_name' with `a_value'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_value_not_void: a_value /= Void
		do
			attributes.force_last (a_value, a_name)
		ensure
			attribute_added: attributes.has (a_name)
			value_set: attributes.item (a_name) = a_value
		end

	add_element (a_element: ET_ECF_NOTE_ELEMENT)
			-- Add element `a_element'.
		require
			a_element_not_void: a_element /= Void
		do
			elements.force_last (a_element)
		ensure
			one_more: elements.count = old elements.count + 1
			element_added: elements.last = a_element
		end

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	attributes_not_void: attributes /= Void
	no_void_attribute_name: not attributes.has_void
	no_empty_attribute_name: not attributes.keys.there_exists (agent {STRING}.is_empty)
	no_void_attribute_value: not attributes.has_void_item

end
