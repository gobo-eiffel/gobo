note

	description:

		"Eiffel aliased feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIASED_FEATURE_NAME

inherit

	ET_EXTENDED_FEATURE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like feature_name; an_alias: like alias_name) is
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

	reset is
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

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_name.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := feature_name.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := alias_name.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := alias_name.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_aliased_feature_name (Current)
		end

invariant

	alias_name_not_void: alias_name /= Void

end
