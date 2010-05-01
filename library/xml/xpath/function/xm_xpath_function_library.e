note

	description:

		"Objects that provide access to functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_FUNCTION_LIBRARY

inherit

	ANY -- For SE 2.x, so that `is_equal' is exported
	
	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

		-- In all cases, an arity value of -1 means ignore the arity
		-- In all cases, if `is_restricted' is set to `True', then
		--  only functions allowed within xsl:use-when are considered.
	
		-- The creation procedure MUST allocate name codes for all
		--  functions in the library, if they are not already allocated,
		--  as the expression parser will not bother to call
		--  `is_function_available' if it cannot find the fingerprint
		--  in the name pool. Note that built-in functions already
		--  have all their fingerprints allocated.
		-- When calling `allocate_name', use a convetional
		--  XML prefix, as this will minimize the size of the
		--  name pool for most usages. The helper routine
		--  `establish_fingerprint' does this correctly.

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent an available function with `an_arity'? 
		require
			valid_arity: an_arity > -2
			strictly_positive_fingerprint: a_fingerprint > 0
		deferred
		end

	last_bound_function: XM_XPATH_EXPRESSION
			-- Last function bound by `bind_function'

feature -- Element change

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function', setting the arguments to `some_arguments'.
		require
			strictly_positive_fingerprint: a_fingerprint > 0
			arguments_not_void: some_arguments /= Void
			function_is_available: is_function_available (a_fingerprint, some_arguments.count, is_restricted)
		deferred
		ensure
			function_bound: last_bound_function /= Void
		end

feature {NONE} -- Implementation

	last_established_fingerprint: INTEGER
			-- Last fingerprint set by `establish_fingerprint'

	establish_fingerprint (a_conventional_prefix, a_namespace_uri, a_local_name: STRING) is
			-- Make fingerprint available in `last_established_fingerprint'.
		require
			conventional_prefix_not_void: a_conventional_prefix /= Void
			namespace_uri_not_empty: a_namespace_uri /= Void and then a_namespace_uri.count > 0
			local_name_not_empty: a_local_name /= Void and then a_local_name.count > 0
		do
			if shared_name_pool.is_name_code_allocated (a_conventional_prefix, a_namespace_uri, a_local_name) then
				last_established_fingerprint := shared_name_pool.fingerprint (a_namespace_uri, a_local_name)
			else
				shared_name_pool.allocate_name (a_conventional_prefix, a_namespace_uri, a_local_name)
				last_established_fingerprint := fingerprint_from_name_code (shared_name_pool.last_name_code)
			end
		ensure
			last_established_fingerprint_set: last_established_fingerprint > 0
		end

end

