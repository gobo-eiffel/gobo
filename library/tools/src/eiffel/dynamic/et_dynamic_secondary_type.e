note

	description:
	"[
		Eiffel dynamic types at run-time corresponding to primary types
		(see ET_DYNAMIC_PRIMARY_TYPE) whose type mark status is overridden
		(e.g. 'attached').
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_SECONDARY_TYPE

inherit

	ET_DYNAMIC_TYPE
		redefine
			is_expanded
		end

create

	make

feature {NONE} -- Initialization

	make (a_primary_type: like primary_type; a_type_mark: like type_mark)
			-- Create a secondary type for `a_primary_type'
			-- overridden with `a_type_mark'.
		require
			a_primary_type_not_void: a_primary_type /= Void
		do
			primary_type := a_primary_type
			type_mark := a_type_mark
		ensure
			primary_type_set: primary_type = a_primary_type
			type_mark_set: type_mark = a_type_mark
		end

feature -- Status report

	is_expanded: BOOLEAN
			-- Is current type expanded?
		do
			Result := primary_type.base_type.is_expanded
		end

	is_self_initializing: BOOLEAN
			-- Is current type self-initializing?
			--
			-- It is currently limited to detachable types and expanded types
			-- in order to match ISE's implementation (as of ISE 20.03.10.3992).
			-- The ECMA standard says that attached type with 'default_create'
			-- as creation procedure are also self-initializing (see DEST,
			-- section 8.19.13, page 106 of ECMA-367 3-36).
		do
			Result := not attached type_mark as l_type_mark or else
				not l_type_mark.is_attached_mark or else is_expanded
		end

	is_attached: BOOLEAN
			-- Is current type attached?
		do
			Result := is_expanded or else (attached type_mark as l_type_mark and then l_type_mark.is_attached_mark)
		end

feature -- Access

	base_type: ET_BASE_TYPE
			-- Base type
		do
			if attached internal_base_type as l_internal_base_type then
				Result := l_internal_base_type
			else
				Result := primary_type.base_type.type_with_type_mark (type_mark)
				internal_base_type := Result
			end
		end

	base_class: ET_CLASS
			-- Base class
		do
			Result := primary_type.base_class
		end

	primary_type: ET_DYNAMIC_PRIMARY_TYPE
			-- Primary version of current type

	type_mark: detachable ET_TYPE_MARK
			-- Type mark (e.g. 'attached') to override `primary_type'

	type_id: INTEGER
			-- Type id
		do
			Result := primary_type.id
			if attached type_mark as l_type_mark and then l_type_mark.is_attached_mark then
				Result := (1 |<< 16) | Result
			end
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := primary_type.hash_code
		end

feature {NONE} -- Implementation

	internal_base_type: detachable ET_BASE_TYPE
			-- Cache for `base_type'

invariant

	internal_base_type_base_type: attached internal_base_type as l_internal_base_type implies l_internal_base_type.is_base_type

end
