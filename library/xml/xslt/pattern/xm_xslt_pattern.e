indexing

	description:

		"XSLT patterns"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_PATTERN

inherit

	XM_XPATH_TYPE

	XM_XPATH_STATIC_PROPERTY

	XM_XPATH_SHARED_EXPRESSION_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Access


	node_kind: INTEGER is
			-- Type of nodes matched
		do
			Result := Any_node
		end

	node_test: XM_XSLT_NODE_TEST is
			-- Retrieve an `XM_XSLT_NODE_TEST' that all nodes matching this pattern must satisfy
		deferred
		ensure
			non_void_test: Result /= Void
		end

	fingerprint: INTEGER is
			-- Determine the name fingerprint of nodes to which this pattern applies;
			-- Used for optimisation.
		do
			Result := -1 -- Means can match multiple fingerprints
		end

	default_priority: MA_DECIMAL is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			create Result.make_from_string ("0.5")
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			
			-- Default implementation returns an empty list;
			-- Suitable for a pattern without sub-expressions.
			
			create Result.make_default
			Result.set_equality_tester (expression_tester)
		ensure
			expression_tester: Result /= Void and then Result.equality_tester /= Void and then Result.equality_tester.is_equal (expression_tester)
		end
	
	computed_dependencies: ARRAY [BOOLEAN] is
			-- Dependencies which restrict optimizations
		do
			create Result.make (1, Dependency_flag_count)
		ensure
			result_not_void: Result /= Void
			correct_count: Result.count = Dependency_flag_count
		end

feature -- Status report
	
	system_id: STRING
			-- SYSTEM id of entity where pattern occured

	original_text: STRING is
			-- Original text of the pattern, for use in diagnostics
		deferred
		ensure
			original_text_not_void: Result /= Void
		end

	line_number: INTEGER
			-- Line number where pattern occured

	is_error: BOOLEAN
			-- Is the pattern in error ?

	error_value: XM_XPATH_ERROR_VALUE
			-- Error value

	is_node_test: BOOLEAN is
			-- Is `Current' a node test?
		do
			Result := False
		end

	is_location_pattern: BOOLEAN is
			-- Is `Current' a location-path pattern?
		do
			Result := False
		end

feature -- Status setting

	set_system_id (a_system_id: STRING) is
			-- Set SYSTEM id of entity where pattern occured to `a_system_id'
		require
			system_id_not_void: a_system_id /= Void
		do
			system_id := STRING_.cloned_string (a_system_id)
		ensure
			system_id_set: system_id /= Void and then STRING_.same_string (system_id, a_system_id)
		end

	set_line_number (a_number: INTEGER) is
			-- Set line number where pattern occured
		do
			line_number := a_number
		ensure
			line_number_set: line_number = a_number
		end

	set_error_value (an_error_value: XM_XPATH_ERROR_VALUE)  is
			-- Set `error_value'
		require
			error_value_not_void: an_error_value /= Void
		do
			error_value := an_error_value
			is_error := True
		ensure
			error_value_set: error_value = an_error_value
		end

feature -- Optimization

	simplified_pattern: XM_XSLT_PATTERN is
			-- Simplify a pattern by applying any context-independent optimizations;
			-- Default implementation does nothing
		do
			Result := Current
		ensure
			pattern_not_void: Result /= Void
		end

	type_check (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Type-check the pattern;
			-- Default implementation does nothing. This is only needed for patterns that contain
			-- variable references or function calls.
		require
			context_not_void: a_context /= Void
		do
			-- do nothing
		end

	promote (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote sub-expressions of `Current'.
		require
			a_offer_not_void: a_offer /= Void
		do
			-- do nothing by default
		end

feature -- Matching

	last_match_result: BOOLEAN is
			-- Result of last call to `match'
		require
			no_error: not is_error
		do
			Result := internal_last_match_result
		end

	match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Attempt to match `Current' againast `a_node'.
			-- Sets `last_match_result' and possibly `error_value'.
		require
			valid_node: a_node /= Void
			context_not_void: a_context /= Void
		deferred
		end

feature -- Conversion

		as_location_pattern: XM_XSLT_LOCATION_PATH_PATTERN is
			-- `Current' seen as a location-path pattern
		require
			location_path_pattern: is_location_pattern
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end


feature {XM_XSLT_PATTERN} -- Local

	internal_last_match_result: BOOLEAN
			-- Result of last call to `match'

	internal_match (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Determine whether this Pattern matches the given Node;
			-- This is an internal interface used for matching sub-patterns;
			--  it does not alter current().
			-- The default implementation is identical to matches().
		require
			valid_node: a_node /= Void
			context_not_void: a_context /= Void
			no_error: not is_error
		do
			match (a_node, a_context)
		end

invariant

	error: is_error implies error_value /= Void
	no_error: not is_error implies error_value = Void
	system_id_not_void: system_id /= Void

end
	
