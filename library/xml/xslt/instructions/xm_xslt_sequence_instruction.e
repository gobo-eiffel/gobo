indexing

	description:

	"Objects that represent xsl:sequence-instrucions, %
%or wrappers aoround the sequence constructor in other instructions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SEQUENCE_INSTRUCTION

inherit
	
	XM_XSLT_EXPRESSION_INSTRUCTION
		redefine
			simplify, analyze, iterator
		end

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_ROLE

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; an_expression: XM_XPATH_EXPRESSION; a_sequence_type: XM_XPATH_SEQUENCE_TYPE) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
		do
			executable := an_executable
			select_expression := an_expression
			required_type := a_sequence_type
			instruction_name := "sequence"
			create children.make (0)
			make_expression_instruction			
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = an_expression
			required_type_set: required_type = a_sequence_type
		end
	
feature -- Access

	instruction_name: STRING
			-- Name of instruction, for diagnostics
	
	select_expression: XM_XPATH_EXPRESSION
			-- Select expression

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			if required_type /= Void then
				Result := required_type.primary_type
			elseif select_expression /= Void then
				Result := select_expression.item_type
			else
				Result := any_item -- not very daring of us - I suppose we might add a subtree_item_type routine
			end
		end

feature -- Status report

	simplified: BOOLEAN
			-- Has `Current' already been simplified?

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "sequence")
			std.error.put_string (a_string)
			std.error.put_new_line
			if select_expression /= Void then
				select_expression.display (a_level + 1)
			else
				display_children (a_level + 1)
			end
		end

	
feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			a_sequence_instruction: XM_XSLT_SEQUENCE_INSTRUCTION
		do
			a_sequence_instruction ?= other
			if a_sequence_instruction /= Void then
				if select_expression /= Void then
					if a_sequence_instruction.select_expression /= Void then
						Result := select_expression.same_expression (a_sequence_instruction.select_expression)
					end
				else
					if select_expression = Void then
						if a_sequence_instruction.select_expression = Void then
							if children.count = a_sequence_instruction.children.count then
								Result := same_subtree (a_sequence_instruction)
							end
						end
					end
				end
			end
		end
	
feature -- Status setting

	set_simplified is
			-- Mark as already simplified.
		require
			not_yet_simplified: not simplified
		do
			simplified := true
		ensure
			simplified: simplified
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations.
		do
			if select_expression /= Void and not simplified then
				select_expression.simplify
				if select_expression.was_expression_replaced then
					set_select_expression (select_expression.replacement_expression)
				end
				set_simplified
			else
				Precursor
			end
		end

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions.
		local
			a_role: XM_XPATH_ROLE_LOCATOR
			a_type_checker: XM_XPATH_TYPE_CHECKER
		do
			if select_expression /= Void then
				select_expression.analyze  (a_context)
				if required_type /= Void then
					create a_role.make (Instruction_role, "sequence/select", 1)
					create a_type_checker
					a_type_checker.static_type_check (a_context, select_expression, required_type, False, a_role)
					if a_type_checker.is_static_type_check_error then
						set_last_error_from_string (a_type_checker.static_type_check_error_message, 4, Type_error)
					else
						set_select_expression (a_type_checker.checked_expression)
					end
				end
			end
			Precursor (a_context)
		end

	promote_instruction (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this instruction.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
			an_expression: XM_XPATH_EXPRESSION
			an_instruction: XM_XSLT_INSTRUCTION
			a_sequence_instruction: XM_XSLT_SEQUENCE_INSTRUCTION
		do
			if select_expression /= Void then
				select_expression.promote (an_offer)
				if select_expression.was_expression_replaced then set_select_expression (select_expression.replacement_expression) end
			else
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
						an_expression.promote (an_offer)
						--if an_expression.was_expression_replaced then an_expression := an_expression.replacement_expression end
						an_instruction ?= an_expression
						if an_instruction /= Void then
							a_cursor.replace (an_instruction)
						else
							check
								cant_happen: False
							end
							--create a_sequence_instruction.make (an_expression, Void)
							--a_cursor.replace (a_sequence_instruction)
						end
					end
					a_cursor.forth
				end					
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- An iterator over the values of a sequence
		do
			if children.count > 0 then
				set_last_error_from_string ("Cannot process xsl:sequence with children as an expression", 0, Type_error)
			else
				Result := select_expression.iterator (a_context)
			end
		end
	
feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_receiver: XM_XSLT_SEQUENCE_RECEIVER
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_item: XM_XPATH_ITEM
			a_sequence_checker: XM_XSLT_SEQUENCE_CHECKER
			a_transformer: XM_XSLT_TRANSFORMER
		do
			last_tail_call := Void
			a_transformer := a_context.transformer
			a_receiver := a_transformer.current_receiver
			if select_expression	/= Void then
				from
					an_iterator := select_expression.iterator (a_context); an_iterator.start
				until
					an_iterator.after
				loop
					an_item := an_iterator.item
					append_item (an_item, a_context, a_receiver)
					an_iterator.forth
				end
				if close_text_node then
					a_receiver.notify_characters ("", 0)
				end
			elseif required_type = Void then

				-- No type-check necessary, so write the values directly to the current output destination

				if children /= Void then
					process_children_leaving_tail (a_context)
				end
			else

				-- Type check requested, so we need to create a type-checking filter

				create a_sequence_checker.make (required_type, a_receiver)
				a_transformer.set_receiver (a_sequence_checker)
				if select_expression /= Void then
					from
						an_iterator := select_expression.iterator (a_context); an_iterator.start
					until
						an_iterator.after
					loop
						an_item := an_iterator.item
						append_item (an_item, a_context, a_receiver)
						an_iterator.forth
					end
					if close_text_node then
						a_receiver.notify_characters ("", 0)
					end
				end
				if children /= Void then
					process_children (a_context)
				end
				a_sequence_checker.final_check
				a_transformer.set_receiver (a_receiver)
			end
		end

feature -- Element change

	set_select_expression (an_expression: XM_XPATH_EXPRESSION) is
			-- Set `select_expression'.
		require
			expression_not_void: an_expression /= Void
		do
			select_expression := an_expression
		ensure
			set: select_expression = an_expression
		end

