indexing

	description:

		"Eiffel classes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS

inherit

	ET_AST_NODE
	HASHABLE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like name; an_id: INTEGER; a_universe: like universe) is
			-- Create a new class.
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id > 0
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			id := an_id
			universe := a_universe
			class_keyword := tokens.class_keyword
			end_keyword := tokens.end_keyword
		ensure
			name_set: name = a_name
			id_set: id = an_id
			universe_set: universe = a_universe
		end

feature -- Status report

	is_expanded: BOOLEAN is
			-- Is class expanded?
		do
			Result := has_expanded_mark
		end

	is_separate: BOOLEAN is
			-- Is class separate?
		do
			Result := has_separate_mark
		end

	has_deferred_mark: BOOLEAN is
			-- Has class been declared as deferred?
		do
			Result := (class_mark /= Void and then class_mark.is_deferred)
		end

	has_expanded_mark: BOOLEAN is
			-- Has class been declared as expanded?
		do
			Result := (class_mark /= Void and then class_mark.is_expanded)
		end

	has_reference_mark: BOOLEAN is
			-- Has class been declared as reference?
		do
			Result := (class_mark /= Void and then class_mark.is_reference)
		end

	has_separate_mark: BOOLEAN is
			-- Has class been declared as separate?
		do
			Result := (class_mark /= Void and then class_mark.is_separate)
		end

feature -- Access

	filename: STRING
			-- Filename

	name: ET_CLASS_NAME
			-- Class name

	obsolete_message: ET_OBSOLETE
			-- Obsolete message

	first_indexing: ET_INDEXING_LIST
			-- Indexing clause at the beginning of the class

	second_indexing: ET_INDEXING_LIST
			-- Indexing clause at the end of the class

	invariants: ET_INVARIANTS
			-- Invariants

	class_keyword: ET_KEYWORD
			-- 'class' keyword

	end_keyword: ET_KEYWORD
			-- 'end' keyword

	class_mark: ET_KEYWORD
			-- 'deferred', 'expanded', 'reference' or 'separate' keyword

	id: INTEGER
			-- Class ID

	hash_code: INTEGER is
			-- Hash code value
		do
			Result := id
		end

	cluster: ET_CLUSTER
			-- Cluster to which current class belongs

	universe: ET_UNIVERSE
			-- Universe to which current class belongs

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			if first_indexing /= Void then
				Result := first_indexing.position
			elseif class_mark /= Void then
				Result := class_mark.position
			else
				Result := class_keyword.position
			end
		end

	leading_break: ET_BREAK
			-- Break that appears at the top of the file, before
			-- the class declaration

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := end_keyword.break
		end

feature -- Genericity

	is_generic: BOOLEAN is
			-- Is current class generic?
		do
			Result := generic_parameters /= Void
		ensure
			definition: Result = (generic_parameters /= Void)
		end

	generic_parameters: ET_FORMAL_PARAMETER_LIST
			-- Formal generic parameters

	has_generic_parameter (a_name: ET_IDENTIFIER): BOOLEAN is
			-- Is `a_name' a formal generic parameter?
		require
			a_name_not_void: a_name /= Void
		do
			if generic_parameters /= Void then
				Result := generic_parameters.has_formal_parameter (a_name)
			end
		ensure
			is_generic: Result implies is_generic
		end

	generic_parameter (a_name: ET_IDENTIFIER): ET_FORMAL_PARAMETER is
			-- Generic parameter with name `a_name';
			-- Void if no such generic parameter
		require
			a_name_not_void: a_name /= Void
		do
			if generic_parameters /= Void then
				Result := generic_parameters.formal_parameter_by_name (a_name)
			end
		ensure
			has_generic_parameter: has_generic_parameter (a_name) = (Result /= Void)
			same_name: Result /= Void implies Result.name.same_identifier (a_name)
		end

