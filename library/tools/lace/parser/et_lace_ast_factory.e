indexing

	description:

		"Lace Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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
			create Result.make (a_name, a_pathname)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_LACE_CLUSTER): ET_LACE_CLUSTERS is
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			create Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_universe (a_clusters: ET_LACE_CLUSTERS; a_factory: ET_AST_FACTORY;
		an_error_handler: ET_ERROR_HANDLER): ET_LACE_UNIVERSE is
			-- New class universe
		require
			an_error_handler_not_void: an_error_handler /= Void
			a_factory_not_void: a_factory /= Void
		do
			create Result.make_with_factory (a_clusters, a_factory, an_error_handler)
		ensure
			universe_not_void: Result /= Void
		end

feature -- Eiffel AST factory

	new_ast_factory: ET_AST_FACTORY is
			-- New Eiffel AST factory
		do
			if ast_factory /= Void then
				Result := ast_factory
			else
				create Result.make
			end
		ensure
			ast_factory_not_void: Result /= Void
		end

	new_error_handler: ET_ERROR_HANDLER is
			-- New error handler for Eiffel parser
		do
			create Result.make_standard
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Configuration

	ast_factory: ET_AST_FACTORY
			-- Return this AST factory in `new_ast_factory'
			-- if not void

feature -- Configuration setting

	set_ast_factory (a_factory: like ast_factory) is
			-- Set `ast_factory' to `a_factory'.
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

end
