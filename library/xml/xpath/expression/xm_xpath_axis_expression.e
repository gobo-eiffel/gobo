note

	description:

		"XPath Axis Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AXIS_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			simplify, create_iterator, compute_intrinsic_dependencies, same_expression, compute_special_properties,
			is_axis_expression, as_axis_expression, is_node_sequence, create_node_iterator
		end

	XM_XPATH_AXIS
		export {NONE} all end

	XM_XPATH_SHARED_ANY_TYPE
		export {NONE} all end

	XM_XPATH_TOKENS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST)
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

	is_axis_expression: BOOLEAN
			-- Is `Current' an axis expression?
		do
			Result := True
		end

	as_axis_expression: XM_XPATH_AXIS_EXPRESSION
			-- `Current' seen as an axis expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible
		local
			principal_axis: INTEGER
		do
			if known_item_type /= Void then
				Result := known_item_type
			else
				principal_axis := axis_principal_node_type (axis)
				if principal_axis = Attribute_node then
					create {XM_XPATH_COMBINED_NODE_TEST} Result.make (create {XM_XPATH_NODE_KIND_TEST}.make_attribute_test, intersect_token, node_test)
				elseif principal_axis = Namespace_node then
					create {XM_XPATH_COMBINED_NODE_TEST} Result.make (create {XM_XPATH_NODE_KIND_TEST}.make_namespace_test, intersect_token, node_test)
				elseif node_test = Void then
					Result := any_node_test
				else
					Result := node_test
				end
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
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

	is_node_sequence: BOOLEAN
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := True
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), axis_description)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			l_parent_node: XM_XPATH_PARENT_NODE_EXPRESSION
		do
			if axis = Parent_axis and then (node_test = Void or else node_test = any_node_test) then
				create  l_parent_node.make
				set_replacement (a_replacement, l_parent_node)
			else
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_message: STRING
		do
			if a_context_item_type = Void then
				l_message := STRING_.concat ("Axis step ", axis_description)
				l_message := STRING_.appended_string (l_message, " cannot be used here: the context item is undefined")
				set_last_error_from_string (l_message, Xpath_errors_uri, "XPDY0002", Dynamic_error)
				a_replacement.put (Current)
			elseif a_context_item_type.is_atomic_type then
				l_message := STRING_.concat ("Axis step ", axis_description)
				l_message := STRING_.appended_string (l_message, " cannot be used here: the context item is an atomic value")
				set_last_error_from_string (l_message, Xpath_errors_uri, "XPTY0020", Type_error)
				a_replacement.put (Current)
			elseif a_context_item_type.is_node_test then
				check_node_test_static_type (a_replacement, a_context, a_context_item_type.as_node_test)
			else
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			a_replacement.put (Current)
		end

feature -- Evaluation

	create_iterator (a_context: XM_XPATH_CONTEXT)
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

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			an_item: XM_XPATH_ITEM
		do
			an_item := a_context.context_item
			if an_item = Void then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("The context item for an axis step is not set.", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			else
				if not an_item.is_node then
					create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("The context item for an axis is not a node.", Xpath_errors_uri, "XPTY0020", Type_error)
				elseif node_test = Void then
					last_node_iterator := an_item.as_node.new_axis_iterator (axis)
				else
					last_node_iterator := an_item.as_node.new_axis_iterator_with_node_test (axis, node_test)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			if axis = Self_axis then
				set_cardinality_optional
			elseif axis = Attribute_axis and then node_test.is_name_test then
				set_cardinality_optional
			else
				set_cardinality_zero_or_more
			end
		end

	compute_special_properties
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

	axis_description: STRING
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

	check_node_test_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_node_test: XM_XPATH_NODE_TEST)
			-- Check static type when context item is a node test.
		require
			context_not_void: a_context /= Void
			node_test_not_void: a_node_test /= Void
			a_replacement_not_void: a_replacement /= Void
			not_replaced: a_replacement.item = Void
		local
			l_origin, l_kind: INTEGER
			l_message, l_article: STRING
			l_element_test: XM_XPATH_NODE_TEST
			l_names, l_selected_names: DS_SET [INTEGER]
		do
			l_origin := a_node_test.primitive_type
			if l_origin /= Any_node and then is_axis_always_empty (axis, l_origin) then
				set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
				l_message := STRING_.concat ("The ", axis_name (axis))
				l_message := STRING_.appended_string (l_message, " axis starting at ")
				if l_origin = Element_node or else l_origin = Attribute_node then
					l_article := "an "
				else
					l_article := "a "
				end
				l_message := STRING_.appended_string (l_message, l_article)
				l_message := STRING_.appended_string (l_message, node_kind_description (l_origin))
				l_message := STRING_.appended_string (l_message, " will never select anything")
				a_context.issue_warning (l_message)
			elseif node_test /= Void then
				l_kind := node_test.primitive_type
				if l_kind /= Any_node and not axis_contains_node_kind (axis, l_kind) then
					set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
					l_message := STRING_.concat ("The ", axis_name (axis))
					l_message := STRING_.appended_string (l_message, " axis will never select any ")
					l_message := STRING_.appended_string (l_message, node_kind_description (l_kind))
					l_message := STRING_.appended_string (l_message, " nodes")
					a_context.issue_warning (l_message)
				elseif axis = Self_axis and l_kind /= Any_node and l_origin /= Any_node and l_kind /= l_origin then
					set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
					l_message := STRING_.concat ("The self axis will never select any ", node_kind_description (l_origin))
					l_message := STRING_.appended_string (l_message, " nodes when starting at ")
					if l_origin = Element_node or else l_origin = Attribute_node then
						l_article := "an "
					else
						l_article := "a "
					end
					l_message := STRING_.appended_string (l_message, l_article)
					l_message := STRING_.appended_string (l_message, " node")
					a_context.issue_warning (l_message)
				else
					if axis = Self_axis then
						create {XM_XPATH_COMBINED_NODE_TEST} known_item_type.make (a_node_test, Intersect_token, node_test)
					end
					if a_node_test.is_document_node_test and axis = Child_axis and l_kind = Element_node then
						l_element_test := a_node_test.as_document_node_test.element_test
						l_names := l_element_test.constraining_node_names
						if l_names /= Void then
							l_selected_names := node_test.constraining_node_names
							if l_selected_names /= Void and then l_selected_names.intersection (l_names).is_empty then
								set_replacement (a_replacement, create {XM_XPATH_EMPTY_SEQUENCE}.make)
								a_context.issue_warning ("Step from document node selects only invalid element names.")
							end
						end
						known_item_type := l_element_test
					end
					if a_replacement.item = Void then
						a_replacement.put (Current)
					end
					--a_schema_type := a_node_test.content_type
					-- TODO: schema-aware version
				end
			else
				a_replacement.put (Current)
			end
		ensure
			replaced: a_replacement.item /= Void
		end

end
