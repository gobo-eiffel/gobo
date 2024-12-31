note

	description:

		"Eiffel lists of note clauses"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2024, Eric Bezault and others"
	license: "MIT License"

class ET_NOTE_LIST

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_NOTE_ITEM]
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
			note_keyword := tokens.note_keyword
			precursor
		end

	make_with_capacity (nb: INTEGER)
			-- Create a new note clause with capacity `nb'.
		do
			note_keyword := tokens.note_keyword
			precursor (nb)
		end

feature -- Access

	note_keyword: ET_KEYWORD
			-- 'note' keyword

	first_semicolon: detachable ET_SEMICOLON_SYMBOL
			-- Semicolon before the first note, if any

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := note_keyword.position
			if Result.is_null then
				if not is_empty then
					Result := first.position
				elseif attached first_semicolon as l_first_semicolon then
					Result := l_first_semicolon.position
				end
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := note_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			if not is_empty then
				Result := last.last_leaf
			elseif attached first_semicolon as l_first_semicolon then
				Result := l_first_semicolon.last_leaf
			else
				Result := note_keyword
			end
		end

feature -- Status report

	has_tagged_note_term_value (a_tag, a_value: STRING): BOOLEAN
			-- Do current 'note' clauses contain one which has tag `a_tag'
			-- and whose one of its terms has value `a_value'?
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
			a_value_not_void: a_value /= Void
			a_value_not_empty: not a_value.is_empty
		local
			i: INTEGER
			l_note_clause: ET_NOTE
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_note_clause := storage.item (i).note_clause
				if attached l_note_clause.tag as l_tag and then STRING_.same_case_insensitive (l_tag.identifier.name, a_tag) then
					if l_note_clause.terms.has_note_term_value (a_value) then
						Result := True
							-- Jump out of the loop.
						i := 0
					end
				end
				i := i - 1
			end
		end

	has_note_term_with_tag (a_tag: STRING): BOOLEAN
			-- Do current 'note' clauses contain one which has tag `a_tag'
			-- and which contains at least one term?
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
		local
			i: INTEGER
			l_note_clause: ET_NOTE
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_note_clause := storage.item (i).note_clause
				if attached l_note_clause.tag as l_tag and then STRING_.same_case_insensitive (l_tag.identifier.name, a_tag) and then not l_note_clause.terms.is_empty then
					Result := True
						-- Jump out of the loop.
					i := 0
				end
				i := i - 1
			end
		end

feature -- Setting

	set_note_keyword (a_note: like note_keyword)
			-- Set `note_keyword' to `a_note'.
		require
			a_note_not_void: a_note /= Void
		do
			note_keyword := a_note
		ensure
			note_keyword_set: note_keyword = a_note
		end

	set_first_semicolon (a_first_semicolon: like first_semicolon)
			-- Set `first_semicolon' to `a_first_semicolon'.
		do
			first_semicolon := a_first_semicolon
		ensure
			first_semicolon_set: first_semicolon = a_first_semicolon
		end

feature -- Basic operations

	append_tagged_note_terms_to_list (a_tag: STRING; a_list: DS_ARRAYED_LIST [ET_NOTE_TERM])
			-- Append note terms with tag `a_tag' to `a_list'.
		require
			a_tag_not_void: a_tag /= Void
			a_tag_not_empty: not a_tag.is_empty
			a_list_not_void: a_list /= Void
		local
			i: INTEGER
			l_note_clause: ET_NOTE
		do
			from
				i := count - 1
			until
				i < 0
			loop
				l_note_clause := storage.item (i).note_clause
				if attached l_note_clause.tag as l_tag and then STRING_.same_case_insensitive (l_tag.identifier.name, a_tag) then
					l_note_clause.terms.append_note_terms_to_list (a_list)
				end
				i := i - 1
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_note_list (Current)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_NOTE_ITEM]
			-- Fixed array routines
		once
			create Result
		end

invariant

	note_keyword_not_void: note_keyword /= Void

end
