indexing

	description:

		"ECF root classes and creation procedures"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ROOT_CLASS

inherit

	ET_ECF_ROOT

create

	make

feature {NONE} -- Initialization

	make (a_class_name: STRING) is
			-- Create a new root with `a_class_name' as root class name.
		require
			a_class_name_not_void: a_class_name /= Void
		do
			class_name := a_class_name
		ensure
			class_name_set: class_name = a_class_name
		end

feature -- Access

	class_name: STRING
			-- Root class name

	creation_procedure_name: STRING
			-- Root creation procedure name

feature -- Setting

	set_creation_procedure_name (a_name: STRING) is
			-- Set `creation_procedure_name' to `a_name'.
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

feature -- Element change

	fill_root (a_system: ET_ECF_SYSTEM) is
			-- Fill `a_system' with root information.
		do
			a_system.set_root_class_name (class_name)
			if creation_procedure_name /= Void then
				a_system.set_creation_procedure_name (creation_procedure_name)
			end
		end

invariant

	class_name_not_void: class_name /= Void

end
