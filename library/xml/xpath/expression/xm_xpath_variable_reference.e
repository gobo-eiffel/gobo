indexing

	description:

	"References to a variable"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_VARIABLE_REFERENCE

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			same_expression, promote, create_iterator, evaluate_item,
			native_implementations, compute_special_properties, compute_intrinsic_dependencies,
			is_variable_reference, as_variable_reference, accumulate_slots_used,
			create_node_iterator, generate_events, lazy_evaluation_mode, eager_evaluation_mode
		end

create

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
		local
			l_name: STRING
		do
			display_name := "" -- to preserve the invariant
			a_declaration.register_reference (Current)
			l_name := a_declaration.variable_name
			if l_name /= Void then
				display_name := l_name
			end
			if not are_static_properties_computed then compute_static_properties end
			initialized := True
		end

feature -- Access

	is_variable_reference: BOOLEAN is
			-- Is `Current' a variable reference?
		do
			Result := True
		end

	as_variable_reference: XM_XPATH_VARIABLE_REFERENCE is
			-- `Current' seen as a variable reference
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			if static_type = Void then
				Result := any_item
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

	lazy_evaluation_mode: INTEGER is
			-- Method used for lazy evaluation of `Current'
		do
			Result := Call_evaluate_variable
		end

	eager_evaluation_mode: INTEGER is
			-- Method used for eager evaluation of `Current'
		do
			Result := Evaluate_and_materialize_variable
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
			-- (Note, we only compare expressions that
			--  have the same static and dynamic context).
		do
			if other.is_variable_reference then
				if binding = Void then
					-- We err on the side of caution:
					Result := STRING_.same_string (display_name, other.as_variable_reference.display_name)
				else
					Result := binding = other.as_variable_reference.binding
				end
			end
		end

feature -- Status report

	last_evaluated_binding: XM_XPATH_VALUE
			-- Value from calling `evaluate_variable'

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			if display_name.is_empty then
				a_string := STRING_.appended_string (indentation (a_level), "$(unbound variable)")
				std.error.put_string (a_string)
				std.error.put_new_line
			else
				a_string := STRING_.appended_string (indentation (a_level), "$")
				a_string := STRING_.appended_string (a_string, display_name)				
				std.error.put_string (a_string)
				std.error.put_new_line
			end
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			if binding = Void or else not binding.is_global then
				set_intrinsically_depends_upon_local_variables
			else
				initialize_intrinsic_dependencies
			end
		end

feature -- Optimization

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			if constant_value /= Void then
				binding := Void
				set_replacement (constant_value)
			else
				check
					static_type_not_void: static_type /= Void
				end
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced

			-- Note that `set_static_type' might be called after type-checking, so:

			if constant_value /= Void then
				binding := Void
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


	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		local
			l_binding: like last_evaluated_binding
		do
			evaluate_variable (a_context)
			if last_evaluated_binding.is_error then
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (last_evaluated_binding.error_value)
			else
				l_binding := last_evaluated_binding
				l_binding.create_iterator (a_context)
				last_iterator := l_binding.last_iterator
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		do
			evaluate_variable (a_context)
			if last_evaluated_binding.is_error then
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make (last_evaluated_binding.error_value)
			else
				last_evaluated_binding.create_node_iterator (a_context)
				last_node_iterator := last_evaluated_binding.last_node_iterator
			end
		end

	generate_events (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			evaluate_variable (a_context)
			if last_evaluated_binding.is_error then
				a_context.report_fatal_error (last_evaluated_binding.error_value)
			else
				last_evaluated_binding.generate_events (a_context)
			end
		end
	
	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			evaluate_variable (a_context)
			if last_evaluated_binding.is_convertible_to_item (a_context) then
				a_result.put (last_evaluated_binding.as_item (a_context))
			else
				a_result.put (Void)
			end
		end

	evaluate_variable (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate variable
		require
			binding_not_void: binding /= Void
			not_replaced: not was_expression_replaced
		do
			binding.evaluate_variable (a_context)
			last_evaluated_binding := binding.last_evaluated_binding
		ensure
			evaluation: last_evaluated_binding /= Void			
		end

feature -- Element change

	set_static_type (a_type: XM_XPATH_SEQUENCE_TYPE; a_constant_value: XM_XPATH_VALUE; a_properties: XM_XPATH_STATIC_PROPERTY) is
			-- Fix up the static type of this variable reference
			-- Optionally, supply a constant value for the variable.
			-- Also supplies other static properties of the expression to which the variable is bound,
			--  for example whether it is an ordered node-set.
		require
			static_type_not_void: a_type /= Void
			not_replaced: not was_expression_replaced
		do
			static_type := a_type
			if are_static_properties_computed then
				reset_static_properties
			end
			constant_value := a_constant_value
			if	a_properties /= Void then
				merge_dependencies (a_properties)
				set_cardinality (a_type.merged_cardinalities (a_properties))
				clone_special_properties (a_properties)

				-- Although the variable may be a context document node-set at the point it is defined,
				--  the context at the point of use may be different, so this property cannot be transferred.
				
				reset_context_document_nodeset
			end
		end

	fix_up (a_required_binding: XM_XPATH_BINDING) is
			-- Fix up this binding reference to a binding.
		require
			binding_not_void: a_required_binding /= Void
			not_replaced: not was_expression_replaced
		do
			binding := a_required_binding
			if are_static_properties_computed then reset_static_properties end
		end

feature {XM_XPATH_VARIABLE_REFERENCE} -- Access

	display_name: STRING
			-- Name of variable

feature {NONE} -- Implementation

	static_type: XM_XPATH_SEQUENCE_TYPE
			-- Static type

	constant_value: XM_XPATH_VALUE
			-- Optional constant value

	native_implementations: INTEGER is
			-- Natively-supported evaluation routines
		do
				Result := Supports_process + Supports_evaluate + Supports_iterator
		end

	compute_cardinality is
			-- Compute cardinality.
		do
			if static_type = Void then
				set_cardinality_zero_or_more
			else
				set_cardinality (static_type.cardinality)
			end
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

	accumulate_slots_used (a_set: DS_HASH_SET [INTEGER]) is
			-- Add all slot numbers used by `an_expression' to `a_set'.
		local
			a_slot_number: INTEGER
		do
			check
				fixed_up: binding /= Void
				-- How to prove this is always the case?
			end
			if not binding.is_global then
				a_slot_number := binding.slot_number
				if a_slot_number > 0 then
					if not a_set.has (a_slot_number) then
						a_set.force_new (a_slot_number)
					end
				end
			end
		end

invariant

	display_name_not_void: display_name /= Void

end
