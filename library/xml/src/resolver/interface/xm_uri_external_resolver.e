note

	description:

		"Resolvers that maintain a URI stack"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_URI_EXTERNAL_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER

	XM_RESOLVER_MEDIA_TYPE

feature -- Status report

	supports_registering_schemes: BOOLEAN
			-- Does `Current' support registering scheme resolvers?
		deferred
		end

	is_stack_empty: BOOLEAN
			-- Is URI stack empty?
		deferred
		end

	uri: UT_URI
			-- Current URI.
		require
			has_stack: not is_stack_empty
		deferred
		ensure
			result_not_void: Result /= Void
		end

feature -- Element change

	push_uri (a_uri: UT_URI )
			-- Push `a_uri' onto the stack.
		require
			uri_not_void: a_uri /= Void
		deferred
		end

	clear_uri_stack
			-- Clear uri stack.
		deferred
		ensure
			stack_empty: is_stack_empty
		end

	reset_uri_stack (a_uri: UT_URI)
			-- Empty the stack then push `a_uri' onto the stack.
		require
			a_uri_not_void: a_uri /= Void
		do
			clear_uri_stack
			push_uri (a_uri)
		end

	register_scheme (a_scheme: XM_URI_RESOLVER)
			-- Register scheme.
		require
			a_scheme_not_void: a_scheme /= Void
			registering_schemes_supported: supports_registering_schemes
		deferred
		end

end

