indexing

	description:

		"Objects that represent an XML document (in some form or other)"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XSLT_SOURCE

inherit

	XM_XPATH_SHARED_NAME_POOL
		export {NONE} all end

feature -- Access

	system_id: STRING is
			-- System-id of source
		deferred
		ensure
			system_id_not_void: Result /= Void
		end

	fragment_identifier: STRING is
			-- Possible decoded fragment identifier
		deferred
		ensure
			may_be_void: True
		end

	uri_reference: STRING is
			-- Full URI reference
		do
			if fragment_identifier = Void then
				Result := system_id
			else
				Result := system_id + "#" + fragment_identifier
			end
		ensure
			result_not_void: Result /= Void
		end

	media_type: UT_MEDIA_TYPE is
			-- Media type of document entity
		deferred
		end

feature -- Events

	send (a_parser: XM_PARSER; a_receiver: XM_XPATH_RECEIVER; is_stylesheet: BOOLEAN) is
			-- Generate and send  events to `a_receiver'
		require
			parser_not_void: a_parser /= Void
			receiver_not_void: a_receiver /= Void
		deferred

			-- User requests (such as type of validation) are available in `a_configuration'.
			-- These can be sensitive to `is_stylesheet'.
			
		end

feature -- Status report

	are_media_type_ignored: BOOLEAN
			-- Are media types ignored when processing fragments?

feature -- Status setting

	ignore_media_types is
			-- Ignore media types when processing fragments.
		do
			are_media_type_ignored := True
		ensure
			media_types_ignored: are_media_type_ignored = True
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
	
