indexing
	description: "Fake abstraction of a .NET NATIVE_ARRAY in a non-.NET system"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	NATIVE_ARRAY [G]

create {NONE}

invariant
	is_dotnet: {PLATFORM}.is_dotnet

end
