indexing

	description:

		"Objects that resolve URIs to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUT_URI_RESOLVER

feature -- Access

	security_manager: XM_XSLT_SECURITY_MANAGER
			-- Security manager;
			-- `resolve' must call `is_output_uri_permitted' on `security_manager'
			--  before attempting to resolve a URI. If `False' is returned,
			--  then `resolve' must set `last_result' to `Void' and set
			--  `error_message' to an explanatory message.

	output_destinations: DS_HASH_TABLE [XM_XSLT_TRANSFORMATION_RESULT, STRING]
			-- Allocated output destinations indexed by absolute URI
	
feature -- Status report

	error_message: STRING
			-- Error message from `resolve'

feature -- Element change

	set_security_manager (a_security_manager: like security_manager) is
			-- Set `security_manager'.
		require
			security_manager_not_void: a_security_manager /= Void
		do
			security_manager := a_security_manager
		ensure
			security_manager_set: security_manager = a_security_manager
		end

feature -- Action

	resolve (a_uri: UT_URI) is
			-- Resolve `a_uri'.
		require
			uri_is_absolute: a_uri /= Void and then a_uri.is_absolute
			uri_not_already_used: not output_destinations.has (a_uri.full_reference)
		deferred
		ensure
			result_or_error: last_result = Void implies error_message /= Void
			result_retrievable_by_uri: error_message = Void implies output_destinations.has (a_uri.full_reference)
				and then output_destinations.item (a_uri.full_reference) = last_result
		end

	close (a_result: XM_XSLT_TRANSFORMATION_RESULT; some_properties: XM_XSLT_OUTPUT_PROPERTIES) is
			-- Close output destination.
		require
			transformation_result_not_void: a_result /= Void
			output_properties_not_void: some_properties /= Void
		deferred
		end

feature -- Result

	last_result: XM_XSLT_TRANSFORMATION_RESULT is
			-- Result object from last call to `resolve'
		deferred
		end

invariant

	security_manager_not_void: security_manager /= Void
	output_destinations_not_void: output_destinations /= Void

end
	
