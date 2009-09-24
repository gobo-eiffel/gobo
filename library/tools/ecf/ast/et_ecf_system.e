indexing

	description:

		"ECF Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SYSTEM

inherit

	ET_SYSTEM
		rename
			make as make_system
		redefine
			name
		end

	ET_ECF_INTERNAL_UNIVERSE
		undefine
			preparse_recursive,
			parse_all_recursive,
			preparse,
			parse_all,
			set_none_type
		redefine
			make, name
		end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: STRING) is
			-- Create a new ECF system.
		do
			precursor (a_name, a_filename)
			make_system (a_name)
		end

feature -- Access

	name: STRING
			-- Name of system

feature -- Setting

	set_root_class_name (a_name: STRING) is
			-- Set root class name to `a_name'.
		local
			an_identifier: ET_IDENTIFIER
		do
			if a_name /= Void and then a_name.count > 0 then
				create an_identifier.make (a_name)
				set_root_type (an_identifier)
			else
				unset_root_type
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
