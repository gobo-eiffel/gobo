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
		redefine
			is_expanded
		end

	DEBUG_OUTPUT

create

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
			features := empty_features
			if is_expanded then
				set_alive
			end
		ensure
			base_type_set: base_type = a_type
			base_class_set: base_class = a_class
			expanded_type_alive: is_expanded implies is_alive
		end

feature -- Status report

	is_alive: BOOLEAN
			-- Is current type considered alive?
			-- (e.g. instances of this type may be created)

	was_alive: BOOLEAN
			-- Was current type considered alive during the last iteration?
			-- (e.g. instances of this type may be created)

	is_expanded: BOOLEAN is
			-- Is current type expanded?
		do
			Result := base_type.is_expanded
		ensure then
			definition: Result = base_type.is_expanded
		end

	is_agent_type: BOOLEAN is
			-- Is current type an agent type?
		do
			-- Result := False
		end

	has_static: BOOLEAN
			-- Does current type contain features that are used as static features?

feature -- Conformance

	conforms_to_type (other: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM): BOOLEAN is
			-- Does current type conform to `other' type?
			-- (Note: 'a_system.universe.ancestor_builder' is used on the classes
			-- whose ancestors need to be built in order to check for conformance.)
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

	set_alive is
			-- Set `is_alive' to True.
		do
			is_alive := True
			if first_type = Void then
				first_type := Current
			elseif first_type = Current then
				-- Do nothing.
			elseif other_types = Void then
				create other_types.make_with_capacity (15)
				other_types.put_last (Current)
			elseif other_types.has (Current) then
				-- Do nothing.
			else
				other_types.force_last (Current)
			end
		ensure
			alive_set: is_alive
		end

	set_was_alive is
			-- Set `was_alive' to True.
		do
			was_alive := True
		ensure
			was_alive_set: was_alive
		end

	set_static (b: BOOLEAN) is
			-- Set `has_static' to `b'.
		do
			has_static := b
		ensure
			static_set: has_static = b
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

	first_type: ET_DYNAMIC_TYPE
			-- First type in current set;
			-- Void if no type in the set

	other_types: ET_DYNAMIC_TYPE_LIST
			-- Other types in current set;
			-- Void if zero or one type in the set

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Sub-sets of current type set
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
			if features = empty_features then
				create features.make_with_capacity (base_class.features.count)
				Result := new_dynamic_feature (a_feature, a_system)
				features.put_last (Result)
			else
				nb := features.count
				from i := 1 until i > nb loop
					l_dynamic_feature := features.item (i)
					if l_dynamic_feature.static_feature = a_feature then
						Result := l_dynamic_feature
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
				if Result = Void then
					Result := new_dynamic_feature (a_feature, a_system)
					features.force_last (Result)
				end
			end
		ensure
			dynamic_feature_not_void: Result /= Void
		end

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current set.
		do
			if a_type.conforms_to_type (static_type, a_system) then
				if first_type = Void then
					first_type := a_type
				elseif a_type = first_type then
					-- Do nothing.
				elseif other_types = Void then
					create other_types.make_with_capacity (15)
					other_types.put_last (a_type)
				elseif other_types.has (a_type) then
					-- Do nothing.
				else
					other_types.force_last (a_type)
				end
			end
		end

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		do
			if is_alive then
				a_target.put_type (Current, a_system)
			end
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		do
			-- Do nothing: the current kind of type set is not pulling
			-- types from sources.
		end

feature -- Output

	debug_output: STRING is
			-- String that should be displayed in debugger to represent `Current'
		do
			Result := base_type.debug_output
		end

feature -- Link

	next_type: ET_DYNAMIC_TYPE
			-- Next dynamic type with the same base class in the surrounding system

	set_next_type (a_type: like next_type) is
			-- Set `next_type' to `a_type'.
		do
			next_type := a_type
		ensure
			next_type_set: next_type = a_type
		end

feature {NONE} -- Implementation

	new_dynamic_feature (a_feature: ET_FEATURE; a_system: ET_SYSTEM): ET_DYNAMIC_FEATURE is
			-- Run-time feature associated with `a_feature';
			-- Create a new object at each call.
		require
			a_feature_not_void: a_feature /= Void
			valid_feature: base_class.features.has (a_feature)
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_feature, Current, a_system)
		ensure
			new_dynamic_feature_not_void: Result /= Void
		end

	empty_features: ET_DYNAMIC_FEATURE_LIST is
			-- 	Empty feature list
		once
			create Result.make
		ensure
			features_not_void: Result /= Void
			features_empty: Result.is_empty
		end

invariant

	base_type_not_void: base_type /= Void
	base_type_base_type: base_type.is_base_type
	base_class_not_void: base_class /= Void
	features_not_void: features /= Void

end
