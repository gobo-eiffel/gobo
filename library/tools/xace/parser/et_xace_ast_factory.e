note

	description:

		"Xace Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_AST_FACTORY

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_cluster (a_name, a_pathname: STRING; a_universe: ET_UNIVERSE): ET_XACE_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_name, a_pathname, a_universe)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_XACE_CLUSTER): ET_XACE_CLUSTERS is
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			create Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_library: ET_XACE_LIBRARY_CONFIG is
			-- New Xace library
		do
			create Result.make
		ensure
			library_not_void: Result /= Void
		end

	new_mounted_library (a_pathname: STRING; a_library: ET_XACE_LIBRARY_CONFIG; a_position: XM_POSITION): ET_XACE_MOUNTED_LIBRARY is
			-- New mounted library
		require
			a_pathname_not_void: a_pathname /= Void
			a_library_not_void: a_library /= Void
			a_position_not_void: a_position /= Void
		do
			create Result.make (a_pathname, a_library, a_position)
		ensure
			mounted_library_not_void: Result /= Void
		end

	new_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES is
			-- New mounted library list
		do
			create Result.make_empty
		ensure
			mounted_libraries_not_void: Result /= Void
		end

	new_options: ET_XACE_OPTIONS is
			-- New option clause
		do
			create Result.make
		ensure
			options_not_void: Result /= Void
		end

	new_class_options (a_name: STRING; an_option: ET_XACE_OPTIONS): ET_XACE_CLASS_OPTIONS is
			-- New options for class `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			an_option_not_void: an_option /= Void
		do
			create Result.make (a_name, an_option)
		ensure
			class_options_not_void: Result /= Void
		end

	new_feature_options (a_name: STRING; an_option: ET_XACE_OPTIONS): ET_XACE_FEATURE_OPTIONS is
			-- New options for feature `a_name'
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			an_option_not_void: an_option /= Void
		do
			create Result.make (a_name, an_option)
		ensure
			feature_options_not_void: Result /= Void
		end

	new_system: ET_XACE_SYSTEM_CONFIG is
			-- New Xace system
		do
			create Result.make
		ensure
			system_not_void: Result /= Void
		end

end
