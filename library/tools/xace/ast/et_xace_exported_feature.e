indexing

	description:

		"Xace exported features"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_EXPORTED_FEATURE

creation

	make

feature {NONE} -- Initialization

	make (a_feature_name: like feature_name; a_external_name: like external_name) is
				-- Create a new exported feature.
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_name_not_empty: a_feature_name.count > 0
			a_external_name_not_void: a_external_name /= Void
			a_external_name_not_void: external_name.count > 0
		do
			feature_name := a_feature_name
			external_name := a_external_name
		ensure
			feature_name_set: feature_name = a_feature_name
			external_name_set: external_name = a_external_name
		end

feature -- Access

	feature_name: STRING
			-- Feature name

	external_name: STRING
			-- External name of feature

invariant

	feature_name_not_void: feature_name /= Void
	feature_name_not_empty: feature_name.count > 0
	external_name_not_void: external_name /= Void
	external_name_not_void: external_name.count > 0

end -- class ET_XACE_EXPORTED_FEATURE