feature -- Creation

	creators: ET_CREATOR_LIST
			-- Creation clauses

	set_creators (a_creators: like creators) is
			-- Set `creators' to `a_creators'.
		do
			creators := a_creators
		ensure
			creators_set: creators = a_creators
		end

	is_creation_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clauses
			-- and is it exported to `a_class'?
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			if creators /= Void then
				Result := creators.is_exported_to (a_name, a_class)
			end
		end

	is_creation_directly_exported_to (a_name: ET_FEATURE_NAME; a_class: ET_CLASS): BOOLEAN is
			-- Is feature name listed in current creation clauses
			-- and is it directly exported to `a_class'?
			-- This is different from `is_creation_exported_to' where `a_class'
			-- can be a descendant of a class appearing in the list of clients.
			-- Note: The use of 'direct' in the name of this feature has not
			-- the same meaning as 'direct and indirect client' in ETL2 p.91.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			if creators /= Void then
				Result := creators.is_directly_exported_to (a_name, a_class)
			end
		end

feature -- Genealogy

	parents: ET_PARENT_LIST
			-- Parents

	ancestors: DS_HASH_TABLE [ET_CLASS_TYPE, INTEGER]
			-- Proper ancestors, indexed by base class ID

	has_ancestor (a_class: ET_CLASS): BOOLEAN is
			-- Is `a_class' an ancestor of current class?
			-- Detect possible inheritance graph cycles.
		require
			a_class_not_void: a_class /= Void
		do
			if a_class = Current then
				Result := True
			else
				if not is_preparsed then
					universe.preparse
				end
				if is_preparsed then
					if not is_parsed then
						parse
					end
					if is_parsed and then not has_syntax_error then
						search_ancestors
						if not has_ancestors_error then
							Result := ancestors.has (a_class.id)
						end
					end
				end
			end
		end

	ancestor (a_type: ET_CLASS_TYPE): ET_CLASS_TYPE is
			-- Ancestor of current class with same
			-- base class as `a_type'
		require
			a_type_not_void: a_type /= Void
			has_ancestor: has_ancestor (a_type.base_class)
		local
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if a_class = Current then
				Result := a_type
			else
				if not is_preparsed then
					universe.preparse
				end
				if is_preparsed then
					if not is_parsed then
						parse
					end
					if is_parsed and then not has_syntax_error then
						search_ancestors
						if not has_ancestors_error then
							Result := ancestors.item (a_class.id)
						end
					end
				end
			end
		ensure
			ancestor_not_void: Result /= Void
		end

	descendants: DS_ARRAYED_LIST [ET_CLASS] is
			-- Proper descendant classes
		do
			if has_descendants then
				Result := universe.descendants (Current)
			else
				!! Result.make (0)
			end
		ensure
			descendants_not_void: Result /= Void
			no_void_descendant: not Result.has (Void)
		end

	has_descendants: BOOLEAN
			-- Does current class have proper descendants?

feature -- Feature clauses

	feature_clauses: ET_FEATURE_CLAUSE_LIST
			-- Feature clauses

	set_feature_clauses (a_feature_clauses: like feature_clauses) is
			-- Set `feature_clauses' to `a_feature_clauses'.
		do
			feature_clauses := a_feature_clauses
		ensure
			feature_clauses_set: feature_clauses = a_feature_clauses
		end

feature -- Features

	named_feature (a_name: ET_FEATURE_NAME): ET_FEATURE is
			-- Feature named `a_name';
			-- Void if no such feature
		require
			a_name_not_void: a_name /= Void
		do
			if named_features /= Void then
				named_features.search (a_name)
				if named_features.found then
					Result := named_features.found_item
				end
			end
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	named_features: DS_HASH_TABLE [ET_FEATURE, ET_FEATURE_NAME]
			-- Features indexed by name

	seeded_feature (a_seed: INTEGER): ET_FEATURE is
			-- Feature with seed `a_seed';
			-- Void if no such feature
		do
			if seeded_features /= Void then
				seeded_features.search (a_seed)
				if seeded_features.found then
					Result := seeded_features.found_item
				end
			end
		ensure
			registered: Result /= Void implies Result.is_registered
		end

	seeded_features: DS_HASH_TABLE [ET_FEATURE, INTEGER]
			-- Features indexed by seed ID

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
				if named_features /= Void then
					a_cursor := named_features.new_cursor
					from a_cursor.start until a_cursor.after loop
						a_cursor.item.add_to_system
						a_cursor.forth
					end
				end
			end
		ensure
			is_in_system: in_system
		end

