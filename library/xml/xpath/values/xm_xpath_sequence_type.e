indexing

	description:

		"XPath sequences"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SEQUENCE_TYPE

inherit

	XM_XPATH_STATIC_PROPERTY

	XM_XPATH_TYPE

	XM_XPATH_CARDINALITY

creation

	make, make_any_sequence, make_single_item, make_optional_item, make_optional_atomic,
	make_single_string, make_single_integer, make_single_node, make_node_sequence, make_numeric_sequence

feature {NONE} -- Initialization

	make (a_type: INTEGER; a_cardinality: INTEGER) is
			-- Create a specific sequence
		require
			valid_cardinality: is_valid_required_cardinality (a_cardinality)
			valid_primary_type: is_valid_type (a_type)
		do
			primary_type := a_type
			content_type := Any_item
			set_cardinality (a_cardinality)
		end

	make_any_sequence is
			-- Create a general sequence
		do
			primary_type := Any_item
			content_type := Any_item
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		end

	make_single_item is
			-- Create a sequence that allows exactly one item
		do
			primary_type := Any_item
			content_type := Any_item
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 2)
		end

	make_optional_item is
			-- Create a sequence that allows zero or one items
		do
			primary_type := Any_item
			content_type := Any_item
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
		end
	
	make_optional_atomic is
			-- Create a sequence that allows zero or one atomic items
		do
			primary_type := Atomic_type
			content_type := Any_item
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
		end

	make_single_string is
			-- Create a sequence that allows exactly one string
		do
			content_type := Any_item
			primary_type := String_type
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 2)
		end

	make_single_integer is
			-- Create a sequence that allows exactly one integer
		do
			content_type := Any_item
			primary_type := Integer_type
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 2)
		end

	make_single_node is
			-- Create a sequence that allows exactly one node
		do
			content_type := Any_item
			primary_type := Any_node
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 2)
		end

	make_node_sequence is
			-- Create a sequence that allows zero or more node
		do
			content_type := Any_item
			primary_type := Any_node
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		end

	make_numeric_sequence is
			-- Create a sequence that allows zero or more numeric values
		do
			content_type := Any_item
			primary_type := Number_type
			create cardinalities.make (1, 3)
			are_cardinalities_computed := True
			cardinalities.put (True, 1)
			cardinalities.put (True, 2)
			cardinalities.put (True, 3)
		end

feature -- Access

	primary_type: INTEGER
			-- Type of constituent items

	content_type: INTEGER
			-- Type of contents (for Elements)

invariant

	valid_primary_type: is_valid_type (primary_type)
	valid_content_type: is_valid_type (content_type)
	
end
