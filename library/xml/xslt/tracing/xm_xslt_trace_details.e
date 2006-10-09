indexing

	description:

		"Objects that detail trace events"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_TRACE_DETAILS

inherit

	XM_XPATH_LOCATOR

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Access

	construct_type: INTEGER is
			-- Type of construct being traced
		deferred
		ensure
			positive_result: Result >= 0
		end

	trace_property (an_expanded_name: STRING): STRING is
			-- Value of trace-property
		require
			name_not_empty: an_expanded_name /= Void and then an_expanded_name.count > 0
			name_is_expanded_name: is_valid_expanded_name (an_expanded_name)
			property_present: STRING_.same_string (an_expanded_name, Gexslt_name_pseudo_attribute) or else trace_properties.has (an_expanded_name)
		deferred
		ensure
			result_not_void: Result /= Void
		end

	trace_properties: DS_LIST [STRING] is
			-- Names of trace-properties
		deferred
		ensure
			properties_not_void: Result /= Void
		end			

end
	
