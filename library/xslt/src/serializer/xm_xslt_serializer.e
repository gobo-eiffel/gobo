note

	description:

		"Interface to XSLT serializers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

deferred class XM_XSLT_SERIALIZER

inherit

	ANY

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Access

	last_error: detachable XM_XPATH_ERROR_VALUE
		-- Last reported fatal or non-recovered error

	error_listener: XM_XSLT_ERROR_LISTENER
			-- Destination for error messages and warnings
		deferred
		ensure
			error_listener_not_void: Result /= Void
		end

	encoder_factory: XM_XSLT_ENCODER_FACTORY
			-- Factory for output encoders
		deferred
		ensure
			encoder_factory_not_void: Result /= Void
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has an error occurred

feature -- Basic operations

	report_warning (a_message: STRING; a_locator: detachable XM_XPATH_LOCATOR)
			-- Report a warning.
		require
			a_message_not_void: a_message /= Void
		do
			error_listener.warning (a_message, a_locator)
		end

	report_recoverable_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Report a recoverable error.
		require
			a_error_not_void: a_error /= Void
		do
			if a_error.type = Dynamic_error and STRING_.same_string (a_error.namespace_uri, Xpath_errors_uri)
				and STRING_.same_string (a_error.code.substring (1, 4), "XTRE") then
				error_listener.error (a_error)
				if not error_listener.recovered then
					is_error := True
					last_error := a_error
				end
			else
				report_fatal_error (a_error)
			end
		end

	report_fatal_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Report a recoverable error.
		require
			error_not_void: a_error /= Void
		do
			if not is_error then

				-- We only report the first error;
				-- Otherwise, an error can get reported twice.

				error_listener.fatal_error (a_error)
				is_error := True
				last_error := a_error
			end
		ensure
			last_error_not_void: last_error /= Void
		end

invariant

	is_error_implies_error_value: is_error implies last_error /= Void

end

