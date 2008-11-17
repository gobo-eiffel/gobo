indexing

	description:

		"ECF external objects"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_EXTERNAL_OBJECT

inherit

	ET_ECF_CONDITIONED

create

	make

feature {NONE} -- Initialization

	make (a_pathname: like pathname) is
			-- Create a new external object.
		require
			a_pathname_not_void: a_pathname /= Void
		do
			pathname := a_pathname
		ensure
			pathname_set: pathname = a_pathname
		end

feature -- Access

	pathname: STRING
			-- Pathname

feature -- Element change

	fill_external_objects (a_system: ET_SYSTEM; a_state: ET_ECF_STATE) is
			-- Add to `a_system' the current external object pathname
			-- of conditions satisfy `a_state'.
		require
			a_system_not_void: a_system /= Void
			a_state_not_void: a_state /= Void
		do
			if is_enabled (a_state) then
				a_system.external_object_pathnames.force_last (pathname)
			end
		end

invariant

	pathname_not_void: pathname /= Void

end
