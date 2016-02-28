note

	description:

	"Objects that implement the cardinality checking of 'treat as':%
	%that is, return the supplied sequence, checking that its cardinality is correct"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CARDINALITY_CHECKER

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			check_static_type, create_iterator, evaluate_item, compute_cardinality,
			create_node_iterator, optimize
		end

create

	make

feature {NONE} -- Initialization

	-- TODO - possible singleton atomizer

	make (a_sequence: XM_XPATH_EXPRESSION; a_request: INTEGER; a_role_locator: XM_XPATH_ROLE_LOCATOR)
			-- Establish invariant.
		require
			underlying_expression_not_void: a_sequence /= Void
			role_locator_not_void: a_role_locator /= void
			valid_cardinality_request: is_valid_required_cardinality (a_request)
		do
			role_locator := a_role_locator
			make_unary (a_sequence)
			required_cardinality := a_request
			compute_static_properties
		ensure
			sequence_set: base_expression = a_sequence
			required_cardinality_set: required_cardinality = a_request
			role_locator_set: role_locator = a_role_locator
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	required_cardinality: INTEGER
			-- The required cardinality

	role_locator: XM_XPATH_ROLE_LOCATOR
			-- Role locator for error messages

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_base_expression (l_replacement_item)
					if required_cardinality = Required_cardinality_zero_or_more then
						set_replacement (a_replacement, base_expression)
					elseif base_expression.cardinality_subsumed_by (required_cardinality) then
						set_replacement (a_replacement, base_expression)
					else
						a_replacement.put (Current)
					end
				end
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.optimize (l_replacement, a_context, a_context_item_type)
			check postcondition_of_optimize: attached l_replacement.item as l_replacement_item then
				if l_replacement_item.is_error then
					set_replacement (a_replacement, l_replacement_item)
				else
					set_base_expression (l_replacement_item)
					if required_cardinality = Required_cardinality_zero_or_more then
						set_replacement (a_replacement, base_expression)
					elseif base_expression.cardinality_subsumed_by (required_cardinality) then
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
			l_finished: BOOLEAN
			l_items: INTEGER
			l_item: XM_XPATH_ITEM
			l_invalid_item: XM_XPATH_INVALID_ITEM
		do
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if not attached l_iterator.error_value as l_error_value then
					from
						l_iterator.start
					until
						l_finished or else l_iterator.is_error
					loop
						if l_iterator.is_error then
							l_finished := True
						elseif l_iterator.after then
							l_finished := True
						else
							l_item := l_iterator.item
							if l_item /= Void then
								a_result.put (l_item)
								l_items := l_items + 1
							end
							if l_items > 1 then
								create l_invalid_item.make_from_string (STRING_.appended_string ("A sequence of more than one item is not allowed as the ",
									role_locator.message), role_locator.namespace_uri, role_locator.error_code, Type_error)
								a_result.put (l_invalid_item)
								l_iterator.set_last_error (l_invalid_item.error_value)
								if not system_id.is_empty then
									l_invalid_item.error_value.set_location (system_id, line_number)
								end
								l_finished := True
							else
								l_iterator.forth
							end
						end
					end
					if not attached l_iterator.error_value as l_error_value then
						if l_items = 0 and then not is_cardinality_allows_zero (required_cardinality) then
							create l_invalid_item.make_from_string (STRING_.appended_string ("An empty sequence is not allowed as the ",
								role_locator.message), role_locator.namespace_uri, role_locator.error_code, Type_error)
							a_result.put (l_invalid_item)
							if not system_id.is_empty then
								l_invalid_item.error_value.set_location (system_id, line_number)
							end
						end
					else
						check is_error: l_iterator.is_error end
						create l_invalid_item.make (l_error_value)
						a_result.put (l_invalid_item)
						if not system_id.is_empty then
							l_invalid_item.error_value.set_location (system_id, line_number)
						end
					end
				else
					check is_error: l_iterator.is_error end
					create l_invalid_item.make (l_error_value)
					a_result.put (l_invalid_item)
					if not system_id.is_empty then
						l_invalid_item.error_value.set_location (system_id, line_number)
					end
				end
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
				l_iterator := l_last_iterator
				if not l_iterator.is_error then
					if not is_cardinality_allows_zero (required_cardinality) then
						if l_iterator.is_node_iterator then
							create {XM_XPATH_NON_EMPTY_NODE_ITERATOR} last_iterator.make (l_iterator.as_node_iterator, role_locator, required_cardinality)
						else
							create {XM_XPATH_NON_EMPTY_ITERATOR} last_iterator.make (l_iterator, role_locator, required_cardinality)
						end
					else
						last_iterator := l_iterator
					end
				else
					last_iterator := l_iterator
				end
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			base_expression.create_node_iterator (a_context)
			check postcondition_of_create_node_iterator: attached base_expression.last_node_iterator as l_last_node_iterator then
				l_iterator := l_last_node_iterator
				if not l_iterator.is_error then
					if not is_cardinality_allows_zero (required_cardinality) then
						create {XM_XPATH_NON_EMPTY_NODE_ITERATOR} last_node_iterator.make (l_iterator.as_node_iterator, role_locator, required_cardinality)
					else
						last_node_iterator := l_iterator
					end
				else
					last_node_iterator := l_iterator
				end
			end
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted

	display_operator: STRING
			-- Format `operator' for display
		do
			Result := "checkCardinality (" + cardinality_in_english (required_cardinality) + ")"
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality (required_cardinality)
		end

invariant

	role_locator_not_void: initialized implies role_locator /= void
	valid_cardinality_request: initialized implies is_valid_required_cardinality (required_cardinality)

end

