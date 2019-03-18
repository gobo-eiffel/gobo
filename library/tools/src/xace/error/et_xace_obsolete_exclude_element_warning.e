note

	description:

		"Warning: Obsolete <exclude> element"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_XACE_WARNING

create

	make

feature {NONE} -- Initialization

	make (a_position: XM_POSITION)
			-- Create a warning reporting that an exclude element
			-- is obsoleted by if/unless attributes.
		require
			a_position_not_void: a_position /= Void
		do
			create parameters.make_filled (empty_string, 1, 1)
			parameters.put (a_position.out, 1)
		end

feature -- Access

	default_template: STRING = "<exclude> at $1 is obsolete, use 'if'/'unless' attributes instead"
			-- Default template used to built the error message

	code: STRING = "XA0015"
			-- Error code

end
