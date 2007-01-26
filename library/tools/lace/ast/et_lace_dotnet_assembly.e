indexing

	description:

		".NET assemblies of classes read from Ace file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_DOTNET_ASSEMBLY

inherit

	ET_DOTNET_ASSEMBLY

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_id; a_pathname: like pathname_id) is
			-- Create a new assembly.
		require
			a_name_not_void: a_name /= Void
		do
			name_id := a_name
			pathname_id := a_pathname
		ensure
			name_id_set: name_id = a_name
			pathname_id_set: pathname_id = a_pathname
		end

feature -- Access

	name: STRING is
			-- Name
		do
			Result := name_id.name
		end

	pathname: STRING is
			-- Assembly pathname (may be Void)
		do
			if pathname_id /= Void then
				Result := pathname_id.name
			end
		end

	classname_prefix: STRING is
			-- Prefix for classnames of current assembly
			-- (may be Void)
		do
			if classname_prefix_id /= Void then
				Result := classname_prefix_id.name
			end
		end

	name_id: ET_IDENTIFIER
			-- Name identifier

	pathname_id: ET_IDENTIFIER
			-- Assembly pathname identifier (may be Void)

	classname_prefix_id: ET_IDENTIFIER
			-- Classname prefix identifier (may be Void)

feature -- Setting

	set_classname_prefix (a_prefix: like classname_prefix_id) is
			-- Set `classname_prefix_id' to `a_prefix'.
		do
			classname_prefix_id := a_prefix
		ensure
			classname_prefix_id_set: classname_prefix_id = a_prefix
		end

invariant

	name_id_not_void: name_id /= Void

end
