indexing

	description:

		"Objects that create XPath functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FUNCTION_FACTORY

inherit

	XM_UNICODE_CHARACTERS_1_1

feature -- Status report

	is_system_function_factory_registered: BOOLEAN
			-- Has an XM_XPATH_SYSTEM_FUNCTION_FACTORY been registered?

feature -- Status setting

	register_system_function_factory (a_system_function_factory: XM_XPATH_SYSTEM_FUNCTION_FACTORY) is
			-- Register an XM_XPATH_SYSTEM_FUNCTION_FACTORY
		require
			no_previous_factory: not is_system_function_factory_registered
			factory_not_void: a_system_function_factory /= Void
		do
			system_function_factory := a_system_function_factory
			is_system_function_factory_registered := True
		ensure
			factory_registered: is_system_function_factory_registered and system_function_factory = a_system_function_factory
		end
	
feature -- Creation
	
	make_system_function (a_function_name: STRING): XM_XPATH_FUNCTION_CALL is
			--  Create an XM_XPATH_FUNCTION_CALL object for `a_function_name
		require
			valid_function_name: a_function_name /= Void and then is_ncname (a_function_name)
			system_function_factory_registered: is_system_function_factory_registered
		do
			Result := system_function_factory.make_system_function (a_function_name)
		end

feature {NONE} -- Implementation

	system_function_factory: XM_XPATH_SYSTEM_FUNCTION_FACTORY
			-- The registered system function factory

invariant

	system_function_factory_not_void: is_system_function_factory_registered implies system_function_factory /= Void

end
