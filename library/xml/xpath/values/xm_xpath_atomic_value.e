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

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (Current)
		end

feature -- Comparison

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE): INTEGER is
			-- Compare `Current' to `other'
		require
			comparable_other: other /= Void and then is_comparable (other)
		deferred
		ensure
			three_way_comparison: Result >= -1 and Result <= 1
		end

feature -- Status report

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		require
			other_not_void: other /= Void
		deferred
		end

	is_convertible (a_required_type: INTEGER): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		require
			required_type_is_atomic: is_atomic_type (a_required_type)
		deferred
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate `Current' as a single item
		do
			Result := Current
		end

	
	evaluate_as_string (a_context: XM_XPATH_CONTEXT): XM_XPATH_STRING_VALUE is
			-- Evaluate `Current' as a String
		do
			create Result.make (string_value)
		end

feature -- Conversion
	
	convert_to_type (a_required_type: INTEGER): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `required_type'
		require
			required_type_is_atomic: is_atomic_type (a_required_type)
			convertiable: is_convertible (a_required_type)
		deferred
		end

end
