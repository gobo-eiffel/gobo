indexing

	description:

	"[
		Eiffel class universes whose classes can be found locally
		in clusters, or exported by libraries or .NET assemlies.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_INTERNAL_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			initialize,
			preparse_local,
			preparse_recursive,
			parse_all_local,
			parse_all_recursive,
			add_universe_recursive
		end

	KL_IMPORTED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	initialize is
			-- Initialize universe.
		do
			precursor
			create libraries.make_empty
			create clusters.make_empty
			create dotnet_assemblies.make_empty
		end

feature -- Status report

	has_cluster (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Is `a_cluster' one of the clusters or recursively
			-- subclusters of current universe?
		do
			Result := clusters.has_subcluster (a_cluster)
		end

	has_cluster_by_name (a_names: ARRAY [STRING]): BOOLEAN is
			-- Is there a cluster named `a_names' in universe?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not STRING_ARRAY_.has (a_names, Void)
			-- no_empty_name: forall n in a_names, n.count > 0
		do
			Result := clusters.has_subcluster_by_name (a_names)
		end

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	libraries: ET_ADAPTED_LIBRARIES
			-- Libraries

	dotnet_assemblies: ET_ADAPTED_DOTNET_ASSEMBLIES
			-- .NET assemblies

	classes_by_groups: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_GROUP] is
			-- Classes locally declared in current universe indexed by groups;
			-- Create a new data structure at each call
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_group: ET_GROUP
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			create Result.make_map (cluster_count)
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				from
					l_class := l_cursor.item
				until
					l_class = Void
				loop
					if l_class.universe = Current then
						l_group := l_class.group
						Result.search (l_group)
						if Result.found then
							l_classes := Result.found_item
						else
							create l_classes.make (initial_classes_in_group_capacity)
							Result.force_last_new (l_classes, l_group)
						end
						l_classes.force_last (l_class)
					end
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
		end

	cluster_by_name (a_names: ARRAY [STRING]): ET_CLUSTER is
			-- Cluster named `a_names' in universe;
			-- Add missing implicit subclusters if needed;
			-- Void if not such cluster
		require
			a_names_not_void: a_names /= Void
			no_void_name: not STRING_ARRAY_.has (a_names, Void)
			-- no_empty_name: forall n in a_names, n.count > 0
		do
			Result := clusters.subcluster_by_name (a_names)
		end

feature -- Measurement

	cluster_count: INTEGER is
			-- Number (recursively) of non-abstract clusters
		do
			Result := clusters.count
		ensure
			cluster_count_not_negavite: Result >= 0
		end

	override_cluster_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only override clusters
		do
			Result := clusters.override_count
		ensure
			override_cluster_count_not_negavite: Result >= 0
		end

	read_write_cluster_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only clusters
		do
			Result := clusters.read_write_count
		ensure
			read_write_cluster_count_not_negavite: Result >= 0
		end

	library_count: INTEGER is
			-- Number of libraries
		do
			Result := libraries.count
		ensure
			library_count_not_negative: Result >= 0
		end

	dotnet_assembly_count: INTEGER is
			-- Number of .NET assemblies
		do
			Result := dotnet_assemblies.count
		ensure
			dotnet_assembly_count_not_negavite: Result >= 0
		end

feature -- Setting

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		require
			a_clusters_not_void: a_clusters /= Void
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries) is
			-- Set `a_libraries' to `libraries'.
		require
			a_libraries_not_void: a_libraries /= Void
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_dotnet_assemblies (a_assemblies: like dotnet_assemblies) is
			-- Set `a_assemblies' to `dotnet_assemblies'.
		require
			a_assemblies_not_void: a_assemblies /= Void
		do
			dotnet_assemblies := a_assemblies
		ensure
			dotnet_assemblies_set: dotnet_assemblies = a_assemblies
		end

feature -- Element change

	add_implicit_subclusters is
			-- Add (recursively) implicit subclusters when clusters are recursive.
			-- Note that these subclusters will otherwise be added when running
			-- one of the `preparse_*' or `parse_all' routines.
		do
			clusters.add_implicit_subclusters
		end

