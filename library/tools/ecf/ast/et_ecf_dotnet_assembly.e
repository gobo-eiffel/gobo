indexing

	description:

		".NET assemblies of classes read from ECF file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_DOTNET_ASSEMBLY

inherit

	ET_DOTNET_ASSEMBLY

create

	make

feature {NONE} -- Initialization

	make (a_name: like name; a_pathname: like pathname) is
			-- Create a new assembly.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
			pathname := a_pathname
		ensure
			name_set: name = a_name
			pathname_set: pathname = a_pathname
		end

feature -- Access

	name: STRING
			-- Name

	pathname: STRING
			-- Assembly pathname (may be Void)

	classname_prefix: STRING
			-- Prefix for classnames of current assembly
			-- (may be Void)

feature -- Setting

	set_classname_prefix (a_prefix: like classname_prefix) is
			-- Set `classname_prefix_id' to `a_prefix'.
		do
			classname_prefix := a_prefix
		ensure
			classname_prefix_set: classname_prefix = a_prefix
		end

end
