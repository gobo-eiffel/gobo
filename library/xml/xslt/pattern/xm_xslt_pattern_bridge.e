indexing

	description:

		"Expressions that provide a bridge to XSLT patterns"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_PATTERN_BRIDGE

inherit

	XM_XPATH_EXPRESSION
		redefine
			is_pattern_bridge, calculate_effective_boolean_value
		end

create

	make

feature {NONE} -- Initialization

	make (a_pattern: like pattern; a_container: like container) is
			-- initialize `Current'.
		require
			a_pattern_not_void: a_pattern /= Void
			a_container_not_void: a_container /= Void
		do
			pattern := a_pattern
			container := a_container
			initialize_special_properties
			set_cardinality_exactly_one
			set_dependencies (pattern.computed_dependencies)
		ensure
			pattern_set: pattern = a_pattern
			container_set: container = a_container
		end

feature -- Access

	pattern: XM_XSLT_PATTERN
			-- Wrapped pattern

	container: XM_XPATH_EXPRESSION_CONTAINER
			-- Containing instruction

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := type_factory.boolean_type
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			Result := pattern.sub_expressions
		end

feature -- Comparison

	same_expression (a_other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `a_other' the same expression?
		local
			l_bridge: XM_XSLT_PATTERN_BRIDGE
		do
			l_bridge ?= a_other
			Result := l_bridge /= Void and then STRING_.same_string (pattern.original_text, l_bridge.pattern.original_text)
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			l_string: STRING
		do
			std.error.put_string (STRING_.concat (indentation (a_level), "pattern: "))
			l_string := STRING_.appended_string (l_string, pattern.original_text)
			std.error.put_string (l_string)
			std.error.put_new_line
		end

	is_pattern_bridge: BOOLEAN is
			-- Is `Current' a bridge to an XSLT pattern?
		do
			Result := True
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			pattern := pattern.simplified_pattern
			set_dependencies (pattern.computed_dependencies)
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			pattern.type_check (a_context, a_context_item_type)
			if pattern.is_error then
				set_last_error (pattern.error_value)
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			-- nothing to do
		end

	promote (a_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		do
			pattern.promote (a_offer)
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Calculate effective boolean value.
		local
			l_context_item: XM_XPATH_ITEM
			l_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
		do
			l_context_item := a_context.context_item
			if l_context_item /= Void and then l_context_item.is_node  then
				l_evaluation_context ?= a_context
				pattern.match (l_context_item.as_node, l_evaluation_context)
				if pattern.is_error then
					set_last_error (pattern.error_value)
				else
					create last_boolean_value.make (pattern.last_match_result)
				end
			else
				create last_boolean_value.make (False)
			end
		end

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
		end

	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String.
		local
			l_item: DS_CELL [XM_XPATH_ITEM]		
		do
			create l_item.make (Void)
			evaluate_item (l_item, a_context)
			create last_evaluated_string.make (l_item.item.string_value)
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			l_item: DS_CELL [XM_XPATH_ITEM]
		do
			create l_item.make (Void)
			evaluate_item (l_item, a_context)
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (l_item.item)
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition cannot be met
		end

	generate_events (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			-- pre-condition cannot be met
		end

	processed_eager_evaluation (a_context: XM_XPATH_CONTEXT): XM_XPATH_VALUE is
			-- Eager evaluation via `generate_events'
		do
			-- pre-condition cannot be met
		end

	lazily_evaluate (a_context: XM_XPATH_CONTEXT; a_reference_count: INTEGER) is
			-- Lazily evaluate `Current'.
		do
			-- no lazy evaluations for patterns
			eagerly_evaluate (a_context)
		end

feature {XM_XPATH_EXPRESSION} -- Local

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
			Result := Supports_evaluate_item
		end

invariant

	pattern_not_void: pattern /= Void
	container_not_void: container /= Void

end


