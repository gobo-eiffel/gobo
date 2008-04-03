indexing

	description:

		"Eiffel qualified query calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_QUALIFIED_QUERY_CALL

inherit

	ET_DYNAMIC_QUALIFIED_CALL
		redefine
			put_type_with_feature,
			propagate_type_with_feature
		end

create

	make

feature {NONE} -- Initialization

	make (a_call: like static_call; a_target_type_set: like target_type_set; a_result_type_set: like result_type_set;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new dynamic query call.
		require
			a_call_not_void: a_call /= Void
			a_call_is_qualified: a_call.is_qualified_call
			a_target_type_set_not_void: a_target_type_set /= Void
			a_result_type_set_not_void: a_result_type_set /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			static_call := a_call
			target_type_set := a_target_type_set
			result_type_set := a_result_type_set
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			static_call_set: static_call = a_call
			target_type_set_set: target_type_set = a_target_type_set
			result_type_set_set: result_type_set = a_result_type_set
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	static_feature: ET_QUERY is
			-- Static feature of the call;
			-- Void if no such feature found
		local
			l_class: ET_CLASS
		do
			l_class := target_type_set.static_type.base_class
			Result := l_class.seeded_query (static_call.name.seed)
		end

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of Result

feature {ET_DYNAMIC_TYPE_SET_BUILDER} -- Access

	seeded_dynamic_feature (a_type: ET_DYNAMIC_TYPE; a_system: ET_DYNAMIC_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time query in `a_type' corresponding to current call;
			-- Void if no such query
		do
			Result := a_type.seeded_dynamic_query (static_call.name.seed, a_system)
		end

feature {NONE} -- Implementation

	put_type_with_feature (a_type: ET_DYNAMIC_TYPE; a_feature: like seeded_dynamic_feature; a_system: ET_DYNAMIC_SYSTEM) is
			-- Add `a_type' to current set.
			-- `a_feature' is the feature in `a_type' corresponding to current call.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_result_type_set: ET_DYNAMIC_TYPE_SET
		do
			precursor (a_type, a_feature, a_system)
			l_result_type_set := a_feature.result_type_set
			if l_result_type_set = Void then
					-- Internal error: it has already been checked somewhere else
					-- that the redeclaration of a query should be a query.
				l_builder := a_system.dynamic_type_set_builder
				l_builder.set_fatal_error
				l_builder.error_handler.report_giaaa_error
			else
				l_result_type_set.put_target (result_type_set, a_system)
			end
		end

	propagate_type_with_feature (a_type: ET_DYNAMIC_TYPE; a_feature: like seeded_dynamic_feature; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER) is
			-- Propagate `a_type' from `target_type_set' using `a_builder'.
			-- `a_feature' is the feature in `a_type' corresponding to current call.
		local
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			l_result_attachment: ET_DYNAMIC_NULL_ATTACHMENT
		do
			precursor (a_type, a_feature, a_builder)
			l_result_type_set := a_feature.result_type_set
			if l_result_type_set = Void then
					-- Internal error: it has already been checked somewhere else
					-- that the redeclaration of a query should be a query.
				a_builder.set_fatal_error
				a_builder.error_handler.report_giaaa_error
			elseif not result_type_set.is_expanded then
				create l_result_attachment.make (l_result_type_set, current_feature, current_type)
				result_type_set.put_source (l_result_attachment, a_builder.current_dynamic_system)
			end
		end

invariant

	result_type_set_not_void: result_type_set /= Void

end
