indexing
	
	description:
	
		"Resolvers that maintain a URI stack"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_URI_EXTERNAL_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER

feature -- Status report

	is_stack_empty: BOOLEAN is
			-- Is URI stack empty?
		deferred
		end

	uri: UT_URI is
			-- Current URI.
		require
			has_stack: not is_stack_empty
		deferred
		ensure
			result_not_void: Result /= Void			
		end

feature -- Element change

	push_uri (a_uri: UT_URI ) is
			-- Push `a_uri' onto the stack.
		require
			uri_not_void: a_uri /= Void
		deferred
		end

end

