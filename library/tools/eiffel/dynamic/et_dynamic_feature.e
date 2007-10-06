indexing

	description:

		"Eiffel features equipped with dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_FEATURE

inherit

	DEBUG_OUTPUT

	ET_TOKEN_CODES
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

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
			l_dynamic_type_set_builder: ET_DYNAMIC_TYPE_SET_BUILDER
			l_type: ET_TYPE
			l_dynamic_type: ET_DYNAMIC_TYPE
			l_dynamic_type_set: ET_DYNAMIC_TYPE_SET
			l_dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			args: ET_FORMAL_ARGUMENT_LIST
			arg: ET_FORMAL_ARGUMENT
			i, nb: INTEGER
			l_external_routine: ET_EXTERNAL_ROUTINE
			l_name: ET_FEATURE_NAME
		do
			l_dynamic_type_set_builder := a_system.dynamic_type_set_builder
			static_feature := a_feature
			l_external_routine ?= a_feature
			if l_external_routine /= Void then
				builtin_code := l_external_routine.builtin_code
			elseif a_target_type.base_class = a_system.universe.procedure_class then
				if a_feature.name.same_feature_name (tokens.call_feature_name) then
						-- Make sure that PROCEDURE.call is considered as
						-- a built-in feature when computing dynamic type sets.
						-- ISE still consider it as a regular routine.
					builtin_code := tokens.builtin_procedure_feature (builtin_procedure_call)
				else
					builtin_code := builtin_not_builtin
				end
			elseif a_target_type.base_class = a_system.universe.function_class then
				l_name := a_feature.name
				if l_name.same_feature_name (tokens.item_feature_name) then
						-- Make sure that FUNCTION.iteml is considered as
						-- a built-in feature when computing dynamic type sets.
						-- ISE still consider it as a regular routine.
					builtin_code := tokens.builtin_function_feature (builtin_function_item)
				elseif l_name.same_feature_name (tokens.call_feature_name) then
						-- Make sure that FUNCTION.call is considered as
						-- a built-in feature when computing dynamic type sets.
						-- ISE still consider it as a regular routine.
					builtin_code := tokens.builtin_function_feature (builtin_function_call)
				else
					builtin_code := builtin_not_builtin
				end
			else
				builtin_code := builtin_not_builtin
			end
			target_type := a_target_type
			l_type := a_feature.type
			if l_type /= Void then
				if a_feature.is_constant_attribute or a_feature.is_unique_attribute then
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type
					l_dynamic_type.set_alive
				elseif builtin_code = builtin_identified_feature (builtin_identified_eif_id_object) then
					result_type_set := l_dynamic_type_set_builder.object_id_dynamic_type_set
				else
					l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
					result_type_set := l_dynamic_type_set_builder.new_dynamic_type_set (l_dynamic_type)
				end
			end
			dynamic_type_sets := empty_dynamic_type_sets
			args := a_feature.arguments
			if args /= Void then
				nb := args.count
				if nb > 0 then
					create l_dynamic_type_sets.make_with_capacity (nb)
					dynamic_type_sets := l_dynamic_type_sets
					from i := 1 until i > nb loop
						arg := args.formal_argument (i)
						if i = 1 and then builtin_code = builtin_identified_feature (builtin_identified_eif_object_id) then
							l_dynamic_type_set := l_dynamic_type_set_builder.object_id_dynamic_type_set
						else
							l_type := arg.type
							l_dynamic_type := a_system.dynamic_type (l_type, a_target_type.base_type)
							l_dynamic_type_set := l_dynamic_type_set_builder.new_dynamic_type_set (l_dynamic_type)
								-- Unless proven otherwise after possible attachments,
								-- a formal actual argument is assumed to be never Void.
							l_dynamic_type_set.set_never_void
						end
						l_dynamic_type_sets.put_last (l_dynamic_type_set)
						arg.name.set_index (i)
						i := i + 1
					end
				end
			end
		ensure
			static_feature_set: static_feature = a_feature
			target_type_set: target_type = a_target_type
		end

