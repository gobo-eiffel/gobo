note

	description:

		"Eiffel attachment mark ('attached', 'detachable', '!' or '?', possibly implicit) followed by keyword 'separate'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2025, Eric Bezault and others"
	license: "MIT License"

class ET_ATTACHMENT_MARK_SEPARATE_KEYWORD

inherit

	ET_TYPE_MARK
		redefine
			is_explicit_attachment_mark,
			is_attached_mark,
			is_detachable_mark,
			is_attached,
			is_detachable,
			is_question_mark,
			is_bang,
			is_explicit_separateness_mark,
			is_separate_mark,
			is_separate
		end

create

	make

feature {NONE} -- Initialization

	make (a_attachment_mark: like attachment_mark; a_separateness_keyword: like separateness_keyword)
			-- Create a new attachment mark followed by the 'separate' keyword.
		require
			a_attachment_symbol_not_void: a_attachment_mark /= Void
			a_separateness_keyword_not_void: a_separateness_keyword /= Void
		do
			attachment_mark := a_attachment_mark
			separateness_keyword := a_separateness_keyword
		ensure
			attachment_mark_set: attachment_mark = a_attachment_mark
			separateness_keyword_set: separateness_keyword = a_separateness_keyword
		end

feature -- Access

	attachment_mark: ET_TYPE_MARK
			-- Attachment mark
			-- (Either 'attached', 'detachable', '!' or '?', possibly implicit)

	separateness_keyword: ET_KEYWORD
			-- Separateness keyword
			-- ('separate')

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := attachment_mark.position
			if Result.is_null then
				Result := separateness_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			if attachment_mark.is_implicit_mark then
				Result := separateness_keyword
			else
				Result := attachment_mark.first_leaf
			end
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := separateness_keyword
		end

feature -- Status report

	is_explicit_attachment_mark: BOOLEAN
			-- Is current type mark an explicit attachment mark?
		do
			Result := attachment_mark.is_explicit_attachment_mark
		end

	is_attached_mark: BOOLEAN
			-- Is current type mark an attached mark?
		do
			Result := attachment_mark.is_attached_mark
		end

	is_detachable_mark: BOOLEAN
			-- Is current type mark a detachable mark?
		do
			Result := attachment_mark.is_detachable_mark
		end

	is_attached: BOOLEAN
			-- Is current type mark the keyword 'attached'?
		do
			Result := attachment_mark.is_attached
		end

	is_detachable: BOOLEAN
			-- Is current type mark the keyword 'detachable'?
		do
			Result := attachment_mark.is_detachable
		end

	is_question_mark: BOOLEAN
			-- Is current type mark the symbol '?'?
		do
			Result := attachment_mark.is_question_mark
		end

	is_bang: BOOLEAN
			-- Is current type mark the symbol '!'?
		do
			Result := attachment_mark.is_bang
		end

	is_explicit_separateness_mark: BOOLEAN
			-- Is current type mark an explicit mark to indicate whether
			-- the type should be separate or not?
		do
			Result := separateness_keyword.is_explicit_separateness_mark
		end

	is_separate_mark: BOOLEAN
			-- Is current type mark a mark to indicate that
			-- the type should be separate?
		do
			Result := separateness_keyword.is_separate_mark
		end

	is_separate: BOOLEAN
			-- Is current type mark the keyword 'separate'?
		do
			Result := separateness_keyword.is_separate
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_attachment_mark_separate_keyword (Current)
		end

invariant

	attachment_mark_not_void: attachment_mark /= Void
	separateness_keyword_not_void: separateness_keyword /= Void

end
