﻿note

	description:

		"Eiffel dynamic type set builders that do nothing"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2019, Eric Bezault and others"
	license: "MIT License"

class ET_DYNAMIC_NULL_TYPE_SET_BUILDER

inherit

	ET_DYNAMIC_TYPE_SET_BUILDER

create

	make

feature {NONE} -- Initialization

	make (a_system: like current_dynamic_system)
			-- Create a new dynamic type set builder.
		require
			a_system_not_void: a_system /= Void
		do
			current_dynamic_system := a_system
		ensure
			current_dynamic_system_set: current_dynamic_system = a_system
		end

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET
			-- New dynamic type set
		do
			Result := a_type
		end

feature -- Generation

	build_dynamic_type_sets
			-- Build dynamic type sets for `current_dynamic_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			has_fatal_error := False
			alive_conforming_descendants_per_type := Void
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL)
			-- Propagate `a_type' from target type set `a_call'.
		do
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_tuple_label_expression_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL; a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Propagate dynamic types of the label in tuple `a_type' to
			-- the dynamic type set of the result type of `a_call'.
		do
		end

	propagate_tuple_label_setter_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL; a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Propagate dynamic types of the source of tuple label setter `a_call'
			-- to the dynamic type set of the corresponding tuple label in `a_type'.
		do
		end

feature {ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION, ET_DYNAMIC_EQUALITY_EXPRESSION} -- Generation

	propagate_is_equal_argument_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE)
			-- Propagate `a_type' as argument of `a_feature', the feature being the
			-- feature 'is_equal' possibly used internally in object equality ('~' and '/~')
			-- or in equality ('=' and '/=') when the target type is expanded.
		do
		end

feature {ET_DYNAMIC_SYSTEM} -- Generation

	propagate_type_of_type_result_type (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE)
			-- Propagate `a_type' to the dynamic type set of the result of the
			-- built-in feature `a_feature' corresponding to "INTERNAL.type_of_type".
		do
		end

feature {ET_DYNAMIC_PRIMARY_TYPE, ET_DYNAMIC_SYSTEM} -- Generation

	propagate_reference_field_dynamic_types (a_attribute: ET_DYNAMIC_FEATURE)
			-- Propagate the dynamic types of the dynamic type set of
			-- `a_attribute' to the result type set of feature
			-- "ISE_RUNTIME.reference_field" (and similar features)
			-- if the static type of `a_attribute' is a reference type.
		do
		end

	propagate_set_reference_field_dynamic_types (a_attribute: ET_DYNAMIC_FEATURE)
			-- Propagate the dynamic types of the dynamic type set of
			-- the formal argument of feature "ISE_RUNTIME.set_reference_field"
			-- (and similar features) to the result type_set of `a_attribute'
			-- if the static type of `a_attribute' is a reference type.
		do
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_reference_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		do
		end

	build_tuple_put_reference (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		do
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE)
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		do
		end

feature {ET_DYNAMIC_FEATURE} -- Generation

	object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			-- Dynamic type set of objects that have been registered through
			-- the object_id mechanism of class "IDENTIFIED" and related classes
		do
			Result := current_dynamic_system.any_type
		end

end
