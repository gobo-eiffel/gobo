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
			may_analyze, same_expression
		end

	XM_XPATH_BINDING_REFERENCE

creation

	make

feature {NONE} -- Initialization

	make (declaration: XM_XPATH_VARIABLE_DECLARATION) is
			-- Register `Current' with `declaration'
			-- When the variable declaration is compiled,
			--  the declaration will call our fix_up routine.
			-- Note that the object does not retain a pointer
			--  to the variable declaration, which would cause the
			--  stylesheet to be locked in memory.
		do
			declaration.register_reference (Current)
			display_name := declaration.name
		end

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible;
			-- All expression return sequences, in general;
			-- This routine determines the type of the items within the
			-- sequence, assuming that (a) this is known in advance,
			-- and (b) it is the same for all items in the sequence.
		do
			if static_type = Void then
				Result := Any_item
			else
				Result := static_type.primary_type
			end
		end

	binding: XM_XPATH_BINDING
			-- Binding for variable;
			-- will be `Void' until `fix_up' is called.

	
feature -- Status report

	may_analyze: BOOLEAN is
			-- OK to call analyze?
		do
			Result := constant_value /= Void or else static_type /= Void
		end
	
feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
			-- (Note, we only compare expressions that
			--  have the same static and dynamic context).
		local
			other_reference: XM_XPATH_VARIABLE_REFERENCE
		do
			other_reference ?= other
			if other_reference /= Void and then binding.is_equal (other_reference.binding) then
				Result := binding /= Void
			end
		end

feature -- Analysis

		analyze (env: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of an expression and its subexpressions;		
			-- This checks statically that the operands of the expression have the correct type;
			-- If necessary it generates code to do run-time type checking or type conversion;
			-- A static type error is reported only if execution cannot possibly succeed, that
			-- is, if a run-time type error is inevitable. The call may return a modified form of the expression;
			-- This routine is called after all references to functions and variables have been resolved
			-- to the declaration of the function or variable. However, the types of such functions and
			-- variables will only be accurately known if they have been explicitly declared
		do
			if constant_value /= Void then
				Result := constant_value
			else
				Result := Current
			end
		end

feature -- Element change

	set_static_type (type: XM_XPATH_SEQUENCE_TYPE; value: XM_XPATH_VALUE; properties: INTEGER) is
			-- Fix up the static type of this variable reference;
			-- Optionally, supply a constant value for the variable.
			-- Also supplies other static properties of the expression to which the variable is bound,
			--  for example whether it is an ordered node-set.
		do
			static_type := type
			constant_value := value
			-- TODO - static properties
		end

	fix_up (required_binding: XM_XPATH_BINDING) is
			-- Fix up this binding reference to a binding.
		do
			binding := required_binding
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
