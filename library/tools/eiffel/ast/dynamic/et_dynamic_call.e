indexing

	description:

		"Eiffel qualified feature calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_CALL

creation

	make

feature {NONE} -- Initialization

	make (a_target: like target; a_target_type_set: like target_type_set; a_name: like feature_name;
		a_feature: like static_feature; a_current_feature: like current_feature;
		a_current_type: like current_type; a_system: ET_SYSTEM) is
			-- Create a new dynamic call.
		require
			a_target_not_void: a_target /= Void
			a_target_type_set_not_void: a_target_type_set /= Void
			a_name_not_void: a_name /= Void
			a_feature_not_void: a_feature /= Void
			a_current_feature_not_void: a_current_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_system_not_void: a_system /= Void
		local
			l_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_NESTED_DYNAMIC_TYPE_SET
		do
			target := a_target
			target_type_set := a_target_type_set
			feature_name := a_name
			static_feature := a_feature
			l_type := a_feature.type
			argument_sources := empty_argument_sources
			if l_type /= Void then
				l_dynamic_type := a_system.dynamic_type (l_type, a_target_type_set.static_type.base_type)
				create l_dynamic_type_set.make (l_dynamic_type)
				result_type_set := l_dynamic_type_set
			end
			current_feature := a_current_feature
			current_type := a_current_type
		ensure
			target_set: target = a_target
			target_type_set_set: target_type_set = a_target_type_set
			feature_name_set: feature_name = a_name
			static_feature_set: static_feature = a_feature
			current_feature_set: current_feature = a_current_feature
			current_type_set: current_type = a_current_type
		end

feature -- Access

	target: ET_TARGET
			-- Target of call

	target_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of target

	feature_name: ET_FEATURE_NAME
			-- Name of feature being called

	static_feature: ET_FEATURE
			-- Feature being called

	argument_sources: ET_DYNAMIC_ATTACHMENT_LIST
			-- Sources of arguments, if any

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type of Result, if any

	current_feature: ET_FEATURE
			-- Feature where the call appears

	current_type: ET_BASE_TYPE
			-- Type to which `current_feature' belongs

	position: ET_POSITION is
			-- Position of attachment
		do
			Result := target.position
		ensure
			position_not_void: Result /= Void
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in `target_type' when
			-- `propagate_types' was last called

feature -- Setting

	set_argument_sources (an_argument_sources: like argument_sources) is
			-- Set `argument_sources' to `an_argument_sources'.
		require
			an_argument_sources_not_void: an_argument_sources /= Void
		do
			argument_sources := an_argument_sources
		ensure
			argument_sources_set: argument_sources = an_argument_sources
		end

feature -- Element change

	propagate_types (a_system: ET_SYSTEM) is
			-- Propagate types from target type set.
		require
			a_system_not_void: a_system /= Void
		local
			l_count: INTEGER
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
			j, nb2: INTEGER
		do
			l_count := target_type_set.count
			if l_count /= count then
				nb := l_count - count
				count := l_count
				l_other_types := target_type_set.other_types
				if l_other_types /= Void then
					nb2 := l_other_types.count
					from j := 1 until j > nb2 loop
						propagate_type (l_other_types.item (j), a_system)
						i := i + 1
						if i < nb then
							j := j + 1
						else
								-- Jump out of the loop.
							j := nb2 + 1
						end
					end
				end
				if i < nb then
					l_type := target_type_set.first_type
					if l_type /= Void then
						propagate_type (l_type, a_system)
					end
				end
			end
		end

feature {NONE} -- Element change

	propagate_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Propagate `a_type' from target type set.
		require
			a_type_not_void: a_type /= Void
			a_system_not_void: a_system /= Void
		local
			l_seed: INTEGER
			l_feature: ET_FEATURE
			l_dynamic_feature: ET_DYNAMIC_FEATURE
			l_argument_types: ET_DYNAMIC_TYPE_SET_LIST
			l_result_type_set: ET_DYNAMIC_TYPE_SET
			i, nb: INTEGER
			l_attachment: ET_NULL_DYNAMIC_ATTACHMENT
		do
			l_seed := static_feature.first_seed
			l_feature := a_type.base_class.seeded_feature (l_seed)
			if l_feature = Void then
				if a_type.conforms_to_type (target_type_set.static_type, a_system) then
						-- Internal error: there should be a feature with seed
						-- `l_seed' in all descendants of `target_type_set.static_type'.
					a_system.set_fatal_error
					a_system.error_handler.report_gibbt_error
				else
					-- The error has already been reported somewhere else.
				end
			else
				l_dynamic_feature := a_type.dynamic_feature (l_feature, a_system)
				l_dynamic_feature.set_regular (True)
				nb := argument_sources.count
				if nb > 0 then
						-- Dynamic type sets for arguments are stored first
						-- in `dynamic_type_sets'.
					l_argument_types := l_dynamic_feature.dynamic_type_sets
					if l_argument_types.count < nb then
							-- Internal error: it has already been checked somewhere else
							-- that there was the same number of formal arguments in
							-- feature redeclaration.
						a_system.set_fatal_error
						a_system.error_handler.report_gibbv_error
					else
						from i := 1 until i > nb loop
							l_argument_types.item (i).put_source (argument_sources.item (i).cloned_attachment, a_system)
							i := i + 1
						end
					end
				end
				l_result_type_set := l_dynamic_feature.result_type_set
				if result_type_set /= Void then
					if l_result_type_set = Void then
							-- Internal error: it has already been checked somewhere else
							-- that the redeclaration of a query should be a query.
						a_system.set_fatal_error
						a_system.error_handler.report_gibbw_error
					else
						create l_attachment.make (l_result_type_set, current_feature, current_type)
						result_type_set.put_source (l_attachment, a_system)
					end
				elseif l_result_type_set /= Void then
						-- Internal error: it has already been checked somewhere else
						-- that the redeclaration of a procedure should be a procedure.
					a_system.set_fatal_error
					a_system.error_handler.report_gibbx_error
				end
			end
		end

feature {NONE} -- Constants

	empty_argument_sources: ET_DYNAMIC_ATTACHMENT_LIST is
			-- Empty list of argument attachments
		once
			create Result.make
		ensure
			argument_sources_not_void: Result /= Void
			argument_sources_empty: Result.is_empty
		end

invariant

	target_not_void: target /= Void
	target_type_set_not_void: target_type_set /= Void
	feature_name_not_void: feature_name /= Void
	static_feature_not_void: static_feature /= Void
	argument_sources_not_void: argument_sources /= Void
	current_feature_not_void: current_feature /= Void
	current_type_not_void: current_type /= Void

end
