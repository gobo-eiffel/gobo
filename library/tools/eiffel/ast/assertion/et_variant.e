indexing

	description:

		"Eiffel loop variants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_VARIANT

inherit

	ET_AST_NODE

create

	make

feature {NONE} -- Initialization

	make (a_tag: like tag; an_expression: like expression) is
			-- Create a new empty loop variant clause.
		do
			variant_keyword := tokens.variant_keyword
			tag := a_tag
			expression := an_expression
		ensure
			tag_set: tag = a_tag
			expression_set: expression = an_expression
		end

feature -- Initialization

	reset is
			-- Reset variant as it was when it was first parsed.
		do
			if expression /= Void then
				expression.reset
			end
		end

feature -- Access

	variant_keyword: ET_KEYWORD
			-- 'variant' keyword

	tag: ET_TAG
			-- Tag

	expression: ET_EXPRESSION
			-- Integer expression

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := variant_keyword.position
			if Result.is_null then
				if tag /= Void then
					Result := tag.position
				elseif expression /= Void then
					Result := expression.position
				end
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := variant_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			if expression /= Void then
				Result := expression.last_leaf
			elseif tag /= Void then
				Result := tag.last_leaf
			else
				Result := variant_keyword
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			if expression /= Void then
				Result := expression.break
			elseif tag /= Void then
				Result := tag.break
			else
				Result := variant_keyword.break
			end
		end

feature -- Setting

	set_variant_keyword (a_variant: like variant_keyword) is
			-- Set `variant_keyword' to `a_variant'.
		require
			a_variant_not_void: a_variant /= Void
		do
			variant_keyword := a_variant
		ensure
			variant_keyword_set: variant_keyword = a_variant
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_variant (Current)
		end

invariant

	variant_keyword_not_void: variant_keyword /= Void

end
