indexing

	description:

		"Objects that resolve URI references"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class  XM_URI_REFERENCE_RESOLVER

inherit

	XM_RESOLVER_MEDIA_TYPE

feature -- Action

	resolve_uri (a_uri_reference: STRING) is
			-- Resolve `a_uri_reference' on behalf of an application.
		require
			uri_reference_not_void: a_uri_reference /= Void
		deferred
		end

feature -- Result

	last_uri_reference_stream: KI_CHARACTER_INPUT_STREAM is
			-- Last stream initialised from URI reference.
		require
			not_error: not has_uri_reference_error
		deferred
		ensure
			not_void: Result /= Void
		end

	last_system_id: UT_URI is
			-- System id used to actually open `last_uri_reference_stream'
		require
			not_error: not has_uri_reference_error
		deferred
		ensure
			not_void: Result /= Void
		end

	has_uri_reference_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		deferred
		end
		
	last_uri_reference_error: STRING is
			-- Last error message.
		require
			has_error: has_uri_reference_error
		deferred
		ensure
			not_void: Result /= Void
		end

end
	
