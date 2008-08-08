indexing

	description:

		"Eiffel dynamic type set builders that do nothing"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_NULL_TYPE_SET_BUILDER

inherit

	ET_DYNAMIC_TYPE_SET_BUILDER

create

	make

feature {NONE} -- Initialization

	make (a_system: like current_dynamic_system) is
			-- Create a new dynamic type set builder.
		require
			a_system_not_void: a_system /= Void
		do
			current_dynamic_system := a_system
		ensure
			current_dynamic_system_set: current_dynamic_system = a_system
		end

feature -- Factory

	new_dynamic_type_set (a_type: ET_DYNAMIC_TYPE): ET_DYNAMIC_TYPE_SET is
			-- New dynamic type set
		do
			Result := a_type
		end

feature -- Generation

	build_dynamic_type_sets is
			-- Build dynamic type sets for `current_dynamic_system'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			has_fatal_error := False
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_call_type (a_type: ET_DYNAMIC_TYPE; a_call: ET_DYNAMIC_QUALIFIED_CALL) is
			-- Propagate `a_type' from target type set `a_call'.
		do
		end

feature {ET_DYNAMIC_QUALIFIED_CALL} -- Generation

	propagate_tuple_label_expression_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_QUERY_CALL; a_type: ET_DYNAMIC_TYPE) is
			-- Propagate dynamic types of the label in tuple `a_type' to
			-- the dynamic type set of the result type of `a_call'.
		do
		end

	propagate_tuple_label_setter_dynamic_types (a_call: ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL; a_type: ET_DYNAMIC_TYPE) is
			-- Propagate dynamic types of the source of tuple label setter `a_call'
			-- to the dynamic type set of the corresponding tuple label in `a_type'.
		do
		end

feature {ET_DYNAMIC_OBJECT_EQUALITY_EXPRESSION, ET_DYNAMIC_EQUALITY_EXPRESSION} -- Generation

	propagate_is_equal_argument_type (a_type: ET_DYNAMIC_TYPE; a_feature: ET_DYNAMIC_FEATURE) is
			-- Propagate `a_type' as argument of `a_feature', the feature being the
			-- feature 'is_equal' possibly used internally in object equality ('~' and '/~')
			-- or in equality ('=' and '/=') when the target type is expanded.
		do
		end

feature {ET_DYNAMIC_TUPLE_TYPE} -- Generation

	build_tuple_item (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; an_item_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of result type of `an_item_feature' from `a_tuple_type'.
		do
		end

	build_tuple_put (a_tuple_type: ET_DYNAMIC_TUPLE_TYPE; a_put_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_put_feature' from `a_tuple_type'.
		do
		end

feature {ET_DYNAMIC_ROUTINE_TYPE} -- Generation

	build_agent_call (an_agent_type: ET_DYNAMIC_ROUTINE_TYPE; a_call_feature: ET_DYNAMIC_FEATURE) is
			-- Build type set of argument type of `a_call_feature' from `an_agent_type'.
		do
		end

feature {ET_DYNAMIC_FEATURE} -- Generation

	object_id_dynamic_type_set: ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set of objects that have been registered through
			-- the object_id mechanism of class "IDENTIFIED" and related classes
		do
			Result := current_dynamic_system.any_type
		end

end
