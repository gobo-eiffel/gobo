indexing

	description:

		"XPath sequence types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SEQUENCE_TYPE

inherit

	XM_XPATH_STATIC_PROPERTY

	XM_XPATH_TYPE
		export {NONE} all end

	XM_XPATH_CARDINALITY

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_NO_NODE_TEST
		export {NONE} all end

create

	make, make_any_sequence, make_single_item, make_optional_item, make_single_atomic, make_optional_atomic, make_optional_integer,
	make_single_string, make_optional_string, make_single_integer, make_single_double, make_single_node, make_optional_node, make_node_sequence,
	make_numeric_sequence, make_atomic_sequence, make_string_sequence, make_empty, make_single_number, make_optional_number,
	make_single_qname, make_optional_qname, make_single_boolean, make_non_empty_sequence

feature {NONE} -- Initialization

	make (a_type: XM_XPATH_ITEM_TYPE; a_cardinality: INTEGER) is
			-- Create a specific sequence
		require
			valid_cardinality: is_valid_required_cardinality (a_cardinality)
		do
			primary_type := a_type
			set_cardinality (a_cardinality)
		end

	make_empty is
			-- create an empty_sequence
		do
			primary_type := empty_item
			set_cardinality_empty
		end
	
	make_non_empty_sequence is
			-- Create a non-empty sequence
		do
			primary_type := any_item
			set_cardinality_one_or_more
		end


	make_any_sequence is
			-- Create a general sequence
		do
			primary_type := any_item
			set_cardinality_zero_or_more
		end

	make_single_item is
			-- Create a sequence that allows exactly one item
		do
			primary_type := any_item
			set_cardinality_exactly_one
		end

	make_optional_item is
			-- Create a sequence that allows zero or one items
		do
			primary_type := any_item
			set_cardinality_optional
		end
	
	make_single_atomic is
			-- Create a sequence that one atomic item
		do
			primary_type := type_factory.any_atomic_type
			set_cardinality_exactly_one
		end
	
	make_optional_atomic is
			-- Create a sequence that allows zero or one atomic items
		do
			primary_type := type_factory.any_atomic_type
			set_cardinality_optional
		end

	make_single_boolean is
			-- Create a sequence of a single xs:boolean
		do
			primary_type := type_factory.boolean_type
			set_cardinality_exactly_one
		end
	
	make_single_qname is
			-- Create a sequence of a single QName
		do
			primary_type := type_factory.qname_type
			set_cardinality_exactly_one
		end
	
	make_optional_qname is
			-- Create a sequence that allows zero or one QNames
		do
			primary_type := type_factory.qname_type
			set_cardinality_optional
		end

	make_single_string is
			-- Create a sequence that allows exactly one string
		do
			primary_type := type_factory.string_type
			set_cardinality_exactly_one
		end

	make_optional_string is
			-- Create a sequence that allows zero or one strings
		do
			primary_type := type_factory.string_type
			set_cardinality_optional
		end

	make_single_integer is
			-- Create a sequence that allows exactly one integer
		do
			primary_type := type_factory.integer_type
			set_cardinality_exactly_one
		end

	make_optional_integer is
			-- Create a sequence that allows zero or one integer
		do
			primary_type := type_factory.integer_type
			set_cardinality_optional
		end

	make_single_double is
			-- Create a sequence that allows exactly one double
		do
			primary_type := type_factory.double_type
			set_cardinality_exactly_one
		end

	make_single_node is
			-- Create a sequence that allows exactly one node
		do
			primary_type := any_node_test
			set_cardinality_exactly_one
		end

	make_optional_node is
			-- Create a sequence that allows zero or one node
		do
			primary_type := any_node_test
			set_cardinality_optional
		end

	make_node_sequence is
			-- Create a sequence that allows zero or more node
		do
			primary_type := any_node_test
			set_cardinality_zero_or_more
		end

	make_single_number is
			-- Create a sequence that exactly one numeric values
		do
			primary_type := type_factory.numeric_type
			set_cardinality_zero_or_more
		end

	make_optional_number is
			-- Create a sequence that allows zero or one numeric values
		do
			primary_type := type_factory.numeric_type
			set_cardinality_optional
		end

	make_numeric_sequence is
			-- Create a sequence that allows zero or more numeric values
		do
			primary_type := type_factory.numeric_type
			set_cardinality_exactly_one
		end

	make_atomic_sequence is
			-- Create a sequence that allows zero or more atomic values
		do
			primary_type := type_factory.any_atomic_type
			set_cardinality_zero_or_more
		end

	make_string_sequence is
			-- Create a sequence that allows zero or more atomic values
		do
			primary_type := type_factory.string_type
			set_cardinality_zero_or_more
		end

feature -- Access

	primary_type: XM_XPATH_ITEM_TYPE
			-- Type of constituent items


invariant

	valid_primary_type: primary_type /= Void
	
end
