indexing

	description:

		"Objects that represent an XML document (in some form or other)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XSLT_SOURCE

feature -- Access

	system_id: STRING is
			-- System-id of source
		deferred
		ensure
			system_id_not_void: Result /= Void
		end

feature -- Events

	send (a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; a_name_pool: XM_XPATH_NAME_POOL; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		require
			parser_not_void: a_parser /= Void
			receiver_not_void: a_receiver /= Void
			name_pool_not_void: a_name_pool /= Void
		deferred

			-- User requests (such as type of validation) are available in `a_configuration'.
			-- These can be sensitive to `is_stylesheet'.
			
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set `system_id'.
		require
			system_id_not_void: a_system_id /= Void
		deferred
		ensure
			system_id_set: system_id = a_system_id
		end

end
	
