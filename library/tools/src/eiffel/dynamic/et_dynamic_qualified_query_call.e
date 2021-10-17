note

	description:

		"Eiffel qualified query calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_QUALIFIED_QUERY_CALL

inherit

	ET_DYNAMIC_QUALIFIED_CALL
		redefine
			force_result_boxing,
			put_type_with_feature,
			propagate_type_with_feature
		end

create

	make

feature {NONE} -- Initialization

	make (a_call: like static_call; a_target_type_set: like target_type_set; a_result_type_set: like result_type_set;
		a_current_feature: like current_feature; a_current_type: like current_type)
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

	static_feature: detachable ET_QUERY
			-- Static feature of the call;
			-- Void if no such feature found
		local
			l_class: ET_CLASS
		do
			l_class := target_type_set.static_type.base_class
			Result := l_class.seeded_query (static_call.name.seed)
		end

	dynamic_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_system: ET_DYNAMIC_SYSTEM): detachable ET_DYNAMIC_FEATURE
			-- Run-time query in `a_type' corresponding to current call;
			-- Void if no such query
		do
			Result := a_type.seeded_dynamic_query (static_call.name.seed, a_system)
		end

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of Result

feature -- Status report

	has_field_access (a_system: ET_DYNAMIC_SYSTEM): BOOLEAN
			-- Is one of the possible dynamic features of current call either
			-- an attribute, a tuple label, a "SPECIAL" item or a once function?
		local
			l_target_type_set: like target_type_set
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
		do
			if is_tuple_label then
				Result := True
			else
				l_target_type_set := target_type_set
				nb := l_target_type_set.count
				from i := 1 until i > nb loop
					l_dynamic_type := l_target_type_set.dynamic_type (i)
					if not attached dynamic_feature (l_dynamic_type, a_system) as l_dynamic_feature then
						-- No feature found.
					elseif l_dynamic_feature.is_builtin_special_item then
						Result := True
							-- Jump out of the loop.
						i := nb + 1
					elseif l_dynamic_feature.is_once then
						Result := True
							-- Jump out of the loop.
						i := nb + 1
					elseif attached {ET_ATTRIBUTE} l_dynamic_feature.static_feature then
						Result := True
							-- Jump out of the loop.
						i := nb + 1
					end
					i := i + 1
				end
			end
		end

	force_result_boxing: BOOLEAN
			-- Should result be boxed even though the result static type is embedded?
			-- This is needed when the call is an attribute, tuple label or "SPECIAL"
			-- item, the call result type is embedded, and it is the target of another call.
			-- In that case we force the result type to be of reference type in order
			-- to force the boxing of the result so that the other call is applied on
			-- the result object itself and not on a copy of this object.

feature -- Status setting

	set_force_result_boxing (b: BOOLEAN)
			-- Set `force_result_boxing' to `b'.
		do
			force_result_boxing := b
		ensure
			force_result_boxing_set: force_result_boxing = b
		end

feature {NONE} -- Implementation

	put_type_with_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' to current set.
			-- `a_feature' is the feature in `a_type' corresponding to current call.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_result_type_set: detachable ET_DYNAMIC_TYPE_SET
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

	propagate_type_with_feature (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_feature: ET_DYNAMIC_FEATURE; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Propagate `a_type' from `target_type_set' using `a_builder'.
			-- `a_feature' is the feature in `a_type' corresponding to current call.
		local
			l_result_type_set: detachable ET_DYNAMIC_TYPE_SET
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

feature {ET_DYNAMIC_TYPE_BUILDER} -- Implementation

	put_type_with_tuple_label (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_builder: ET_DYNAMIC_TYPE_SET_BUILDER)
			-- Add `a_type' to current set when the current call is a call to a Tuple label.
		do
			a_builder.propagate_tuple_label_expression_dynamic_types (Current, a_type)
		end

invariant

	result_type_set_not_void: result_type_set /= Void

end
