note

	description:

		"Eiffel feature names followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_NAME_COMMA

inherit

	ET_FEATURE_NAME_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_name: like feature_name; a_comma: like comma) is
			-- Create a new feature_name-comma.
		require
			a_name_not_void: a_name /= Void
			a_comma_not_void: a_comma /= Void
		do
			feature_name := a_name
			comma := a_comma
		ensure
			feature_name_set: feature_name = a_name
			comma_set: comma = a_comma
		end

feature -- Initialization

	reset is
			-- Reset feature name as it was when it was last parsed.
		do
			-- Do nothing.
		end

feature -- Access

	feature_name: ET_FEATURE_NAME
			-- Feature name in comma-separated list

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
			a_processor.process_feature_name_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
