note

	description:

		"Eiffel tagged note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"

class ET_TAGGED_INDEXING

inherit

	ET_INDEXING
		rename
			make as make_untagged_indexing
		redefine
			tag, process
		end

create

	make

feature {NONE} -- Initialization

	make (a_tag: like tag; a_terms: like terms)
			-- Create a new tagged note clause.
		require
			a_tag_not_void: a_tag /= Void
			a_terms_not_void: a_terms /= Void
		do
			tag := a_tag
			terms := a_terms
		ensure
			tag_set: tag = a_tag
			terms_set: terms = a_terms
		end

feature -- Access

	tag: ET_TAG
			-- Tag

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_tagged_indexing (Current)
		end

invariant

	tag_not_void: tag /= Void

end
