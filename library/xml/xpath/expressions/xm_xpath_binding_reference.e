indexing

	description:

	"References to a variable declaration"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_BINDING_REFERENCE

feature -- Element change

	set_static_type (a_static_type: XM_XPATH_SEQUENCE_TYPE; a_constant_value: XM_XPATH_VALUE;  a_dependencies_set: ARRAY [BOOLEAN]; a_cardinalities_set: ARRAY [BOOLEAN]; a_special_properties_set: ARRAY [BOOLEAN]) is
			-- Fix up the static type of this variable reference;
			-- Optionally, supply a constant value for the variable.
			-- Also supplies other static properties of the expression to which the variable is bound,
			--  for example whether it is an ordered node-set.
		require
			static_type_not_void: a_static_type /= Void
		deferred
		end

	fix_up (a_binding: XM_XPATH_BINDING) is
			-- Fix up this binding reference to a binding.
		require
			binding_not_void: a_binding /= Void
		deferred
		end

end
