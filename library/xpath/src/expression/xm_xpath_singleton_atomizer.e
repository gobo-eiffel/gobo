note

	description:

	"Objects that map a sequence by replacing a node with it's typed value, whilst checking cardinality"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2015, Colin Adams and others"
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

	make (a_sequence: XM_XPATH_EXPRESSION; a_role: XM_XPATH_ROLE_LOCATOR; empty: BOOLEAN)
			-- Establish invariant
		require
			sequence_not_void: a_sequence /= Void
			role_not_void: a_role /= Void
		do
			role := a_role
			make_unary (a_sequence)
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


	item_type: XM_XPATH_ITEM_TYPE
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

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.simplify (l_replacement)
			check postcondition_of_simplify: attached l_replacement.item as l_replacement_item then
				set_base_expression (l_replacement_item)
				if base_expression.is_error then
					set_replacement (a_replacement, base_expression)
				elseif base_expression.is_atomic_value then
					set_replacement (a_replacement, base_expression.as_atomic_value)
				else
					a_replacement.put (Current)
				end
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_base_expression (l_replacement_item)
				if base_expression.is_error then
					set_replacement (a_replacement, base_expression)
				else
					reset_static_properties
					if base_expression.is_empty_sequence and then not allows_empty then
						set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (
							STRING_.concat ("An empty sequence is not allowed as the ", role.message), role.namespace_uri, role.error_code, Type_error))
					elseif is_sub_type (base_expression.item_type, type_factory.any_atomic_type) then
						set_replacement (a_replacement, base_expression)
					else
						a_replacement.put (Current)
					end
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_item: XM_XPATH_ITEM
			l_items_count: INTEGER
			l_value: XM_XPATH_VALUE
		do
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if attached l_iterator.error_value as l_error_value then
					check is_error: l_iterator.is_error end
					set_last_error (l_error_value)
				else
					from
						l_iterator.start
					until
						is_error or else l_iterator.after
					loop
						l_item := l_iterator.item
						if l_item.is_atomic_value then
							l_items_count := l_items_count + 1
							if l_items_count > 1 then
								set_last_error_from_string (STRING_.concat ("A sequence of more than one item is not allowed as the ",
									role.message), role.namespace_uri, role.error_code, Type_error)
							else
								a_result.put (l_item)
							end
						else -- Node
							l_value := l_item.as_node.atomized_value
							l_items_count := l_value.count
							if l_items_count > 1 then
								set_last_error_from_string (STRING_.concat ("A sequence of more than one item is not allowed as the ", role.message), role.namespace_uri, role.error_code, Type_error)
							elseif l_items_count = 1 then
								a_result.put (l_value.item_at (1))
							end
						end
						if not is_error then
							l_iterator.forth
							if attached l_iterator.error_value as l_error_value then
								check is_error: l_iterator.is_error end
								set_last_error (l_error_value)
							end
						end
					end
				end
				if attached error_value as l_error_value then
					check is_error: is_error end
					a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_error_value))
				elseif l_items_count = 0 then
					if allows_empty then
						a_result.put (Void)
					else
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string (STRING_.concat ("An empty sequence is not allowed as the ",
							role.message), role.namespace_uri, role.error_code, Type_error))
					end
				end
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := "atomize singleton"
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			if allows_empty then
				set_cardinality_optional
			else
				set_cardinality_exactly_one
			end
		end

	compute_special_properties
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


