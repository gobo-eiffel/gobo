note

	description:

		"ECF declarations of classes and features accessible from other languages"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_VISIBLE_CLASS

create

	make

feature {NONE} -- Initialization

	make (a_class_name: like class_name)
			-- Create a new visible clause for class `a_class_name'.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			class_name := a_class_name
		ensure
			class_name_set: class_name = a_class_name
		end

feature -- Access

	class_name: STRING
			-- Class name

	feature_name: detachable STRING
			-- Feature name

	new_class_name: detachable STRING
			-- Class name to be used from the other languages

	new_feature_name: detachable STRING
			-- Feature name to be used from the other languages

feature -- Setting

	set_feature_name (a_feature_name: like feature_name)
			-- Set `feature_name' to `a_feature_name'.
		do
			feature_name := a_feature_name
		ensure
			feature_name_set: feature_name = a_feature_name
		end

	set_new_class_name (a_new_class_name: like new_class_name)
			-- Set `new_class_name' to `a_new_class_name'.
		do
			new_class_name := a_new_class_name
		ensure
			new_class_name_set: new_class_name = a_new_class_name
		end

	set_new_feature_name (a_new_feature_name: like feature_name)
			-- Set `new_feature_name' to `a_new_feature_name'.
		do
			new_feature_name := a_new_feature_name
		ensure
			new_feature_name_set: new_feature_name = a_new_feature_name
		end

invariant

	class_name_not_void: class_name /= Void

end
