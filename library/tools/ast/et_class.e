indexing

	description:

		"Eiffel classes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLASS

inherit

	HASHABLE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_id: INTEGER; a_universe: like universe) is
			-- Create a new class.
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id >= 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			id := an_id
			universe := a_universe
			!! features.make (100)
		ensure
			name_set: name = a_name
			id_set: id = an_id
			universe_set: universe = a_universe
		end

feature -- Access

	filename: STRING
			-- Filename

	name: ET_IDENTIFIER
			-- Class name

	parents: ET_PARENTS
			-- Parents

	ancestors: DS_HASH_SET [ET_CLASS]
			-- Proper ancestors

	features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	feature_table: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE]
			-- Features indexed by seed

	invariants: ET_ASSERTIONS
			-- Invariants

	id: INTEGER
			-- Class ID

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := id
		end

	universe: ET_UNIVERSE
			-- Universe to which current class belongs

feature -- Status report

	is_deferred: BOOLEAN
			-- Is class deferred?

	is_expanded: BOOLEAN
			-- Is class expanded?

	is_separate: BOOLEAN
			-- Is class separate?

	is_generic: BOOLEAN is
			-- Is class generic?
		do
			-- TO DO
		end

	has_generic_parameter (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		do
			-- TO DO
		ensure
			is_generic: Result implies is_generic
		end

	has_ancestor (a_class: ET_CLASS): BOOLEAN is
			-- Is `a_class' an ancestor of current class?
			-- Detect possible inheritance graph cycles.
		require
			a_class_not_void: a_class /= Void
		do
			if a_class = Current then
				Result := True
			else
				compute_ancestors
				Result := ancestors.has (a_class)
			end
		end

feature -- Error status

	syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?

	has_cycle: BOOLEAN
			-- Is there any cycle in inheritance graph of
			-- current class? (In other words, does current
			-- class have an ancestor which violates VHPR-1?)

feature -- Parsing

	set_filename (a_name: STRING) is
			-- Set `filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			filename := a_name
		ensure
			filename_set: filename = a_name
		end

	set_deferred is
			-- Set `is_deferred' to True.
		do
			is_deferred := True
		ensure
			is_deferred: is_deferred
		end

	set_parents (a_parents: like parents) is
			-- Set `parents' to `a_parents'.
		do
			parents := a_parents
		ensure
			parents_set: parents = a_parents
		end

	put_feature (a_feature: ET_FEATURE) is
			-- Add `a_feature' to `features'.
		require
			a_feature_not_void: a_feature /= Void
		local
			a_name: ET_FEATURE_NAME
		do
			a_name := a_feature.name
			if not features.has (a_name) then
				features.force (a_feature, a_name)
			else
			end
		end

feature -- Inheritance

	compute_ancestors is
			-- Compute ancestors of current class.
			-- Detect possible inheritance graph cycles.
		do
			if ancestors = Void then
				computing_ancestors := True
				if Current = universe.general_class then
					!! ancestors.make (0)
					if parents /= Void then
						-- Error
						parents.add_ancestors (Current)
					end
				elseif parents /= Void then
					!! ancestors.make (10)
					parents.add_ancestors (Current)
				else
					!! ancestors.make (3)
					universe.any_class.add_ancestors (Current)
				end
				computing_ancestors := False
			end
		ensure
			ancestors_not_void: ancestors /= Void
		end

	flatten is
			-- Flatten feature table.
		local
			a_features: ET_INHERITED_FEATURES
		do
			if feature_table = Void then
				compute_ancestors
				if not has_cycle then
					a_features := Shared_inherited_features
					if parents /= Void then
						parents.flatten
						a_features.set_current_class (Current)
						parents.add_inherited_features (a_features)
					elseif Current /= universe.general_class then
						universe.any_parent.flatten
						a_features.set_current_class (Current)
						a_features.add_inherited_features (universe.any_parent)
					else
						a_features.set_current_class (Current)
					end
					a_features.flatten
				else
					!! feature_table.make (0)
				end
			end
		ensure
			ancestors_not_void: ancestors /= Void
			feature_table_not_void: feature_table /= Void
		end

feature {ET_PARENTS, ET_CLASS} -- Inheritance

	add_ancestors (a_class: ET_CLASS) is
			-- Add current class and its ancestors to ancestors of `a_class'.
			-- Detect possible inheritance graph cycles.
		require
			a_class_not_void: a_class /= Void
			a_class_ancestors_not_void: a_class.ancestors /= Void
		local
			a_cursor: DS_HASH_SET_CURSOR [ET_CLASS]
			a_class_ancestors: like ancestors
		do
			a_class_ancestors := a_class.ancestors
			if Current = universe.none_class then
					-- Error.
				a_class.set_has_cycle
			else
				if not a_class_ancestors.has (Current) then
						-- Optimization: Do not add ancestors of current
						-- class if it is already known to be an ancestor
						-- of `a_class' since its ancestors would have
						-- already been added to `an_ancestors'.
					a_class_ancestors.force (Current)
					if ancestors = Void then
						compute_ancestors
					elseif computing_ancestors then
							-- Inheritance graph cycle detected.
						compute_cyclic_ancestors
					end
					a_cursor := ancestors.new_cursor
					from a_cursor.start until a_cursor.after loop
						a_class_ancestors.force (a_cursor.item)
						a_cursor.forth
					end
					if has_cycle then
							-- There is a cycle in the inheritance graph
							-- of current class. Propagate the information
							-- to `a_class'.
						a_class.set_has_cycle
					end
				end
			end
		end

feature {ET_CLASS, ET_ANCESTORS} -- Inheritance

	add_cyclic_ancestors (ancestor_table: DS_HASH_TABLE [ET_ANCESTORS, ET_CLASS]) is
			-- Add current class and its ancestors to `ancestor_table'.
		require
			ancestor_table_not_void: ancestor_table /= Void
			no_void_ancestors: not ancestor_table.has_item (Void)
		local
			anc: ET_ANCESTORS
		do
			if not ancestor_table.has (Current) then
				if computing_ancestors then
					computing_ancestors := False
					ancestors := Void
				end
				!! anc.make (Current, ancestor_table)
				ancestor_table.force (anc, Current)
				if ancestors = Void then
					if Current = universe.general_class then
						if parents /= Void then
							-- Error
							parents.add_cyclic_ancestors (anc)
						end
					elseif parents /= Void then
						parents.add_cyclic_ancestors (anc)
					else
						anc.add_parent (universe.any_class)
					end
				end
			end
		ensure
			ancestors_added: ancestor_table.has (Current)
			no_void_ancestors: not ancestor_table.has_item (Void)
		end

	set_has_cycle is
			-- Set `has_cycle' to True.
		do
			has_cycle := True
		ensure
			has_cycle: has_cycle
		end

	set_ancestors (an_ancestors: like ancestors) is
			-- Set `ancestors' to `an_ancestors'.
		require
			an_ancestors_not_void: an_ancestors /= Void
		do
			ancestors := an_ancestors
		ensure
			ancestors_set: ancestors = an_ancestors
		end

feature {ET_INHERITED_FEATURES} -- Inheritance

	set_feature_table (a_table: like feature_table) is
			-- Set `feature_table' to `a_table'.
		require
			a_table_not_void: a_table /= Void
			no_void_feature: not a_table.has_item (Void)
		do
			feature_table := a_table
		ensure
			feature_table_set: feature_table = a_table
		end

feature {NONE} -- Inheritance

	compute_cyclic_ancestors is
			-- Compute ancestors of current class and of its
			-- ancestors when current class is involved in
			-- an inheritance graph cycles.
		local
			ancestor_table: DS_HASH_TABLE [ET_ANCESTORS, ET_CLASS]
			a_cursor: DS_HASH_TABLE_CURSOR [ET_ANCESTORS, ET_CLASS]
			flattener: DS_NESTED_LIST_FLATTENER [ET_CLASS]
		do
			!! ancestor_table.make (10)
			add_cyclic_ancestors (ancestor_table)
			!! flattener.make
			flattener.flatten (ancestor_table)
			a_cursor := ancestor_table.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.set_ancestors
				a_cursor.forth
			end
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.set_has_cycle
				a_cursor.forth
			end
		end

	computing_ancestors: BOOLEAN
			-- Has current class already been visited
			-- while computing `ancestors'?

	Shared_inherited_features: ET_INHERITED_FEATURES is
			-- Shared inherited features
		once
			!! Result.make (Current)
		ensure
			inherited_features_not_void: Result /= Void
		end

invariant

	name_not_void: name /= Void
	id_positive: id >= 0
	universe_not_void: universe /= Void
	features_not_void: features /= Void
	no_void_feature: not features.has_item (Void)
	no_void_seeded_feature: feature_table /= Void implies not feature_table.has_item (Void)

end -- class ET_CLASS
