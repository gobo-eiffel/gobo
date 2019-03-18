note

	description:

		"Xace targets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_TARGET

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

create

	make

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new Xace target.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
			create options.make
			create clusters.make_empty
			create libraries.make_empty
		ensure
			name_set: name = a_name
		end

feature -- Access

	name: STRING
			-- Name of target

	root_class_name: detachable STRING
			-- Name of root class

	creation_procedure_name: detachable STRING
			-- Name of root creation procedure

	options: ET_XACE_OPTIONS
			-- Options

	clusters: ET_XACE_CLUSTERS
			-- Clusters

	libraries: ET_XACE_MOUNTED_LIBRARIES
			-- Mounted libraries

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

	set_root_class_name (a_name: like root_class_name)
			-- Set `root_class_name' to `a_name'.
		do
			root_class_name := a_name
		ensure
			root_class_name_set: root_class_name = a_name
		end

	set_creation_procedure_name (a_name: like creation_procedure_name)
			-- Set `creation_procedure_name' to `a_name'.
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

	set_options (a_options: like options)
			-- Set `options' to `a_options'.
		require
			a_options_not_void: a_options /= Void
		do
			options := a_options
		ensure
			options_set: options = a_options
		end

	set_clusters (a_clusters: like clusters)
			-- Set `clusters' to `a_clusters'.
		require
			a_clusters_not_void: a_clusters /= Void
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_libraries (a_libraries: like libraries)
			-- Set `libraries' to `a_libraries'.
		require
			a_libraries_not_void: a_libraries /= Void
		do
			libraries := a_libraries
		ensure
			libraries_set: libraries = a_libraries
		end

feature -- Basic operations

	merge_libraries (a_libraries: ET_XACE_MOUNTED_LIBRARIES; an_error_handler: ET_XACE_ERROR_HANDLER)
			-- Add `libraries' to `a_libraries'.
			-- Report any error (e.g. incompatible prefixes) in `an_error_handler'.
		require
			a_libraries_not_void: a_libraries /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			if attached libraries as l_libraries then
				l_libraries.merge_libraries (a_libraries, an_error_handler)
			end
		end

invariant

	name_not_void: name /= Void
	name_not_empty: not name.is_empty
	options_not_void: options /= Void
	clusters_not_void: clusters /= Void
	libraries_not_void: libraries /= Void

end
