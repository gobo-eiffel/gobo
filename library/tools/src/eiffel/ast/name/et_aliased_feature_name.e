note

	description:

		"Eiffel aliased feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIASED_FEATURE_NAME

inherit

	ET_EXTENDED_FEATURE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like feature_name; an_alias: like alias_name)
			-- Create a new aliased feature name.
		require
			a_name_not_void: a_name /= Void
			an_alias_not_void: an_alias /= Void
		do
			feature_name := a_name
			alias_name := an_alias
		ensure
			feature_name_set: feature_name = a_name
			alias_name_set: alias_name = an_alias
		end

feature -- Initialization

	reset
			-- Reset feature name as it was when it was last parsed.
		do
			feature_name.reset
			alias_name.reset
		end

feature -- Access

	feature_name: ET_IDENTIFIER
			-- Feature name

	alias_name: ET_ALIAS_NAME
			-- Alias name, if any

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
			Result := alias_name.last_leaf
		end

feature -- Comparison

	same_call_name (a_call_name: ET_CALL_NAME): BOOLEAN
			-- Is `Current' the name of a feature which could be called with `a_call_name'?
			-- (case insensitive)
		do
			if feature_name.same_call_name (a_call_name) then
				Result := True
			else
				Result := alias_name.same_call_name (a_call_name)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_aliased_feature_name (Current)
		end

invariant

	alias_name_not_void: alias_name /= Void

end
