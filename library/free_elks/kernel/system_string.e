indexing
	description: "Fake abstraction of a .NET SYSTEM_STRING in a non-.NET system"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	SYSTEM_STRING

feature -- Access

	length: INTEGER is do end

invariant
	is_dotnet: {PLATFORM}.is_dotnet

end
