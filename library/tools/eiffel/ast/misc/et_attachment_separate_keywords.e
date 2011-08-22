note

	description:

		"Eiffel keyword 'attached' or 'detachable' followed by keyword 'separate'"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ATTACHMENT_SEPARATE_KEYWORDS

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

	make (a_attachment_keyword: like attachment_keyword; a_separateness_keyword: like separateness_keyword)
			-- Create a new attachment keyword followed by the 'separate' keyword.
		require
			a_attachment_keyword_not_void: a_attachment_keyword /= Void
			a_attachment_keyword_consistency: a_attachment_keyword.is_attached or a_attachment_keyword.is_detachable
			a_separateness_keyword_not_void: a_separateness_keyword /= Void
		do
			attachment_keyword := a_attachment_keyword
			separateness_keyword := a_separateness_keyword
		ensure
			attachment_keyword_set: attachment_keyword = a_attachment_keyword
			separateness_keyword_set: separateness_keyword = a_separateness_keyword
		end

feature -- Access

	attachment_keyword: ET_KEYWORD
			-- Attachment keyword
			-- (Either 'attached' or 'detachable')

	separateness_keyword: ET_KEYWORD
			-- Separateness keyword
			-- ('separate')
	
	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := attachment_keyword.position
			if Result.is_null then
				Result := separateness_keyword.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := attachment_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := separateness_keyword
		end

	break: ET_BREAK
			-- Break which appears just after current node
		do
			Result := separateness_keyword.break
		end

feature -- Status report

	is_separate_mark: BOOLEAN = True
			-- Is current type mark a mark to indicate that
			-- the type should be separate?
		
	is_attached_mark: BOOLEAN
			-- Is current type mark an attached mark?
		do
			Result := attachment_keyword.is_attached
		end
		
	is_detachable_mark: BOOLEAN
			-- Is current type mark a detachable mark?
		do
			Result := attachment_keyword.is_detachable
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_attachment_separate_keywords (Current)
		end

invariant

	attachment_keyword_not_void: attachment_keyword /= Void
	attachment_keyword_consistency: attachment_keyword.is_attached or attachment_keyword.is_detachable
	separateness_keyword_not_void: separateness_keyword /= Void
	
end
