indexing

	description:

		"Eiffel classes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
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

	generic_parameters: ET_FORMAL_GENERIC_PARAMETERS
			-- Formal generic parameters

	generic_parameter (a_name: ET_IDENTIFIER): ET_FORMAL_GENERIC_PARAMETER is
			-- Generic parameter with name `a_name';
			-- Void if no such generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			if generic_parameters /= Void then
				Result := generic_parameters.generic_parameter (a_name)
			end
		ensure
			has_generic_parameter: has_generic_parameter (a_name) = (Result /= Void)
			same_name: Result /= Void implies Result.name.same_identifier (a_name)
		end

	parents: ET_PARENTS
			-- Parents

	ancestors: DS_HASH_TABLE [ET_CLASS_TYPE, ET_CLASS]
			-- Proper ancestors, indexed by base class

	ancestor (a_type: ET_CLASS_TYPE): ET_CLASS_TYPE is
		require
			a_type_not_void: a_type /= Void
			has_ancestor: has_ancestor (a_type.base_class)
		do
			if a_type.base_class = Current then
				Result := a_type
			else
				Result := ancestors.item (a_type.base_class)
			end
		end

	features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	seeds: DS_HASH_TABLE [ET_FEATURE, INTEGER]
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

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

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
			Result := generic_parameters /= Void
		ensure
			definition: Result = (generic_parameters /= Void)
		end

	has_generic_parameter (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		do
			if generic_parameters /= Void then
				Result := generic_parameters.has_generic_parameter (a_name)
			end
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
			elseif is_parsed and not has_syntax_error then
				search_ancestors
				Result := ancestors.has (a_class)
			end
		end

feature -- Parsing status

	is_parsed: BOOLEAN is
			-- Has current class been parsed?
		do
			Result := (filename /= Void)
		ensure
			definition: Result = (filename /= Void)
		end

	has_syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?

feature {ET_EIFFEL_SCANNER_SKELETON} -- Parsing

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

	set_expanded is
			-- Set `is_expanded' to True.
		do
			is_expanded := True
		ensure
			is_expanded: is_expanded
		end

	set_separate is
			-- Set `is_separate' to True.
		do
			is_separate := True
		ensure
			is_separate: is_separate
		end

	set_generic_parameters (a_generic_parameters: like generic_parameters) is
			-- Set `generic_parameters' to `a_generic_parameters'.
		do
			generic_parameters := a_generic_parameters
		ensure
			generic_parameters_set: generic_parameters = a_generic_parameters
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

	set_syntax_error (b: BOOLEAN) is
			-- Set `has_syntax_error' to `b'.
		do
			has_syntax_error := b
		ensure
			syntax_error_set: has_syntax_error = b
		end

feature -- System

	in_system: BOOLEAN
			-- Is current class reachable from the
			-- root class?

	add_to_system is
			-- Recursively add current class to system.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_FEATURE, ET_FEATURE_NAME]
		do
			if not in_system then
				in_system := True
				if parents /= Void then
					parents.add_to_system
				else
					universe.any_class.add_to_system
				end
				a_cursor := features.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_cursor.item.add_to_system
					a_cursor.forth
				end
			end
		ensure
			is_in_system: in_system
		end

