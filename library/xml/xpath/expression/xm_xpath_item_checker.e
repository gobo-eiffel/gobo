note

	description:

	"Objects that implement the type checking of 'treat as':%
	%that is, return the supplied sequence, checking that all its items are of the correct type"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ITEM_CHECKER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			simplify, check_static_type, create_iterator, evaluate_item, item_type,
			same_expression, is_item_checker, as_item_checker, create_node_iterator
		end

	XM_XPATH_MAPPING_FUNCTION

	XM_XPATH_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; an_item_type: XM_XPATH_ITEM_TYPE; a_role_locator: XM_XPATH_ROLE_LOCATOR) is
			-- Establish invariant.
		require
			underlying_expression_not_void: a_sequence /= Void
			role_locator_not_void: a_role_locator /= Void
			item_type_not_void: an_item_type /= Void
		do
			error_code := a_role_locator.error_code
			make_unary (a_sequence)
			role_locator := a_role_locator
			required_item_type := an_item_type
			compute_static_properties
			adopt_child_expression (base_expression)
		ensure
			base_expression_set: base_expression = a_sequence
			role_locator_set: role_locator = a_role_locator
			item_type_set: required_item_type = an_item_type
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	required_item_type: XM_XPATH_ITEM_TYPE
			-- The required type for items
	
	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

	error_code: STRING
			-- Error code to be reported

	is_item_checker: BOOLEAN is
			-- Is `Current' an item checker?
		do
			Result := True
		end

	as_item_checker: XM_XPATH_ITEM_CHECKER is
			-- `Current' seen as an item checker
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := required_item_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			other_checker: XM_XPATH_ITEM_CHECKER
		do
			if other.is_item_checker then
				other_checker := other.as_item_checker
				Result := base_expression.same_expression (other_checker.base_expression) 
					and then other_checker.required_item_type = required_item_type
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]) is
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.simplify (l_replacement)
			set_base_expression (l_replacement.item)
			if required_item_type = any_item or else base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			else
				a_replacement.put (Current)
			end
		end

	
	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_relation: INTEGER
			l_message: STRING
			l_replacement: DS_CELL [XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			set_base_expression (l_replacement.item)
			if base_expression.is_error then
				set_replacement (a_replacement, base_expression)
			elseif base_expression.cardinality_is_empty then
				-- no type checking needed
				set_replacement (a_replacement, base_expression)
			else
				l_relation := type_relationship (required_item_type, base_expression.item_type)
				if l_relation = Same_item_type or else l_relation = Subsuming_type then
					set_replacement (a_replacement, base_expression)
				elseif l_relation = Disjoint_types then
					if base_expression.cardinality_allows_zero then
						a_context.issue_warning (STRING_.concat ("The only value that can pass type-checking is an empty sequence. ", role_locator.message))
					elseif required_item_type = type_factory.string_type and is_sub_type (base_expression.item_type, type_factory.any_uri_type)  then
						-- URI promotion will take care of this at run-time
						if base_expression.is_computed_expression then
							base_expression.as_computed_expression.set_parent (parent)
						end
						set_replacement (a_replacement, base_expression)
					else
						l_message := "Required type of " + role_locator.message + " is "
							+ required_item_type.conventional_name + "; supplied value has type " + base_expression.item_type.conventional_name
						set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (l_message, Xpath_errors_uri, error_code, Type_error))
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			base_expression.evaluate_item (a_result, a_context)
			if a_result.item = Void then
				-- do nothing
			elseif a_result.item.is_error then
				-- do nothing
			else
				test_conformance (a_result.item)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			elseif an_iterator.is_node_iterator then
				create {XM_XPATH_NODE_MAPPING_ITERATOR} last_iterator.make (an_iterator.as_node_iterator, Current, Void)
			else
				create {XM_XPATH_MAPPING_ITERATOR} last_iterator.make (an_iterator, Current, Void)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			l_iterator := base_expression.last_iterator
			if l_iterator.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (l_iterator.error_value)
			else
				create {XM_XPATH_NODE_MAPPING_ITERATOR} last_node_iterator.make (l_iterator, Current, Void)
			end
		end

	map (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `a_item' to a sequence
		do
			if not a_item.is_error then
				test_conformance (a_item)
			end
			create last_mapped_item.make_item (a_item)
		end

	map_nodes (a_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT) is
			-- Map `a_item' to a sequence
		do
			if not a_item.is_error then
				test_conformance (a_item)
				if a_item.is_error then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (a_item.error_value)
				else
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_item.as_node)
				end
			else
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (a_item.error_value)
			end
		end

feature -- Element change

	set_error_code (an_error_code: like error_code) is
			-- Set error code to be reported.
		require
			error_code_length_eight: an_error_code /= Void and then an_error_code.count = 8
		do
			error_code := an_error_code
		ensure
			error_code_set: error_code = an_error_code
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "treat as " + required_item_type.conventional_name
		end

feature {NONE} -- Implementation

	test_conformance (a_item: XM_XPATH_ITEM) is
			-- Test conformance of `a_item' to `required_item_type'.
			-- Marks `Current' and `a_item' as in error if check fails.
		require
			item_not_in_error: a_item /= Void and then not a_item.is_error 
		local
			l_message: STRING
		do
			if not required_item_type.matches_item (a_item, True) then
				l_message := STRING_.appended_string ("Required type of ", role_locator.message)
				l_message := STRING_.appended_string (l_message, " is ")
				l_message := STRING_.appended_string (l_message, required_item_type.conventional_name)
				l_message := STRING_.appended_string (l_message, "; supplied value is ")
				l_message := STRING_.appended_string (l_message, a_item.item_type.conventional_name)
				a_item.set_last_error_from_string (l_message, Xpath_errors_uri, error_code, Type_error)
				set_last_error_from_string (l_message, Xpath_errors_uri, error_code, Type_error)
			end
		end

invariant

	role_locator_not_void: initialized implies role_locator /= void
	item_type_not_void: initialized implies required_item_type /= Void
	error_code_length_eight: error_code /= Void and then error_code.count = 8

end

