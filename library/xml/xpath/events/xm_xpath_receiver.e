indexing

	description:

		"Objects that receive XPath events"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_RECEIVER

	-- This is an interface to receive XML events.
	-- It is based on XM_CALLBACKS, XM_DTD_CALLBACKS and XM_DTD_ATTRIBUTE_CONTENT,
	-- but has additional events, and work with XM_XPATH_NAME_POOL.
	-- Namespaces and attributes are handled by separate events, and Schema types
	-- can be defined for elements and attributes.

	-- XM_XPATH_CONTENT_EMITTER is available to mediate between XM_CALLBACKS etc.,
	-- and implementations of this class.


feature -- Access

	name_pool: XM_XPATH_NAME_POOL
			-- The name pool in which all name codes can be found

feature -- Events

	on_error (a_message: STRING) is
			-- Event producer detected an error.
		require
			not_void: a_message /= Void
		deferred
		end

	start_document is
			-- New document
		deferred
		end

	set_unparsed_entity (a_name: STRING; a_system_id: STRING; a_public_id: STRING) is
			-- Notify an unparsed entity URI.
		require
			name_not_void: a_name /= Void
			system_id_not_void: a_system_id /= Void
			public_id_not_void: a_public_id /= Void
		deferred
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element.
		require
			zero_properties: properties = 0 -- reserved for future use
		deferred
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
			-- Namespaces are notified after the `start_element' event, and before
			--  any children for the element. The namespaces that are reported are only required
			--  to include those that are different from the parent element; however, duplicates may be reported.
			-- A namespace must not conflict with any namespaces already used for element or attribute names.
		deferred
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute;
			-- Attributes are notified after the `start_element' event, and before any
			--  children. Namespaces and attributes may be intermingled
		require
			value_not_void: a_value /= Void
		deferred
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
			-- Note that the initial receiver of output from XSLT instructions will not receive this event,
			--  it has to detect it itself. Note that this event is reported for every element even if it has
			--  no attributes, no namespaces, and no content.
		deferred
		end

	end_element is
			-- Notify the end of an element;
			-- The receiver must maintain a stack if it needs to know which
			--  element is ending.
		deferred
		end

	notify_characters (chars: STRING; properties: INTEGER) is
			-- Notify character data.
			-- Note that some receivers may require the character data to be
			--  sent in a single event, but in general this is not a requirement.
		require
			data_not_void: chars /= Void
		deferred
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER) is
			-- Notify a processing instruction.
		require
			name_not_void: a_name /= Void
			data_not_void: a_data_string /= Void
		deferred
		end
	
	notify_comment (a_content_string: STRING; properties: INTEGER) is
			-- Notify a comment.
			-- Comments are only notified if they are outside the DTD.
		require
			content_not_void: a_content_string /= Void
		deferred
		end

	end_document is
			-- Notify the end of the document.
		deferred
		end

feature -- Element change

	set_name_pool (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Set the name pool in which all name codes can be found.
		require
			name_pool_not_void: a_name_pool /= Void
		do
			name_pool := a_name_pool
		ensure
			name_pool_set: name_pool = a_name_pool
		end

	set_system_id (a_system_id: STRING) is
			-- Set the system-id of the destination tree.
		require
			system_id_not_void: a_system_id /= Void
		deferred
		end
	
end