feature -- Compilation: parsing status

	is_preparsed: BOOLEAN is
			-- Has current class been preparsed (i.e. its filename
			-- and cluster are already known but the class has not
			-- necessarily been parsed yet)?
		do
			Result := (filename /= Void and cluster /= Void)
		ensure
			definition: Result = (filename /= Void and cluster /= Void)
			true_if_parsed: is_parsed implies is_preparsed
		end

	is_parsed: BOOLEAN
			-- Has current class been parsed?

	has_syntax_error: BOOLEAN
			-- Has a fatal syntax error been detected?

feature -- Compilation: parsing

	parse is
			-- Parse current class.
			-- The class may end up not being parsed if `filename'
			-- didn't contain this class after all (i.e. if the
			-- preparsing phase gave errouneous result).
		require
			is_preparsed: is_preparsed
			no_parsed: not is_parsed
		local
			a_file: KL_TEXT_INPUT_FILE
		do
			!! a_file.make (filename)
			a_file.open_read
			if a_file.is_open_read then
				universe.parse_file (a_file, filename, cluster)
				a_file.close
			else
				-- TODO:
			end
		end

	set_filename (a_name: STRING) is
			-- Set `filename' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			filename := a_name
		ensure
			filename_set: filename = a_name
		end

	set_cluster (a_cluster: like cluster) is
			-- Set `cluster' to `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			cluster := a_cluster
		ensure
			cluster_set: cluster = a_cluster
		end

	set_parsed is
			-- Set `is_parsed' to True.
		require
			is_preparsed: is_preparsed
		do
			is_parsed := True
		ensure
			is_parsed: is_parsed
		end

	set_class_mark (a_mark: like class_mark) is
			-- Set `class_mark' to `a_mark'.
		do
			class_mark := a_mark
		ensure
			class_mark_set: class_mark = a_mark
		end

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			same_class_name: name.same_class_name (a_name)
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_generic_parameters (a_generic_parameters: like generic_parameters) is
			-- Set `generic_parameters' to `a_generic_parameters'.
		do
			generic_parameters := a_generic_parameters
		ensure
			generic_parameters_set: generic_parameters = a_generic_parameters
		end

	set_obsolete_message (an_obsolete_message: like obsolete_message) is
			-- Set `obsolete_message' to `an_obsolete_message'.
		do
			obsolete_message := an_obsolete_message
		ensure
			obsolete_message_set: obsolete_message = an_obsolete_message
		end

	set_parents (a_parents: like parents) is
			-- Set `parents' to `a_parents'.
		do
			parents := a_parents
		ensure
			parents_set: parents = a_parents
		end

	set_invariants (an_invariants: like invariants) is
			-- Set `invariants' to `an_invariants'.
		do
			invariants := an_invariants
		ensure
			invariants_set: invariants = an_invariants
		end

	set_first_indexing (an_indexing: like first_indexing) is
			-- Set `first_indexing' to `an_indexing'
		do
			first_indexing := an_indexing
		ensure
			first_indexing_set: first_indexing = an_indexing
		end

	set_second_indexing (an_indexing: like second_indexing) is
			-- Set `second_indexing' to `an_indexing'
		do
			second_indexing := an_indexing
		ensure
			second_indexing_set: second_indexing = an_indexing
		end

	set_class_keyword (a_class: like class_keyword) is
			-- Set `class_keyword' to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			class_keyword := a_class
		ensure
			class_keyword_set: class_keyword = a_class
		end

	set_end_keyword (an_end: like end_keyword) is
			-- Set `end_keyword' to `an_end'.
		require
			an_end_not_void: an_end /= Void
		do
			end_keyword := an_end
		ensure
			end_keyword_set: end_keyword = an_end
		end

	set_leading_break (a_break: like leading_break) is
			-- Set `leading_break' to `a_break'.
		do
			leading_break := a_break
		ensure
			leading_break_set: leading_break = a_break
		end

	set_named_features (a_features: like named_features) is
			-- Set `named_features' to `a_features'.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
			-- a_features_registered: forall f in a_features, f.is_registered
		do
			named_features := a_features
		ensure
			named_features_set: named_features = a_features
		end

	set_syntax_error (b: BOOLEAN) is
			-- Set `has_syntax_error' to `b'.
		do
			has_syntax_error := b
		ensure
			syntax_error_set: has_syntax_error = b
		end

