note

	description:

		"Variant of XM_STOP_ON_ERROR_FILTER that also stops the parser if the error is not from the parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2013, Eric Bezault and others"
	license: "MIT License"

class XM_PARSER_STOP_ON_ERROR_FILTER

inherit

	XM_STOP_ON_ERROR_FILTER
		rename
			make_next as old_make_next
		redefine
			on_error
		end

create

	make,
	make_next

feature {NONE} -- Inialization

	make (a_parser: like parser)
			-- Set parser.
		require
			a_parser_not_void: a_parser /= Void
		do
			make_next (a_parser, null_callbacks)
		end

	make_next (a_parser: like parser; a_next: like next)
			-- Set parser and next callbacks.
		require
			a_parser_not_void: a_parser /= Void
			a_next_not_void: a_next /= Void
		do
			parser := a_parser
			old_make_next (a_next)
		end

feature -- Access

	parser: XM_PARSER
			-- Associated parser.

feature -- Event(s)

	on_error (a_message: STRING)
			-- Error event.
		do
			if parser.is_correct or else (a_message /= parser.last_error_description) then
					-- The error does not come from the parser,
					-- it is therefore an error from a filter that
					-- is between the parser and this one,
					-- so let's to stop the parser.
				parser.force_unreported_error (a_message)
			end
			Precursor (a_message)
		end

invariant

	parser_not_void: parser /= Void

end