feature -- Genealogy status

	ancestors_searched: BOOLEAN is
			-- Have `ancestors' been searched?
		do
			Result := ancestors /= Void
		ensure
			definition: Result = (ancestors /= Void)
		end

	has_ancestors_error: BOOLEAN
			-- Has a fatal error occurred during
			-- ancestors searching?

feature -- Genealogy

	search_ancestors is
			-- Search ancestors of current class.
			-- Detect possible inheritance graph cycles.
		require
			is_parsed: is_parsed
			no_syntax_error: not has_syntax_error
		local
			anc: DS_HASH_SET [ET_CLASS]
			cycle: DS_LINKED_LIST [ET_CLASS]
			a_class, any_class, cycle_root: ET_CLASS
			a_parents, any_parents: like parents
			a_parent: ET_PARENT
			nb, old_nb: INTEGER
		do
			if not ancestors_searched then
				!! anc.make (10)
					-- Give dummy values to the first two arguments of
					-- `add_to_ancestors'. These two arguments are only
					-- used `for error reporting and there will not be
					-- any error here thanks to the preconditions
					-- "is_parsed" and "no_syntax_error".
				add_to_ancestors (universe.any_type, Current, anc)
				any_class := universe.any_class
				any_parents := universe.any_parents
				nb := anc.count
				from until nb = 0 or nb = old_nb loop
					from anc.start until anc.after loop
						a_class := anc.item_for_iteration
						a_parents := a_class.parents
						if a_parents /= Void then
							if a_parents.ancestors_searched then
								a_parents.set_ancestors (a_class)
								anc.remove (a_class)
							else
								anc.forth
							end
						elseif any_class.ancestors_searched then
							any_parents.set_ancestors (a_class)
							anc.remove (a_class)
						else
							anc.forth
						end
					end
					old_nb := nb
					nb := anc.count
				end
				if nb /= 0 then
						-- There is a cycle in the inheritance graph.
					!! cycle.make
					a_class := anc.first
					from until cycle.has (a_class) loop
						cycle.put_last (a_class)
							-- Look for first parent of `a_class' whose
							-- ancestors have not been searched yet. This
							-- parent exists otherwise `a_class' would not
							-- be in `anc' in the first place.
						a_parents := a_class.parents
						if a_parents = Void then
							a_parents := universe.any_parents
						end
						a_parent := a_parents.first_unsearched_parent
						a_class := a_parent.type.base_class
					end
					cycle_root := a_class
					cycle.put_last (cycle_root)
					from until cycle.first = cycle_root loop
						cycle.remove_first
					end
						-- Make sure that all classes evolved in the
						-- cycle and their descendants are marked
						-- with `has_ancestors_error'.
					!! ancestors.make (0)
					from anc.start until anc.after loop
						a_class := anc.item_for_iteration
						a_class.set_ancestors_error (True)
						a_class.set_ancestors (ancestors)
						anc.forth
					end
						-- Report the validity error VHPR-1.
					error_handler.report_vhpr1_error (cycle_root, cycle)
				end
			end
		ensure
			ancestors_searched: ancestors_searched
		end
		
feature {ET_PARENTS, ET_PARENT, ET_CLASS} -- Genealogy

	add_to_ancestors (a_type: ET_CLASS_TYPE; an_heir: ET_CLASS; anc: DS_HASH_SET [ET_CLASS]) is
			-- Add current class and recursively its ancestors
			-- to `anc' if not already done and if `ancestors'
			-- have not been searched yet. `an_heir' is the class
			-- where `a_type', whose base class is current class,
			-- appears as a parent. (`a_type' and `an_heir' are
			-- only needed for error reporting and may have dummy
			-- values starting the ancestors search process (call
			-- to feature `search_ancestors').)
		require
			a_type_not_void: a_type /= Void
			an_heir_not_void: an_heir /= Void
			anc_not_void: anc /= Void
		local
			any_class: ET_CLASS
		do
			if not ancestors_searched then
				has_ancestors_error := False
				if not is_parsed then
						-- Error: class not in universe
						-- (VTCT, ETL2 p.199).
					error_handler.report_vtct_error (an_heir, a_type)
					!! ancestors.make (0)
					has_ancestors_error := True
				elseif has_syntax_error then
						-- This error has already been reported
						-- somewhere else.
					!! ancestors.make (0)
					has_ancestors_error := True
				elseif parents = Void then
					if Current = universe.general_class then
						!! ancestors.make (0)
					elseif Current = universe.any_class then
							-- ISE Eiffel has no GENERAL class anymore.
							-- Use ANY has class root now.
						!! ancestors.make (0)
					elseif not anc.has (Current) then
						any_class := universe.any_class
						if not any_class.is_parsed then
								-- Error: class ANY not in universe
								-- (VTCT, ETL2 p.199).
							error_handler.report_vtct_any_error (Current)
							!! ancestors.make (0)
							has_ancestors_error := True
						elseif any_class.has_syntax_error then
								-- This error has already been reported
								-- somewhere else.
							!! ancestors.make (0)
							has_ancestors_error := True
						else
							anc.force (Current)
							universe.any_parents.add_to_ancestors (Current, anc)
						end
					end
				elseif not anc.has (Current) then
					anc.force (Current)
					parents.add_to_ancestors (Current, anc)
				end
			end
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

	set_ancestors_error (b: BOOLEAN) is
			-- Set `has_ancestors_error' to `b'.
		do
if equal (name.name, "COLLECTION") then
do_nothing
end
			has_ancestors_error := b
		ensure
			has_ancestors_error_set: has_ancestors_error = b
		end

feature -- Flattening status

	is_flattened: BOOLEAN is
			-- Have features been flattened?
		do
			Result := seeds /= Void
		ensure
			definition: Result = (seeds /= Void)
		end

	has_flatten_error: BOOLEAN
			-- Has a fatal error occurred during
			-- feature flattening?

feature -- Feature flattening

	flatten is
			-- Flatten feature table.
		require
			is_parsed: is_parsed
			no_syntax_error: not has_syntax_error
		local
			a_flattener: ET_FEATURE_FLATTENER
			any_parents: ET_PARENTS
			has_error: BOOLEAN
		do
			if not is_flattened then
				search_ancestors
				has_error := has_ancestors_error
				if not has_error and then generic_parameters /= Void then
					has_error := not generic_parameters.check_validity (Current)
				end
				if not has_error and then parents /= Void then
					has_error := not parents.check_generic_derivation (Current)
				end
				if not has_error then
					a_flattener := Shared_feature_flattener
					if parents = Void then
						if Current = universe.general_class then
							a_flattener.set_current_class (Current)
						elseif Current = universe.any_class then
								-- ISE Eiffel has no GENERAL class anymore.
								-- Use ANY has class root now.
							a_flattener.set_current_class (Current)
						else
							any_parents := universe.any_parents
							any_parents.flatten
							if any_parents.has_flatten_error then
								!! seeds.make (0)
								has_flatten_error := True
							else
								a_flattener.set_current_class (Current)
								any_parents.add_inherited_features (a_flattener)
							end
						end
					else
						parents.flatten
						if parents.has_flatten_error then
							!! seeds.make (0)
							has_flatten_error := True
						else
							a_flattener.set_current_class (Current)
							parents.add_inherited_features (a_flattener)
						end
					end
					a_flattener.flatten
				else
					!! seeds.make (0)
					has_flatten_error := True
				end
			end
		ensure
			ancestors_not_void: ancestors /= Void
			flattened: is_flattened
		end

feature {ET_FEATURE_FLATTENER} -- Feature flattening

	set_seeds (a_seeds: like seeds) is
			-- Set `seeds' to `a_seeds'.
		require
			a_seeds_not_void: a_seeds /= Void
			no_void_feature: not a_seeds.has_item (Void)
		do
			seeds := a_seeds
		ensure
			seeds_set: seeds = a_seeds
		end

feature {NONE} -- Implementation

	Shared_feature_flattener: ET_FEATURE_FLATTENER is
			-- Shared feature flattener
		once
			!! Result.make (Current)
		ensure
			feature_flattener_not_void: Result /= Void
		end

invariant

	name_not_void: name /= Void
	id_positive: id >= 0
	universe_not_void: universe /= Void
	features_not_void: features /= Void
	no_void_feature: not features.has_item (Void)
	no_void_seeded_feature: seeds /= Void implies not seeds.has_item (Void)
	no_void_ancestor: ancestors /= Void implies not ancestors.has_item (Void)

end -- class ET_CLASS
