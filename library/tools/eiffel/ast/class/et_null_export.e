indexing

	description:

		"Eiffel null export clauses"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_NULL_EXPORT

inherit

	ET_EXPORT

feature -- Access

	clients (a_name: ET_FEATURE_NAME): ET_CLIENTS is
			-- Clients for feature `a_name'
		do
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current export clause?
		do
			Result := False
		end

end -- class ET_NULL_EXPORT
