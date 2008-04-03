indexing

	description:

		"Eiffel generic class types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_GENERIC_CLASS_TYPE

inherit

	ET_CLASS_TYPE
		rename
			make as make_class_type
		redefine
			actual_parameters,
			unresolved_type,
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_type_mark: like type_mark; a_name: like name;
		a_parameters: like actual_parameters; a_base_class: ET_CLASS) is
			-- Create a new generic class type.
		require
			a_name_not_void: a_name /= Void
			a_parameters_not_void: a_parameters /= Void
			a_base_class_not_void: a_base_class /= Void
		do
			type_mark := a_type_mark
			name := a_name
			actual_parameters := a_parameters
			base_class := a_base_class
		ensure
			type_mark_set: type_mark = a_type_mark
			name_set: name = a_name
			actual_parameters_set: actual_parameters = a_parameters
			base_class_set: base_class = a_base_class
		end

feature -- Access

	actual_parameters: ET_ACTUAL_PARAMETER_LIST
			-- Actual generic parameters

	unresolved_type: ET_CLASS_TYPE
			-- Type from which current type is a resolved version

feature -- Setting

	set_unresolved_type (a_type: like unresolved_type) is
			-- Set `unresolved_type' to `a_type'.
		do
			unresolved_type := a_type
		ensure
			unresolved_type_set: unresolved_type = a_type
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_generic_class_type (Current)
		end

invariant

	actual_parameters_not_void: actual_parameters /= Void

end
