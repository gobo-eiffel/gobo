indexing

	description:

		"Eiffel class universes"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			clusters
		end

creation

	make, make_with_factory

feature -- Access

	system_name: STRING
			-- Name of system

	root_class_name: STRING
			-- Name of root class

	creation_procedure_name: STRING
			-- Name of root creation procedure

	options: ET_XACE_OPTIONS
			-- Options

	clusters: ET_XACE_CLUSTERS
			-- Clusters

	mounted_clusters: ET_XACE_MOUNTED_CLUSTERS
			-- Mounted clusters

	externals: ET_XACE_EXTERNALS
			-- External clause

feature -- Setting

	set_system_name (a_name: like system_name) is
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_root_class_name (a_name: like root_class_name) is
			-- Set `root_class_name' to `a_name'.
		do
			root_class_name := a_name
		ensure
			root_class_name_set: root_class_name = a_name
		end

	set_creation_procedure_name (a_name: like creation_procedure_name) is
			-- Set `creation_procedure_name' to `a_name'.
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

	set_options (an_options: like options) is
			-- Set `options' to `an_options'.
		do
			options := an_options
		ensure
			options_set: options = an_options
		end

	set_externals (an_externals: like externals) is
			-- Set `externals' to `an_externals'.
		do
			externals := an_externals
		ensure
			externals_set: externals = an_externals
		end

	set_mounted_clusters (a_clusters: like mounted_clusters) is
			-- Set `mounted_clusters' to `a_clusters'.
		do
			if mounted_clusters /= Void then
				mounted_clusters.unmount_root (Current)
			end
			mounted_clusters := a_clusters
			if mounted_clusters /= Void then
				mounted_clusters.mount_root (Current)
			end
		ensure
			mounted_clusters_set: mounted_clusters = a_clusters
		end

feature -- Basic operations

	merge_externals is
			-- Merge the external clauses of all clusters
			-- and subclusters of current universe to `externals'.
		local
			was_void: BOOLEAN
		do
			if clusters /= Void then
				if externals = Void then
					was_void := True
					!! externals.make
				end
				clusters.merge_externals (externals)
				if was_void and externals.is_empty then
					externals := Void
				end
			end
		end

end -- class ET_XACE_UNIVERSE
