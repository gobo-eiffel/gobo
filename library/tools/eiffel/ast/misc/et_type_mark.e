indexing

	description:

		"Eiffel type marks (e.g. 'expanded', 'reference', 'separate', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_MARK

inherit

	ET_AST_LEAF

feature -- Status report

	is_expanded: BOOLEAN is
			-- Is current type mark 'expanded'?
		do
			-- Result := False
		end

	is_reference: BOOLEAN is
			-- Is current type mark 'reference'?
		do
			-- Result := False
		end

	is_separate: BOOLEAN is
			-- Is current type mark 'separate'?
		do
			-- Result := False
		end

	is_question_mark: BOOLEAN is
			-- Is current type mark '?'?
		do
			-- Result := False
		end

	is_bang: BOOLEAN is
			-- Is current type mark '!'?
		do
			-- Result := False
		end

	is_keyword: BOOLEAN is
			-- Is current type mark a keyword?
		do
			Result := is_expanded or is_reference or is_separate
		ensure
			definition: Result = (is_expanded or is_reference or is_separate)
		end

feature -- Access

	text: STRING is
			-- Textual representation of type mark
		deferred
		ensure
			text_not_void: Result /= Void
			text_not_empty: Result.count > 0
		end

end
