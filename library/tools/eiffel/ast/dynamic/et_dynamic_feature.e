indexing

	description:

		"Eiffel features equipped with dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_FEATURE

inherit

	DEBUG_OUTPUT

creation

	make

feature {NONE} -- Initialization

	make (a_feature: like static_feature; a_target_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Create a new feature equipped with dynamic type sets,
			-- associated with compilation time feature `a_feature' in
			-- type `a_target_type' in the surrounding system `a_system'.
		require
			a_feature_not_void: a_feature /= Void
			a_target_type_not_void: a_target_type /= Void
			a_system_not_void: a_system /= Void
		local
			l_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_NESTED_DYNAMIC_TYPE_SET
			args: ET_FORMAL_ARGUMENT_LIST
			l_locals: ET_LOCAL_VARIABLE_LIST
			l_none_type: ET_DYNAMIC_TYPE
			i, nb: INTEGER
		do
			static_feature := a_feature
			l_type := a_feature.type
			if l_type /= Void then
				l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
				create {ET_NESTED_DYNAMIC_TYPE_SET} result_type.make (l_dynamic_type)
			end
			args := a_feature.arguments
			if args /= Void then
				nb := args.count
				if nb > 0 then
					create argument_types.make_with_capacity (nb)
					from i := nb until i < 1 loop
						l_type := args.formal_argument (i).type
						l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
						create l_dynamic_type_set.make (l_dynamic_type)
						argument_types.put_first (l_dynamic_type_set)
						i := i - 1
					end
				end
			end
			l_locals := a_feature.locals
			if l_locals /= Void then
				nb := l_locals.count
				if nb > 0 then
						-- Fill local types with "NONE" type. They will be given their real
						-- types when building the dynamic type sets of current feature in
						-- ET_DYNAMIC_TYPE_SET_BUILDER.
					l_none_type := a_system.none_type
					create local_types.make_with_capacity (nb)
					from i := 1 until i > nb loop
						local_types.put_first (l_none_type)
						i := i + 1
					end
				end
			end
		ensure
			static_feature_set: static_feature = a_feature
		end

feature -- Access

	argument_types: ET_DYNAMIC_TYPE_SET_LIST
			-- Types of arguments, if any

	local_types: ET_DYNAMIC_TYPE_SET_LIST
			-- Types of locals, if any

	result_type: ET_DYNAMIC_TYPE_SET
			-- Type of result, if any

	first_precursor: ET_DYNAMIC_PRECURSOR
			-- First precursor called from current feature;
			-- May be void if no precursor called

	other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			-- Other precursors called from current feature;
			-- May be void if zero or one precursor called

	dynamic_precursor (a_feature: ET_FEATURE; a_parent_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM): ET_DYNAMIC_PRECURSOR is
			-- Dynamic precursor of current feature
		require
			a_feature_not_void: a_feature /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_system_not_void: a_system /= Void
		local
			l_precursor: ET_DYNAMIC_PRECURSOR
			i, nb: INTEGER
		do
			if first_precursor = Void then
				create Result.make (a_feature, a_parent_type, Current, a_system)
				Result.set_regular (is_regular or is_creation)
				Result.set_static (is_static)
				first_precursor := Result
			elseif first_precursor.parent_type = a_parent_type and first_precursor.static_feature = a_feature then
				Result := first_precursor
			else
				if other_precursors = Void then
					create other_precursors.make_with_capacity (1)
					create Result.make (a_feature, a_parent_type, Current, a_system)
					Result.set_regular (is_regular or is_creation)
					Result.set_static (is_static)
					other_precursors.put_first (Result)
				else
					nb := other_precursors.count
					from i := 1 until i > nb loop
						l_precursor := other_precursors.item (i)
						if l_precursor.parent_type = a_parent_type and l_precursor.static_feature = a_feature then
							Result := l_precursor
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
					if Result = Void then
						create Result.make (a_feature, a_parent_type, Current, a_system)
						Result.set_regular (is_regular or is_creation)
						Result.set_static (is_static)
						other_precursors.force_first (Result)
					end
				end
			end
		ensure
			dynamic_precursor_not_void: Result /= Void
		end

	first_feature_call: ET_DYNAMIC_CALL
			-- Dynamic type set of first qualified feature call

	last_feature_call: ET_DYNAMIC_CALL
			-- Dynamic type set of last qualified feature call

	first_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
			-- Dynamic type set of first assignment attempt in current feature

	last_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT
			-- Dynamic type set of last assignment attempt in current feature

	static_feature: ET_FEATURE
			-- Feature at compilation time

	id: INTEGER
			-- ID

feature -- Setting

	set_id (i: INTEGER) is
			-- Set `id' to `i'.
		do
			id := i
		ensure
			id_set: id = i
		end

feature -- Status report

	is_built: BOOLEAN
			-- Have dynamic type sets of current feature been built?

	is_creation: BOOLEAN
			-- Is current feature used as a creation procedure?

	is_regular: BOOLEAN
			-- Is current feature used as a regular feature?

	is_static: BOOLEAN
			-- Is current feature used as a static feature?

	is_function: BOOLEAN is
			-- Is feature a function?
		do
			Result := static_feature.is_function
		ensure
			query: Result implies result_type /= Void
		end

	is_attribute: BOOLEAN is
			-- Is feature an attribute?
		do
			Result := static_feature.is_attribute
		ensure
			query: Result implies result_type /= Void
		end

	is_constant_attribute: BOOLEAN is
			-- Is feature a constant attribute?
		do
			Result := static_feature.is_constant_attribute
		ensure
			query: Result implies result_type /= Void
		end

	is_unique_attribute: BOOLEAN is
			-- Is feature a unique attribute?
		do
			Result := static_feature.is_unique_attribute
		ensure
			query: Result implies result_type /= Void
		end

	is_procedure: BOOLEAN is
			-- Is current feature a procedure?
		do
			Result := static_feature.is_procedure
		ensure
			definition: Result = (result_type = Void)
		end

feature -- Status setting

	set_built (b: BOOLEAN) is
			-- Set `is_built' to `b'.
		do
			is_built := b
		ensure
			built_set: is_built = b
		end

	set_creation (b: BOOLEAN) is
			-- Set `is_creation' to `b'.
		local
			l_regular: BOOLEAN
			i, nb: INTEGER
		do
			is_creation := b
			if first_precursor /= Void then
				l_regular := b or is_regular
				first_precursor.set_regular (l_regular)
				if other_precursors /= Void then
					nb := other_precursors.count
					from i := 1 until i > nb loop
						other_precursors.item (i).set_regular (l_regular)
						i := i + 1
					end
				end
			end
		ensure
			creation_set: is_creation = b
		end

	set_regular (b: BOOLEAN) is
			-- Set `is_regular' to `b'.
		local
			l_regular: BOOLEAN
			i, nb: INTEGER
		do
			is_regular := b
			if first_precursor /= Void then
				l_regular := b or is_creation
				first_precursor.set_regular (l_regular)
				if other_precursors /= Void then
					nb := other_precursors.count
					from i := 1 until i > nb loop
						other_precursors.item (i).set_regular (l_regular)
						i := i + 1
					end
				end
			end
		ensure
			regular_set: is_regular = b
		end

	set_static (b: BOOLEAN) is
			-- Set `is_static' to `b'.
		local
			i, nb: INTEGER
		do
			is_static := b
			if first_precursor /= Void then
				first_precursor.set_static (b)
				if other_precursors /= Void then
					nb := other_precursors.count
					from i := 1 until i > nb loop
						other_precursors.item (i).set_static (b)
						i := i + 1
					end
				end
			end
		ensure
			static_set: is_static = b
		end

feature -- Element change

	put_assignment_attempt (an_assignment_attempt: ET_DYNAMIC_ASSIGNMENT_ATTEMPT) is
			-- Put `an_assignment_attempt' to the end of list of assignment attempts.
		require
			an_assignment_attempt_not_void: an_assignment_attempt /= Void
		do
			if first_assignment_attempt = Void then
				first_assignment_attempt := an_assignment_attempt
			else
				last_assignment_attempt.set_next_assignment_attempt (an_assignment_attempt)
			end
			last_assignment_attempt := an_assignment_attempt
		ensure
			last_assignment_attempt_set: last_assignment_attempt = an_assignment_attempt
		end

	put_feature_call (a_call: ET_DYNAMIC_CALL) is
			-- Put `a_call' to the end of list of feature calls.
		require
			a_call_not_void: a_call /= Void
		do
			if first_feature_call = Void then
				first_feature_call := a_call
			else
				last_feature_call.set_next_call (a_call)
			end
			last_feature_call := a_call
		ensure
			last_feature_call_set: last_feature_call = a_call
		end

	insert_feature_call (a_previous_call, a_call: ET_DYNAMIC_CALL) is
			-- Insert `a_call' just after `a_previous_call' in the
			-- list of feature calls, or at the first position if
			-- it is Void.
		require
			a_call_not_void: a_call /= Void
			-- has_previous_call: a_previous_call /= Void implies has (a_previous_call)
		do
			if a_previous_call = Void then
				if first_feature_call = Void then
					first_feature_call := a_call
					last_feature_call := a_call
				else
					a_call.set_next_call (first_feature_call)
					first_feature_call := a_call
				end
			else
				if a_previous_call = last_feature_call then
					last_feature_call := a_call
				else
					a_call.set_next_call (a_previous_call.next_call)
				end
				a_previous_call.set_next_call (a_call)
			end
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := static_feature.debug_output
		end

invariant

	static_feature_not_void: static_feature /= Void
	assignment_attempts: (first_assignment_attempt /= Void) = (last_assignment_attempt /= Void)
	feature_calls: (first_feature_call /= Void) = (last_feature_call /= Void)

end
