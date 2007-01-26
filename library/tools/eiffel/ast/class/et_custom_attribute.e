indexing

	description:

		"Eiffel for .NET custom attributes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CUSTOM_ATTRIBUTE

inherit

	ET_INDEXING_TERM

create

	make

feature {NONE} -- Initialization

	make (a_creation: like creation_expression; a_settings: like settings) is
			-- Create a new custom attribute.
		require
			a_creation_not_void: a_creation /= Void
		do
			creation_expression := a_creation
			settings := a_settings
			end_keyword := tokens.end_keyword
		ensure
			creation_expression_set: creation_expression = a_creation
			settings_set: settings = a_settings
		end

feature -- Access

	creation_expression: ET_CREATE_EXPRESSION
			-- Creation of custom attribute

	settings: ET_MANIFEST_TUPLE
			-- Additional custom attribute settings

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := creation_expression.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := creation_expression.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := end_keyword
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Setting

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_custom_attribute (Current)
		end

invariant

	creation_expression_not_void: creation_expression /= Void
	end_keyword_not_void: end_keyword /= Void

end
