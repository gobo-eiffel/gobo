indexing

	description:

		"Xace Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_AST_FACTORY

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_cluster (a_name, a_pathname: STRING): ET_XACE_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			!! Result.make (a_name, a_pathname)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_XACE_CLUSTER): ET_XACE_CLUSTERS is
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			!! Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_exported_class (a_name: STRING): ET_XACE_EXPORTED_CLASS is
			-- New export clause
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			!! Result.make (a_name)
		ensure
			exported_class_not_void: Result /= Void
		end

	new_exported_feature (a_feature_name, an_external_name: STRING): ET_XACE_EXPORTED_FEATURE is
			-- New exported feature
		require
			a_feature_name_not_void: a_feature_name /= Void
			a_feature_name_not_empty: a_feature_name.count > 0
			an_external_name_not_void: an_external_name /= Void
			an_external_name_not_void: an_external_name.count > 0
		do
			!! Result.make (a_feature_name, an_external_name)
		ensure
			exported_feature_not_void: Result /= Void
		end

	new_externals: ET_XACE_EXTERNALS is
			-- New external clause
		do
			!! Result.make
		ensure
			externals_not_void: Result /= Void
		end

	new_library: ET_XACE_LIBRARY is
			-- New Xace library
		do
			!! Result.make
		ensure
			library_not_void: Result /= Void
		end

	new_mounted_cluster (a_pathname: STRING; a_clusters: ET_XACE_CLUSTERS): ET_XACE_MOUNTED_CLUSTER is
			-- New mounted cluster
		require
			a_pathname_not_void: a_pathname /= Void
			a_pathname_not_empty: a_pathname.count > 0
			a_clusters_not_void: a_clusters /= Void
		do
			!! Result.make (a_pathname, a_clusters)
		ensure
			mounted_cluster_not_void: Result /= Void
		end

	new_mounted_clusters (a_cluster: ET_XACE_MOUNTED_CLUSTER): ET_XACE_MOUNTED_CLUSTERS is
			-- New mounted cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			!! Result.make (a_cluster)
		ensure
			mounted_clusters_not_void: Result /= Void
		end

	new_mounted_library (a_pathname: STRING; a_library: ET_XACE_LIBRARY; a_position: XM_POSITION): ET_XACE_MOUNTED_LIBRARY is
			-- New mounted library
		require
			a_pathname_not_void: a_pathname /= Void
			a_library_not_void: a_library /= Void
			a_position_not_void: a_position /= Void
		do
			!! Result.make (a_pathname, a_library, a_position)
		ensure
			mounted_library_not_void: Result /= Void
		end

	new_mounted_libraries: ET_XACE_MOUNTED_LIBRARIES is
			-- New mounted library list
		do
			!! Result.make_empty
		ensure
			mounted_libraries_not_void: Result /= Void
		end

	new_options: ET_XACE_OPTIONS is
			-- New option clause
		do
			!! Result.make
		ensure
			options_not_void: Result /= Void
		end

	new_system (a_clusters: ET_XACE_CLUSTERS): ET_XACE_SYSTEM is
			-- New Xace system
		do
			!! Result.make (a_clusters)
		ensure
			system_not_void: Result /= Void
		end

	new_universe (a_clusters: ET_XACE_CLUSTERS; a_factory: ET_AST_FACTORY;
		an_error_handler: ET_ERROR_HANDLER): ET_XACE_UNIVERSE is
			-- New class universe
		require
			an_error_handler_not_void: an_error_handler /= Void
			a_factory_not_void: a_factory /= Void
		do
			!! Result.make_with_factory (a_clusters, a_factory, an_error_handler)
		ensure
			universe_not_void: Result /= Void
		end

feature -- Eiffel AST factory

	new_ast_factory: ET_AST_FACTORY is
			-- New Eiffel AST factory
		do
			!! Result.make
		ensure
			ast_factory_not_void: Result /= Void
		end

	new_error_handler: ET_ERROR_HANDLER is
			-- New error handler for Eiffel parser
		do
			!! Result.make_standard
		ensure
			error_handler_not_void: Result /= Void
		end

end
