note

	description:

		"Eiffel lists of actual generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ACTUAL_PARAMETERS

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset actual parameters as they were when they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				type (i).reset
				i := i + 1
			end
		end

	reset_qualified_anchored_types
			-- Reset qualified anchored types contained in current actual parameters
			-- as they were just after they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				type (i).reset_qualified_anchored_types
				i := i + 1
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of actual parameters
		deferred
		ensure
			count_not_negative: Result >= 0
		end

feature -- Access

	actual_parameter (i: INTEGER): ET_ACTUAL_PARAMETER
			-- Actual parameter of `i'-th item in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			actual_parameter_not_void: Result /= Void
		end

	type (i: INTEGER): ET_TYPE
			-- Type of `i'-th item in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			type_not_void: Result /= Void
		end

	named_types (a_context: ET_TYPE_CONTEXT): ET_ACTUAL_PARAMETERS
			-- Named types of current parameters, when they appear in `a_context',
			-- only made up of class names and generic formal parameters when the
			-- root type of `a_context' is a generic type not fully derived
			-- (Definition of base type in  ETL2 p.198). Replace by "*UNKNOWN*"
			-- any unresolved identifier type, anchored type involved in a cycle.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, j, nb: INTEGER
			a_parameter: ET_ACTUAL_PARAMETER
			a_named_parameter: ET_ACTUAL_PARAMETER
			l_type: ET_TYPE
			l_other_type: detachable ET_TYPE
			l_named_type: detachable ET_NAMED_TYPE
			l_new_list: detachable ET_ACTUAL_PARAMETER_LIST
		do
			Result := Current
			nb := count
			from i := nb until i < 1 loop
				a_parameter := actual_parameter (i)
				l_type := a_parameter.type
				if l_type /= l_other_type or l_named_type = Void then
					l_named_type := l_type.named_type (a_context)
					l_other_type := l_type
				end
				a_named_parameter := a_parameter.named_parameter_with_type (l_named_type)
				if l_new_list /= Void then
					l_new_list.put_first (a_named_parameter)
				elseif a_parameter /= a_named_parameter then
					create l_new_list.make_with_capacity (count)
					Result := l_new_list
					from j := nb until j <= i loop
						l_new_list.put_first (actual_parameter (j))
						j := j - 1
					end
					l_new_list.put_first (a_named_parameter)
				end
				i := i - 1
			end
		ensure
			named_types_not_void: Result /= Void
			same_count: Result.count = count
			-- types_named: forall i in 1..count, Result.type (i).is_named_type
		end

	index_of_label (a_label: ET_IDENTIFIER): INTEGER
			-- Index of actual generic parameter with label `a_label';
			-- 0 if it does not exist
		require
			a_label_not_void: a_label /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if attached actual_parameter (i).label as l_actual_label and then a_label.same_identifier (l_actual_label) then
					Result := i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
		end

	folded_actual_parameters: detachable ET_ACTUAL_PARAMETERS
			-- Actual parameters as they were when last parsed
		do
			Result := Current
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no actual parameters?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	has_anchored_type: BOOLEAN
			-- Does one of current types contain an anchored type?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_anchored_type then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_unqualified_anchored_type: BOOLEAN
			-- Does one of current types contain an unqualified anchored type
			-- (i.e. 'like Current' or 'like feature_name')?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_unqualified_anchored_type then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_identifier_anchored_type: BOOLEAN
			-- Does one of current types contain an identifier anchored type
			-- (i.e. an anchored type other than 'like Current')?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_identifier_anchored_type then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	depends_on_qualified_anchored_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does one of the current types depend on a qualified anchored type when
			-- viewed from `a_context' when trying to determine its base type?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in non-qualified anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).depends_on_qualified_anchored_type (a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_formal_types (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does one of the current types contain a formal generic
			-- parameter when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if type (i).has_formal_types (a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	named_types_have_class (a_class: ET_CLASS; a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does one of the named types of current parameters contain
			-- `a_class' when it appears in `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_class_not_void: a_class /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if actual_parameter (i).named_parameter_has_class (a_class, a_context) then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

feature -- Comparison

	same_syntactical_types (other: ET_ACTUAL_PARAMETERS; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Are current types appearing in `a_context' and `other'
			-- types appearing in `other_context' the same type?
			-- (Note: We are NOT comparing the basic types here!
			-- Therefore anchored types are considered the same
			-- only if they have the same anchor. An anchor type
			-- is not considered the same as any other type even
			-- if they have the same base type.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if not type (i).same_syntactical_type (other.type (i), other_context, a_context) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	same_named_types (other: ET_ACTUAL_PARAMETERS; other_context, a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Do current types appearing in `a_context' and `other' types
			-- appearing in `other_context' have the same named types?
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if not type (i).same_named_type (other.type (i), other_context, a_context) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature -- Conformance

	conforms_to_types (other: ET_ACTUAL_PARAMETERS; other_context, a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does current actual parameters appearing in `a_context' conform
			-- to `other' actual parameters appearing in `other_context'?
			-- (Note: 'a_system_processor.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_system_processor_not_void: a_system_processor /= Void
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if not type (i).conforms_to_type (other.type (i), other_context, a_context, a_system_processor) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

	agent_conforms_to_types (a_tuple_position: INTEGER; other: ET_ACTUAL_PARAMETERS; other_context, a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does current actual parameters (of an Agent type) appearing in `a_context'
			-- conform to `other' actual parameters appearing in `other_context'?
			-- Use SmartEiffel agent type conformance semantics, where the conformance
			-- of the Tuple actual generic parameter is checked in the reverse order.
			-- (Note: 'a_system_processor.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_system_processor_not_void: a_system_processor /= Void
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			elseif other.count /= count then
					-- Validity error VTUG-2.
				Result := False
			else
				Result := True
				nb := count
				from i := 1 until i > nb loop
					if i = a_tuple_position then
							-- Reverse conformance for the argument parameter.
						if not other.type (i).conforms_to_type (type (i), a_context, other_context, a_system_processor) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					else
						if not type (i).conforms_to_type (other.type (i), other_context, a_context, a_system_processor) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
		end

	tuple_conforms_to_types (other: ET_ACTUAL_PARAMETERS; other_context, a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does current actual parameters (of a Tuple_type) appearing in `a_context'
			-- conform to `other' actual parameters appearing in `other_context'?
			-- (Note: 'a_system_processor.ancestor_builder' is used on classes on
			-- the classes whose ancestors need to be built in order to check
			-- for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			a_system_processor_not_void: a_system_processor /= Void
		local
			i, nb: INTEGER
		do
			if other = Current and then other_context = a_context then
				Result := True
			else
				nb := other.count
				if nb <= count then
					Result := True
					from i := 1 until i > nb loop
						if not type (i).conforms_to_type (other.type (i), other_context, a_context, a_system_processor) then
							Result := False
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				else
					Result := False
				end
			end
		end

feature -- Type processing

	resolved_formal_parameters (a_parameters: ET_ACTUAL_PARAMETERS): ET_ACTUAL_PARAMETERS
			-- Version of current types where the formal generic
			-- parameter types have been replaced by their actual
			-- counterparts in `a_parameters'
		require
			a_parameters_not_void: a_parameters /= Void
		local
			i, j, nb: INTEGER
			a_parameter, a_resolved_parameter: ET_ACTUAL_PARAMETER_ITEM
			l_type: ET_TYPE
			l_other_type: detachable ET_TYPE
			l_resolved_type: detachable ET_TYPE
			l_new_list: detachable ET_ACTUAL_PARAMETER_LIST
		do
			Result := Current
			nb := count
			from i := nb until i < 1 loop
				a_parameter := actual_parameter (i)
				l_type := a_parameter.type
				if l_type /= l_other_type or l_resolved_type = Void then
					l_resolved_type := l_type.resolved_formal_parameters (a_parameters)
					l_other_type := l_type
				end
				a_resolved_parameter := a_parameter.resolved_formal_parameters_with_type (l_resolved_type)
				if l_new_list /= Void then
					l_new_list.put_first (a_resolved_parameter)
				elseif a_parameter /= a_resolved_parameter then
					create l_new_list.make_with_capacity (count)
					Result := l_new_list
					from j := nb until j <= i loop
						l_new_list.put_first (actual_parameter (j))
						j := j - 1
					end
					l_new_list.put_first (a_resolved_parameter)
				end
				i := i - 1
			end
		ensure
			resolved_parameters_not_void: Result /= Void
			same_count: Result.count = count
		end

feature -- Output

	append_to_string (a_string: STRING)
			-- Append textual representation of
			-- current actual parameters to `a_string'.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
		do
			a_string.append_character ('[')
			nb := count
			if nb >= 1 then
				from i := 1 until i > nb loop
					if attached actual_parameter (i).label as l_label then
						if i > 1 then
							a_string.append_string ("; ")
						end
						a_string.append_string (l_label.lower_name)
						a_string.append_string (": ")
					elseif i > 1 then
						a_string.append_string (", ")
					end
					type (i).append_to_string (a_string)
					i := i + 1
				end
			end
			a_string.append_character (']')
		end

	append_unaliased_to_string (a_string: STRING)
			-- Append textual representation of unaliased
			-- version of current actual parameters to `a_string'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			a_string.append_character ('[')
			nb := count
			if nb >= 1 then
				a_type := type (1)
				a_type.append_unaliased_to_string (a_string)
				from i := 2 until i > nb loop
					a_string.append_string (", ")
					a_type := type (i)
					a_type.append_unaliased_to_string (a_string)
					i := i + 1
				end
			end
			a_string.append_character (']')
		end

	append_runtime_name_to_string (a_string: STRING)
			-- Append to `a_string' textual representation of unaliased
			-- version of current actual parameters as returned by 'TYPE.runtime_name'.
			-- An unaliased version if when aliased types such as INTEGER
			-- are replaced by the associated types such as INTEGER_32.
		require
			a_string_not_void: a_string /= Void
		local
			i, nb: INTEGER
			a_type: ET_TYPE
		do
			a_string.append_character ('[')
			nb := count
			if nb >= 1 then
				a_type := type (1)
				a_type.append_runtime_name_to_string (a_string)
				from i := 2 until i > nb loop
					a_string.append_string (", ")
					a_type := type (i)
					a_type.append_runtime_name_to_string (a_string)
					i := i + 1
				end
			end
			a_string.append_character (']')
		end

end