feature -- Access

	result_type_set: ET_DYNAMIC_TYPE_SET
			-- Type set of result, if any

	target_type: ET_DYNAMIC_TYPE
			-- Type of target

	argument_type_set (i: INTEGER): ET_DYNAMIC_TYPE_SET is
			-- Type set of `i'-th argument;
			-- Void if unknown yet
		do
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	dynamic_type_sets: ET_DYNAMIC_TYPE_SET_LIST
			-- Dynamic type sets of expressions within current feature;
			-- Dynamic type sets for arguments are stored first

	dynamic_type_set (an_operand: ET_OPERAND): ET_DYNAMIC_TYPE_SET is
			-- Dynamic type set associated with `an_operand';
			-- Void if unknown yet
		require
			an_operand_not_void: an_operand /= Void
		local
			i: INTEGER
		do
			i := an_operand.index
			if i >= 1 and i <= dynamic_type_sets.count then
				Result := dynamic_type_sets.item (i)
			end
		end

	first_precursor: ET_DYNAMIC_PRECURSOR
			-- First precursor called from current feature;
			-- May be void if no precursor called

	other_precursors: ET_DYNAMIC_PRECURSOR_LIST
			-- Other precursors called from current feature;
			-- May be void if zero or one precursor called

	dynamic_precursor (a_feature: ET_FEATURE; a_parent_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM): ET_DYNAMIC_PRECURSOR is
			-- Dynamic precursor of current feature;
			-- `a_feature' is the precursor of the current feaure in `a_parent_type'
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
					other_precursors.put_last (Result)
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
						other_precursors.force_last (Result)
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

	set_result_type_set (a_result_type_set: like result_type_set) is
			-- Set `result_type_set' to `a_result_type_set'.
		do
			result_type_set := a_result_type_set
		ensure
			result_type_set_set: result_type_set = a_result_type_set
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

	is_generated: BOOLEAN
			-- Has code for current feature been generated?

	is_creation: BOOLEAN
			-- Is current feature used as a creation procedure?

	is_regular: BOOLEAN
			-- Is current feature used as a regular feature?

	is_static: BOOLEAN
			-- Is current feature used as a static feature?

	is_function (a_system: ET_SYSTEM): BOOLEAN is
			-- Is feature a function?
		require
			a_system_not_void: a_system /= Void
		do
			if static_feature.is_function then
				if is_builtin then
						-- The function should not be a built-in attribute.
					Result := not target_type.is_builtin_attribute (static_feature, builtin_code, a_system)
				else
					Result := True
				end
			end
		ensure
			query: Result implies is_query
		end

	is_attribute (a_system: ET_SYSTEM): BOOLEAN is
			-- Is feature an attribute?
		require
			a_system_not_void: a_system /= Void
		do
			if not is_builtin then
				Result := static_feature.is_attribute
			else
				Result := target_type.is_builtin_attribute (static_feature, builtin_code, a_system)
			end
		ensure
			query: Result implies is_query
		end

	is_constant_attribute: BOOLEAN is
			-- Is feature a constant attribute?
		do
			Result := static_feature.is_constant_attribute
		ensure
			query: Result implies is_query
		end

	is_unique_attribute: BOOLEAN is
			-- Is feature a unique attribute?
		do
			Result := static_feature.is_unique_attribute
		ensure
			query: Result implies is_query
		end

	is_query: BOOLEAN is
			-- Is current feature a query?
		do
			Result := (result_type_set /= Void)
		ensure
			definition: Result = (result_type_set /= Void)
		end

	is_procedure: BOOLEAN is
			-- Is current feature a procedure?
		do
			Result := (result_type_set = Void)
		ensure
			definition: Result = (result_type_set = Void)
		end

	is_tilde_feature (a_system: ET_SYSTEM): BOOLEAN is
			-- Is current feature supposed to simulate the forthcoming
			-- '~' operator introduced in ECMA Eiffel 367?
			-- (This feature is KL_ANY_ROUTINES.equal_objects.)
		require
			a_system_not_void: a_system /= Void
		local
			l_feature: ET_FEATURE
		do
			l_feature := static_feature.implementation_feature
			Result := l_feature.implementation_class.name.same_class_name (tokens.kl_any_routines_class_name) and then l_feature.name.same_feature_name (tokens.equal_objects_feature_name)
		end

	is_precursor: BOOLEAN is
			-- Is current feature a precursor?
		do
			-- Result := False
		end

	is_semistrict (a_system: ET_SYSTEM): BOOLEAN is
			-- Is current feature semistrict?
		require
			a_system_not_void: a_system /= Void
		do
			if not is_builtin then
				-- Result := False
			elseif (builtin_code // builtin_capacity) = builtin_boolean_class then
				inspect builtin_code \\ builtin_capacity
				when builtin_boolean_and_then then
					Result := target_type = a_system.boolean_type
				when builtin_boolean_or_else then
					Result := target_type = a_system.boolean_type
				when builtin_boolean_implies then
					Result := target_type = a_system.boolean_type
				else
					Result := False
				end
			end
		end

	is_inlined: BOOLEAN
			-- Is current feature inlined?

	is_builtin: BOOLEAN is
			-- Is current feature built-in?
		do
			Result := (builtin_code /= builtin_not_builtin)
		end

	is_current_type_needed: BOOLEAN
			-- Is current type is needed to execute current feature?
			-- (This might be needed for optimization purposes.)

	builtin_code: INTEGER
			-- Built-in code of current feature

	is_builtin_routine_call: BOOLEAN is
			-- Is current feature the built-in feature 'ROUTINE.call'?
		do
			Result := (builtin_code = builtin_function_feature (builtin_function_call)) or
				(builtin_code = builtin_procedure_feature (builtin_procedure_call))
		ensure
			builtin: Result implies is_builtin
		end

	is_builtin_function_item: BOOLEAN is
			-- Is current feature the built-in feature 'FUNCTION.item'?
		do
			Result := (builtin_code = builtin_function_feature (builtin_function_item))
		ensure
			builtin: Result implies is_builtin
		end

feature -- Status setting

	set_built (b: BOOLEAN) is
			-- Set `is_built' to `b'.
		do
			is_built := b
		ensure
			built_set: is_built = b
		end

	set_generated (b: BOOLEAN) is
			-- Set `is_generated' to `b'.
		do
			is_generated := b
		ensure
			generated_set: is_generated = b
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

	set_inlined (b: BOOLEAN) is
			-- Set `is_inlined' to `b'.
		do
			is_inlined := b
		ensure
			inlined_set: is_inlined = b
		end

	set_current_type_needed (b: BOOLEAN) is
			-- Set `is_current_type_needed' to `b'.
		do
			is_current_type_needed := b
		ensure
			current_type_needed_set: is_current_type_needed = b
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

invariant

	static_feature_not_void: static_feature /= Void
	target_type_not_void: target_type /= Void
	dynamic_type_sets_not_void: dynamic_type_sets /= Void

end
