indexing

	description:

		"Objects that represent instructions which are also expressions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_EXPRESSION_INSTRUCTION

inherit

	XM_XPATH_EXPRESSION

	XM_XSLT_INSTRUCTION

feature {NONE} -- Initialization

	make_expression_instruction is
			-- Establish static properties
		local
			a_sub_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_EXPRESSION]
			a_list: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
		do
			initialize_special_properties
			initialize_dependencies
			initialize_intrinsic_dependencies
			set_cardinality_zero_or_more
			from
				a_list := sub_expressions
				a_cursor := a_list.new_cursor
				a_cursor.start
			variant
				a_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_sub_expression := a_cursor.item
				merge_dependencies (a_sub_expression.dependencies)
				a_cursor.forth
			end
		end

feature -- Access
	
	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		local
			a_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
			an_expression: XM_XSLT_EXPRESSION_INSTRUCTION
		do
			create a_list.make (children.count)
			from
				a_cursor := children.new_cursor
				a_cursor.start
			variant
				children.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression ?= a_cursor.item
				if an_expression = Void then
					a_cursor.go_after
					set_last_error_from_string ("BUG: Children of an XM_XSLT_EXPRESSION_INSTRUCTION must themselves be Expressions", 0, Type_error)
				else
					a_list.put_last (an_expression)
				end
				a_cursor.forth
			end
			Result := xpath_expressions (a_list)
		end

feature -- Optimization

	simplified_expression: XM_XPATH_EXPRESSION is
			-- Simplified expression as a result of context-independent static optimizations
		local
			an_expression_instruction: XM_XSLT_EXPRESSION_INSTRUCTION
			an_instruction: XM_XSLT_INSTRUCTION
			a_sequence_instruction: XM_XSLT_SEQUENCE_INSTRUCTION
			an_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
		do
			if children.count = 0 then
				Result := Current
			else
				an_expression_instruction := clone (Current)
				an_expression_instruction.clone_children (Current)
				from
					a_cursor := an_expression_instruction.children.new_cursor
					a_cursor.start
				variant
					an_expression_instruction.children.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					an_expression ?= a_cursor.item
					if an_expression /= Void then
						an_expression := an_expression.simplified_expression
						an_instruction ?= an_expression
						if an_instruction /= Void then
							a_cursor.replace (an_instruction)
						else
							create a_sequence_instruction.make (an_instruction.executable, an_expression, Void)
							a_cursor.replace (a_sequence_instruction)
						end
					end
					a_cursor.forth
				end
				Result := an_expression_instruction
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		local
			an_instruction: XM_XSLT_INSTRUCTION
			a_sequence_instruction: XM_XSLT_SEQUENCE_INSTRUCTION
			an_expression: XM_XPATH_EXPRESSION
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]	
		do
			from
				a_cursor := children.new_cursor
				a_cursor.start
			variant
				children.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression ?= a_cursor.item
				if an_expression /= Void then
					an_expression.analyze (a_context)
					if an_expression.was_expression_replaced then
						an_expression := an_expression.replacement_expression
					end
					an_instruction ?= an_expression
					if an_instruction /= Void then
						a_cursor.replace (an_instruction)
					else
						create a_sequence_instruction.make (an_instruction.executable, an_expression, Void)
						a_cursor.replace (a_sequence_instruction)
					end
				end
				a_cursor.forth
			end
		ensure then
			not_replaced: not was_expression_replaced
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		require
			promotion_offer_not_void: an_offer /= Void
		deferred
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			an_expression: XM_XPATH_EXPRESSION
		do
			an_offer.accept (Current)
			if an_offer.accepted_expression = Void then
				promote_instruction (an_offer)
			else
				set_replacement (an_offer.accepted_expression)
			end
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
			a_boolean: XM_XPATH_BOOLEAN_VALUE
			a_string: XM_XPATH_STRING_VALUE
			a_number: XM_XPATH_NUMERIC_VALUE
			a_double: XM_XPATH_DOUBLE_VALUE
		do
			an_iterator := iterator (a_context)
			if not an_iterator.is_error then
				an_iterator.start
				an_item := an_iterator.item
				a_node ?= an_item
				if a_node /= Void then
					create Result.make (True)
				else
					a_boolean ?= an_item
					if a_boolean /= Void then
						if a_boolean.value then
							create Result.make (True)
						elseif an_iterator.after then
							create Result.make (False)
						else
							an_iterator.forth
							create Result.make (not an_iterator.after)
						end
					else
						a_string ?= an_item
						if a_string /= Void then
							if a_string.string_value.count /= 0 then
								create Result.make (True)
							elseif an_iterator.after then
								create Result.make (False)
							else
								an_iterator.forth
								create Result.make (not an_iterator.after)								
							end
						else
							a_number ?= an_item
							if a_number /= Void then
								if an_iterator.after then
									create Result.make (False)
								else
									a_double ?=	a_number.convert_to_type (type_factory.double_type)
										check
											double_result_not_void: a_double /= Void
											-- This conversion always suceeds
										end
									if a_double.value = 0.0 then
										create Result.make (False)
									else
										create Result.make (a_number.is_nan)
									end
								end
							else
								create Result.make (True)
							end
						end
					end
				end
				if Result = Void then create Result.make (False) end			
			else
				create Result.make (False)
				Result.set_last_error (an_iterator.error_value)
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			an_iterator := iterator (a_context)
			an_iterator.start
			if an_iterator.after then
				last_evaluated_item := Void
			else
				last_evaluated_item := an_iterator.item
			end
		end


	evaluate_as_string (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a String.
		do
			evaluate_item (a_context)
			if last_evaluated_item = Void then
				create last_evaluated_string.make ("")
			else
				create last_evaluated_string.make (last_evaluated_item.string_value)
			end
		end
	
	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			evaluate_item (a_context)
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (last_evaluated_item)
		end

feature -- Element change

	clone_children (other: XM_XSLT_EXPRESSION_INSTRUCTION) is
			-- Clone `children' from `other'.
		require
			other_not_void: other /= Void
		do
			children := clone (other.children)
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction;
			--  (in XSLT terms, the expressions present on attributes of the instruction,
			--  as distinct from the child instructions in a sequence construction)
		require
			instruction_list_not_void: an_instruction_list /= Void
		deferred
		ensure
			expression_tester: Result /= Void  and then Result.equality_tester.is_equal (expression_tester)
		end

	same_subtree (other: like Current): BOOLEAN is
			-- Do `Current' and `other' have the same sub-tree expression?
		require
			other_not_void: other /= Void
			some_children: children.count >0 and then other.children.count > 0
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
			an_expression, another_expression: XM_XPATH_EXPRESSION
		do
			from
				a_cursor := children.new_cursor
				a_cursor.start
				Result := True
			variant
				children.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_expression ?= a_cursor.item
				another_expression ?= other.children.item (a_cursor.index)
				if an_expression = Void and then another_expression = Void then
					Result := True
				elseif an_expression = Void then
					Result := False
					a_cursor.go_after
				else
					Result := an_expression.same_expression (another_expression)
					if not Result then
						a_cursor.go_after
					end
				end
				if not a_cursor.after then a_cursor.forth end
			end			
		end

end
