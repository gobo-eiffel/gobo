indexing

	description:

		"Xace export clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_EXPORTED_CLASS

creation

	make

feature {NONE} -- Initialization

	make (a_name: like class_name) is
			-- Create a new export clause.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			class_name := a_name
			!! features.make
		ensure
			class_name_set: class_name = a_name
		end

feature -- Access

	class_name: STRING
			-- Exported class name

	features: DS_LINKED_LIST [ET_XACE_EXPORTED_FEATURE]
			-- Exported features

invariant

	class_name_not_void: class_name /= Void
	class_name_not_empty: class_name.count > 0
	features_not_void: features /= Void
	no_void_feature: not features.has (Void)

end -- class ET_XACE_EXPORTED_CLASS
