note

	description:

		"Eiffel class marks (e.g. 'attached', 'detachable', 'expanded', 'reference', 'separate', 'deferred', '!' or '?')"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2022, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CLASS_MARK

inherit

	ET_TYPE_MARK
		undefine
			first_position,
			last_position,
			break
		end

	ET_AST_LEAF

feature -- Status report

	is_deferred: BOOLEAN
			-- Is current type mark 'deferred'?
		do
			-- Result := False
		end

feature -- Access

	text: STRING_8
			-- Textual representation
			-- (using UTF-8 encoding)
		deferred
		ensure
			text_not_void: Result /= Void
			text_not_empty: not Result.is_empty
			text_is_string: {KL_ANY_ROUTINES}.same_types (Result, {STRING_8} "")
			valid_utf8_text: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

end
