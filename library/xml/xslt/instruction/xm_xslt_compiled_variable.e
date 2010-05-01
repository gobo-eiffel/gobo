note

	description:

		"Objects that represent the compiled form of xsl:variable, both local and global"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_COMPILED_VARIABLE

inherit

	XM_XSLT_COMPILED_GENERAL_VARIABLE

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_name: STRING; a_slot_number: INTEGER) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			valid_name: a_name /= Void and then a_name.count > 0
		do
			executable := an_executable
			variable_name := a_name
			slot_number := a_slot_number
			compute_static_properties
			initialized := True
		ensure
			executable_set: executable = an_executable
			name_set: variable_name = a_name
			slot_number: slot_number = a_slot_number
		end

end
