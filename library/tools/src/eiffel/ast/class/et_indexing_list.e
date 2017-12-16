note

	description:

		"Eiffel lists of note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INDEXING_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_INDEXING_ITEM]
		redefine
			make, make_with_capacity
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_with_capacity

feature {NONE} -- Initialization

	make
			-- Create a new note clause
		do
			indexing_keyword := tokens.indexing_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new note clause with capacity `nb'.
		do
			indexing_keyword := tokens.indexing_keyword
			precursor (nb)
		end

feature -- Access

	indexing_keyword: ET_KEYWORD
			-- 'indexing' keyword

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := indexing_keyword.position
			if Result.is_null and not is_empty then
				Result := first.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := indexing_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if is_empty then
				Result := indexing_keyword
			else
				Result := last.last_leaf
			end
		end

feature -- Status report

	has_tagged_indexing_term_value (a_tag, a_value: STRING): BOOLEAN
			-- Do current 'note' clauses contain one which has tag `a_tag'
			-- and whose one of its terms has value `a_value'?
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		local
			i: INTEGER
			l_indexing_clause: ET_INDEXING
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_indexing_clause := storage.item (i).indexing_clause
				if attached l_indexing_clause.tag as l_tag and then STRING_.same_case_insensitive (l_tag.identifier.name, a_tag) then
					if l_indexing_clause.terms.has_indexing_term_value (a_value) then
						Result := True
							-- Jump out of the loop.
						i := 0
					end
				end
				i := i - 1
			end
		end

	has_indexing_term_with_tag (a_tag: STRING): BOOLEAN
			-- Do current 'note' clauses contain one which has tag `a_tag'
			-- and which contains at least one term?
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
		local
			i: INTEGER
			l_indexing_clause: ET_INDEXING
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_indexing_clause := storage.item (i).indexing_clause
				if attached l_indexing_clause.tag as l_tag and then STRING_.same_case_insensitive (l_tag.identifier.name, a_tag) and then not l_indexing_clause.terms.is_empty then
					Result := True
						-- Jump out of the loop.
					i := 0
				end
				i := i - 1
			end
		end

feature -- Setting

	set_indexing_keyword (an_indexing: like indexing_keyword)
			-- Set `indexing_keyword' to `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		do
			indexing_keyword := an_indexing
		ensure
			indexing_keyword_set: indexing_keyword = an_indexing
		end

feature -- Basic operations

	append_tagged_indexing_terms_to_list (a_tag: STRING; a_list: DS_ARRAYED_LIST [ET_INDEXING_TERM])
			-- Append indexing terms with tag `a_tag' to `a_list'.
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
			a_list_not_void: a_list /= Void
		local
			i: INTEGER
			l_indexing_clause: ET_INDEXING
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_indexing_clause := storage.item (i).indexing_clause
				if attached l_indexing_clause.tag as l_tag and then STRING_.same_case_insensitive (l_tag.identifier.name, a_tag) then
					l_indexing_clause.terms.append_indexing_terms_to_list (a_list)
				end
				i := i - 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_indexing_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_INDEXING_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	indexing_keyword_not_void: indexing_keyword /= Void

end
