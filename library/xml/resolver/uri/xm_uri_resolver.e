note

	description:

		"Interface for absolute URI resolver"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_URI_RESOLVER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES

feature -- Operation(s)

	scheme: STRING
			-- Scheme name (constant).
		deferred
		ensure
			result_not_void: Result /= Void
			result_not_empty: not Result.is_empty
		end

	resolve (a_uri: UT_URI)
			-- Resolve URI to stream.
		require
			a_uri_not_void: a_uri /= Void
			a_uri_absolute: a_uri.is_absolute
			a_uri_scheme: attached a_uri.scheme as l_scheme and then STRING_.same_string (scheme, l_scheme)
		deferred
		ensure
			stream_open_on_success: attached last_stream as l_last_stream implies l_last_stream.is_open_read
		end

feature -- Result

	last_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from external entity
		deferred
		end

	has_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		deferred
		end

	last_error: detachable STRING
			-- Last error message
		deferred
		end

	has_media_type: BOOLEAN
			-- Is the media type available.
		deferred
		end

	last_media_type: detachable UT_MEDIA_TYPE
			-- Media type, if available.
		deferred
		end

invariant

	has_error: has_error implies last_error /= Void
	has_no_error: not has_error implies last_stream /= Void
	has_media_type: has_media_type implies last_media_type /= Void

end
