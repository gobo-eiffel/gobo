note

	description:

		"Lace Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_AST_FACTORY

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_assembly (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER; a_system: ET_SYSTEM): ET_LACE_DOTNET_ASSEMBLY is
			-- New assembly
		require
			a_name_not_void: a_name /= Void
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_name, a_pathname, a_system)
		ensure
			assembly_not_void: Result /= Void
		end

	new_assemblies (an_assembly: ET_LACE_DOTNET_ASSEMBLY): ET_ADAPTED_DOTNET_ASSEMBLIES is
			-- New assembly list
		require
			an_assembly_not_void: an_assembly /= Void
		do
			create Result.make (an_assembly)
		ensure
			assemblies_not_void: Result /= Void
		end

	new_cluster (a_name: ET_IDENTIFIER; a_pathname: ET_IDENTIFIER; a_universe: ET_UNIVERSE): ET_LACE_CLUSTER is
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_name, a_pathname, a_universe)
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

	new_gac_assembly (a_name: ET_IDENTIFIER; an_assembly_name: ET_IDENTIFIER; a_system: ET_SYSTEM): ET_LACE_DOTNET_GAC_ASSEMBLY is
			-- New GAC assembly
		require
			a_name_not_void: a_name /= Void
			an_assembly_name_not_void: an_assembly_name /= Void
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_name, an_assembly_name, a_system)
		ensure
			assembly_not_void: Result /= Void
		end

	new_system (a_name: STRING): ET_LACE_SYSTEM is
			-- New Eiffel system
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			create Result.make (a_name)
		ensure
			system_not_void: Result /= Void
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
			if error_handler /= Void then
				Result := error_handler
			else
				create Result.make_standard
			end
		ensure
			error_handler_not_void: Result /= Void
		end

feature -- Configuration

	ast_factory: ET_AST_FACTORY
			-- Return this AST factory in `new_ast_factory'
			-- if not void

	error_handler: ET_ERROR_HANDLER
			-- Return this error handler in `new_error handler'
			-- if not void

feature -- Configuration setting

	set_ast_factory (a_factory: like ast_factory) is
			-- Set `ast_factory' to `a_factory'.
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

	set_error_handler (a_handler: like error_handler) is
			-- Set `error_handler' to `a_handler'.
		do
			error_handler := a_handler
		ensure
			error_handler_set: error_handler = a_handler
		end

end
