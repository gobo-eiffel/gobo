indexing

	description:

		"Lists of XML attributes"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2001, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_ATTRIBUTE_LIST

inherit

	DS_ARRAYED_LIST [GEANT_ATTRIBUTE]
		rename
			make as ds_arrayed_list_make
		end

creation

	make_from_hash_table, make_from_bilinear

feature {NONE} -- Initialization

	make_from_hash_table (some_attributes: DS_HASH_TABLE [UC_STRING, UC_STRING]) is
			-- Create a new list of attributes and fill it
			-- with values in `some_attributes' (attributes
			-- values indexed by names).
		require
			some_attributes_not_void: some_attributes /= Void
			no_void_name: not some_attributes.has (Void)
			-- no_empty_name: forall key in some_attributes, not key.empty
			no_void_value: not some_attributes.has_item (Void)
		local
			a_cursor: DS_HASH_TABLE_CURSOR [UC_STRING, UC_STRING]
			an_attribute: GEANT_ATTRIBUTE
		do
			ds_arrayed_list_make (some_attributes.count)
			a_cursor := some_attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
				!! an_attribute.make (a_cursor.key, a_cursor.item)
				put_last (an_attribute)
				a_cursor.forth
			end
		end

	make_from_bilinear (some_attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
			-- Create a new list of attributes and fill it
			-- with values in `some_attributes'.
		require
			some_attributes_not_void: some_attributes /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]
			an_attribute: GEANT_ATTRIBUTE
		do
			ds_arrayed_list_make (some_attributes.count)
			a_cursor := some_attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
				!! an_attribute.make (a_cursor.item.first.first, a_cursor.item.second)
				put_last (an_attribute)
				a_cursor.forth
			end
		end

feature -- Output

	print_attributes is
			-- Write attributes to standard output.
		local
			an_attribute: GEANT_ATTRIBUTE
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				an_attribute := item (i)
				print (an_attribute.name.out + "=%"" + an_attribute.value.out + "%"%N")
				i := i + 1
			end
		end

invariant

	no_void_attribute: not has (Void)

end -- class GEANT_ATTRIBUTE_LIST
