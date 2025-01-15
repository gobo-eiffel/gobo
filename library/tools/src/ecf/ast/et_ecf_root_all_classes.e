note

	description:

		"ECF all classes roots"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2025, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_ROOT_ALL_CLASSES

inherit

	ET_ECF_ROOT

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new all classes root.
		do
		end

feature -- Element change

	fill_root (a_system: ET_ECF_SYSTEM)
			-- Fill `a_system' with root information.
		do
			a_system.set_root_type_name (Void)
			a_system.set_root_type (Void)
			a_system.set_root_creation (Void)
		end

end
