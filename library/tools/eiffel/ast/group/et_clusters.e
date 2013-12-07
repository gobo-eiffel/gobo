note

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTERS

inherit

	ANY

	KL_SHARED_FILE_SYSTEM

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_cluster: like cluster)
			-- Create a new cluster list with initially
			-- one cluster `a_cluster'.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			create clusters.make (Initial_clusters_capacity)
			clusters.put_last (a_cluster)
		ensure
			one_cluster: clusters.count = 1
			clusters_set: clusters.last = a_cluster
		end

	make_empty
			-- Create a new empty cluster list.
		do
			create clusters.make (Initial_clusters_capacity)
		ensure
			is_empty: clusters.is_empty
		end

feature -- Status report

	has_subcluster (a_cluster: ET_CLUSTER): BOOLEAN
			-- Is `a_cluster' (recursively) one of the subclusters
			-- of current clusters?
		require
			a_cluster_not_void: a_cluster /= Void
		local
			i, nb: INTEGER
			l_cluster: ET_CLUSTER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				l_cluster := clusters.item (i)
				if l_cluster = a_cluster or else l_cluster.has_subcluster (a_cluster) then
					Result := True
					i := nb + 1
				else
					i := i + 1
				end
			end
		end

	has_subcluster_by_name (a_names: ARRAY [STRING]): BOOLEAN
			-- Is there a subcluster (recursively) named `a_names' in current clusters?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := has_subcluster_by_name_at_index (a_names, a_names.lower)
		end

	has_subcluster_with_absolute_pathname (a_pathname: STRING): BOOLEAN
			-- Is there a subcluster (recursively) in current clusters with
			-- absolute pathname `a_pathname'?
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Do not take into account missing implicit subclusters.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				if clusters.item (i).has_cluster_with_absolute_pathname (a_pathname) then
					Result := True
					i := nb + 1
				end
				i := i + 1
			end
		end

feature {ET_INTERNAL_UNIVERSE} -- Status report

	has_subcluster_by_name_at_index (a_names: ARRAY [STRING]; a_index: INTEGER): BOOLEAN
			-- Is there a subcluster (recursively) named `a_names',
			-- ignoring the entries before `a_index', in current clusters?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			l_name: STRING
			i, nb: INTEGER
			l_clusters: ET_CLUSTERS
			l_cluster: ET_CLUSTER
		do
			Result := True
			l_clusters := Current
			i := a_index
			nb := a_names.upper
			from until i > nb loop
				if l_clusters /= Void then
					l_name := a_names.item (i)
					l_cluster := l_clusters.cluster_by_name (l_name)
				else
					l_cluster := Void
				end
				if l_cluster /= Void then
					l_clusters := l_cluster.subclusters
					i := i + 1
				else
					Result := False
					i := nb + 1 -- Jump out of the loop.
				end
			end
		end

feature -- Access

	cluster (i: INTEGER): ET_CLUSTER
			-- `i'-th cluster
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := clusters.item (i)
		ensure
			cluster_not_void: Result /= Void
		end

	cluster_by_name (a_name: STRING): ET_CLUSTER
			-- Cluster with name `a_name';
			-- Void if not such cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			i, nb: INTEGER
			l_cluster: ET_CLUSTER
		do
			nb := clusters.count
			from i := nb until i < 1 loop
				l_cluster := clusters.item (i)
				if STRING_.same_case_insensitive (l_cluster.name, a_name) then
					Result := l_cluster
					i := 0
				else
					i := i - 1
				end
			end
		end

	subcluster_by_name (a_names: ARRAY [STRING]): ET_CLUSTER
			-- Subcluster (recursively) named `a_names' in current clusters
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := subcluster_by_name_with_parent (a_names, Void)
		ensure
			not_void_if_has: has_subcluster_by_name (a_names) implies Result /= Void
		end

	subcluster_with_absolute_pathname (a_pathname: STRING): ET_CLUSTER
			-- Subcluster (recursively) with absolute pathname `a_pathname' in current clusters
			--
			-- `a_pathname' is expected to be a canonical absolute pathname.
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_absolute: file_system.is_absolute_pathname (a_pathname)
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := clusters.item (i).cluster_with_absolute_pathname (a_pathname)
				if Result /= Void then
					i := nb + 1
				end
				i := i + 1
			end
		ensure
			not_void_if_has: has_subcluster_with_absolute_pathname (a_pathname) implies Result /= Void
		end

	clusters: DS_ARRAYED_LIST [like cluster]
			-- Clusters

feature {ET_INTERNAL_UNIVERSE} -- Access

	subcluster_by_name_at_index (a_names: ARRAY [STRING]; a_index: INTEGER): ET_CLUSTER
			-- Subcluster (recursively) named `a_names', ignoring the entries before `a_index',
			-- in current clusters
			--
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := subcluster_by_name_at_index_with_parent (a_names, a_index, Void)
		ensure
			not_void_if_has: has_subcluster_by_name_at_index (a_names, a_index) implies Result /= Void
		end

