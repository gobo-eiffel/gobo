note

	description:

		"Objects that receive XPath events"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_RECEIVER

inherit

	ANY

	XM_XPATH_RECEIVER_OPTIONS
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_NAME_POOL


	-- This is an interface to receive XML events.
	-- It is based on XM_CALLBACKS, XM_DTD_CALLBACKS and XM_DTD_ATTRIBUTE_CONTENT,
	-- but has additional events, and works with XM_XPATH_NAME_POOL.
	-- Namespaces and attributes are handled by separate events, and Schema types
	-- can be defined for elements and attributes.

	-- XM_XPATH_CONTENT_EMITTER is available to mediate between XM_CALLBACKS etc.,
	-- and implementations of this class.

feature -- Access

	document_uri: detachable UT_URI
			-- Absolute URI of resource from which document node will be constructed

	base_uri: STRING
			-- Base URI of document;
			-- This will be absolute if it is possible to compute an absolute base URI

feature -- Ststus report

	is_open: BOOLEAN
			-- Has `open' been called yet?

	is_document_started: BOOLEAN
			-- Has `start_document' been called yet?

	is_written: BOOLEAN
			-- Has any output been written yet?

	is_builder: BOOLEAN
			-- Is `Current' an `XM_XPATH_BUILDER'?
		do
		end

	is_proxy: BOOLEAN
			-- Is `Current' an `XM_XPATH_PROXY_RECEIVER'?
		do
		end

	is_name_code_ok_for_start_element (a_name_code: INTEGER): BOOLEAN
			-- Is `a_name_code' valid for `start_element'?
		do

			-- This is redefined by receivers capable of skipping an element

			Result := a_name_code >= 0
		end

feature -- Status setting

	mark_as_written
			-- Mark as output has been written.
		do
			is_written := True
		end

feature -- Events

	on_error (a_message: STRING)
			-- Event producer detected an error.
		require
			not_void: a_message /= Void
		deferred
		end

	open
			-- Notify start of event stream.
		require
			not_open: not is_open
		deferred
		ensure
			opened: is_open
			not_started: not is_document_started
		end

	start_document
			-- Notify start of document node.
		require
			opened: is_open
			not_previously_started: not is_document_started
		deferred
		ensure
			document_started: is_document_started
		end

	set_unparsed_entity (a_name: STRING; a_system_id: detachable STRING; a_public_id: detachable STRING)
			-- Notify an unparsed entity URI.
		require
			name_not_void: a_name /= Void
		deferred
		ensure
			not_empty: is_written
		end

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element.
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code) and is_name_code_ok_for_start_element (a_name_code)
		deferred
		ensure
			not_empty: is_written
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
			-- Namespaces are notified after the `start_element' event, and before
			--  any children for the element. The namespaces that are reported are only required
			--  to include those that are different from the parent element; however, duplicates may be reported.
			-- A namespace must not conflict with any namespaces already used for element or attribute names.
		require
			positive_namespace_code: a_namespace_code >= 0
		deferred
		ensure
			not_empty: is_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
			-- Notify an attribute;
			-- Attributes are notified after the `start_element' event, and before any
			--  children. Namespaces and attributes may be intermingled
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
			value_not_void: a_value /= Void
		deferred
		ensure
			not_empty: is_written
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
			-- Note that the initial receiver of output from XSLT instructions will not receive this event,
			--  it has to detect it itself. Note that this event is reported for every element even if it has
			--  no attributes, no namespaces, and no content.
		require
			element_open: True -- In general, we won't occur the overhead of maintaining a stack to prove this
		deferred
		ensure
			not_empty: is_written
		end

	end_element
			-- Notify the end of an element;
			-- The receiver must maintain a stack if it needs to know which
			--  element is ending.
		require
			element_open: True -- In general, we won't occur the overhead of maintaining a stack to prove this
		deferred
		ensure
			not_empty: is_written
		end

	notify_characters (chars: STRING; properties: INTEGER)
			-- Notify character data.
			-- Note that some receivers may require the character data to be
			--  sent in a single event, but in general this is not a requirement.
		require
			element_open: True -- In general, we won't occur the overhead of maintaining a stack to prove this
			data_not_void: chars /= Void
		deferred
		ensure
			not_empty: is_written
		end

	notify_processing_instruction (a_name: STRING; a_data_string: STRING; properties: INTEGER)
			-- Notify a processing instruction.
		require
			name_not_void: a_name /= Void
			data_not_void: a_data_string /= Void
		deferred
		ensure
			not_empty: is_written
		end

	notify_comment (a_content_string: STRING; properties: INTEGER)
			-- Notify a comment.
			-- Comments are only notified if they are outside the DTD.
		require
			content_not_void: a_content_string /= Void
		deferred
		ensure
			not_empty: is_written
		end

	end_document
			-- Notify end of document node.
		require
			document_started: is_document_started
		deferred
		ensure
			document_ended: not is_document_started
		end

	close
			-- Notify end of event stream.
		require
			opened: is_open
			document_ended: not is_document_started
		deferred
		ensure
			not_open: not is_open
		end

feature -- Element change

	set_document_uri (a_uri: detachable UT_URI)
			-- Set `document_uri' for destination tree.
		require
			not_open: not is_open
			absolute_uri: a_uri /= Void implies a_uri.is_absolute
		do
			document_uri := a_uri
		ensure
			document_uri_set: document_uri = a_uri
		end

	set_base_uri (a_uri: STRING)
			-- Set `base_uri' for destination tree.
		require
			a_uri: a_uri /= Void
		do
			base_uri := a_uri
		ensure
			base_uri_set: base_uri = a_uri
		end

	set_document_locator (a_locator: XM_XPATH_LOCATOR)
			-- Set the locator.
		require
			not_open: not is_open
			locator_not_void: a_locator /= Void
		deferred
		end

feature -- Conversion

	as_builder: XM_XPATH_BUILDER
			-- `Current' as a builder
		require
			builder: is_builder
		do
			check precondition_is_builder: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_proxy: XM_XPATH_PROXY_RECEIVER
			-- `Current' as a proxy
		require
			proxy: is_proxy
		do
			check precondition_is_proxy: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

invariant

	document_uri_is_absolute: attached document_uri as l_document_uri implies l_document_uri.is_absolute
	base_uri_not_void: base_uri /= Void
	not_open_implies_not_started: not is_open implies not is_document_started
	started_implies_open: is_document_started implies is_open

end


