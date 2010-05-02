note

	description:

		"Eiffel null export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_NULL_EXPORT

inherit

	ET_EXPORT

feature -- Access

	clients (a_name: ET_FEATURE_NAME): ET_CLIENTS
			-- Clients for feature `a_name'
		do
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN
			-- Is `a_name' listed in current export clause?
		do
			Result := False
		end

end
