indexing

	description:

	"Objects that map a sequence by replacing a node with it's typed value, whilst checking cardinality"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_SINGLETON_ATOMIZER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			item_type, simplify, check_static_type, evaluate_item, compute_cardinality, compute_special_properties
		end

create {XM_XPATH_EXPRESSION_FACTORY}

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; a_role: XM_XPATH_ROLE_LOCATOR; empty: BOOLEAN) is
			-- Establish invariant
		require
			sequence_not_void: a_sequence /= Void
			role_not_void: a_role /= Void
		do
			make_unary (a_sequence)
			role := a_role
			allows_empty := empty
			is_always_untyped := True -- not schema-aware
			compute_static_properties
			initialized := True
		ensure
			base_expression_set: base_expression = a_sequence
			role_set: role = a_role
			allows_empty_set: allows_empty = empty
			static_properties_computed: are_static_properties_computed
		end

feature -- Access
	

	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		local
			a_kind_mask: INTEGER
			finished: BOOLEAN
			a_schema_type: XM_XPATH_SCHEMA_TYPE
			a_complex_type: XM_XPATH_COMPLEX_TYPE
		do
			Result := base_expression.item_type
			if not Result.is_atomic_type then
				if Result.is_node_test then
					if not Result.is_no_node_test then
						a_kind_mask := Result.as_node_test.node_kind_mask
						if is_always_untyped then
							if INTEGER_.bit_or (a_kind_mask, string_kinds) = string_kinds then
								Result := type_factory.string_type; finished := True
							elseif INTEGER_.bit_or (a_kind_mask, untyped_if_untyped_kinds) = untyped_if_untyped_kinds then
								Result := type_factory.untyped_atomic_type; finished := True
							end
						elseif INTEGER_.bit_or (a_kind_mask, untyped_kinds) = untyped_kinds then
							Result := type_factory.untyped_atomic_type; finished := True
						end
					end
					if not finished then
						a_schema_type := Result.as_node_test.content_type
						if a_schema_type.is_simple_type then
							Result := a_schema_type.as_simple_type.common_atomic_type
						else
							a_complex_type:= a_schema_type.as_complex_type
							if a_complex_type.is_simple_content then
								Result := a_complex_type.simple_content_type.common_atomic_type
							elseif a_complex_type.is_any_type then

								-- xs:anyType includes xs:anySimpleType as a subtype,
								--  so the atomized value can be any atomic type
								--  including xdt:untypedAtomic

								Result := type_factory.any_atomic_type
							else

								-- If a complex type with complex content (other than xs:anyType) can be atomized at all,
								--  then it will return xdt:untypedAtomic values

								Result := type_factory.untyped_atomic_type
							end
						end
					end
				else
					Result := type_factory.any_atomic_type
				end
			end
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_atomic_value then
				set_replacement (base_expression.as_atomic_value)
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			base_expression.check_static_type (a_context, a_context_item_type)
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.was_expression_replaced then
					set_base_expression (base_expression.replacement_expression)
				end
				reset_static_properties
				if base_expression.is_empty_sequence and then not allows_empty then
					set_last_error_from_string (STRING_.concat ("An empty sequence is not allowed as the ", role.message), role.namespace_uri, role.error_code, Type_error)
				elseif is_sub_type (base_expression.item_type, type_factory.any_atomic_type) then
					set_replacement (base_expression)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			items_count: INTEGER
			a_value: XM_XPATH_VALUE
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				set_last_error (an_iterator.error_value)
			else
				from
					an_iterator.start
				until
					is_error or else an_iterator.after 
				loop
					an_item := an_iterator.item
					if an_item.is_atomic_value then
						items_count := items_count + 1
						if items_count > 1 then
							set_last_error_from_string (STRING_.concat ("A sequence of more than one item is not allowed as the ",
																					  role.message), role.namespace_uri, role.error_code, Type_error)
						else
							last_evaluated_item := an_item
						end
					else -- Node
						a_value := an_item.as_node.atomized_value
						items_count := a_value.count
						if items_count > 1 then
							set_last_error_from_string (STRING_.concat ("A sequence of more than one item is not allowed as the ",
																					  role.message), role.namespace_uri, role.error_code, Type_error)
						elseif items_count = 1 then
							last_evaluated_item := a_value.item_at (1)
						end
					end
					if not is_error then
						an_iterator.forth
						if an_iterator.is_error then
							set_last_error (an_iterator.error_value)
						end
					end
				end
			end
			if is_error then
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (error_value)
			elseif items_count = 0 then
				if allows_empty then
					last_evaluated_item := Void
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string (STRING_.concat ("An empty sequence is not allowed as the ",
																																	 role.message), role.namespace_uri, role.error_code, Type_error)
				end
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "atomize singleton"
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			if allows_empty then
				set_cardinality_optional
			else
				set_cardinality_exactly_one
			end
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

feature {NONE} -- Implemeantion

	is_always_untyped: BOOLEAN
			-- Are all nodes always untyped?

	allows_empty: BOOLEAN
			-- Is an empty sequence allowed?

	role: XM_XPATH_ROLE_LOCATOR
			-- Role locator

invariant

	role_not_void: initialized implies role /= Void

end

	
