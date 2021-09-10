note

	description:

		"Eiffel qualified procedure calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_QUALIFIED_PROCEDURE_CALL

inherit

	ET_DYNAMIC_QUALIFIED_CALL

create

	make

feature {NONE} -- Initialization

	make (a_call: like static_call; a_target_type_set: like target_type_set;
		a_current_feature: like current_feature; a_current_type: like current_type)
			-- Create a new dynamic procedure call.
		require
			a_call_not_void: a_call /= Void
			a_call_is_qualified: a_call.is_qualified_call
			a_target_type_set_not_void: a_target_type_set /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			static_call := a_call
			target_type_set := a_target_type_set
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			static_call_set: static_call = a_call
			target_type_set_set: target_type_set = a_target_type_set
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	static_feature: detachable ET_PROCEDURE
			-- Static feature of the call;
			-- Void if no such feature found
		local
			l_class: ET_CLASS
		do
			l_class := target_type_set.static_type.base_class
			Result := l_class.seeded_procedure (static_call.name.seed)
		end

	dynamic_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_system: ET_DYNAMIC_SYSTEM): detachable ET_DYNAMIC_FEATURE
			-- Run-time procedure in `a_type' corresponding to current call;
			-- Void if no such procedure
		do
			Result := a_type.seeded_dynamic_procedure (static_call.name.seed, a_system)
		end

feature {ET_DYNAMIC_TYPE_BUILDER} -- Implementation

	put_type_with_tuple_label (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Add `a_type' to current set when the current call is a call to a Tuple label.
		do
			a_builder.propagate_tuple_label_setter_dynamic_types (Current, a_type)
		end

end
