indexing

	description:

		"XSLT patterns"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_PATTERN

inherit

	XM_XPATH_TYPE
	
	KL_IMPORTED_STRING_ROUTINES
	
feature -- Access

	node_test: XM_XPATH_NODE_TEST is
			-- Retrieve an `XM_XPATH_NODE_TEST' that all nodes matching this pattern must satisfy
		deferred
		ensure
			non_void_test: Result /= Void
		end

	item_type: INTEGER is
			-- Determine the types of nodes to which this pattern applies;
			-- Used for optimisation;
			-- For patterns that match nodes of several types, return Any_node
		do
			Result := Any_node
		ensure
			valid_node: is_node_type (Result)
		end

	fingerprint: INTEGER is
			-- Determine the name fingerprint of nodes to which this pattern applies;
			-- Used for optimisation.
		do
			Result := -1 -- Means can match multiple fingerprints
		end

	default_priority: DOUBLE is
			--  Determine the default priority to use if this pattern appears as a match pattern for a template with no explicit priority attribute.
		do
			Result := 0.5
		end
	
feature -- Status report
	
	system_id: STRING
			-- SYSTEM id of entity where pattern occured

	original_text: STRING
			-- Original text of the pattern, for use in diagnostics

	line_number: INTEGER
			-- Line number where pattern occured

feature -- Status setting

	set_system_id (a_system_id: STRING) is
			-- Set SYSTEM id of entity where pattern occured to `a_system_id'
		require
			system_id_not_void: a_system_id /= Void
		do
			system_id := clone (a_system_id)
		ensure
			system_id_set: system_id /= Void and then STRING_.same_string (system_id, a_system_id)
		end

	set_original_text (text: STRING) is
			-- Set original text of the pattern.
		require
			original_text_not_void: text /= Void
		do
			original_text := clone (text)
		ensure
			original_text_set: original_text /= Void and then STRING_.same_string (original_text, text)
		end

	set_line_number (a_number: INTEGER) is
			-- Set line number where pattern occured
		do
			line_number := a_number
		ensure
			line_number_set: line_number = a_number
		end
			
feature -- Analysis

	simplify: XM_XPATH_PATTERN is
			-- Simplify a pattern by applying any context-independent optimizations;
			-- Default implementation does nothing
		do
			Result := Current
		ensure
			pattern_not_void: Result /= Void
		end

	type_check (context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_PATTERN is
			-- Type-check the pattern;
			-- Default implementation does nothing. This is only needed for patterns that contain
			-- variable references or function calls.
		require
			context_not_void: context /= Void
		do
			Result := Current
		ensure
			pattern_not_void: Result /= Void
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_controller: XM_XSLT_CONTROLLER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
			-- This is the main external interface for matching patterns:
			--  it sets current() to the node being tested
			-- The controller is only relevant if the pattern
			--  uses variables, or contains calls on functions such as document() or key().
		require
			valid_node: a_node /= Void
		deferred
		end

feature {NONE} -- Implementation

	internal_matches (a_node: XM_XPATH_NODE; a_controller: XM_XSLT_CONTROLLER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
			-- This is an internal interface used for matching sub-patterns;
			--  it does not alter the value of current().
			-- The default implementation is identical to matches().
		require
			valid_node: a_node /= Void
		do
			Result := matches (a_node, a_controller)
		end
end
	
