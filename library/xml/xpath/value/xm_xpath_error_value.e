note

	description:

		"XPath error values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ERROR_VALUE

inherit

	XM_XPATH_LOCATOR

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	UC_UNICODE_ROUTINES
		export {NONE} all end

create

	make, make_empty, make_from_string, make_unknown

feature {NONE} -- Initialization

	make (a_description, a_namespace_uri, a_error_code: STRING; a_value: like value; a_error_type: like type)
			-- Create a general error value.
		require
			namespace_uri_not_void: a_namespace_uri /= Void
			ascii_uri: is_ascii_string (a_namespace_uri)
			local_part_not_void: a_error_code /= Void
			ascii_code: is_ascii_string (a_error_code)
			description_not_void: a_description /= Void
			valid_error_type: a_error_type = Static_error or a_error_type = Type_error or a_error_type = Dynamic_error
		do
			if a_value = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} value.make
			else
				value := a_value
			end
			namespace_uri := a_namespace_uri
			code := a_error_code
			type := a_error_type
			description := a_description
			initialize_location
		ensure
			description_set: description = a_description
			value_set: a_value /= Void implies value = a_value
			namespace_set: namespace_uri = a_namespace_uri
			code_set: code = a_error_code
			type_set: type = a_error_type
		end

	make_empty (a_namespace_uri, a_error_code: STRING a_error_type: INTEGER)
			-- Create an empty-sequence error value
		require
			valid_error_type: a_error_type = Static_error or a_error_type = Type_error or a_error_type = Dynamic_error
			namespace_uri_not_void: a_namespace_uri /= Void
			ascii_uri: is_ascii_string (a_namespace_uri)
			local_part_not_void: a_error_code /= Void
			ascii_code: is_ascii_string (a_error_code)
		local
			l_empty_sequence: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]
		do
			create l_empty_sequence.make
			make ("()", a_namespace_uri, a_error_code, l_empty_sequence, a_error_type)
		ensure
			namespace_set: namespace_uri = a_namespace_uri
			code_set: code = a_error_code
			type_set: type = a_error_type
		end

	make_from_string (a_description, a_namespace_uri, a_error_code: STRING; a_error_type: like type)
			-- Create from `a_string'.
		require
			namespace_uri_not_void: a_namespace_uri /= Void
			ascii_uri: is_ascii_string (a_namespace_uri)
			local_part_not_void: a_error_code /= Void
			ascii_code: is_ascii_string (a_error_code)
			description_not_void: a_description /= Void
			valid_error_type: a_error_type = Static_error or a_error_type = Type_error or a_error_type = Dynamic_error
		local
			l_string_value: XM_XPATH_STRING_VALUE
			l_iterator: XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]
		do
			create l_string_value.make (a_description)
			create l_iterator.make (l_string_value)
			make (a_description, a_namespace_uri, a_error_code, l_iterator, a_error_type)
		ensure
			description_set: description = a_description
			namespace_set: namespace_uri = a_namespace_uri
			code_set: code = a_error_code
			type_set: type = a_error_type
		end

	make_unknown
			-- Create an unknown error
		local
			l_empty_sequence: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]
		do
			create l_empty_sequence.make
			make ("Unknown error", Xpath_errors_uri, "FOER0000", l_empty_sequence, Dynamic_error)
		end

	initialize_location
			-- Initialize location to unknown.
		do
			system_id := ""
			line_number := 0
		end

feature -- Access

	namespace_uri: STRING
			-- Namespace URI of error code

	code: STRING
			-- Local part of error code

	description: STRING
			-- Description

	type: INTEGER
			-- Type of error

	value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			-- Error value

	system_id: STRING
			-- SYSTEM ID of physical entity where error occurred

	line_number: INTEGER
			-- Approximate line number of current event, or 0 if unknown

	error_message: STRING
			-- Textual error message
		local
			l_message: STRING
		do
			if namespace_uri.count > 0 then
				l_message := STRING_.concat (namespace_uri, "#")
				l_message := STRING_.appended_string (l_message, code)
			else
				l_message := code
			end
			l_message := STRING_.appended_string (l_message, ": ")
			Result := STRING_.appended_string (l_message, description)
		ensure
			error_message_not_void: Result /= Void
		end

	error_identifier: STRING
			-- Identifier for error condition
		do
			Result := namespace_uri + "#" + code
		ensure
			error_identifier_not_void: Result /= Void
		end

feature -- Status report

	is_location_known: BOOLEAN
			-- is the location of the error known?
		do
			Result := not system_id.is_empty
		end

feature -- Comparison

	same_error (other: XM_XPATH_ERROR_VALUE): BOOLEAN
			-- Are `Current' and `other' the same error?
		require
			other_not_void: other /= Void
		do

			-- Same error iff QName error code and description and type are all the same

			Result := STRING_.same_string (code, other.code) and then type=other.type
				and then STRING_.same_string (error_message, other.error_message)
				and then STRING_.same_string (namespace_uri, other.namespace_uri)
		end

feature -- Element change

	set_location (a_system_id: like system_id; a_line_number: like line_number)
			-- Set location information.
		require
			system_id_known: not a_system_id.is_empty
		do
			system_id := a_system_id
			if a_line_number > 0 then line_number := a_line_number end
		ensure
			location_known: is_location_known
			system_id_set: system_id = a_system_id
			line_number_set: a_line_number > 0 implies line_number = a_line_number
		end

	set_code (a_code: like code)
			--	Set `code' to `a_code'.
		require
			a_code_not_void: a_code /= Void
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

invariant

	error_value_not_void: value /= Void
	namespace_uri_not_void: namespace_uri /= Void
	local_part_not_void: code /= Void
	description_not_void: description /= Void
	error_type: type = Static_error or type = Type_error or type = Dynamic_error

end

