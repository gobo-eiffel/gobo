indexing

	description:

		"Xace libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_LIBRARY

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new Xace library.
		do
			library_prefix := empty_prefix
		ensure
			no_library_prefix: library_prefix.count = 0
		end

feature -- Access

	name: STRING
			-- Name of library

	options: ET_XACE_OPTIONS
			-- Options

	clusters: ET_XACE_CLUSTERS
			-- Clusters

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

	externals: ET_XACE_EXTERNALS
			-- External clause

	library_prefix: STRING
			-- Prefix to be applied to the names of the
			-- clusters of the current library when mounted

feature -- Setting

	set_name (a_name: like name) is
			-- Set `name' to `a_name'.
		do
			name := a_name
		ensure
			name_set: name = a_name
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
			-- Set `libraries' to `a_libraries'.
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

	set_library_prefix (a_prefix: like library_prefix) is
			-- Set `library_prefix' to `a_prefix'.
		require
			a_prefix_not_void: a_prefix /= Void
		do
			library_prefix := a_prefix
		ensure
			library_prefix_set: library_prefix = a_prefix
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

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER) is
			-- Add `libraries' to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			if libraries /= Void then
				libraries.merge_libraries (a_libraries, an_error_handler)
			end
		end

	merge_externals is
			-- Merge the external clauses of all clusters
			-- and subclusters of current library to `externals'.
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

feature {NONE} -- Constants

	empty_prefix: STRING is ""
			-- Empty prefix

invariant

	library_prefix_not_void: library_prefix /= Void

end
