note

	description:

		"Features implemented in .NET"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DOTNET_FEATURE

inherit

	ET_FEATURE
		redefine
			is_frozen, is_dotnet,
			overloaded_extended_name
		end

feature -- Status report

	is_frozen: BOOLEAN is
			-- Has feature been declared as frozen?
		do
			Result := (frozen_keyword /= Void or not is_virtual)
		end

	is_virtual: BOOLEAN
			-- Has feature been declared as virtual?

	is_static: BOOLEAN
			-- Has feature been declared as static?

	is_dotnet: BOOLEAN is True
			-- Is current feature a .NET feature?

feature -- Access

	dotnet_name: STRING
			-- .NET feature name

	overloaded_extended_name: ET_EXTENDED_FEATURE_NAME
			-- Possibly overloaded extended Eiffel feature name
			-- (useful in .NET)

feature -- Status setting

	set_virtual (b: BOOLEAN) is
			-- Set `is_virtual' to `b'.
		do
			is_virtual := b
		ensure
			virtual_set: is_virtual = b
		end

	set_static (b: BOOLEAN) is
			-- Set `is_static' to `b'.
		do
			is_static := b
		ensure
			static_set: is_static = b
		end

feature -- Setting

	set_dotnet_name (a_name: like dotnet_name) is
			-- Set `dotnet_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			dotnet_name := a_name
		ensure
			dotnet_name_set: dotnet_name = a_name
		end

	set_overloaded_extended_name (a_name: like overloaded_extended_name) is
			-- Set `overloaded_extended_name' to `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			overloaded_extended_name := a_name
		ensure
			overloaded_extended_name_set: overloaded_extended_name = a_name
		end

invariant

	dotnet_name_not_void: dotnet_name /= Void
	dotnet_name_not_empty: not dotnet_name.is_empty

end
