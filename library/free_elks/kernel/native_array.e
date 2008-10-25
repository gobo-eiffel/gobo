indexing
	description: "Fake abstraction of a .NET NATIVE_ARRAY in a non-.NET system"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	NATIVE_ARRAY [G]

invariant
	is_dotnet: {PLATFORM}.is_dotnet

end
