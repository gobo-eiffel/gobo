indexing

	description:

		"Geant XML elements"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_XML_ELEMENT

inherit

	GEANT_COMPOSITE [GEANT_XML_ELEMENT]
		rename
			make as make_composite,
			add as add_child,
			has as has_child,
			remove as remove_child
		end

	GEANT_ATTRIBUTE_HANDLER
		rename
			make as make_attribute_handler
		end

	UC_UNICODE_FACTORY
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a new element named `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			make_composite
			set_name (a_name)
			make_attribute_handler
			set_content (Empty_string)
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: UC_STRING
			-- Element name

	content: UC_STRING
			-- Content of element

	child_by_name (a_name: UC_STRING): GEANT_XML_ELEMENT is
			-- First child element with the local name
			-- `a_name' and belonging to no namespace;
			-- Void if not found
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			a_child: GEANT_XML_ELEMENT
		do
			nb := children.count
			from i := 1 until i > nb loop
				a_child := children.item (i)
				if a_child.name.is_equal (a_name) then
					Result := a_child
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			not_void_if_exists: not children_by_name (a_name).is_empty implies Result /= Void
		end

	children_by_name (a_name: UC_STRING): DS_ARRAYED_LIST [GEANT_XML_ELEMENT] is
			-- All direct children named `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			a_child: GEANT_XML_ELEMENT
		do
			nb := children.count
			!! Result.make (nb)
			from i := 1 until i > nb loop
				a_child := children.item (i)
				if a_child.name.is_equal (a_name) then
					Result.put_last (a_child)
				end
				i := i + 1
			end
		ensure
			children_not_void: Result /= Void
			no_void_children: not Result.has (Void)
		end

feature -- Setting

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_content (a_content: like content) is
			-- Set `content' to `a_content'.
		require
			a_content_not_void: a_content /= Void
		do
			content := a_content
		ensure
			content_set: content = a_content
		end

feature {NONE} -- Constants

	Empty_string: UC_STRING is
			-- Empty string
		once
			Result := new_unicode_string ("")
		ensure
			string_not_void: Result /= Void
			string_empty: Result.count = 0
		end

invariant

	name_not_void: name /= Void
	name_not_empty: name.count > 0
	content_not_void: content /= Void

end -- class GEANT_XML_ELEMENT
