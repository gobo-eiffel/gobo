note

	description:

		"XPath sequence types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
	make_single_qname, make_optional_qname, make_qname_sequence, make_single_boolean, make_non_empty_sequence, make_integer_sequence,
	make_optional_date_time, make_optional_day_time_duration, make_optional_year_month_duration, make_optional_duration,
	make_single_date, make_single_time, make_optional_date, make_optional_time, make_single_any_uri

feature	{NONE} -- Initialization

	make (a_type: XM_XPATH_ITEM_TYPE; a_cardinality: INTEGER)
			-- Create a specific sequence
		require
			valid_cardinality: is_valid_required_cardinality (a_cardinality)
		do
			primary_type := a_type
			set_cardinality (a_cardinality)
		end

	make_empty
			-- create an empty_sequence
		do
			primary_type := empty_item
			set_cardinality_empty
		end

	make_non_empty_sequence
			-- Create a non-empty sequence
		do
			primary_type := any_item
			set_cardinality_one_or_more
		end


	make_any_sequence
			-- Create a general sequence
		do
			primary_type := any_item
			set_cardinality_zero_or_more
		end

	make_single_item
			-- Create a sequence that allows exactly one item
		do
			primary_type := any_item
			set_cardinality_exactly_one
		end

	make_optional_item
			-- Create a sequence that allows zero or one items
		do
			primary_type := any_item
			set_cardinality_optional
		end

	make_single_atomic
			-- Create a sequence that one atomic item
		do
			primary_type := type_factory.any_atomic_type
			set_cardinality_exactly_one
		end

	make_optional_atomic
			-- Create a sequence that allows zero or one atomic items
		do
			primary_type := type_factory.any_atomic_type
			set_cardinality_optional
		end

	make_single_boolean
			-- Create a sequence of a single xs:boolean
		do
			primary_type := type_factory.boolean_type
			set_cardinality_exactly_one
		end

	make_single_qname
			-- Create a sequence of a single QName
		do
			primary_type := type_factory.qname_type
			set_cardinality_exactly_one
		end

	make_optional_qname
			-- Create a sequence that allows zero or one QNames
		do
			primary_type := type_factory.qname_type
			set_cardinality_optional
		end

	make_qname_sequence
			-- Create a sequence that allows zero or more QNames
		do
			primary_type := type_factory.qname_type
			set_cardinality_zero_or_more
		end

	make_single_string
			-- Create a sequence that allows exactly one string
		do
			primary_type := type_factory.string_type
			set_cardinality_exactly_one
		end

	make_optional_string
			-- Create a sequence that allows zero or one strings
		do
			primary_type := type_factory.string_type
			set_cardinality_optional
		end

	make_single_any_uri
			-- Create a sequence of a single anyURI
		do
			primary_type := type_factory.any_uri_type
			set_cardinality_exactly_one
		end

	make_single_integer
			-- Create a sequence that allows exactly one integer
		do
			primary_type := type_factory.integer_type
			set_cardinality_exactly_one
		end

	make_optional_integer
			-- Create a sequence that allows zero or one integer
		do
			primary_type := type_factory.integer_type
			set_cardinality_optional
		end

	make_integer_sequence
			-- Create a sequence that allows zero or more integers.
		do
			primary_type := type_factory.integer_type
			set_cardinality_zero_or_more
		end

	make_single_double
			-- Create a sequence that allows exactly one double
		do
			primary_type := type_factory.double_type
			set_cardinality_exactly_one
		end

	make_single_node
			-- Create a sequence that allows exactly one node
		do
			primary_type := any_node_test
			set_cardinality_exactly_one
		end

	make_optional_node
			-- Create a sequence that allows zero or one node
		do
			primary_type := any_node_test
			set_cardinality_optional
		end

	make_node_sequence
			-- Create a sequence that allows zero or more node
		do
			primary_type := any_node_test
			set_cardinality_zero_or_more
		end

	make_single_number
			-- Create a sequence that exactly one numeric values
		do
			primary_type := type_factory.numeric_type
			set_cardinality_exactly_one
		end

	make_optional_number
			-- Create a sequence that allows zero or one numeric values
		do
			primary_type := type_factory.numeric_type
			set_cardinality_optional
		end

	make_numeric_sequence
			-- Create a sequence that allows zero or more numeric values
		do
			primary_type := type_factory.numeric_type
			set_cardinality_zero_or_more
		end

	make_atomic_sequence
			-- Create a sequence that allows zero or more atomic values
		do
			primary_type := type_factory.any_atomic_type
			set_cardinality_zero_or_more
		end

	make_string_sequence
			-- Create a sequence that allows zero or more atomic values
		do
			primary_type := type_factory.string_type
			set_cardinality_zero_or_more
		end

	make_optional_date_time
			-- Create a sequence that allows zero or one dateTimes
		do
			primary_type := type_factory.date_time_type
			set_cardinality_optional
		end

	make_single_date
			-- Create a sequence that allows exactly one date.
		do
			primary_type := type_factory.date_type
			set_cardinality_exactly_one
		end

	make_single_time
			-- Create a sequence that allows exactly one time.
		do
			primary_type := type_factory.time_type
			set_cardinality_exactly_one
		end

	make_optional_date
			-- Create a sequence that allows zero or one dates
		do
			primary_type := type_factory.date_type
			set_cardinality_optional
		end
	make_optional_time
			-- Create a sequence that allows zero or one times
		do
			primary_type := type_factory.time_type
			set_cardinality_optional
		end

	make_optional_duration
			-- Create a sequence that allows zero or one durations
		do
			primary_type := type_factory.duration_type
			set_cardinality_optional
		end


	make_optional_day_time_duration
			-- Create a sequence that allows zero or one dayTimeDurations
		do
			primary_type := type_factory.day_time_duration_type
			set_cardinality_optional
		end

	make_optional_year_month_duration
			-- Create a sequence that allows zero or one dayTimeDurations
		do
			primary_type := type_factory.year_month_duration_type
			set_cardinality_optional
		end

feature -- Access

	primary_type: XM_XPATH_ITEM_TYPE
			-- Type of constituent items


invariant

	valid_primary_type: primary_type /= Void

end
