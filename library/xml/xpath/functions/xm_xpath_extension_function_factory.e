indexing

	description:

		"Objects that create XPath extension functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_EXTENSION_FUNCTION_FACTORY


feature -- Access

	has (a_local_name: STRING; an_arity: INTEGER): BOOLEAN is
			-- Does `a_local_name' represent a known extension function?
			-- If `an_arity' = -1, then ignore `an_arity' (any match for `a_local_name' will do)
		require
			valid_local_name: a_local_name /= Void and then a_local_name.count > 0
			nearly_positive_arity: an_arity >= -1
		deferred
		end

	function (a_local_name: STRING; an_arity: INTEGER): XM_XPATH_FUNCTION_CALL is
			-- Function named `a_local_name' with `an_arity' arguments ;
			-- If `an_arity' = -1, then ignore `an_arity' (any match for `a_uri', `a_local_name' will do)
		require
			valid_local_name: a_local_name /= Void and then a_local_name.count > 0
			nearly_positive_arity: an_arity >= -1
			is_extension_function: has (a_local_name, an_arity)
		deferred
		ensure
			extension_function_not_void: Result /= Void
		end

end