feature -- Compilation: genealogy status

	ancestors_searched: BOOLEAN is
			-- Have `ancestors' been searched?
		do
			Result := has_ancestors_error or (ancestors /= Void)
		ensure
			ancestors_not_void: (Result and not has_ancestors_error)
				implies (ancestors /= Void)
		end

	has_ancestors_error: BOOLEAN
			-- Has a fatal error occurred during
			-- ancestors searching?

feature -- Compilation: genealogy

	search_ancestors is
			-- Search ancestors of current class.
			-- Detect possible inheritance graph cycles.
		require
			is_parsed: is_parsed
			no_syntax_error: not has_syntax_error
		local
			a_sorter: DS_TOPOLOGICAL_SORTER [ET_CLASS]
			sorted_anc: DS_ARRAYED_LIST [ET_CLASS]
			a_parents, any_parents: like parents
			a_cycle: DS_ARRAYED_LIST [ET_CLASS]
			a_class: ET_CLASS
			i, nb: INTEGER
			has_error: BOOLEAN
		do
			if not ancestors_searched then
				a_sorter := universe.class_sorter
				a_sorter.wipe_out
					-- Give dummy values to the first two arguments of
					-- `add_to_sorter'. These two arguments are only
					-- used for error reporting and there will not be
					-- any error here thanks to the preconditions
					-- "is_parsed" and "no_syntax_error".
				add_to_sorter (universe.any_type, Current, a_sorter)
				a_sorter.sort
				sorted_anc := a_sorter.sorted_items
				any_parents := universe.any_parents
				nb := sorted_anc.count
				from i := 1 until i > nb loop
					a_class := sorted_anc.item (i)
					a_parents := a_class.parents
					if a_parents = Void or else a_parents.is_empty then
						a_parents := any_parents
					end
					check sorted: a_parents.ancestors_searched end
					a_parents.set_ancestors_of (a_class)
					i := i + 1
				end
				if a_sorter.has_cycle then
						-- There is a cycle in the inheritance graph.
					a_cycle := a_sorter.cycle
					a_sorter.wipe_out
						-- Make sure that all classes envolved in the
						-- cycle and their descendants are marked
						-- with `has_ancestors_error'.
					set_ancestors_error
					if parents /= Void and then not parents.is_empty then
						parents.set_ancestors_error
					else
						any_parents.set_ancestors_error
					end
						-- Report the validity error VHPR-1.
					error_handler.report_vhpr1_error (a_cycle.first, a_cycle)
				else
					a_sorter.wipe_out
				end
				nb := sorted_anc.count
				from i := 1 until i > nb loop
					a_class := sorted_anc.item (i)
					if not a_class.has_ancestors_error then
						a_parents := a_class.parents
						if a_parents = Void or else a_parents.is_empty then
							a_parents := any_parents
						end
						if a_parents.has_ancestors_error then
							a_class.set_ancestors_error
						else
							has_error := False
							if a_class.generic_parameters /= Void then
								has_error := not a_class.generic_parameters.check_validity (a_class)
							end
							if has_error then
								a_class.set_ancestors_error
							elseif not a_parents.check_generic_derivation (a_class) then
								a_class.set_ancestors_error
							else
								a_parents.add_descendant (a_class)
							end
						end
					end
					i := i + 1
				end
			end
		end

feature {ET_PARENT_LIST, ET_CLASS} -- Compilation: genealogy

	add_to_sorter (a_type: ET_CLASS_TYPE; an_heir: ET_CLASS;
		a_sorter: DS_TOPOLOGICAL_SORTER [ET_CLASS]) is
			-- Add current class and recursively its ancestors
			-- to `a_sorter' if not already done and if `ancestors'
			-- have not been searched yet. `an_heir' is the class
			-- where `a_type', whose base class is current class,
			-- appears as a parent. (`a_type' and `an_heir' are
			-- only needed for error reporting and may have dummy
			-- values starting the ancestors search process (call
			-- to feature `search_ancestors').)
		require
			a_type_not_void: a_type /= Void
			an_heir_not_void: an_heir /= Void
			a_sorter_not_void: a_sorter /= Void
		local
			any_class: ET_CLASS
		do
			if not ancestors_searched then
				has_ancestors_error := False
				if not is_preparsed then
					universe.preparse
				end
				if not is_preparsed then
						-- Error: class not in universe
						-- (VTCT, ETL2 p.199).
					error_handler.report_vtct_error (an_heir, a_type)
					set_ancestors_error
				else
					if not is_parsed then
						parse
					end
					if not is_parsed then
							-- Error: class not in universe
							-- (VTCT, ETL2 p.199).
						error_handler.report_vtct_error (an_heir, a_type)
						set_ancestors_error
					elseif has_syntax_error then
							-- This error has already been reported
							-- somewhere else.
						set_ancestors_error
					elseif parents = Void or else parents.is_empty then
						if Current = universe.general_class then
							!! ancestors.make_map (0)
						elseif Current = universe.any_class then
								-- ISE Eiffel has no GENERAL class anymore.
								-- Use ANY has class root now.
							!! ancestors.make_map (0)
						elseif not a_sorter.has (Current) then
							any_class := universe.any_class
							if not any_class.is_preparsed then
								universe.preparse
							end
							if not any_class.is_preparsed then
									-- Error: class ANY not in universe
									-- (VTCT, ETL2 p.199).
								error_handler.report_vtct_any_error (Current)
								set_ancestors_error
							else
								if not any_class.is_parsed then
									any_class.parse
								end
								if not any_class.is_parsed then
										-- Error: class ANY not in universe
										-- (VTCT, ETL2 p.199).
									error_handler.report_vtct_any_error (Current)
									set_ancestors_error
								elseif any_class.has_syntax_error then
										-- This error has already been reported
										-- somewhere else.
									set_ancestors_error
								else
									a_sorter.force (Current)
									universe.any_parents.add_to_sorter (Current, a_sorter)
								end
							end
						end
					elseif not a_sorter.has (Current) then
						a_sorter.force (Current)
						parents.add_to_sorter (Current, a_sorter)
					end
				end
			end
		end

feature {ET_PARENT_LIST} -- Compilation: genealogy

	set_ancestors (some_ancestors: like ancestors) is
			-- Set `ancestors' to `some_ancestors'.
		require
			some_ancestors_not_void: some_ancestors /= Void
			no_void_ancestor: not some_ancestors.has_item (Void)
		do
			ancestors := some_ancestors
		ensure
			ancestors_set: ancestors = some_ancestors
		end

	add_descendant (a_class: ET_CLASS) is
			-- Add `a_class' to the list of descendant classes
		require
			a_class_not_void: a_class /= Void
			ancestors_searched: a_class.ancestors_searched
			no_ancestors_error: not a_class.has_ancestors_error
		do
			has_descendants := True
		ensure
			inserted: has_descendants
		end

feature {ET_PARENT_LIST, ET_PARENT, ET_CLASS, ET_FORMAL_PARAMETER_LIST} -- Compilation: genealogy

	set_ancestors_error is
			-- Set `has_ancestors_error' to `True'.
		local
			i, nb: INTEGER
			a_class: ET_CLASS
			desc: like descendants
		do
			has_ancestors_error := True
			ancestors := Void
			if has_descendants then
				desc := descendants
				nb := desc.count
				from i := 1 until i > nb loop
					a_class := desc.item (i)
					if not a_class.has_ancestors_error then
						a_class.set_ancestors_error
					end
					i := i + 1
				end
			end
		ensure
			ancestors_searched: ancestors_searched
			has_ancestors_error_set: has_ancestors_error
		end

feature -- Compilation: flattening status

	is_flattened: BOOLEAN is
			-- Have features been flattened?
		do
			Result := has_flatten_error or (seeded_features /= Void)
		ensure
			seeded_features_not_void: (Result and not has_flatten_error)
				implies (seeded_features /= Void)
		end

	has_flatten_error: BOOLEAN
			-- Has a fatal error occurred during
			-- feature flattening?

feature -- Compilation: feature flattening

	flatten is
			-- Flatten feature table.
		require
			is_parsed: is_parsed
			no_syntax_error: not has_syntax_error
		local
			a_flattener: ET_FEATURE_FLATTENER
			any_parents: ET_PARENT_LIST
		do
				-- Search ancestors even if `is_flattened' is True
				-- because `has_flatten_error' could have been set
				-- during the parsing by ET_CLASS.put_feature and
				-- we want to search the ancestors (if not already
				-- done) anyway (see postcondition).
			search_ancestors
			if not is_flattened then
				if not has_ancestors_error then
					a_flattener := universe.feature_flattener
					if parents = Void or else parents.is_empty then
						if Current = universe.general_class then
							a_flattener.set_current_class (Current)
							a_flattener.flatten
						elseif Current = universe.any_class then
								-- ISE Eiffel has no GENERAL class anymore.
								-- Use ANY has class root now.
							a_flattener.set_current_class (Current)
							a_flattener.flatten
						else
							any_parents := universe.any_parents
							any_parents.flatten
							if any_parents.has_flatten_error then
								set_flatten_error
							else
								a_flattener.set_current_class (Current)
								any_parents.add_inherited_features (a_flattener)
								a_flattener.flatten
							end
						end
					else
						parents.flatten
						if parents.has_flatten_error then
							set_flatten_error
						else
							a_flattener.set_current_class (Current)
							parents.add_inherited_features (a_flattener)
							a_flattener.flatten
						end
					end
				else
					set_flatten_error
				end
			end
		ensure
			ancestors_searched: ancestors_searched
			flattened: is_flattened
		end

	remove_features is
			-- Wipe out all features of current class.
			-- (Might be useful in order to free some memory
			-- space when the class is still needed for
			-- conformance test purposes but its features
			-- are not used anymore.)
		do
			set_flatten_error
			named_features := Void
		ensure
			is_flattened: is_flattened
			has_flatten_error: has_flatten_error
			named_features_wiped_out: named_features = Void
			seeded_features_wiped_out: seeded_features = Void
		end

	set_flatten_error is
			-- Set `has_flatten_error' to True.
		do
			has_flatten_error := True
			seeded_features := Void
		ensure
			is_flattened: is_flattened
			has_flatten_error: has_flatten_error
		end

	set_seeded_features (a_features: like seeded_features) is
			-- Set `seeded_features' to `a_features'.
		require
			a_features_not_void: a_features /= Void
			no_void_feature: not a_features.has_item (Void)
			-- a_features_registered: forall f in a_features, f.is_registered
		do
			seeded_features := a_features
		ensure
			seeded_features_set: seeded_features = a_features
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_class (Current)
		end

invariant

	name_not_void: name /= Void
	id_positive: id > 0
	universe_not_void: universe /= Void
	no_void_named_feature: named_features /= Void implies not named_features.has_item (Void)
	-- named_features_registered: named_features /= Void implies forall f in named_features, f.is_registered
	no_void_seeded_feature: seeded_features /= Void implies not seeded_features.has_item (Void)
	-- seeded_features_registered: seeded_features /= Void implies forall f in seeded_features, f.is_registered
	no_void_ancestor: ancestors /= Void implies not ancestors.has_item (Void)
	class_keyword_not_void: class_keyword /= Void
	end_keyword_not_void: end_keyword /= Void

end
