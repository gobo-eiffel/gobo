indexing

	description:

		"Xace systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SYSTEM

creation

	make

feature {NONE} -- Initialization

	make (a_clusters: like clusters) is
			-- Create a new Xace system.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

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

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

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

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries) is
			-- Set `a_libraries' to `libraries'.
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

	set_externals (an_externals: like externals) is
			-- Set `externals' to `an_externals'.
		do
			externals := an_externals
		ensure
			externals_set: externals = an_externals
		end

feature -- Basic operations

	mount_libraries is
			-- Add clusters `libraries' to `clusters'.
			-- Mark these clusters as mounted.
		do
			if libraries /= Void then
				if clusters = Void then
					!! clusters.make_empty
				end
				libraries.mount_libraries (clusters)
			end
		end

	merge_externals is
			-- Merge the external clauses of all clusters
			-- and subclusters of current system to `externals'.
		local
			was_void: BOOLEAN
		do
			if clusters /= Void or libraries /= Void then
				if externals = Void then
					was_void := True
					!! externals.make
				end
			end
			if clusters /= Void then
				clusters.merge_externals (externals)
			end
			if libraries /= Void then
				libraries.merge_externals (externals)
			end
			if was_void and then externals.is_empty then
				externals := Void
			end
		end

end
