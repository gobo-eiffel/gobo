indexing

	description:

		"Ace file generators for Visual Eiffel"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_VE_GENERATOR 

inherit

	ET_XACE_GENERATOR

	UT_STRING_ROUTINES
		export {NONE} all end

creation

	make

feature -- Access

	esd_filename: STRING is "ve.esd"
			-- Name of generated Ace file

feature -- Output

	generate (a_system: ET_XACE_UNIVERSE) is
			-- Generate a new ESD file from `a_system'.
		local
			a_file: KL_OUTPUT_FILE
			an_externals: ET_XACE_EXTERNALS
			variables: ET_XACE_VARIABLES
		do
			!! a_file.make (esd_filename)
			a_file.open_write
			if a_file.is_open_write then
				variables := a_system.variables
				if variables = Void then
					!! variables.make
					a_system.set_variables (variables)
				end
				variables.define_value ("GOBO_EIFFEL", "ve")
				a_system.mount_clusters
				an_externals := a_system.externals
				if an_externals /= Void then
					an_externals := an_externals.cloned_externals
				end
				a_system.merge_externals
				print_esd_file (a_system, a_file)
				a_file.close
				a_system.set_externals (an_externals)
				a_system.unmount_clusters
			else
				error_handler.report_cannot_write_file_error (esd_filename)
			end
		end

feature {NONE} -- Output

	print_esd_file (a_system: ET_XACE_UNIVERSE; a_file: KL_OUTPUT_FILE) is
			-- Print ESD `a_system' to `a_file'.
		require
			a_system_not_void: a_system /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_clusters: ET_XACE_CLUSTERS
		do
			a_file.put_string ("system")
			a_file.put_new_line
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_string (a_system.system_name)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_string ("root")
			a_file.put_new_line
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_string (a_system.root_class_name)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_string ("creation")
			a_file.put_new_line
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_string (a_system.creation_procedure_name)
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_string ("cluster")
			a_file.put_new_line
			a_file.put_new_line
			a_clusters := a_system.clusters
			if a_clusters /= Void then
				print_clusters (a_clusters, a_system.variables, a_file)
				a_file.put_new_line
			end
			a_file.put_string ("option")
			a_file.put_new_line
			a_file.put_new_line
			print_indentation (1, a_file)
			a_file.put_string ("target exe console")
			a_file.put_new_line
			a_file.put_new_line
			a_file.put_string ("end")
			a_file.put_new_line
		end

	print_clusters (a_clusters: ET_XACE_CLUSTERS; variables: ET_XACE_VARIABLES; a_file: KL_OUTPUT_FILE) is
			-- Print `a_clusters' to `a_file'.
		require
			a_clusters_not_void: a_clusters /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			i, nb: INTEGER
			cluster_list: DS_ARRAYED_LIST [ET_XACE_CLUSTER]
		do
			cluster_list := a_clusters.clusters
			nb := cluster_list.count
			from i := 1 until i > nb loop
				print_cluster (cluster_list.item (i), variables, a_file)
				i := i + 1
			end
		end

	print_cluster (a_cluster: ET_XACE_CLUSTER; variables: ET_XACE_VARIABLES; a_file: KL_OUTPUT_FILE) is
			-- Print `a_cluster' to `a_file'.
		require
			a_cluster_not_void: a_cluster /= Void
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		local
			a_pathname: STRING
			subclusters: ET_XACE_CLUSTERS
		do
			if not a_cluster.is_abstract then
				print_indentation (1, a_file)
				a_file.put_character ('[')
				a_file.put_string (a_cluster.full_name ('_'))
				a_file.put_string (" %"")
				a_pathname := a_cluster.full_pathname
				if variables /= Void then
					a_pathname := variables.expanded_variables (a_pathname)
				end
					-- Visual Eiffel does not like the currly
					-- brackets around environment variables.
				a_pathname := remove_all_characters (a_pathname, '{')
				a_pathname := remove_all_characters (a_pathname, '}')
				a_file.put_string (a_pathname)
				a_file.put_string ("%"] end")
				a_file.put_new_line
			end
			subclusters := a_cluster.subclusters
			if subclusters /= Void then
				print_clusters (subclusters, variables, a_file)
			end
		end

end -- class ET_XACE_VE_GENERATOR
