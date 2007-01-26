indexing

	description:

		"Xace exported features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_EXPORTED_FEATURE

create

	make

feature {NONE} -- Initialization

	make (a_class_name: like class_name; a_feature_name: like feature_name; a_external_name: like external_name) is
				-- Create a new exported feature.
		require
			a_class_name_not_void: a_class_name /= Void
			a_class_name_not_empty: a_class_name.count > 0
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_name_not_empty: a_feature_name.count > 0
			a_external_name_not_void: a_external_name /= Void
			a_external_name_not_empty: a_external_name.count > 0
		do
			class_name := a_class_name
			feature_name := a_feature_name
			external_name := a_external_name
		ensure
			class_name_set: class_name = a_class_name
			feature_name_set: feature_name = a_feature_name
			external_name_set: external_name = a_external_name
		end

feature -- Access

	class_name: STRING
			-- Class name

	feature_name: STRING
			-- Feature name

	external_name: STRING
			-- External name of feature

invariant

	class_name_not_void: class_name /= Void
	class_name_not_empty: class_name.count > 0
	feature_name_not_void: feature_name /= Void
	feature_name_not_empty: feature_name.count > 0
	external_name_not_void: external_name /= Void
	external_name_not_empty: external_name.count > 0

end
