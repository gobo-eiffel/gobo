indexing

	description:

		"Eiffel conversion expressions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CONVERT_EXPRESSION

inherit

	ET_EXPRESSION

create

	make

feature {NONE} -- Initialization

	make (e: like expression; a_feature: like convert_feature) is
			-- Create a new conversion expression.
		require
			e_not_void: e /= Void
			a_feature_not_void: a_feature /= Void
		do
			expression := e
			convert_feature := a_feature
		ensure
			expression_set: expression = e
			convert_feature_set: convert_feature = a_feature
		end

feature -- Access

	expression: ET_EXPRESSION
			-- Expression to be converted

	convert_feature: ET_CONVERT_FEATURE
			-- Conversion feature

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := expression.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := expression.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := expression.last_leaf
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := expression.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_convert_expression (Current)
		end

invariant

	expression_not_void: expression /= Void
	convert_feature_not_void: convert_feature /= Void

end
