note

	description:

		"Invalid node iterators"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"


class XM_XPATH_INVALID_NODE_ITERATOR

inherit

	XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		redefine
			is_node_iterator, as_node_iterator
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_from_string

feature {NONE} -- Initialization

	make (a_error: XM_XPATH_ERROR_VALUE)
			-- Establish invariant.
		require
			error_not_void: a_error /= Void
		do
			set_last_error (a_error)
		ensure
			error_set: error_value = a_error
		end

	make_from_string (a_string, a_namespace_uri, a_error_code: STRING; a_error_type: INTEGER)
			-- Create from `a_string'.
		require
			valid_error_type: a_error_type = Static_error or a_error_type = Type_error or a_error_type = Dynamic_error
			string_not_void: a_string /= Void and then a_string.count > 0
			namespace_uri_not_void: a_namespace_uri /= Void
			error_code_not_void: a_error_code /= Void
		do
			create error_value.make_from_string (a_string, a_namespace_uri, a_error_code, a_error_type)
			is_error := True
		ensure
			description_set: STRING_.same_string (error_value.description, a_string)
			code_set: error_value.code = a_error_code
			type_set: error_value.type = a_error_type
		end

feature -- Access

	item: XM_XPATH_NODE
			-- Node at the current position
		do
			check
				not_called: False
				-- precondition is never met
			end
		end

feature -- Status report

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			check
				not_called: False
				-- precondition is never met
			end
		end

	is_node_iterator: BOOLEAN
			-- Does `Current' yield a node sequence?
		do
			Result := True
		end

feature -- Conversion

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Cursor movement

		forth
			-- Move to next position
		do
			check
				not_called: False
				-- precondition is never met
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			check
				not_called: False
				-- precondition is never met
			end
		end

invariant

	in_error: is_error

end

