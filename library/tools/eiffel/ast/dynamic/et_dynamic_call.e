indexing

	description:

		"Eiffel qualified feature calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_CALL

inherit

	ET_DYNAMIC_TARGET

creation

	make

feature {NONE} -- Initialization

	make (a_call: like static_call; a_target_type_set: like target_type_set;
		a_current_feature: like current_feature; a_current_type: like current_type) is
			-- Create a new dynamic call.
		require
			a_call_not_void: a_call /= Void
			a_target_type_set_not_void: a_target_type_set /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
		do
			static_call := a_call
			target_type_set := a_target_type_set
			argument_type_sets := empty_argument_type_sets
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			static_call_set: static_call = a_call
			target_type_set_set: target_type_set = a_target_type_set
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	static_call: ET_FEATURE_CALL
			-- Static feature call

	target_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of target

	argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Type sets of arguments, if any

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of Result, if any

	current_feature: ET_DYNAMIC_FEATURE
			-- Feature where the call appears

	current_type: ET_DYNAMIC_TYPE
			-- Type to which `current_feature' belongs

	position: ET_POSITION is
			-- Position of call
		do
			Result := static_call.position
		ensure
			position_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in `target_type_set' when
			-- `propagate_types' was last called

feature -- Setting

	set_argument_type_sets (an_argument_type_sets: like argument_type_sets) is
			-- Set `argument_type_sets' to `an_argument_type_sets'.
		require
			an_argument_type_sets_not_void: an_argument_type_sets /= Void
		do
			argument_type_sets := an_argument_type_sets
		ensure
			argument_type_sets_set: argument_type_sets = an_argument_type_sets
		end

	set_result_type_set (a_result_type_set: like result_type_set) is
			-- Set `result_type_set' to `a_result_type_set'.
		do
			result_type_set := a_result_type_set
		ensure
			result_type_set_set: result_type_set = a_result_type_set
		end

	set_count (l_count: INTEGER) is
			-- Set `count' to `l_count'.
		do
			count := l_count
		ensure
			count_set: count = l_count
		end

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		local
			l_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_source_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_target_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
		do
			l_seed := static_call.name.seed
			l_feature := a_type.base_class.seeded_feature (l_seed)
			if l_feature = Void then
				if a_type.conforms_to_type (target_type_set.static_type, a_system) then
						-- Internal error: there should be a feature with seed
						-- `l_seed' in all descendants of `target_type_set.static_type'.
					l_builder := a_system.dynamic_type_set_builder
					l_builder.set_fatal_error
					l_builder.error_handler.report_gibea_error
				else
					-- The error has already been reported somewhere else.
				end
			else
				l_dynamic_feature := a_type.dynamic_feature (l_feature, a_system)
				l_dynamic_feature.set_regular (True)
				l_source_argument_type_sets := argument_type_sets
				nb := l_source_argument_type_sets.count
				if nb > 0 then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_target_argument_type_sets := l_dynamic_feature.dynamic_type_sets
					if l_target_argument_type_sets.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of formal arguments in
							-- feature redeclaration.
						l_builder := a_system.dynamic_type_set_builder
						l_builder.set_fatal_error
						l_builder.error_handler.report_gibeb_error
					else
						from i := 1 until i > nb loop
							l_source_argument_type_sets.item (i).put_target (l_target_argument_type_sets.item (i), a_system)
							i := i + 1
						end
					end
				end
				l_result_type_set := l_dynamic_feature.result_type_set
				if result_type_set /= Void then
					if l_result_type_set = Void then
							-- Internal error: it has already been checked somewhere else
							-- that the redeclaration of a query should be a query.
						l_builder := a_system.dynamic_type_set_builder
						l_builder.set_fatal_error
						l_builder.error_handler.report_gibec_error
					else
						l_result_type_set.put_target (result_type_set, a_system)
					end
				elseif l_result_type_set /= Void then
						-- Internal error: it has already been checked somewhere else
						-- that the redeclaration of a procedure should be a procedure.
					l_builder := a_system.dynamic_type_set_builder
					l_builder.set_fatal_error
					l_builder.error_handler.report_gibed_error
				end
			end
		end

feature {NONE} -- Constants

	empty_argument_type_sets: ET_DYNAMIC_TYPE_SET_LIST is
			-- Empty list of argument type_sets
		once
			create Result.make
		ensure
			argument_type_sets_not_void: Result /= Void
			argument_type_sets_empty: Result.is_empty
		end

invariant

	static_call_not_void: static_call /= Void
	target_type_set_not_void: target_type_set /= Void
	argument_type_sets_not_void: argument_type_sets /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end