feature {ET_CLUSTER} -- Access

	subcluster_by_name_with_parent (a_names: ARRAY [STRING]; a_parent_cluster: ET_CLUSTER): ET_CLUSTER
			-- Subcluster (recursively) named `a_names' in current clusters
			--
			-- If `a_parent_cluster' is not Void, then it is considered to be
			-- the parent cluster of the current clusters.
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		do
			Result := subcluster_by_name_at_index_with_parent (a_names, a_names.lower, a_parent_cluster)
		ensure
			not_void_if_has: has_subcluster_by_name (a_names) implies Result /= Void
		end

feature {NONE} -- Access

	subcluster_by_name_at_index_with_parent (a_names: ARRAY [STRING]; a_index: INTEGER; a_parent_cluster: ET_CLUSTER): ET_CLUSTER
			-- Subcluster (recursively) named `a_names', ignoring the entries before `a_index',
			-- in current clusters
			--
			-- If `a_parent_cluster' is not Void, then it is considered to be
			-- the parent cluster of the current clusters.
			-- Add missing implicit subclusters if needed.
			-- Void if not such cluster.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not a_names.has (Void)
			no_empty_name: not a_names.there_exists (agent {STRING}.is_empty)
		local
			l_name: STRING
			i, nb: INTEGER
			l_clusters: ET_CLUSTERS
			l_parent_cluster: ET_CLUSTER
		do
			l_clusters := Current
			l_parent_cluster := a_parent_cluster
			i := a_index
			nb := a_names.upper
			from until i > nb loop
				if l_clusters /= Void then
					l_name := a_names.item (i)
					Result := l_clusters.cluster_by_name (l_name)
				else
					Result := Void
				end
				if Result /= Void then
					l_parent_cluster := Result
					l_clusters := Result.subclusters
					i := i + 1
				elseif l_parent_cluster /= Void and then l_parent_cluster.is_recursive then
					from until i > nb loop
						l_name := a_names.item (i)
						if l_parent_cluster.is_valid_directory_name (l_name) then
							l_parent_cluster.add_recursive_cluster (l_name)
						end
						l_clusters := l_parent_cluster.subclusters
						if l_clusters /= Void then
							Result := l_clusters.cluster_by_name (l_name)
						else
							Result := Void
						end
						if Result /= Void then
							l_parent_cluster := Result
							i := i + 1
						else
							i := nb + 1 -- Jump out of the loop.
						end
					end
				else
					i := nb + 1 -- Jump out of the loop.
				end
			end
		ensure
			not_void_if_has: has_subcluster_by_name_at_index (a_names, a_index) implies Result /= Void
		end

feature -- Iterators

	do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]])
			-- Apply `an_action' to every cluster.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				l_cluster := clusters.item (i)
				an_action.call ([l_cluster])
				i := i + 1
			end
		end

	do_if (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]]; a_test: FUNCTION [ANY, TUPLE [ET_CLUSTER], BOOLEAN])
			-- Apply `an_action' to every cluster which satisfies `a_test'.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
		require
			an_action_not_void: an_action /= Void
			a_test_not_void: a_test /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				l_cluster := clusters.item (i)
				if a_test.item ([l_cluster]) then
					an_action.call ([l_cluster])
				end
				i := i + 1
			end
		end

	do_all_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' to every cluster.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
		do
			if a_stop_request = Void then
				do_all (an_action)
			elseif not a_stop_request.item ([]) then
				nb := clusters.count
				from i := 1 until i > nb loop
					if a_stop_request.item ([]) then
						i := nb + 1
					else
						l_cluster := clusters.item (i)
						an_action.call ([l_cluster])
						i := i + 1
					end
				end
			end
		end

	do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]])
			-- Apply `an_action' to every cluster and recursively their subclusters.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
			l_subclusters: ET_CLUSTERS
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				l_cluster := clusters.item (i)
				an_action.call ([l_cluster])
				l_subclusters := l_cluster.subclusters
				if l_subclusters /= Void then
					l_subclusters.do_recursive (an_action)
				end
				i := i + 1
			end
		end

	do_recursive_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' to every cluster and recursively their subclusters.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
			l_subclusters: ET_CLUSTERS
		do
			if a_stop_request = Void then
				do_recursive (an_action)
			elseif not a_stop_request.item ([]) then
				nb := clusters.count
				from i := 1 until i > nb loop
					if a_stop_request.item ([]) then
						i := nb + 1
					else
						l_cluster := clusters.item (i)
						an_action.call ([l_cluster])
						l_subclusters := l_cluster.subclusters
						if l_subclusters /= Void then
							l_subclusters.do_recursive_until (an_action, a_stop_request)
						end
						i := i + 1
					end
				end
			end
		end

	do_explicit (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]])
			-- Apply `an_action' to every non-implicit cluster and recursively their subclusters.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
			l_subclusters: ET_CLUSTERS
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				l_cluster := clusters.item (i)
				if not l_cluster.is_implicit then
					an_action.call ([l_cluster])
					l_subclusters := l_cluster.subclusters
					if l_subclusters /= Void then
						l_subclusters.do_recursive (an_action)
					end
				end
				i := i + 1
			end
		end

	do_explicit_until (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]]; a_stop_request: FUNCTION [ANY, TUPLE, BOOLEAN])
			-- Apply `an_action' to every non-implicit cluster and recursively their subclusters.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
			--
			-- The iteration will be interrupted if a stop request is received
			-- i.e. `a_stop_request' starts returning True. No interruption if
			-- `a_stop_request' is Void.
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: like cluster
			l_subclusters: ET_CLUSTERS
		do
			if a_stop_request = Void then
				do_explicit (an_action)
			elseif not a_stop_request.item ([]) then
				nb := clusters.count
				from i := 1 until i > nb loop
					if a_stop_request.item ([]) then
						i := nb + 1
					else
						l_cluster := clusters.item (i)
						if not l_cluster.is_implicit then
							an_action.call ([l_cluster])
							l_subclusters := l_cluster.subclusters
							if l_subclusters /= Void then
								l_subclusters.do_explicit_until (an_action, a_stop_request)
							end
						end
						i := i + 1
					end
				end
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of clusters
		do
			Result := clusters.count
		ensure
			count_not_negative: Result >= 0
		end

	count_recursive: INTEGER
			-- Number (recursively) of non-abstract clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).count_recursive
				i := i + 1
			end
		ensure
			count_recursive_not_negative: Result >= 0
		end

	override_count_recursive: INTEGER
			-- Number (recursively) of non-abstract non-read-only override clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).override_count_recursive
				i := i + 1
			end
		ensure
			override_count_recursive_not_negative: Result >= 0
		end

	read_write_count_recursive: INTEGER
			-- Number (recursively) of non-abstract non-read-only clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).read_write_count_recursive
				i := i + 1
			end
		ensure
			read_write_count_recursive_not_negative: Result >= 0
		end

feature -- Status setting

	set_overridden_constraint_enabled (b: BOOLEAN)
			-- Set `overridden_constraint_enabled' of all clusters to `b'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_overridden_constraint_enabled (b)
				i := i + 1
			end
		end

	set_scm_mapping_constraint_enabled (b: BOOLEAN)
			-- Set `scm_mapping_constraint_enabled' of all clusters to `b'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_scm_mapping_constraint_enabled (b)
				i := i + 1
			end
		end

