indexing

	description:

		"Eiffel loop tagged expression variants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_TAGGED_EXPRESSION_VARIANT

inherit

	ET_EXPRESSION_VARIANT
		rename
			make as make_expression_variant
		redefine
			process
		end

creation

	make

feature {NONE} -- Initialization

	make (a_variant: like variant_keyword; a_tag: like tag;
		an_expression: like expression) is
			-- Create a new loop expression variant clause.
		require
			a_variant_not_void: a_variant /= Void
			a_tag_not_void: a_tag /= Void
			an_expression_not_void: an_expression /= Void
		do
			variant_keyword := a_variant
			tag := a_tag
			expression := an_expression
		ensure
			variant_keyword_set: variant_keyword = a_variant
			tag_set: tag = a_tag
			expression_set: expression = an_expression
		end

feature -- Access

	tag: ET_TAG
			-- Tag

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_tagged_expression_variant (Current)
		end

invariant

	tag_not_void: tag /= Void

end