feature -- Relations

	add_universe_recursive (a_visited: DS_HASH_SET [ET_UNIVERSE]) is
			-- Add current universe to `a_visited' and
			-- recursively the universes it depends on.
		do
			if not a_visited.has (Current) then
				a_visited.force_last (Current)
				libraries.do_all (agent {ET_LIBRARY}.add_universe_recursive (a_visited))
				dotnet_assemblies.do_all (agent {ET_DOTNET_ASSEMBLY}.add_universe_recursive (a_visited))
			end
		end

feature -- Parsing

	preparse_local is
			-- Build a mapping between class names and their filenames and
			-- populate `classes' (both with classes declared locally and
			-- exported by other universes which are assumed to have been
			-- preparsed before this call), even if the classes have not been
			-- parsed yet. If current universe had already been preparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `classes', but are not parsed.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			classes_modified := False
			classes_added := False
			if not is_preparsed then
				is_preparsed := True
				import_classes
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_preparser))
			else
-- TODO: .NET assemblies are currently considered read-only.
-- TODO: take care of classes which have been moved for a library to the current universe
-- or vice-versa.
				libraries.do_adapted (agent {ET_ADAPTED_LIBRARY}.propagate_classes_modified (Current))
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				reset_modified_classes
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_preparser))
				if classes_modified then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
				end
			end
		end

	preparse_recursive is
			-- Build a mapping between class names and their filenames and
			-- populate `classes' (both with classes declared locally and
			-- exported by other universes which have themselves been preparsed
			-- recursively during this call), even if the classes have not been
			-- parsed yet. If current universe had already been preparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `classes', but are not parsed.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		local
			l_assemblies: ET_DOTNET_ASSEMBLIES
		do
			create l_assemblies.make_empty
			dotnet_assemblies.do_all (agent l_assemblies.put_last)
			current_system.dotnet_assembly_consumer.consume_assemblies (l_assemblies)
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.preparse_local)
			libraries.do_ordered (agent {ET_LIBRARY}.preparse_local)
			preparse_local
		end

	parse_all_local is
			-- Parse all classes declared locally in the current universe.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `classes' will be populated (both with classes
			-- declared locally and those exported by other universes which
			-- are assumed to have been preparsed before this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			classes_modified := False
			classes_added := False
			if not is_preparsed then
				is_preparsed := True
				import_classes
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_parser))
			else