feature -- Setting

	set_provider_constraint (a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT)
			-- Set provider constraint of all clusters to `a_constraint'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_provider_constraint (a_constraint)
				i := i + 1
			end
		end

	set_dependant_constraint (a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT)
			-- Set dependant constraint of all clusters to `a_constraint'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_dependant_constraint (a_constraint)
				i := i + 1
			end
		end

feature {ET_CLUSTER} -- Setting

	set_parent (a_parent: like cluster)
			-- Set parent of all clusters to `a_parent'.
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				clusters.item (i).set_parent (a_parent)
				i := i + 1
			end
		end

feature -- Element change

	put_last (a_cluster: like cluster)
			-- Add `a_cluster' to the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters.force_last (a_cluster)
		ensure
			one_more: clusters.count = old clusters.count + 1
			cluster_added: clusters.last = a_cluster
		end

	add_implicit_subclusters
			-- Add (recursively) implicit subclusters to current clusters if they are recursive.
			-- Note that these subclusters will otherwise be added when running one of
			-- the `preparse_*' or `parse_*_all' routines of ET_UNIVERSE.
		local
			l_clusters: DS_ARRAYED_LIST [ET_CLUSTER]
			i, nb: INTEGER
		do
			l_clusters := clusters
			nb := l_clusters.count
			from i := 1 until i > nb loop
				l_clusters.item (i).add_implicit_subclusters
				i := i + 1
			end
		end

feature {NONE} -- Constants

	Initial_clusters_capacity: INTEGER = 50
			-- Initial capacity for `clusters'

invariant

	clusters_not_void: clusters /= Void
	not_void_cluster: not clusters.has_void

end
