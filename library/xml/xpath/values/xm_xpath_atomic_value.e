indexing

	description:

		"An XPath value that is not a sequence (strictly, a sequence of one item)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ATOMIC_VALUE

inherit

	XM_XPATH_VALUE

	XM_XPATH_ITEM
	
feature {NONE} -- Initialization

	make_atomic_value is
			-- Establish static properties
		do
			make_value
			cardinalities.put (True, 2)
			end

feature -- Access

	typed_value: XM_XPATH_VALUE is
			-- Typed value
		do
			Result := Current
		end

	iterator (context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Yields an iterator to iterate over the values of a sequence
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (Current)
		end

feature -- Conversions
	
		convert_to_type (required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `required_type'
		require
			required_type_is_atomic: is_atomic_type (required_type)
		deferred
		end

feature -- Evaluation

	evaluate_item (context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate an expression as a single item;
			-- This always returns either a single Item or Void
			-- (denoting the empty sequence). No conversion is done. This method should not be
			-- used unless the static type of the expression is a subtype of "item" or "item?": that is,
			-- it should not be called if the expression may return a sequence. There is no guarantee that
			-- this condition will be detected.
		do
			Result := Current
		end

	
	evaluate_as_string (context: XM_XPATH_CONTEXT): STRING is
			-- Evaluate an expression as a String
			-- This function must only be called in contexts where it is known
			-- that the expression will return a single string (or where an empty sequence
			-- is to be treated as a zero-length string). Implementations should not attempt to convert
			-- the result to a string, other than converting () to "". This routine is used mainly to
			-- evaluate expressions produced by compiling an attribute value template.
		do
			Result := string_value
		end
end
