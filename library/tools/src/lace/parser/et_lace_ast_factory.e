note

	description:

		"Lace Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_AST_FACTORY

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_assembly (a_name: ET_IDENTIFIER; a_pathname: detachable ET_IDENTIFIER; a_system: ET_SYSTEM): ET_LACE_DOTNET_ASSEMBLY
			-- New assembly
		require
			a_name_not_void: a_name /= Void
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_name, a_pathname, a_system)
		ensure
			assembly_not_void: Result /= Void
		end

	new_assemblies (an_assembly: ET_LACE_DOTNET_ASSEMBLY): ET_ADAPTED_DOTNET_ASSEMBLIES
			-- New assembly list
		require
			an_assembly_not_void: an_assembly /= Void
		do
			create Result.make (an_assembly)
		ensure
			assemblies_not_void: Result /= Void
		end

	new_cluster (a_name: ET_IDENTIFIER; a_pathname: detachable ET_IDENTIFIER; a_universe: ET_UNIVERSE): ET_LACE_CLUSTER
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_name, a_pathname, a_universe)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_LACE_CLUSTER): ET_LACE_CLUSTERS
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			create Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_gac_assembly (a_name: ET_IDENTIFIER; an_assembly_name: ET_IDENTIFIER; a_system: ET_SYSTEM): ET_LACE_DOTNET_GAC_ASSEMBLY
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

	new_system (a_name: STRING): ET_LACE_SYSTEM
			-- New Eiffel system
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			create Result.make (a_name)
		ensure
			system_not_void: Result /= Void
		end

end
