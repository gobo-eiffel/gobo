indexing

	description:

		"Eiffel conversion feature followed by a comma"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_FEATURE_COMMA

inherit

	ET_CONVERT_FEATURE_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_convert_feature: like convert_feature; a_comma: like comma) is
			-- Create a new convert_feature-comma.
		require
			a_convert_feature_not_void: a_convert_feature /= Void
			a_comma_not_void: a_comma /= Void
		do
			convert_feature := a_convert_feature
			comma := a_comma
		ensure
			convert_feature_set: convert_feature = a_convert_feature
			comma_set: comma = a_comma
		end

feature -- Access

	convert_feature: ET_CONVERT_FEATURE
			-- Conversion feature in comma-separated list

	comma: ET_SYMBOL
			-- Comma separator

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := convert_feature.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := convert_feature.first_leaf
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
			a_processor.process_convert_feature_comma (Current)
		end

invariant

	comma_not_void: comma /= Void

end
