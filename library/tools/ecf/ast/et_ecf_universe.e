indexing

	description:

		"ECF Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_UNIVERSE

inherit

	ET_UNIVERSE
		redefine
			clusters, dotnet_assemblies
		end

create

	make, make_standard, make_with_factory

feature -- Access

	clusters: ET_ECF_CLUSTERS
			-- Clusters

	dotnet_assemblies: ET_ECF_DOTNET_ASSEMBLIES
			-- .NET assemblies

feature -- Setting

	set_root_class_name (a_name: STRING) is
			-- Set `root_class_name' to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			if a_name /= Void and then a_name.count > 0 then
				create an_identifier.make (a_name)
				set_root_class (an_identifier)
			else
				root_class := Void
			end
		end

	set_creation_procedure_name (a_name: STRING) is
			-- Set `creation_procedure_name' to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			if a_name /= Void and then a_name.count > 0 then
				create an_identifier.make (a_name)
				set_root_creation (an_identifier)
			else
				root_creation := Void
			end
		end

end
