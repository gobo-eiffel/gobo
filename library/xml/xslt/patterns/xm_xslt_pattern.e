indexing

	description:

		"XSLT patterns"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_PATTERN

inherit

	XM_XPATH_TYPE
	
	KL_IMPORTED_STRING_ROUTINES
	
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

	set_original_text (a_text_string: STRING) is
			-- Set original text of the pattern.
		require
			original_text_not_void: a_text_string /= Void
		do
			original_text := clone (a_text_string)
		ensure
			original_text_set: original_text /= Void and then STRING_.same_string (original_text, a_text_string)
		end

	set_line_number (a_number: INTEGER) is
			-- Set line number where pattern occured
		do
			line_number := a_number
		ensure
			line_number_set: line_number = a_number
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

	type_check (a_context: XM_XPATH_STATIC_CONTEXT): XM_XSLT_PATTERN is
			-- Type-check the pattern;
			-- Default implementation does nothing. This is only needed for patterns that contain
			-- variable references or function calls.
		require
			context_not_void: a_context /= Void
		do
			Result := Current
		ensure
			pattern_not_void: Result /= Void
		end

feature -- Matching

	matches (a_node: XM_XPATH_NODE; a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
			-- This is the main external interface for matching patterns;
			--  it sets the result of current() to `a_node'.
			-- The transformer is only relevant if the pattern
			--  uses variables, or contains calls on functions such as document() or key().
		require
			valid_node: a_node /= Void
		deferred
		end

feature {XM_XSLT_PATTERN} -- Local

	internal_matches (a_node: XM_XPATH_NODE;  a_transformer: XM_XSLT_TRANSFORMER): BOOLEAN is
			-- Determine whether this Pattern matches the given Node;
			-- This is an internal interface used for matching sub-patterns;
			--  it does not alter current().
			-- The default implementation is identical to matches().
		require
			valid_node: a_node /= Void
		do
			Result := matches (a_node, a_transformer)
		end
end
	
