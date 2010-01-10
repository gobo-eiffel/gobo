note
	description: "Common ancestors to all immutable STRING classes."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2009-12-01 22:45:32 +0100 (Tue, 01 Dec 2009) $"
	revision: "$Revision: 406 $"

deferred class
	IMMUTABLE_STRING_GENERAL

inherit
	READABLE_STRING_GENERAL
		redefine
			is_immutable
		end

feature -- Status report

	is_immutable: BOOLEAN = True
			-- <Precursor>

invariant
	immutable: is_immutable

end
