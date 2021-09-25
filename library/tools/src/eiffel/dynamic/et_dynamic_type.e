note

	description:

		"Eiffel dynamic types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE

inherit

	ET_DYNAMIC_TYPE_SET
		redefine
			index_of,
			is_expanded,
			put_target,
			has_type
		end

	HASHABLE

	DEBUG_OUTPUT

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

feature -- Status report

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			Result := base_type.is_expanded
		ensure then
			definition: Result = base_type.is_expanded
		end

	is_never_void: BOOLEAN
			-- Can the expression of current dynamic type set never be void?
			-- (Note that in order to be truly true, the current dynamic type
			-- set should also be non-empty. Therefore it is recommended to
			-- use 'not can_be_void'.)
		do
			Result := not base_class.is_none and primary_type.is_alive
		end

	is_generic: BOOLEAN
			-- Is current type generic?
		do
			Result := base_class.is_generic
		ensure
			definition: Result = base_class.is_generic
		end

	is_basic: BOOLEAN
			-- Is current type one of "BOOLEAN", "CHARACTER_8", "CHARACTER_32",
			-- "INTEGER_8", "INTEGER_16", "INTEGER_32", "INTEGER_64",
			-- "NATURAL_8", "NATURAL_16", "NATURAL_32", "NATURAL_64",
			-- "POINTER", "REAL_32", "REAL_64"?
		do
			Result := base_class.is_basic
		ensure
			definition: Result = base_class.is_basic
		end

	is_self_initializing: BOOLEAN
			-- Is current type self-initializing?
			--
			-- It is currently limited to detachable types and expanded types
			-- in order to match ISE's implementation (as of ISE 20.03.10.3992).
			-- The ECMA standard says that attached type with 'default_create'
			-- as creation procedure are also self-initializing (see DEST,
			-- section 8.19.13, page 106 of ECMA-367 3-36).
		deferred
		end

	is_attached: BOOLEAN
			-- Is current type attached?
		deferred
		end

	has_type (a_type: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Do current dynamic types contain `a_type'?
		do
			if count = 1 then
				Result := a_type = primary_type
			end
		ensure then
			definition: Result = (a_type = primary_type)
		end

feature -- Status setting

	set_never_void
			-- Set `is_never_void' to True.
		do
			-- `is_never_void' is already True unless current type is NONE or is not alive.
		end

feature -- Access

	base_type: ET_BASE_TYPE
			-- Base type
		deferred
		ensure
			base_type_not_void: Result /= Void
			base_type_base_type: Result.is_base_type
		end

	base_class: ET_CLASS
			-- Base class
		deferred
		ensure
			base_class_not_void: Result /= Void
		end

	primary_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Primary version of current type
		deferred
		ensure
			primary_type_not_void: Result /= Void
		end

	meta_type: detachable ET_DYNAMIC_PRIMARY_TYPE
			-- Type representing current type, if any.
			-- If current type is of the form 'T', then
			-- the meta type will be 'detachable TYPE [T]'.

	type_mark: detachable ET_TYPE_MARK
			-- Type mark (e.g. 'attached') to override `primary_type'
		deferred
		end

	type_id: INTEGER
			-- Type id
		deferred
		end

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	dynamic_type (i: INTEGER): ET_DYNAMIC_PRIMARY_TYPE
			-- Dynamic type at index `i'
		do
			Result := primary_type
		end

	index_of (a_type: ET_DYNAMIC_PRIMARY_TYPE): INTEGER
			-- Index of first occurrence of `a_type'.
			-- 0 if type not found.
		do
			if has_type (a_type) then
				Result := 1
			end
		end

feature -- Setting

	set_meta_type (a_type: like meta_type)
			-- Set `meta_type' to `a_type'.
		do
			meta_type := a_type
		ensure
			meta_type_set: meta_type = a_type
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in current type set
		do
			if not base_class.is_none and primary_type.is_alive then
				Result := 1
			end
		end

feature -- Conformance

	conforms_to_type (other: ET_DYNAMIC_TYPE): BOOLEAN
			-- Does current type conform to `other' type?
		require
			other_not_void: other /= Void
		local
			l_base_type: ET_BASE_TYPE
			l_other_base_type: ET_BASE_TYPE
		do
			if other = Current then
				Result := True
			else
				l_base_type := primary_type.base_type
				l_other_base_type := other.primary_type.base_type
				if l_other_base_type.is_type_attached_with_type_mark (other.type_mark, l_other_base_type) implies l_base_type.is_type_attached_with_type_mark (type_mark, l_base_type) then
					Result := primary_type.conforms_to_primary_type (other.primary_type)
				end
			end
		end

feature -- Output

	debug_output: STRING
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := base_type.debug_output
		end

feature -- Element change

	put_type_from_type_set (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' coming from `a_type_set' to current target.
		do
		end

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		do
			if primary_type.is_alive then
				a_target.put_type_from_type_set (primary_type, Current, a_system)
			end
			if not is_never_void then
				a_target.propagate_can_be_void (Current)
			end
		end

feature {ET_DYNAMIC_TYPE_SET} -- Implementation

	dynamic_types: ET_DYNAMIC_PRIMARY_TYPES
			-- Dynamic types in current set;
			-- Void if no type in the set
		do
			Result := Current
		end

end
