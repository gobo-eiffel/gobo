note
	description: "Fake abstraction of a .NET SYSTEM_STRING in a non-.NET system"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	SYSTEM_STRING

feature -- Access

	length: INTEGER do end

invariant
	is_dotnet: {PLATFORM}.is_dotnet

end
