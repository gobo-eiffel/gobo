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
			i, nb: INTEGER
		do
			static_feature := a_feature
			l_type := a_feature.type
			if l_type /= Void then
				l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
				create {ET_NESTED_DYNAMIC_TYPE_SET} result_type.make (l_dynamic_type)
			end
			dynamic_calls := empty_dynamic_calls
			dynamic_assignment_attempts := empty_dynamic_assignment_attempts
			dynamic_type_sets := empty_dynamic_type_sets
			args := a_feature.arguments
			if args /= Void then
				nb := args.count
				if nb > 0 then
					create dynamic_type_sets.make_with_capacity (nb)
					from i := nb until i < 1 loop
						l_type := args.formal_argument (i).type
						l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
						create l_dynamic_type_set.make (l_dynamic_type)
						dynamic_type_sets.put_first (l_dynamic_type_set)
						i := i - 1
					end
				end
			end
		ensure
			static_feature_set: static_feature = a_feature
		end

feature -- Access

	result_type: ET_DYNAMIC_TYPE_SET
			-- Type of result, if any

	dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Dynamic type sets of expressions within current feature;
			-- Dynamic type sets for arguments are stored first

	dynamic_type_set (an_expression: ET_EXPRESSION): ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set associated with `an_expression';
			-- Void if unknown yet
		require
			an_expression_not_void: an_expression /= Void
		local
			i: INTEGER
		do
			i := an_expression.index
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	dynamic_calls: ET_DYNAMIC_CALL_LIST
			-- Dynamic calls within current feature

	dynamic_call (a_call: ET_FEATURE_CALL): ET_DYNAMIC_CALL is
			-- Dynamic call associated with `a_call';
			-- Void if unknown yet
		require
			a_call_not_void: a_call /= Void
		local
			i: INTEGER
		do
			i := a_call.call_index
			if i >= 1 and i <= dynamic_calls.count then
				Result := dynamic_calls.item (i)
			end
		end

	dynamic_assignment_attempts: ET_DYNAMIC_ASSIGNMENT_ATTEMPT_LIST
			-- Dynamic assignment attempts within current feature

	dynamic_assignment_attempt (an_assignment: ET_ASSIGNMENT_ATTEMPT): ET_DYNAMIC_ASSIGNMENT_ATTEMPT is
			-- Dynamic assignment attempt associated with `an_assignment';
			-- Void if unknown yet
		require
			an_assignment_not_void: an_assignment /= Void
		local
			i: INTEGER
		do
			i := an_assignment.index
			if i >= 1 and i <= dynamic_assignment_attempts.count then
				Result := dynamic_assignment_attempts.item (i)
			end
		end

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

	static_feature: ET_FEATURE
			-- Feature at compilation time

	id: INTEGER
			-- ID

feature -- Setting

	set_dynamic_type_sets (a_dynamic_type_sets: like dynamic_type_sets) is
			-- Set `dynamic_type_sets' to `a_dynamic_type_sets'.
		require
			a_dynamic_type_sets_not_void: a_dynamic_type_sets /= Void
		do
			dynamic_type_sets := a_dynamic_type_sets
		ensure
			dynamic_type_sets_set: dynamic_type_sets = a_dynamic_type_sets
		end

	set_dynamic_calls (a_dynamic_calls: like dynamic_calls) is
			-- Set `dynamic_calls' to `a_dynamic_calls'.
		require
			a_dynamic_calls_not_void: a_dynamic_calls /= Void
		do
			dynamic_calls := a_dynamic_calls
		ensure
			dynamic_calls_set: dynamic_calls = a_dynamic_calls
		end

	set_dynamic_assignment_attempts (a_dynamic_assignment_attempts: like dynamic_assignment_attempts) is
			-- Set `dynamic_assignment_attempts' to `an_dynamic_assignment_attempts'.
		require
			a_dynamic_assignment_attempts_not_void: a_dynamic_assignment_attempts /= Void
		do
			dynamic_assignment_attempts := a_dynamic_assignment_attempts
		ensure
			dynamic_assignment_attempts_set: dynamic_assignment_attempts = a_dynamic_assignment_attempts
		end

	set_result_type (a_result_type: like result_type) is
			-- Set `result_type' to `a_result_type'.
		do
			result_type := a_result_type
		ensure
			result_type_set: result_type = a_result_type
		end

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

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := static_feature.debug_output
		end

feature {NONE} -- Constants

	empty_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST is
			-- Empty dynamic type set list
		once
			create Result.make
		ensure
			dynamic_type_sets_not_void: Result /= Void
			dynamic_type_sets_empty: Result.is_empty
		end

	empty_dynamic_calls: ET_DYNAMIC_CALL_LIST is
			-- Empty dynamic call list
		once
			create Result.make
		ensure
			dynamic_calls_not_void: Result /= Void
			dynamic_calls_empty: Result.is_empty
		end

	empty_dynamic_assignment_attempts: ET_DYNAMIC_ASSIGNMENT_ATTEMPT_LIST is
			-- Empty dynamic assignment attempt list
		once
			create Result.make
		ensure
			dynamic_assignment_attempts_not_void: Result /= Void
			dynamic_assignment_attempts_empty: Result.is_empty
		end

invariant

	static_feature_not_void: static_feature /= Void
	dynamic_type_sets_not_void: dynamic_type_sets /= Void
	dynamic_calls_not_void: dynamic_calls /= Void
	dynamic_assignment_attempts_not_void: dynamic_assignment_attempts /= Void

end
