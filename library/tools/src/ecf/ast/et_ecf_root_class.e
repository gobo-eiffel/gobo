note

	description:

		"ECF root classes and creation procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_ROOT_CLASS

inherit

	ET_ECF_ROOT

create

	make

feature {NONE} -- Initialization

	make (a_class_name: ET_IDENTIFIER)
			-- Create a new root with `a_class_name' as root class name.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			class_name := a_class_name
		ensure
			class_name_set: class_name = a_class_name
		end

feature -- Access

	class_name: ET_IDENTIFIER
			-- Root class name

	creation_procedure_name: detachable ET_IDENTIFIER
			-- Root creation procedure name

	cluster_name: detachable ET_IDENTIFIER
			-- Name of cluster where to find the root class

feature -- Setting

	set_creation_procedure_name (a_name: like creation_procedure_name)
			-- Set `creation_procedure_name' to `a_name'.
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

	set_cluster_name (a_name: like cluster_name)
			-- Set `cluster_name' to `a_name'.
		do
			cluster_name := a_name
		ensure
			cluster_name_set: cluster_name = a_name
		end

feature -- Element change

	fill_root (a_system: ET_ECF_SYSTEM)
			-- Fill `a_system' with root information.
		do
			a_system.set_root_type (class_name)
			a_system.set_root_creation (creation_procedure_name)
		end

invariant

	class_name_not_void: class_name /= Void

end
