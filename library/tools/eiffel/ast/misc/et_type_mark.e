indexing

	description:

		"Eiffel type marks (e.g. 'attached', 'detachable', 'expanded', 'reference', 'separate', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_MARK

inherit

	ET_AST_LEAF

feature -- Status report

	is_attached: BOOLEAN is
			-- Is current type mark 'attached'?
		do
			-- Result := False
		end

	is_detachable: BOOLEAN is
			-- Is current type mark 'detachable'?
		do
			-- Result := False
		end

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

	is_attachment_mark: BOOLEAN is
			-- Is current type mark an attachment mark?
		do
			Result := is_attached_mark or is_detachable_mark
		ensure
			definition: Result = (is_attached_mark or is_detachable_mark)
		end

	is_attached_mark: BOOLEAN is
			-- Is current type mark an attached mark?
		do
			Result := is_attached or is_bang
		ensure
			definition: Result = (is_attached or is_bang)
		end

	is_detachable_mark: BOOLEAN is
			-- Is current type mark a detachable mark?
		do
			Result := is_detachable or is_question_mark
		ensure
			definition: Result = (is_detachable or is_question_mark)
		end

	is_keyword: BOOLEAN is
			-- Is current type mark a keyword?
		do
			Result := not (is_question_mark or is_bang)
		ensure
			definition: Result = not (is_question_mark or is_bang)
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
