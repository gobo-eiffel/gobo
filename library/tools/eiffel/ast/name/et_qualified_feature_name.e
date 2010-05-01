note

	description:

		"Eiffel feature names in qualified calls"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_QUALIFIED_FEATURE_NAME

inherit

	ET_AST_NODE

feature -- Access

	feature_name: ET_FEATURE_NAME is
			-- Feature name
		deferred
		ensure
			feature_name_not_void: Result /= Void
		end

end