feature {XM_XSLT_EXPRESSION_INSTRUCTION} -- Local

	xpath_expressions (an_instruction_list: DS_ARRAYED_LIST [XM_XSLT_EXPRESSION_INSTRUCTION]): DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- All the XPath expressions associated with this instruction
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_INSTRUCTION]
			an_expression: XM_XPATH_EXPRESSION
		do
			if select_expression /= Void then
				create Result.make (1)
				Result.set_equality_tester (expression_tester)
				Result.put_last (select_expression)
			else
				create Result.make (children.count)
				Result.set_equality_tester (expression_tester)
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
						Result.put_last (an_expression)
					end
					a_cursor.forth
				end
			end		
		end

feature {NONE} -- Implementation

	required_type: XM_XPATH_SEQUENCE_TYPE
			-- Optional required type

	close_text_node: BOOLEAN
			-- Should we emit an empty character string? -- TODO - check what this is for

	append_item (an_item: XM_XPATH_ITEM; a_context: XM_XPATH_CONTEXT; a_receiver: XM_XSLT_SEQUENCE_RECEIVER) is
			-- If this call to xsl:sequence is in a template (rather than a function) it may
			--  be marked as a tail call; in this situation we need to evaluate the returned
			--  function call package. Doing so may return further function call packages, which also need
			--  to be processed. This has to be iterative rather than recursive to avoid consuming stack space.
		require
			item_not_void: an_item /= Void
			context_not_void: a_context /= Void
			receiver_not_void: a_receiver /= Void
		local
			an_object_value: XM_XPATH_OBJECT_VALUE
			a_function_package: XM_XSLT_FUNCTION_CALL_PACKAGE
		do
			an_object_value ?= an_item
			if an_object_value /= Void then
				a_function_package ?= an_object_value.value
				if a_function_package /= Void then
					todo ("append_item (function call package)", True)
				else
					todo ("append_item (Don't know how to deal with unknown object value)", True)
				end
			else
				a_receiver.append_item (an_item)
			end
		end

invariant

	select_expression: select_expression /= Void implies children.count = 0
	children: children.count > 0 implies select_expression = Void

end
	
