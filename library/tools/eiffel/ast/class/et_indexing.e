note

	description:

		"Eiffel note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING

inherit

	ET_INDEXING_ITEM

create

	make

feature {NONE} -- Initialization

	make (a_terms: like terms) is
			-- Create a new note clause.
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
			-- Note terms

	indexing_clause: ET_INDEXING is
			-- Note clause in semicolon-separated list
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

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			if tag /= Void then
				Result := tag.first_leaf
			else
				Result := terms.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := terms.last_leaf
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
