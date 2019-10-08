note

	description:

		"Eiffel aliased feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIASED_FEATURE_NAME

inherit

	ET_EXTENDED_FEATURE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like feature_name; an_alias_names: like alias_names)
			-- Create a new aliased feature name.
		require
			a_name_not_void: a_name /= Void
			an_alias_names_not_void: an_alias_names /= Void
		do
			feature_name := a_name
			alias_names := an_alias_names
		ensure
			feature_name_set: feature_name = a_name
			alias_names_set: alias_names = an_alias_names
		end

feature -- Initialization

	reset
			-- Reset feature name as it was when it was last parsed.
		do
			feature_name.reset
			alias_names.reset
		end

feature -- Access

	feature_name: ET_IDENTIFIER
			-- Feature name

	alias_names: ET_ALIAS_NAME_LIST
			-- Alias names

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_name.position
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := feature_name.first_leaf
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := alias_names.last_leaf
		end

feature -- Comparison

	same_call_name (a_call_name: ET_CALL_NAME): BOOLEAN
			-- Is `Current' the name of a feature which could be called with `a_call_name'?
			-- (case insensitive)
		do
			if feature_name.same_call_name (a_call_name) then
				Result := True
			else
				Result := alias_names.has_call_name (a_call_name)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_aliased_feature_name (Current)
		end

invariant

	alias_names_not_void: alias_names /= Void

end
