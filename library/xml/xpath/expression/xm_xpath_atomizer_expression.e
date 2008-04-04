indexing

	description:

		"Objects that map a sequence by replacing nodes with their typed values. Corresponds to fn:data()"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIZER_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			item_type, simplify, check_static_type, create_iterator, evaluate_item, compute_cardinality,
			compute_special_properties, is_atomizer_expression, as_atomizer_expression, is_node_sequence,
			create_node_iterator
		end

	XM_XPATH_SHARED_ATOMIZING_FUNCTION

	XM_XPATH_NODE_KIND_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_sequence: XM_XPATH_EXPRESSION; untyped: BOOLEAN) is
			-- Establish invariant
		require
			sequence_not_void: a_sequence /= Void
		do
			make_unary (a_sequence)
			is_always_untyped := untyped
			compute_static_properties
			initialized := True
		ensure
			is_always_untyped_set: is_always_untyped = untyped
			base_expression_set: base_expression = a_sequence
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	is_atomizer_expression: BOOLEAN is
			-- Is `Current' an atomizer expression?
		do
			Result := True
		end

	as_atomizer_expression: XM_XPATH_ATOMIZER_EXPRESSION is
			-- `Current' seen as a range expression
		do
			Result := Current
		end

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
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	is_node_sequence: BOOLEAN is
			-- Is `Current' a sequence of zero or more nodes?
		do
			Result := False
		end

feature -- Optimization	

	simplify is
			-- Perform context-independent static optimizations
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
		do
			base_expression.simplify
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			elseif base_expression.was_expression_replaced then
				set_base_expression (base_expression.replacement_expression)
			end
			if base_expression.is_atomic_value then
				set_replacement (base_expression.as_atomic_value)
			else
				if base_expression.is_value then
					from
						base_expression.create_iterator (Void)
						an_iterator := base_expression.last_iterator
						if an_iterator.is_error then
							finished := True
							set_last_error (an_iterator.error_value)
						else
							an_iterator.start
						end
					until
						finished or else an_iterator.after
					loop

						-- If all items in the sequence are atomic (they generally will be, since this is
						--  done at compile time), then return the sequence.

						if an_iterator.item.is_node then
							finished := True
						else
							an_iterator.forth
						end
					end
					free (base_expression.last_iterator)
					if not finished then
						set_replacement (base_expression)
					end
				end
			end
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			is_always_untyped := a_context.configuration.are_all_nodes_untyped
			base_expression.check_static_type (a_context, a_context_item_type)
			if base_expression.is_error then
				set_last_error (base_expression.error_value)
			else
				if base_expression.was_expression_replaced then
					set_base_expression (base_expression.replacement_expression)
				end
				reset_static_properties
				if is_sub_type (base_expression.item_type, type_factory.any_atomic_type) then
					set_replacement (base_expression)
				end
			end
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
		do
			base_expression.evaluate_item (a_result, a_context)
			if a_result.item = Void or else a_result.item.is_error then
				-- nothing to do
			else
				if a_result.item.is_node then
					l_iterator := a_result.item.as_node.typed_value
					if l_iterator.is_error then
						a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
					else
						l_iterator.start
						if l_iterator.is_error then
							a_result.put (create {XM_XPATH_INVALID_ITEM}.make (l_iterator.error_value))
						else
							a_result.put (l_iterator.item)
						end
					end
				else
					-- nothing to do
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			an_iterator := base_expression.last_iterator
			if an_iterator.is_error then
				last_iterator := an_iterator
			else
				last_iterator := shared_atomizing_function.new_atomizing_iterator (an_iterator)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence.
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "atomize"
		end

	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		local
			a_type: XM_XPATH_ITEM_TYPE
		do
			if is_always_untyped then
				set_cardinalities (base_expression)
			elseif base_expression.cardinality_allows_many then
				set_cardinality_zero_or_more
			else
				a_type := base_expression.item_type
				if a_type.is_atomic_type then
					set_cardinalities (base_expression)
				elseif a_type.is_node_test and then a_type.as_node_test.content_type.is_atomic_type then
					set_cardinalities (base_expression)
				else
					set_cardinality_zero_or_more
				end
			end
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

feature {NONE} -- Implementation

	is_always_untyped: BOOLEAN
			-- Are all nodes guarenteed untyped?

end

	
