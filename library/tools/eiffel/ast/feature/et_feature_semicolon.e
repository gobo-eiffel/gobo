indexing

	description:

		"Eiffel features followed by a semicolon"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_FEATURE_SEMICOLON

inherit

	ET_FEATURE_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_feature: like feature_item; a_semicolon: like semicolon) is
			-- Create a new feature-semicolon.
		require
			a_feature_not_void: a_feature /= Void
			a_semicolon_not_void: a_semicolon /= Void
		do
			feature_item := a_feature
			semicolon := a_semicolon
		ensure
			feature_item_set: feature_item = a_feature
			semicolon_set: semicolon = a_semicolon
		end

feature -- Access

	feature_item: ET_FEATURE
			-- Feature in semicolon-separated list

	semicolon: ET_SYMBOL
			-- Semicolon separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := feature_item.position
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := semicolon.break
		end

invariant

	semicolon_not_void: semicolon /= Void

end
