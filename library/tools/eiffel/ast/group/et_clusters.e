indexing

	description:

		"Eiffel cluster lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLUSTERS

inherit

	ANY

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_ARRAY_ROUTINES

create

	make, make_empty

feature {NONE} -- Initialization

	make (a_cluster: like cluster) is
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

	make_empty is
			-- Create a new empty cluster list.
		do
			create clusters.make (Initial_clusters_capacity)
		ensure
			is_empty: clusters.is_empty
		end

feature -- Status report

	has_subcluster (a_cluster: ET_CLUSTER): BOOLEAN is
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

	has_subcluster_by_name (a_names: ARRAY [STRING]): BOOLEAN is
			-- Is there a subcluster (recursively) named `a_names' in current clusters?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not STRING_ARRAY_.has (a_names, Void)
			-- no_empty_name: forall n in a_names, n.count > 0
		local
			l_name: STRING
			i, nb: INTEGER
			l_clusters: ET_CLUSTERS
			l_cluster: ET_CLUSTER
		do
			Result := True
			l_clusters := Current
			i := a_names.lower
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

	cluster (i: INTEGER): ET_CLUSTER is
			-- `i'-th cluster
		require
			i_large_enough: i >= 1
			i_small_enough: i <= clusters.count
		do
			Result := clusters.item (i)
		ensure
			cluster_not_void: Result /= Void
		end

	cluster_by_name (a_name: STRING): ET_CLUSTER is
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

	subcluster_by_name (a_names: ARRAY [STRING]): ET_CLUSTER is
			-- Subcluster (recursively) named `a_names' in current clusters;
			-- Add missing implicit subclusters if needed;
			-- Void if not such cluster
		require
			a_names_not_void: a_names /= Void
			no_void_name: not STRING_ARRAY_.has (a_names, Void)
			-- no_empty_name: forall n in a_names, n.count > 0
		local
			l_name: STRING
			i, nb: INTEGER
			l_clusters: ET_CLUSTERS
			l_parent_cluster: ET_CLUSTER
		do
			l_clusters := Current
			i := a_names.lower
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
						if file_system.directory_exists (file_system.pathname (l_parent_cluster.full_pathname, l_name)) then
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
		end

	clusters: DS_ARRAYED_LIST [like cluster]
			-- Clusters

feature -- Iterators

	do_all (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]]) is
			-- Apply `an_action' to every cluster.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
			--
			-- The iteration will be interrupted if surrounding Eiffel system
			-- has been marked as stoppable and it received a stop request.
			-- See `is_stoppable', `stop_requested' and `was_stopped' in class
			-- ET_SYSTEM for more details.
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_system: ET_SYSTEM
		do
			nb := clusters.count
			if nb > 0 then
				l_system := clusters.item (1).current_system
				from i := 1 until i > nb loop
					if l_system.is_stoppable and then l_system.stop_requested then
						l_system.set_stopped
						i := nb + 1
					else
						an_action.call ([clusters.item (i)])
						i := i + 1
					end
				end
			end
		end

	do_recursive (an_action: PROCEDURE [ANY, TUPLE [ET_CLUSTER]]) is
			-- Apply `an_action' to every cluster and recursively their subclusters.
			-- (Semantics not guaranteed if `an_action' adds or removes clusters.)
			--
			-- The iteration will be interrupted if surrounding Eiffel system
			-- has been marked as stoppable and it received a stop request.
			-- See `is_stoppable', `stop_requested' and `was_stopped' in class
			-- ET_SYSTEM for more details.
		require
			an_action_not_void: an_action /= Void
		local
			i, nb: INTEGER
			l_cluster: ET_CLUSTER
			l_subclusters: ET_CLUSTERS
			l_system: ET_SYSTEM
		do
			nb := clusters.count
			if nb > 0 then
				l_system := clusters.item (1).current_system
				from i := 1 until i > nb loop
					if l_system.is_stoppable and then l_system.stop_requested then
						l_system.set_stopped
						i := nb + 1
					else
						l_cluster := clusters.item (i)
						an_action.call ([l_cluster])
						l_subclusters := l_cluster.subclusters
						if l_subclusters /= Void then
							l_subclusters.do_recursive (an_action)
						end
						i := i + 1
					end
				end
			end
		end

feature -- Measurement

	count: INTEGER is
			-- Number (recursively) of non-abstract clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).count
				i := i + 1
			end
		ensure
			count_non_negative: Result >= 0
		end

	override_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only override clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).override_count
				i := i + 1
			end
		ensure
			override_count_non_negative: Result >= 0
		end

	read_write_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only clusters
		local
			i, nb: INTEGER
		do
			nb := clusters.count
			from i := 1 until i > nb loop
				Result := Result + clusters.item (i).read_write_count
				i := i + 1
			end
		ensure
			read_write_count_non_negative: Result >= 0
		end

feature -- Status setting

	set_overridden_constraint_enabled (b: BOOLEAN) is
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

feature -- Setting

	set_provider_constraint (a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT) is
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

	set_dependant_constraint (a_constraint: ET_CLUSTER_DEPENDENCE_CONSTRAINT) is
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

	set_parent (a_parent: like cluster) is
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

	put_last (a_cluster: like cluster) is
			-- Add `a_cluster' to the list of clusters.
		require
			a_cluster_not_void: a_cluster /= Void
		do
			clusters.force_last (a_cluster)
		ensure
			one_more: clusters.count = old clusters.count + 1
			cluster_added: clusters.last = a_cluster
		end

	add_implicit_subclusters is
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

	Initial_clusters_capacity: INTEGER is 50
			-- Initial capacity for `clusters'

invariant

	clusters_not_void: clusters /= Void
	not_void_cluster: not clusters.has (Void)

end
