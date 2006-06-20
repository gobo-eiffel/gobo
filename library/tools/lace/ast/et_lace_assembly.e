indexing

	description:

		".NET assemblies of classes read from Ace file"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_ASSEMBLY

inherit

	ET_ASSEMBLY

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

	class_prefix: STRING is
			-- Prefix for classnames of current assembly
			-- (may be Void)
		do
			if class_prefix_id /= Void then
				Result := class_prefix_id.name
			end
		end

	name_id: ET_IDENTIFIER
			-- Name identifier

	pathname_id: ET_IDENTIFIER
			-- Assembly pathname identifier (may be Void)

	class_prefix_id: ET_IDENTIFIER
			-- Class prefix identifier (may be Void)

feature -- Setting

	set_class_prefix (a_prefix: like class_prefix_id) is
			-- Set `class_prefix_id' to `a_prefix'.
		do
			class_prefix_id := a_prefix
		ensure
			class_prefix_id_set: class_prefix_id = a_prefix
		end

invariant

	name_id_not_void: name_id /= Void

end
