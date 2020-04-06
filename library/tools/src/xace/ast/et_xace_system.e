note

	description:

		"Xace Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2020, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SYSTEM

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_SYSTEM
		rename
			make as make_system
		redefine
			name,
			clusters
		end

	ET_XACE_SYSTEM_CONFIG
		rename
			libraries as mounted_libraries,
			set_libraries as set_mounted_libraries
		undefine
			set_name,
			set_clusters
		redefine
			make, name,
			clusters, set_root_class_name,
			set_creation_procedure_name
		end

create

	make

feature {NONE} -- Initialization

	make (a_target: ET_XACE_TARGET)
			-- Create a new Eiffel system.
		do
			precursor (a_target)
			make_system (a_target.name)
			set_default_class_mapping
			system_name := name
		end

feature -- Access

	name: STRING
			-- Name of system

	clusters: ET_XACE_CLUSTERS
			-- Clusters

feature -- Setting

	set_root_class_name (a_name: like root_class_name)
			-- Set `root_class_name' to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			root_class_name := a_name
			if a_name /= Void and then a_name.count > 0 then
				create an_identifier.make (a_name)
				set_root_type (an_identifier)
			else
				unset_root_type
			end
		end

	set_creation_procedure_name (a_name: like creation_procedure_name)
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
