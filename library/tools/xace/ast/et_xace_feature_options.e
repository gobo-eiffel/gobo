note

	description:

		"Xace feature options"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_FEATURE_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_name: like feature_name; an_options: like options) is
			-- Create a new feature options for feature `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			an_options_not_void: an_options /= Void
		do
			feature_name := a_name
			options := an_options
		ensure
			feature_name_set: feature_name = a_name
			options_set: options = an_options
		end

feature -- Access

	feature_name: STRING
			-- Feature name

	options: ET_XACE_OPTIONS
			-- Feature options

invariant

	feature_name_not_void: feature_name /= Void
	feature_name_not_empty: feature_name.count > 0
	options_not_void: options /= Void

end
