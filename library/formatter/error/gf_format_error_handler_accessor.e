indexing

	description: "Accessor for singleton GF_FORMAT_ERROR_HANDLER."
	thanks: "Thanks to Design Patterns and Contracts."

	library: "Gobo Eiffel Pattern Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


class

	GF_FORMAT_ERROR_HANDLER_ACCESSOR


feature {NONE} -- Private

	the_error_handler: GF_FORMAT_ERROR_HANDLER is
			-- The unique error handler instance
		once
			create Result
		ensure
			error_handler_not_void: Result /= Void
		end

	is_error_handler_real_singleton: BOOLEAN is
			-- Do multiple calls to `singleton' return the same result?
		do
			Result := the_error_handler = the_error_handler
		ensure
			definition: the_error_handler = the_error_handler
		end

invariant

	accessing_real_singleton: is_error_handler_real_singleton

end
