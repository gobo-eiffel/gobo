indexing

	description:

		"Eiffel dynamic types at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_TYPE

inherit

	ET_DYNAMIC_TYPE_SET

	DEBUG_OUTPUT

creation

	make

feature {NONE} -- Initialization

	make (a_type: like base_type; a_class: like base_class) is
			-- Create a new type.
		require
			a_type_not_void: a_type /= Void
			a_type_base_type: a_type.is_base_type
			a_class_not_void: a_class /= Void
		do
			base_type := a_type
			base_class := a_class
			count := 1
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
		end

feature -- Status report

	is_alive: BOOLEAN
			-- Is current type considered alive?
			-- (e.g. instances of this type may be created)

	is_expanded: BOOLEAN is
			-- Is current type expanded?
		do
			Result := base_type.is_expanded
		ensure
			definition: Result = base_type.is_expanded
		end

feature -- Conformance

	conforms_to_type (other: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM): BOOLEAN is
			-- Does current type conform to `other' type?
			-- (Note: 'a_system.universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance,
			-- and 'a_system.universe.qualified_signature_resolver' is used on classes
			-- whose qualified anchored types need to be resolved in order to
			-- check conformance.)
		require
			other_not_void: other /= Void
			a_system_not_void: a_system /= Void
			-- no_cycle: no cycle in anchored types involved.
		local
			l_universe: ET_UNIVERSE
			l_any: ET_CLASS_TYPE
		do
			l_universe := a_system.universe
			l_any := l_universe.any_class
			Result := base_type.conforms_to_type (other.base_type, l_any, l_any, l_universe)
		end

feature -- Status setting

	set_alive (b: BOOLEAN) is
			-- Set `is_alive' to `b'.
		do
			is_alive := b
		ensure
			alive_set: is_alive = b
		end

feature -- Access

	base_type: ET_BASE_TYPE
			-- Base type

	base_class: ET_CLASS
			-- Base class

	features: ET_DYNAMIC_FEATURE_LIST
			-- Features executed at run-time, if any

	static_type: ET_DYNAMIC_TYPE is
			-- Type at compilation time
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	first_type: ET_DYNAMIC_TYPE is
			-- First type in current set;
			-- Void if no type in the set
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

	other_types: DS_LINKABLE [ET_DYNAMIC_TYPE] is
			-- Other types in current set;
			-- Void if zero or one type in the set
		do
		ensure then
			only_one_type: Result = Void
		end

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Sub-sets of current set
		do
		ensure then
			no_source: Result = Void
		end

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

feature -- Features

	dynamic_feature (a_feature: ET_FEATURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time feature associated with `a_feature'
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: base_class.features.has (a_feature)
			a_system_not_void: a_system /= Void
		local
			i, nb: INTEGER
			l_dynamic_feature: ET_DYNAMIC_FEATURE
		do
			if features = Void then
				create features.make_with_capacity (base_class.features.count)
				create Result.make (a_feature, Current, a_system)
				features.put_first (Result)
			else
				nb := features.count
				from i := 1 until i > nb loop
					l_dynamic_feature :=  features.item (i)
					if l_dynamic_feature.static_feature = a_feature then
						Result := l_dynamic_feature
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result = Void then
					create Result.make (a_feature, Current, a_system)
					features.force_first (Result)
				end
			end
		ensure
			dynamic_feature_not_void: Result /= Void
		end

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		do
			if a_type /= Current then
					-- Internal error: cannot put another type to current type.
				a_system.set_fatal_error
				a_system.error_handler.report_gibcd_error
			end
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are sub-sets of current set.)
		do
				-- Internal error: dynamic types cannot have sources.
			a_system.set_fatal_error
			a_system.error_handler.report_gibce_error
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := base_type.debug_output
		end

invariant

	base_type_not_void: base_type /= Void
	base_type_base_type: base_type.is_base_type
	base_class_not_void: base_class /= Void

end
