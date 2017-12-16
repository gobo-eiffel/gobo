note

	description:

		"XPath InstanceOf Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_INSTANCE_OF_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			same_expression, check_static_type, calculate_effective_boolean_value, evaluate_item,
			compute_cardinality, item_type, display, is_instance_of_expression,
			as_instance_of_expression
		end

create

	make

feature {NONE} -- Initialization

	make (a_source: XM_XPATH_EXPRESSION; a_target_type: XM_XPATH_SEQUENCE_TYPE)
			-- Establish invariant.
		require
			source_expression_not_void: a_source /= Void
			target_sequence_type_not_void: a_target_type /= Void
		do
			target_type := a_target_type
			make_unary (a_source)
			compute_static_properties
		ensure
			static_properties_computed: are_static_properties_computed
			base_expression_set: base_expression = a_source
			target_set: target_type = a_target_type
		end

feature -- Access

	target_type: XM_XPATH_SEQUENCE_TYPE
			-- Target sequence type

	is_instance_of_expression: BOOLEAN
			-- Is `Current' an instance-of expression?
		do
			Result := True
		end

	as_instance_of_expression: XM_XPATH_INSTANCE_OF_EXPRESSION
			-- `Current' seen as an instance-of expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		local
			other_instance_of: XM_XPATH_INSTANCE_OF_EXPRESSION
		do
			if other.is_instance_of_expression then
				other_instance_of := other.as_instance_of_expression
				Result := base_expression.same_expression (other_instance_of.base_expression)
					and then other_instance_of.target_type = target_type
					and then other_instance_of.cardinality = cardinality
			end
		end

feature -- Status report

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "instance-of ")
			std.error.put_string (a_string)
			std.error.put_new_line
			base_expression.display (a_level + 1)
			a_string := STRING_.appended_string (indentation (a_level + 1), target_type.primary_type.conventional_name)
			a_string := STRING_.appended_string (a_string, target_type.occurrence_indicator)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION];
		a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static analysis of `Current' and its subexpressions
		local
			l_expression: XM_XPATH_EXPRESSION
			l_relation: INTEGER
			l_result: DS_CELL [detachable XM_XPATH_ITEM]
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			base_expression.check_static_type (l_replacement, a_context, a_context_item_type)
			check postcondition_of_check_static_type: attached l_replacement.item as l_replacement_item then
				set_base_expression (l_replacement_item)
				if base_expression.is_error then
					set_replacement (a_replacement, base_expression)
				else
					if base_expression.is_value and not base_expression.depends_upon_implicit_timezone then
						create l_result.make (Void)
						evaluate_item (l_result, a_context.new_compile_time_context)
						if attached l_result.item as l_result_item then
							set_replacement (a_replacement, l_result_item.as_atomic_value)
						end
					else

						-- See if we can get the answer by static analysis.

						if target_type.cardinality_subsumes (base_expression.cardinality) then
							l_relation := type_relationship (base_expression.item_type, target_type.primary_type)
							if l_relation = Same_item_type or else l_relation = Subsumed_type then
								create {XM_XPATH_BOOLEAN_VALUE} l_expression.make (True)
								set_replacement (a_replacement, l_expression)
							elseif l_relation = Disjoint_types then
								-- it might still be true - iff both sequences are empty
								if (not base_expression.cardinality_allows_zero) or (not target_type.cardinality_allows_zero) then
									create {XM_XPATH_BOOLEAN_VALUE} l_expression.make (False)
									set_replacement (a_replacement, l_expression)
								end
							end
						end
					end
				end
				if a_replacement.item = Void then
					a_replacement.put (Current)
				end
			end
		end

	-- TODO: add optimize along the same lines

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			counter: INTEGER
			finished: BOOLEAN
			l_last_boolean_value: like last_boolean_value
		do
			last_boolean_value := Void
			base_expression.create_iterator (a_context)
			check postcondition_of_create_iterator: attached base_expression.last_iterator as l_last_iterator then
				an_iterator := l_last_iterator
				if attached an_iterator.error_value as l_error_value then
					check is_error: an_iterator.is_error end
					create l_last_boolean_value.make (False)
					l_last_boolean_value.set_last_error (l_error_value)
					last_boolean_value := l_last_boolean_value
				else
					from
						counter := 0; finished := False
						an_iterator.start
					until
						finished or else an_iterator.is_error or else an_iterator.after
					loop
						an_item := an_iterator.item
						counter := counter + 1
						if not target_type.primary_type.matches_item (an_item, False) then
							create last_boolean_value.make (False); finished := True
						elseif counter = 2 and then not target_type.cardinality_allows_many then
							create last_boolean_value.make (False)
						end
						an_iterator.forth
					end
					if last_boolean_value = Void then
						if counter = 0 and then not target_type.cardinality_allows_zero then
							create last_boolean_value.make (False)
						else
							create last_boolean_value.make (True)
						end
					end
				end
			end
		end

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			calculate_effective_boolean_value (a_context)
			a_result.put (last_boolean_value)
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	display_operator: STRING
			-- Format `operator' for display
		do
			-- not used
			check False then end
		end

invariant

	target_sequence_type_not_void: initialized implies target_type /= Void

end
