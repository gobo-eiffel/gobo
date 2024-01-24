note

	description:

		"XPath Expressions that test whether a position() is within a certain range"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_POSITION_RANGE

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			compute_intrinsic_dependencies, evaluate_item, compute_special_properties,
			is_position_range, as_position_range
		end

create

	make

feature {NONE} -- Initialization

	make (an_integer, another_integer: INTEGER)
			-- Establish invariant.
		require
			non_negative_lower_bound: an_integer >= 0
			valid_upper_bound: another_integer >= an_integer
		do
			minimum_position := an_integer
			maximum_position := another_integer
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			minumum_set: minimum_position = an_integer
			maxumum_set: maximum_position = another_integer
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	minimum_position: INTEGER
			-- Minimum position

	maximum_position: INTEGER
			-- Maximum position

	is_position_range: BOOLEAN
			-- Is `Current' a position range?
		do
			Result := True
		end

	as_position_range: XM_XPATH_POSITION_RANGE
			-- `Current' seen as a position range
		do
			Result := Current
		end

feature -- Status report

	display (level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (level), "positionRange(")
			a_string := STRING_.appended_string (a_string, minimum_position.out)
			a_string := STRING_.appended_string (a_string, ",")
			a_string := STRING_.appended_string (a_string, maximum_position.out)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_position
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			p: INTEGER
		do
			p := a_context.context_position
			a_result.put (create {XM_XPATH_BOOLEAN_VALUE}.make (p >= minimum_position and then p <= maximum_position)	)
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	compute_special_properties
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

invariant

	minimum_position: minimum_position >= 0
	proper_range: maximum_position >= minimum_position

end
