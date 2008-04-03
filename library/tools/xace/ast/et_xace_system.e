indexing

	description:

		"Xace Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2008, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SYSTEM

inherit

	ET_SYSTEM
		redefine
			clusters, system_name
		end

	ET_XACE_SYSTEM_CONFIG
		rename
			make as make_system,
			libraries as mounted_libraries,
			set_libraries as set_mounted_libraries
		undefine
			set_clusters, set_system_name
		redefine
			clusters, set_root_class_name,
			set_creation_procedure_name, system_name
		end

create

	make

feature -- Access

	clusters: ET_XACE_CLUSTERS
			-- Clusters

	system_name: STRING
			-- Name of system

feature -- Setting

	set_root_class_name (a_name: like root_class_name) is
			-- Set `root_class_name' to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			root_class_name := a_name
			if a_name /= Void and then a_name.count > 0 then
				create an_identifier.make (a_name)
				set_root_class (an_identifier)
			else
				root_class := Void
			end
		end

	set_creation_procedure_name (a_name: like creation_procedure_name) is
			-- Set `creation_procedure_name' to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			creation_procedure_name := a_name
			if a_name /= Void and then a_name.count > 0 then
				create an_identifier.make (a_name)
				set_root_creation (an_identifier)
			else
				root_creation := Void
			end
		end

end
