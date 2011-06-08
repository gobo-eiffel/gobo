note

	description:

		"ECF states fulfilling or not conditions"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_STATE

create

	make

feature {NONE} -- Initialization

	make (a_target: ET_ECF_TARGET; a_version: UT_VERSION)
			-- Create a new ECF state based on information specified in `a_target'.
		require
			a_target_not_void: a_target /= Void
			a_version_not_void: a_version /= Void
		do
			target := a_target
			ise_version := a_version
		ensure
			target_set: target = a_target
			ise_version_set: ise_version = a_version
		end

feature -- Status

	is_dotnet: BOOLEAN
			-- Is system to be compiled to .NET?

	is_multithreaded: BOOLEAN
			-- Is system to be compiled multithreaded?

feature -- Access

	target: ET_ECF_TARGET
			-- Target where information about current state are specified

	ise_version: UT_VERSION
			-- ISE version to be used when evaluating version conditions

feature -- Status setting

	set_dotnet (b: BOOLEAN)
			-- Set `is_dotnet' to `b'.
		do
			is_dotnet := b
		ensure
			dotnet_set: is_dotnet = b
		end

	set_multithreaded (b: BOOLEAN)
			-- Set `is_multithreaded' to `b'.
		do
			is_multithreaded := b
		ensure
			multithreaded_set: is_multithreaded = b
		end

invariant

	target_not_void: target /= Void
	ise_version_not_void: ise_version /= Void

end
