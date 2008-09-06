indexing

	description:

		"Eiffel export clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_EXPORT

inherit

	ET_AST_NODE

feature -- Initialization

	reset is
			-- Reset export clause as it was when it was last parsed.
		do
		end

feature -- Access

	clients (a_name: ET_FEATURE_NAME): ET_CLIENTS is
			-- Clients for feature `a_name'
		require
			a_name_not_void: a_name /= Void
			has_feature_name: has_feature_name (a_name)
		deferred
		ensure
			clients_not_void: Result /= Void
		end

feature -- Status report

	has_feature_name (a_name: ET_FEATURE_NAME): BOOLEAN is
			-- Is `a_name' listed in current export clause?
		require
			a_name_not_void: a_name /= Void
		deferred
		ensure
			all_definition: is_all implies Result
		end

	is_all: BOOLEAN is
			-- Is current export clause of the form 'export {CLIENT} all'?
		do
			-- Result := False
		end

	is_semicolon: BOOLEAN is
			-- Is current node a semicolon?
		do
			-- Result := False
		end

end
