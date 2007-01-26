indexing

	description:

		"Eiffel feature names which appear in a comma-separated list of feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_FEATURE_NAME_ITEM

inherit

	ET_EXTENDED_FEATURE_NAME

feature -- Access

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		do
		end

end
