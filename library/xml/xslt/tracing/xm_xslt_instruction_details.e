indexing

	description:

		"Trace details for an instruction"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_INSTRUCTION_DETAILS

inherit

	XM_XSLT_TRACE_DETAILS

	UC_SHARED_STRING_EQUALITY_TESTER

create

	make

feature {NONE} -- Initialization

	make (a_construct_type, a_line_number: INTEGER; a_system_id: STRING) is
			-- Initialize.
		require
			positive_construct_type: a_construct_type >= 0
			positive_line_number: a_line_number >= 0
			system_id_not_void: a_system_id /= Void
		do
			create {DS_ARRAYED_LIST [STRING]} trace_properties.make_default
			trace_properties.set_equality_tester (string_equality_tester)
			create property_map.make_with_equality_testers (10, string_equality_tester, string_equality_tester)
			system_id := a_system_id
			line_number := a_line_number
			construct_type := a_construct_type
		ensure
			system_id_set: system_id = a_system_id
			line_number_set: line_number = a_line_number
			construct_type_set: construct_type = a_construct_type
		end

feature -- Access

	system_id: STRING
			-- Current SYSTEM ID
	
	line_number: INTEGER
			-- Approximate line number of current event, or 0 if unknown
		
	construct_type: INTEGER
			-- Type of construct being traced

	trace_property (an_expanded_name: STRING): STRING is
			-- Value of trace-property
		do
			Result := property_map.item (an_expanded_name)
		end

	trace_properties: DS_LIST [STRING]
			-- Names of trace-properties

feature -- Element change

	set_trace_property (a_value, a_name: STRING) is
			--  Set property `a_name' to `a_value'.
		require
			name_not_void: a_name /= Void
			value_not_void: a_value /= Void
		do
			trace_properties.force_last (a_name)
			property_map.force (a_value, a_name)
		end

feature {NONE} -- Implementation

	property_map: DS_HASH_TABLE [STRING, STRING]
			-- Map of property names to values

invariant

	property_map_not_void: property_map /= Void

end
	
