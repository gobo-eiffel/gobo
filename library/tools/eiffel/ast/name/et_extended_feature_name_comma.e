note

	description:

		"Eiffel extended feature names followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXTENDED_FEATURE_NAME_COMMA

inherit

	ET_EXTENDED_FEATURE_NAME

create

	make

feature {NONE} -- Initialization

	make (a_name: like extended_feature_name; a_comma: like comma) is
			-- Create a new extended-feature_name-comma.
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			extended_feature_name := a_name
			comma := a_comma
		ensure
			extended_feature_name_set: extended_feature_name = a_name
			comma_set: comma = a_comma
		end

feature -- Initialization

	reset is
			-- Reset feature name as it was when it was last parsed.
		do
			extended_feature_name.reset
		end

feature -- Access

	extended_feature_name: ET_EXTENDED_FEATURE_NAME
			-- Extended feature name in comma-separated list

	feature_name: ET_FEATURE_NAME is
			-- Feature name
		do
			Result := extended_feature_name.feature_name
		end

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		do
			Result := extended_feature_name.alias_name
		end

	comma: ET_SYMBOL
			-- Comma separator

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
			Result := comma
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := comma.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_extended_feature_name_comma (Current)
		end

invariant

	extended_feature_name_not_void: extended_feature_name /= Void
	comma_not_void: comma /= Void

end
