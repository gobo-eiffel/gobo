indexing

	description:

		"Eiffel targets when propagating dynamic types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TARGET

feature -- Element change

	put_type (a_type: ET_DYNAMIC_TYPE; a_system: ET_SYSTEM) is
			-- Add `a_type' to current target.
		require
			a_type_not_void: a_type /= Void
			a_system_not_void: a_system /= Void
		deferred
		end

	put_type_from_attachment (a_type: ET_DYNAMIC_TYPE; an_attachment: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_type' coming from `an_attachment' to current target.
		require
			a_type_not_void: a_type /= Void
			an_attachment_not_void: an_attachment /= Void
			a_system_not_void: a_system /= Void
		do
			put_type (a_type, a_system)
		end	

end
