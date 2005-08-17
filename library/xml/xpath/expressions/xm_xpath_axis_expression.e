indexing

	description:

		"XPath Axis Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AXIS_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, create_iterator, compute_intrinsic_dependencies, same_expression, compute_special_properties,
			is_axis_expression, as_axis_expression
		end

	XM_XPATH_AXIS

	XM_XPATH_SHARED_ANY_TYPE

create

	make

feature {NONE} -- Initialization

	make (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST) is
		require
			valid_axis_type: is_axis_valid (an_axis_type)
		do
			axis := an_axis_type
			node_test := a_node_test
			compute_static_properties
			initialized := True
		ensure
			axis_set: axis = an_axis_type
			node_test_set: node_test = a_node_test
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	
	axis: INTEGER
			-- Type of axis

	node_test: XM_XPATH_NODE_TEST
			-- Node test
	
	is_axis_expression: BOOLEAN is
			-- Is `Current' an axis expression?
		do
			Result := True
		end

	as_axis_expression: XM_XPATH_AXIS_EXPRESSION is
			-- `Current' seen as an axis expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		local
			principal_axis: INTEGER
		do
			if known_item_type /= Void then
				Result := known_item_type
			else
				principal_axis := axis_principal_node_type (axis)
				if principal_axis = Attribute_node then
					create {XM_XPATH_NODE_KIND_TEST} Result.make_attribute_test
				elseif node_test = Void or else node_test.node_kind = Any_node then
					Result := any_node_test
				else
					create {XM_XPATH_NODE_KIND_TEST} Result.make (node_test.node_kind)
				end
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			an_axis_expression: XM_XPATH_AXIS_EXPRESSION
		do
			if not other.is_axis_expression then
				Result := False
			else
				an_axis_expression := other.as_axis_expression
				if axis /= an_axis_expression.axis then
					Result := False
				elseif node_test = Void and then an_axis_expression.node_test = Void then
					Result := True
				else
					Result := STRING_.same_string (node_test.original_text, an_axis_expression.node_test.original_text)
				end
			end
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), axis_description)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		local
			a_parent_node: XM_XPATH_PARENT_NODE_EXPRESSION
		do
			if axis = Parent_axis and then (not node_test.is_name_test or else node_test = any_node_test) then
				create  a_parent_node.make
				set_replacement (a_parent_node)
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			a_message: STRING
		do
			mark_unreplaced
			if a_context_item_type = Void then
				a_message := STRING_.concat ("Axis step ", axis_description)
				a_message := STRING_.appended_string (a_message, " cannot be used here: the context item is undefined")
				set_last_error_from_string (a_message, Xpath_errors_uri, "XPDY0002", Dynamic_error)
			elseif a_context_item_type.is_atomic_type then
				a_message := STRING_.concat ("Axis step ", axis_description)
				a_message := STRING_.appended_string (a_message, " cannot be used here: the context item is an atomic value")
				set_last_error_from_string (a_message, Xpath_errors_uri, "XPTY0020", Type_error)
			elseif a_context_item_type.is_node_test then
				check_node_test_static_type (a_context, a_context_item_type.as_node_test)
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			an_item: XM_XPATH_ITEM
		do
			an_item := a_context.context_item
			if an_item = Void then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("The context item for an axis step is not set.", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			else
				if not an_item.is_node then
					create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("The context item for an axis is not a node.", Xpath_errors_uri, "XPTY0020", Type_error)
				elseif node_test = Void then
					last_iterator := an_item.as_node.new_axis_iterator (axis)
				else
					last_iterator := an_item.as_node.new_axis_iterator_with_node_test (axis, node_test)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_zero_or_more
		end

	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			set_context_document_nodeset
			set_single_document_nodeset
			set_non_creating
			if is_forward_axis (axis) then
				set_ordered_nodeset
			else
				set_reverse_document_order
			end
			if is_peer_axis (axis) then
				set_peer_nodeset
			end
			if is_subtree_axis (axis) then
				set_subtree_nodeset
			end
			if axis = Attribute_axis then
				set_attribute_ns_nodeset
			end
		end

feature {NONE} -- Implementation

	known_item_type: XM_XPATH_ITEM_TYPE
			--  Data type of the expression, when known

	axis_description: STRING is
			-- Description of `Current'
		local
			a_test_string: STRING
		do
			if node_test = Void then
				a_test_string := "node()"
			else
				a_test_string := node_test.original_text
			end
			Result := STRING_.concat (axis_name (axis), "::")
			Result := STRING_.appended_string (Result, a_test_string)
		ensure
			result_not_void: Result /= Void
		end

	check_node_test_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_node_test: XM_XPATH_NODE_TEST) is
			-- Check static type when context item is a node test.
		require
			context_exists: a_context /= Void
			node_test_exists: a_node_test /= Void
		local
			an_origin, a_kind: INTEGER
			an_empty_sequence: XM_XPATH_EMPTY_SEQUENCE
			a_message, an_article: STRING
			a_schema_type: XM_XPATH_SCHEMA_TYPE
		do
			an_origin := a_node_test.primitive_type
			if an_origin /= Any_node and then is_axis_always_empty (axis, an_origin) then
				create an_empty_sequence.make
				set_replacement (an_empty_sequence)
				a_message := STRING_.concat ("The ", axis_name (axis))
				a_message := STRING_.appended_string (a_message, " axis starting at ")
				if an_origin = Element_node or else an_origin = Attribute_node then
					an_article := "an "
				else
					an_article := "a "
				end
				a_message := STRING_.appended_string (a_message, an_article)
				a_message := STRING_.appended_string (a_message, node_kind_description (an_origin))
				a_message := STRING_.appended_string (a_message, " will never select anything")
				a_context.issue_warning (a_message)
			elseif node_test /= Void then
				a_kind := node_test.primitive_type
				if a_kind /= Any_node and then not axis_contains_node_kind (axis, a_kind) then
					create an_empty_sequence.make
					set_replacement (an_empty_sequence)
					a_message := STRING_.concat ("The ", axis_name (axis))
					a_message := STRING_.appended_string (a_message, " axis will never select any ")
					a_message := STRING_.appended_string (a_message, node_kind_description (a_kind))
					a_message := STRING_.appended_string (a_message, " nodes")
					a_context.issue_warning (a_message)
				elseif axis = Self_axis and then a_kind /= Any_node and then an_origin /= Any_node and then a_kind /= an_origin then
					create an_empty_sequence.make
					set_replacement (an_empty_sequence)
					a_message := STRING_.concat ("The self axis will never select any ", node_kind_description (an_origin))
					a_message := STRING_.appended_string (a_message, " nodes when starting at ")
					if an_origin = Element_node or else an_origin = Attribute_node then
						an_article := "an "
					else
						an_article := "a "
					end
					a_message := STRING_.appended_string (a_message, an_article)
					a_message := STRING_.appended_string (a_message, " node")
					a_context.issue_warning (a_message)
				else
					a_schema_type := a_node_test.content_type
					if a_schema_type /= any_type then
						-- TODO: schema-aware version
						check
							schema_aware: False
						end
					end
				end
			end
		end

end