-- TODO: .NET assemblies are currently considered read-only.
-- TODO: take care of classes which have been moved for a library to the current universe
-- or vice-versa.
				libraries.do_adapted (agent {ET_ADAPTED_LIBRARY}.propagate_classes_modified (Current))
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				reset_modified_classes
				clusters.do_all (agent {ET_CLUSTER}.process (current_system.eiffel_parser))
				if classes_modified then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
				end
			end
		end

	parse_all_recursive is
			-- Parse all classes declared locally in the current universe,
			-- and recursively those that are declared in universes it
			-- depends on. There is not need to call one of the preparse
			-- routines beforehand since the current routine will traverse
			-- all clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `classes' will be populated (both with classes
			-- declared locally and those exported by other universes which
			-- have themselves been parsed recursively during this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		local
			l_assemblies: ET_DOTNET_ASSEMBLIES
		do
			create l_assemblies.make_empty
			dotnet_assemblies.do_all (agent l_assemblies.put_last)
			current_system.dotnet_assembly_consumer.consume_assemblies (l_assemblies)
			dotnet_assemblies.do_recursive (agent {ET_DOTNET_ASSEMBLY}.parse_all_local)
			libraries.do_ordered (agent {ET_LIBRARY}.parse_all_local)
			parse_all_local
		end

feature {NONE} -- Parsing

	import_classes is
			-- Import classes made available (i.e. exported) by other universes.
		do
			if not libraries.is_empty then
				libraries.do_adapted (agent {ET_ADAPTED_LIBRARY}.export_classes (Current))
				if eiffel_class (current_system.any_class.name) /= current_system.any_class then
-- TODO: report error
				end
			else
				classes.force_last (current_system.any_class, current_system.any_class.name)
				classes.force_last (current_system.arguments_class, current_system.arguments_class.name)
				classes.force_last (current_system.array_class, current_system.array_class.name)
				classes.force_last (current_system.bit_class, current_system.bit_class.name)
				classes.force_last (current_system.boolean_class, current_system.boolean_class.name)
				classes.force_last (current_system.boolean_ref_class, current_system.boolean_ref_class.name)
				classes.force_last (current_system.character_8_class, current_system.character_8_class.name)
				classes.force_last (current_system.character_8_ref_class, current_system.character_8_ref_class.name)
				classes.force_last (current_system.character_32_class, current_system.character_32_class.name)
				classes.force_last (current_system.character_32_ref_class, current_system.character_32_ref_class.name)
				classes.force_last (current_system.disposable_class, current_system.disposable_class.name)
				classes.force_last (current_system.function_class, current_system.function_class.name)
				classes.force_last (current_system.identified_routines_class, current_system.identified_routines_class.name)
				classes.force_last (current_system.integer_8_class, current_system.integer_8_class.name)
				classes.force_last (current_system.integer_8_ref_class, current_system.integer_8_ref_class.name)
				classes.force_last (current_system.integer_16_class, current_system.integer_16_class.name)
				classes.force_last (current_system.integer_16_ref_class, current_system.integer_16_ref_class.name)
				classes.force_last (current_system.integer_32_class, current_system.integer_32_class.name)
				classes.force_last (current_system.integer_32_ref_class, current_system.integer_32_ref_class.name)
				classes.force_last (current_system.integer_64_class, current_system.integer_64_class.name)
				classes.force_last (current_system.integer_64_ref_class, current_system.integer_64_ref_class.name)
				classes.force_last (current_system.native_array_class, current_system.native_array_class.name)
				classes.force_last (current_system.natural_8_class, current_system.natural_8_class.name)
				classes.force_last (current_system.natural_8_ref_class, current_system.natural_8_ref_class.name)
				classes.force_last (current_system.natural_16_class, current_system.natural_16_class.name)
				classes.force_last (current_system.natural_16_ref_class, current_system.natural_16_ref_class.name)
				classes.force_last (current_system.natural_32_class, current_system.natural_32_class.name)
				classes.force_last (current_system.natural_32_ref_class, current_system.natural_32_ref_class.name)
				classes.force_last (current_system.natural_64_class, current_system.natural_64_class.name)
				classes.force_last (current_system.natural_64_ref_class, current_system.natural_64_ref_class.name)
				classes.force_last (current_system.none_class, current_system.none_class.name)
				classes.force_last (current_system.platform_class, current_system.platform_class.name)
				classes.force_last (current_system.pointer_class, current_system.pointer_class.name)
				classes.force_last (current_system.pointer_ref_class, current_system.pointer_ref_class.name)
				classes.force_last (current_system.predicate_class, current_system.predicate_class.name)
				classes.force_last (current_system.procedure_class, current_system.procedure_class.name)
				classes.force_last (current_system.real_32_class, current_system.real_32_class.name)
				classes.force_last (current_system.real_32_ref_class, current_system.real_32_ref_class.name)
				classes.force_last (current_system.real_64_class, current_system.real_64_class.name)
				classes.force_last (current_system.real_64_ref_class, current_system.real_64_ref_class.name)
				classes.force_last (current_system.routine_class, current_system.routine_class.name)
				classes.force_last (current_system.special_class, current_system.special_class.name)
				classes.force_last (current_system.string_8_class, current_system.string_8_class.name)
				classes.force_last (current_system.string_32_class, current_system.string_32_class.name)
				classes.force_last (current_system.system_object_class, current_system.system_object_class.name)
				classes.force_last (current_system.system_string_class, current_system.system_string_class.name)
				classes.force_last (current_system.tuple_class, current_system.tuple_class.name)
				classes.force_last (current_system.type_class, current_system.type_class.name)
				classes.force_last (current_system.typed_pointer_class, current_system.typed_pointer_class.name)
			end
			dotnet_assemblies.do_adapted (agent {ET_ADAPTED_DOTNET_ASSEMBLY}.export_classes (Current))
		end

invariant

	libraries_not_void: libraries /= Void
	clusters_not_void: clusters /= Void
	dotnet_assemblies_not_void: dotnet_assemblies /= Void

end
