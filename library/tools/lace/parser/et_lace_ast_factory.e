indexing

	description:

		"Lace Abstract Syntax Tree factories"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LACE_AST_FACTORY

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_cluster (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER): ET_LACE_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
		do
			!! Result.make (a_name, a_pathname)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_LACE_CLUSTER): ET_LACE_CLUSTERS is
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			!! Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_universe (a_clusters: ET_LACE_CLUSTERS): ET_LACE_UNIVERSE is
			-- New class universe
		local
			an_error_handler: ET_ERROR_HANDLER
			a_factory: ET_AST_FACTORY
		do
			!! an_error_handler.make_standard
			!! a_factory.make
			!! Result.make_with_factory (a_clusters, a_factory, an_error_handler)
		ensure
			universe_not_void: Result /= Void
		end

end -- class ET_LACE_AST_FACTORY
