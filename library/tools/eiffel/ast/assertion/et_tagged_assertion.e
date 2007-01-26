indexing

	description:

		"Eiffel tagged assertions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_TAGGED_ASSERTION

inherit

	ET_ASSERTION
		redefine
			reset
		end

create

	make

feature {NONE} -- Initialization

	make (a_tag: like tag) is
			-- Create a new assertion.
		require
			a_tag_not_void: a_tag /= Void
		do
			tag := a_tag
		ensure
			tag_set: tag = a_tag
		end

feature -- Initialization

	reset is
			-- Reset assertion as it was when it was first parsed.
		do
			if expression /= Void then
				expression.reset
			end
		end

feature -- Access

	tag: ET_TAG
			-- Tag

	expression: ET_EXPRESSION
			-- Expression

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := tag.position
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := tag.first_leaf
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if expression /= Void then
				Result := expression.last_leaf
			else
				Result := tag.last_leaf
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if expression /= Void then
				Result := expression.break
			else
				Result := tag.break
			end
		end

feature -- Setting

	set_expression (an_expression: like expression) is
			-- Set `expression' to `an_expression'.
		do
			expression := an_expression
		ensure
			expression_set: expression = an_expression
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_tagged_assertion (Current)
		end

invariant

	tag_not_void: tag /= Void

end
