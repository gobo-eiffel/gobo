indexing

	description:

		"Variant of XM_STOP_ON_ERROR_FILTER that also stops the parser if the error is not from the parser"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_PARSER_STOP_ON_ERROR_FILTER

inherit

	XM_STOP_ON_ERROR_FILTER
		redefine
			on_error
		end

create

	make,
	make_next

feature {NONE}

	make (a_parser: like parser) is
			-- Set parser.
		require
			a_parser_not_void: a_parser /= Void
		do
			parser := a_parser
			make_null
		end

	make_next (a_parser: like parser; a_next: like next) is
			-- Set parser and next callbacks.
		require
			a_parser_not_void: a_parser /= Void
			a_next_not_void: a_next /= Void
		do
			make (a_parser)
			set_next (a_next)
		end

	parser: XM_PARSER
			-- Associated parser.

feature -- Event(s)

	on_error (a_message: STRING) is
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
