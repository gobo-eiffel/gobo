note

	description:

		"Warning: Obsolete <exclude> element"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING

inherit

	ET_XACE_WARNING

create

	make

feature {NONE} -- Initialization

	make (a_position: XM_POSITION) is
			-- Create a warning reporting that an exclude element
			-- is obsoleted by if/unless attributes.
		require
			a_position_not_void: a_position /= Void
		do
			create parameters.make (1, 1)
			parameters.put (a_position.out, 1)
		end

feature -- Access

	default_template: STRING is "<exclude> at $1 is obsolete, use 'if'/'unless' attributes instead"
			-- Default template used to built the error message

	code: STRING is "XA0015"
			-- Error code

end
