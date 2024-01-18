note

	description:

		"Objects that resolve URI references"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_URI_REFERENCE_RESOLVER

inherit

	XM_RESOLVER_MEDIA_TYPE

feature -- Action

	resolve_uri (a_uri_reference: STRING)
			-- Resolve `a_uri_reference' on behalf of an application.
		require
			uri_reference_not_void: a_uri_reference /= Void
		deferred
		end

feature -- Result

	last_uri_reference_stream: detachable KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from URI reference.
		deferred
		end

	last_system_id: detachable UT_URI
			-- System id used to actually open `last_uri_reference_stream'
		deferred
		end

	has_uri_reference_error: BOOLEAN
			-- Did the last resolution attempt succeed?
		deferred
		end

	last_uri_reference_error: detachable STRING
			-- Last error message.
		deferred
		end

invariant

	last_uri_reference_error_not_void: has_uri_reference_error implies last_uri_reference_error /= Void
--	last_uri_reference_stream_not_void: not has_uri_reference_error implies last_uri_reference_stream /= Void
--	last_system_id_not_void: not has_uri_reference_error implies last_system_id /= Void

end

