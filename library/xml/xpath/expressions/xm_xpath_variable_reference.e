indexing

	description:

	"References to a variable"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VARIABLE_REFERENCE

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			same_expression, promote, iterator, evaluate_item, lazily_evaluate
		end

	XM_XPATH_BINDING_REFERENCE

creation

	make

feature {NONE} -- Initialization

	make (a_declaration: XM_XPATH_VARIABLE_DECLARATION) is
			-- Register `Current' with `a_declaration'
			-- When the variable declaration is compiled,
			--  the declaration will call our fix_up routine.
			-- Note that the object does not retain a pointer
			--  to the variable declaration, which would cause the
			--  stylesheet to be locked in memory.
		require
			declaration_not_void: a_declaration /= Void
		do
			a_declaration.register_reference (Current)
			display_name := a_declaration.variable_name
			compute_static_properties
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			if static_type = Void then
				create {XM_XPATH_ANY_ITEM_TYPE} Result.make
			else
				Result := static_type.primary_type
			end
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	binding: XM_XPATH_BINDING
			-- Binding for variable;
			-- will be `Void' until `fix_up' is called.


feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
			-- (Note, we only compare expressions that
			--  have the same static and dynamic context).
			-- I'm not entirely happy with the routine logic,
			--  since if binding is `Void', then we cannot know
			--  if the two references are to the same
			--  binding or not.
			-- But it is necessary to return `Ture' to avoid
			--  {DS_ARRAYED_LIST}.put from failing it's post-condition.
		local
			other_reference: XM_XPATH_VARIABLE_REFERENCE
		do
			other_reference ?= other
			if other_reference /= Void then 
				Result := binding = other_reference.binding
			end
		end

feature -- Status report

	last_evaluated_binding: XM_XPATH_VALUE
			-- Value from calling evaluated_binding

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			if display_name = Void then
				a_string := STRING_.appended_string (indentation (a_level), "$(unbound variable)")
				std.error.put_string (a_string)
				if is_error then
					std.error.put_string (" in error%N")
				else
					std.error.put_new_line
				end
			else
				a_string := STRING_.appended_string (indentation (a_level), "$")
				a_string := STRING_.appended_string (a_string, display_name)				
				std.error.put_string (a_string)
				if is_error then
					std.error.put_string (" in error%N")
				else
					std.error.put_new_line
				end
			end
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions;		
		do
			mark_unreplaced
				check
					static_type_not_void: static_type /= Void
				end
			if constant_value /= Void then
				set_replacement (constant_value)
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			if an_offer.action = Inline_variable_references then
				an_offer.accept (Current)
				a_promotion := an_offer.accepted_expression
				if a_promotion /= Void then
					set_replacement (a_promotion)
				end
			end
		end

feature -- Evaluation

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterate over the values of a sequence
		do
			evaluate_variable (a_context)
			Result := last_evaluated_binding.iterator (a_context)
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			evaluate_variable (a_context)
				check
					is_convertible_to_item: last_evaluated_binding.is_convertible_to_item (a_context)
				end
				last_evaluated_item := last_evaluated_binding.as_item (a_context)
		end

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate variable
		require
			binding_not_void: binding /= Void
		do
			binding.evaluate_variable (a_context)
			last_evaluated_binding := binding.last_evaluated_binding
		end

	lazily_evaluate (a_context: XM_XPATH_CONTEXT) is
			-- Lazily evaluate `Current'.
		do
			eagerly_evaluate (a_context)
		end

feature -- Element change

	set_static_type (a_type: XM_XPATH_SEQUENCE_TYPE; a_constant_value: XM_XPATH_VALUE; a_dependencies_set: ARRAY [BOOLEAN]; a_cardinalities_set: ARRAY [BOOLEAN]; a_special_properties_set: ARRAY [BOOLEAN]) is
			-- Fix up the static type of this variable reference
		do
			static_type := a_type
			constant_value := a_constant_value
			if	a_dependencies_set /= Void then
				set_dependencies (a_dependencies_set)
			end
			if a_cardinalities_set /= Void then
				set_cardinalities (a_type.merged_cardinality (a_cardinalities_set))
			end
			if a_special_properties_set /= Void then
				set_special_properties (a_special_properties_set)
			end
		end

	fix_up (a_required_binding: XM_XPATH_BINDING) is
			-- Fix up this binding reference to a binding.
		do
			binding := a_required_binding
		end

feature {NONE} -- Implementation

	static_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type

	constant_value: XM_XPATH_VALUE
			-- Optional constant value

	display_name: STRING
			-- For diagnostics

	compute_cardinality is
			-- Compute cardinality.
		do
			if static_type = Void then
				set_cardinality_zero_or_more
			else
				set_cardinality (static_type.cardinality)
			end
		end

end
