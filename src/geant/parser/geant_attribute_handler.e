indexing

	description:

		"XML attribute handlers"

	library:    "Gobo Eiffel Ant"
	author:     "Sven Ehrke <sven.ehrke@sven-ehrke.de>"
	copyright:  "Copyright (c) 2001, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class GEANT_ATTRIBUTE_HANDLER

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new attribute handler.
		do
			!! attributes.make (0)
		end

feature -- Access

	attributes: DS_ARRAYED_LIST [GEANT_ATTRIBUTE]
			-- Attributes

	attribute_by_name (a_name: UC_STRING): GEANT_ATTRIBUTE is
			-- Attribute of name `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			has_attribute: has_attribute (a_name)
		local
			i, nb: INTEGER
			an_attribute: GEANT_ATTRIBUTE
		do
			nb := attributes.count
			from i := 1 until i > nb loop
				an_attribute := attributes.item (i)
				if an_attribute.name.is_equal (a_name) then
					Result := an_attribute
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			attribute_not_void: Result /= Void
		end

	attribute_value_by_name (a_name: UC_STRING): UC_STRING is
			-- Value of attribute named `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			has_attribute: has_attribute (a_name)
		local
			i, nb: INTEGER
			an_attribute: GEANT_ATTRIBUTE
		do
			nb := attributes.count
			from i := 1 until i > nb loop
				an_attribute := attributes.item (i)
				if an_attribute.name.is_equal (a_name) then
					Result := an_attribute.value
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			attribute_value_not_void: Result /= Void
		end

feature -- Status report

	has_attribute (a_name: UC_STRING): BOOLEAN is
			-- Is there an attribute named `a_name'
			-- in `attributes'?
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			an_attribute: GEANT_ATTRIBUTE
		do
				-- Implementation notes:
				-- loop over all attributes to find the right one.
				-- usually a hash table is used for these kind of things and
				-- actually the attributes have been in one in the XML_HANDLER
				-- But: since an element usually just has a few attributes looping
				-- does not matter here.
			nb := attributes.count
			from i := 1 until i > nb loop
				an_attribute := attributes.item (i)
				if an_attribute.name.is_equal (a_name) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Element change

	add_attribute (an_attribute: GEANT_ATTRIBUTE) is
			-- Add `an_attribute' to `attributes'.
		require
			an_attribute_not_void: an_attribute /= Void
			not_has_attribute: not has_attribute (an_attribute.name)
		do
			attributes.force_last (an_attribute)
		ensure
			attribute_added: has_attribute (an_attribute.name)
		end

	add_attributes (some_attributes: GEANT_ATTRIBUTE_LIST) is
			-- Add all attributes to `attributes'.
		require
			some_attributes_not_void: some_attributes /= Void
			no_void_attribute: not some_attributes.has (Void)
			-- not_has_attributes: forall item in some_attributes, not has_attribute (item)
		local
			i, nb: INTEGER
			an_attribute: GEANT_ATTRIBUTE
		do
			nb := some_attributes.count
			from i := 1 until i > nb loop
				an_attribute := some_attributes.item (i)
				add_attribute (an_attribute)
				i := i + 1
			end
		end

invariant

	attributes_not_void: attributes /= Void
	no_void_attribute: not attributes.has (Void)

end -- class GEANT_ATTRIBUTE_HANDLER
