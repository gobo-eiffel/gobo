note

	description:

		".NET assemblies of classes read from Ace file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_DOTNET_ASSEMBLY

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_DOTNET_ASSEMBLY
		rename
			make as make_dotnet_assembly
		end

create

	make

feature {NONE} -- Initialization

	make (a_name: like name_id; a_pathname: like pathname_id; a_system: ET_SYSTEM)
			-- Create a new assembly.
		require
			a_name_not_void: a_name /= Void
			a_system_not_void: a_system /= Void
		local
			l_pathname: detachable STRING
		do
			name_id := a_name
			pathname_id := a_pathname
			if a_pathname /= Void then
				l_pathname := a_pathname.name
			end
			make_dotnet_assembly (a_name.name, l_pathname, a_system)
		ensure
			name_id_set: name_id = a_name
			pathname_id_set: pathname_id = a_pathname
			current_system_set: current_system = a_system
		end

feature -- Access

	name_id: ET_IDENTIFIER
			-- Name identifier

	pathname_id: detachable ET_IDENTIFIER
			-- Assembly pathname identifier (may be Void)

	classname_prefix_id: detachable ET_IDENTIFIER
			-- Classname prefix identifier (may be Void)

feature -- Setting

	set_classname_prefix_id (a_prefix: like classname_prefix_id)
			-- Set `classname_prefix_id' to `a_prefix'.
		local
			l_classname_prefix: detachable STRING
		do
			classname_prefix_id := a_prefix
			if a_prefix /= Void then
				l_classname_prefix := a_prefix.name
			end
			set_classname_prefix (l_classname_prefix)
		ensure
			classname_prefix_id_set: classname_prefix_id = a_prefix
			classname_prefix_set: a_prefix /= Void implies classname_prefix = a_prefix.name
			no_classname_prefix_set: a_prefix = Void implies classname_prefix = Void
		end

invariant

	name_id_not_void: name_id /= Void
	name_definition: name = name_id.name
	pathname_definition: attached pathname_id as l_pathname_id implies pathname = l_pathname_id.name
	no_pathname_definition: pathname_id /= Void implies pathname = Void

end
