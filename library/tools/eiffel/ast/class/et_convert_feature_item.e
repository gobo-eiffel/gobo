note

	description:

		"Eiffel conversion features which appear in a comma-separated list of types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CONVERT_FEATURE_ITEM

inherit

	ET_AST_NODE

feature -- Access

	convert_feature: ET_CONVERT_FEATURE is
			-- Conversion feature in comma-separated list
		deferred
		ensure
			convert_feature_not_void: Result /= Void
		end

end
