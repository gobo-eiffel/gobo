indexing

	description:

		"Eiffel indexing clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING

inherit

	ET_INDEXING_ITEM

creation

	make

feature {NONE} -- Initialization

	make (a_terms: like terms) is
			-- Create a new indexing clause.
		require
			a_terms_not_void: a_terms /= Void
		do
			terms := a_terms
		ensure
			terms_set: terms = a_terms
		end

feature -- Access

	tag: ET_TAG is
			-- Tag
		do
		end

	terms: ET_INDEXING_TERM_LIST
			-- Indexing terms

	indexing_clause: ET_INDEXING is
			-- Indexing clause in semicolon-separated list
		do
			Result := Current
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if tag /= Void then
				Result := tag.position
			else
				Result := terms.position
			end
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := terms.break
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_indexing (Current)
		end

invariant

	terms_not_void: terms /= Void

end
