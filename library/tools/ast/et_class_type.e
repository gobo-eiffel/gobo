indexing

	description:

		"Eiffel class types"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_CLASS_TYPE

inherit

	ET_TYPE

creation

	make

feature {NONE} -- Initialization

	make (a_name: like class_name; a_parameters: like generic_parameters; a_class: like base_class) is
			-- Create a new class type.
		require
			a_name_not_void: a_name /= Void
			a_class_not_void: a_class /= Void
		do
			class_name := a_name
			generic_parameters := a_parameters
			base_class := a_class
		ensure
			class_name_set: class_name = a_name
			generic_parameters_set: generic_parameters = a_parameters
			base_class_set: base_class = a_class
		end

feature -- Access

	class_name: ET_IDENTIFIER
			-- Name of base class

	base_class: ET_CLASS
			-- Base class

	generic_parameters: ET_ACTUAL_GENERIC_TYPES
			-- Generic parameters

invariant

	class_name_not_void: class_name /= Void
	base_class_not_void: base_class /= Void

end -- class ET_CLASS_TYPE
