indexing

	description: "[
		Translations of class names between a storing and a retrieving
		system. Values in this table are names of classes in the retrieving
		system, indexed by names of generating classes in the storing
		system (i.e. with no generic arguments). Values may have generic
		arguments (e.g. "MY_CLASS [DOUBLE]"), thus allowing a very simple
		conversion of a non-generic class into a generic class. The
		presence of entries in this table affects all retrieve operations
		for objects stored using `independent_store'.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class CLASS_NAME_TRANSLATIONS

inherit

	HASH_TABLE [STRING, STRING]
		export
			{NONE} replace_key, remove
		redefine
			default_create,
			put, force, extend, replace,
			clear_all,
			out
		end

create

	default_create

feature -- Initialization

	default_create is
			-- Make table with current translations
		local
			i, cnt: INTEGER
			o, n: STRING
		do
			cnt := class_translation_count
			make (cnt)
			from i := 0 until i = cnt loop
				create o.make_from_c_pointer (class_translation_old (i))
				create n.make_from_c_pointer (class_translation_new (i))
				put (n, o)
				i := i + 1
			end
		end

feature -- Element change

	put (new: STRING; key: STRING) is
			-- Insert `new' with `key' if there is no other item
			-- associated with the same key.
			-- Set `inserted' if and only if an insertion has
			-- been made (i.e. `key' was not present).
			-- If so, set `position' to the insertion position.
			-- If not, set `conflict'.
			-- In either case, set `found_item' to the item
			-- now associated with `key' (previous item if
			-- there was one, `new' otherwise).
		do
			Precursor (new, key)
			if inserted then add_translation (new, key) end
		end

	force (new: STRING; key: STRING) is
			-- Update table so that `new' will be the item associated
			-- with `key'.
			-- If there was an item for that key, set `found'
			-- and set `found_item' to that item.
			-- If there was none, set `not_found' and set
			-- `found_item' to the default value.
		do
			Precursor (new, key)
			add_translation (new, key)
		end

	extend (new: STRING; key:STRING) is
			-- Assuming there is no item of key `key',
			-- insert `new' with `key'.
			-- Set `inserted'.
		do
			Precursor (new, key)
			add_translation (new, key)
		end

	replace (new: STRING; key: STRING) is
			-- Replace item at `key', if present,
			-- with `new'; do not change associated key.
			-- Set `replaced' if and only if a replacement has been made
			-- (i.e. `key' was present); otherwise set `not_found'.
			-- Set `found_item' to the item previously associated
			-- with `key' (default value if there was none).
		do
			if has (key) then
				Precursor (new, key)
				add_translation (new, key)
			end
		end

feature -- Removal

	clear_all is
			-- Reset all items to default values; reset status.
		do
			Precursor
			class_translation_clear
		end

feature -- Output

	out: STRING is
			-- Printable representation of translations
		local
			k: STRING
			i: ?STRING
		do
			from
				create Result.make (25 + count * 40)
				Result.append ("Class name translations:%N")
				start
			until
				after
			loop
				k := key_for_iteration
				if k /= Void then
					Result.append (k)
				end
				Result.append (" -> ")
				i := item_for_iteration
				if i /= Void then
					Result.append (i)
				end
				Result.append_character ('%N')
				forth
			end
		end

feature {NONE} -- Implementation

	add_translation (new_name, old_name: ?STRING) is
			-- Add a translation entry mapping class `old_name' in the
			-- storing system to class `new_name' in the retrieving system.
		local
			n, o: ANY
		do
			if new_name /= Void and then old_name /= Void then
				n := new_name.to_c
				o := old_name.to_c
				class_translation_put ($n, $o)
			end
		end

feature {NONE} -- Externals

	class_translation_put (new_name, old_name: POINTER) is
		external
			"C use %"eif_retrieve.h%""
		end

	class_translation_clear is
		external
			"C use %"eif_retrieve.h%""
		end

	class_translation_count: INTEGER is
		external
			"C use %"eif_retrieve.h%""
		end

	class_translation_old (i: INTEGER): POINTER is
		external
			"C use %"eif_retrieve.h%""
		end

	class_translation_new (i: INTEGER): POINTER is
		external
			"C use %"eif_retrieve.h%""
		end

end
