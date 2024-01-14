note

	description:

		"Eiffel constraints on formal generic parameters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019-2024, Eric Bezault and others"
	license: "MIT License"

deferred class ET_CONSTRAINT

inherit

	ET_AST_NODE

feature -- Initialization

	reset
			-- Reset constraint as it was just after it was last parsed.
		deferred
		end

	reset_renames
			-- Reset renames of type constraints as they were just
			-- after they were last parsed.
		do
		end

feature -- Access

	type_constraint (i: INTEGER): ET_TYPE_CONSTRAINT
			-- `i'-th type constraint
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			type_constraint_not_void: Result /= Void
		end

feature -- Status report

	has_formal_parameter (i: INTEGER): BOOLEAN
			-- Is one of the constraint types the `i'-th formal generic parameter of the enclosing class?
		do
			-- Result := False	
		end

	are_named_types: BOOLEAN
			-- Are all types named types (only made up of named types)?
		deferred
		end

	has_expanded_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is one of the constraint types an expanded type when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	has_attached_type (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Is one of the constraint types attached when viewed from `a_context'?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	has_non_separate_reference_attributes (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does one of the constraint types contain attributes whose types are declared
			-- of non-separate reference types when viewed from `a_context'?
			-- True in case of a formal generic parameter because the actual
			-- generic parameter may contain non-separate reference attributes.
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

	has_nested_non_separate_reference_attributes (a_context: ET_TYPE_CONTEXT): BOOLEAN
			-- Does one of the constraint types contain non-separate reference attributes
			-- when viewed from `a_context', or recursively does it contain expanded
			-- attributes whose types contain non-separate reference attributes?
		require
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
		deferred
		end

feature -- Measurement

	count: INTEGER
			-- Number of type constraints in current constraint
		deferred
		ensure
			count_not_negative: Result >= 0
		end

feature -- Conformance

	conforms_to_type (other: ET_TYPE; other_context, a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Does at least one type in current constraint appearing in `a_context'
			-- conform  to `other' type appearing in `other_context'?
			-- (Note: 'a_system_processor.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		do
			Result := conforms_to_type_with_type_marks (other, Void, other_context, Void, a_context, a_system_processor)
		end

	conforms_to_type_with_type_marks (other: ET_TYPE; other_type_mark: detachable ET_TYPE_MARK; other_context: ET_TYPE_CONTEXT; a_type_mark: detachable ET_TYPE_MARK; a_context: ET_TYPE_CONTEXT; a_system_processor: ET_SYSTEM_PROCESSOR): BOOLEAN
			-- Same as `conforms_to_type' except that the type mark status of the types
			-- in current constraint and `other' is overridden by `a_type_mark' and
			-- `other_type_mark', if not Void
		require
			other_not_void: other /= Void
			other_context_not_void: other_context /= Void
			other_context_valid: other_context.is_valid_context
			a_context_not_void: a_context /= Void
			a_context_valid: a_context.is_valid_context
			-- no_cycle: no cycle in anchored types involved.
			a_system_processor_not_void: a_system_processor /= Void
		deferred
		end

feature -- Output

	types_to_text: STRING
			-- Textual representation of the types in current constraint
			-- (Create a new string at each call.)
		do
			create Result.make (15)
			append_types_to_string (Result)
		ensure
			types_to_text_not_void: Result /= Void
		end

	append_types_to_string (a_string: STRING)
			-- Append to `a_string' the textual representation
			-- of the types in current constraint.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

end
