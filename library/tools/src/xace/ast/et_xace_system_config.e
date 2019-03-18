note

	description:

		"Xace systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_SYSTEM_CONFIG

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_UNIVERSE_CONFIG
		redefine
			select_target
		end

create

	make

feature -- Access

	root_class_name: detachable STRING
			-- Name of root class

	creation_procedure_name: detachable STRING
			-- Name of root creation procedure

feature -- Setting

	set_root_class_name (a_name: like root_class_name)
			-- Set `root_class_name' to `a_name'.
		do
			root_class_name := a_name
		ensure
			root_class_name_set: root_class_name = a_name
		end

	set_creation_procedure_name (a_name: like creation_procedure_name)
			-- Set `creation_procedure_name' to `a_name'.
		do
			creation_procedure_name := a_name
		ensure
			creation_procedure_name_set: creation_procedure_name = a_name
		end

feature -- Basic operations

	select_target (a_target: ET_XACE_TARGET; a_error_handler: ET_XACE_ERROR_HANDLER)
			-- Select `a_target'.
			-- Set `options', `clusters' and `libraries' accordingly.
		do
			precursor (a_target, a_error_handler)
			set_root_class_name (a_target.root_class_name)
			set_creation_procedure_name (a_target.creation_procedure_name)
		end

end
