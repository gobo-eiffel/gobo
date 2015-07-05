note

	description:

		"Eiffel symbol '!' or '?' followed by keyword 'separate'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ATTACHMENT_SYMBOL_SEPARATE_KEYWORD

inherit

	ET_TYPE_MARK
		redefine
			is_attached_mark,
			is_detachable_mark,
			is_separate_mark
		end

create

	make

feature {NONE} -- Initialization

	make (a_attachment_symbol: like attachment_symbol; a_separateness_keyword: like separateness_keyword)
			-- Create a new attachment symbol followed by the 'separate' keyword.
		require
			a_attachment_symbol_not_void: a_attachment_symbol /= Void
			a_attachment_symbol_consistency: a_attachment_symbol.is_bang or a_attachment_symbol.is_question_mark
			a_separateness_keyword_not_void: a_separateness_keyword /= Void
		do
			attachment_symbol := a_attachment_symbol
			separateness_keyword := a_separateness_keyword
		ensure
			attachment_symbol_set: attachment_symbol = a_attachment_symbol
			separateness_keyword_set: separateness_keyword = a_separateness_keyword
		end

feature -- Access

	attachment_symbol: ET_SYMBOL
			-- Attachment symbol
			-- (Either '!' or '?')

	separateness_keyword: ET_KEYWORD
			-- Separateness keyword
			-- ('separate')

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := attachment_symbol.position
			if Result.is_null then
				Result := separateness_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := attachment_symbol
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := separateness_keyword
		end

feature -- Status report

	is_separate_mark: BOOLEAN = True
			-- Is current type mark a mark to indicate that
			-- the type should be separate?

	is_attached_mark: BOOLEAN
			-- Is current type mark an attached mark?
		do
			Result := attachment_symbol.is_bang
		end

	is_detachable_mark: BOOLEAN
			-- Is current type mark a detachable mark?
		do
			Result := attachment_symbol.is_question_mark
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_attachment_symbol_separate_keyword (Current)
		end

invariant

	attachment_symbol_not_void: attachment_symbol /= Void
	attachment_symbol_consistency: attachment_symbol.is_bang or attachment_symbol.is_question_mark
	separateness_keyword_not_void: separateness_keyword /= Void

end
