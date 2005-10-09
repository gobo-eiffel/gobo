indexing

	description:

		"Objects that manage access to functions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_FUNCTION_LIBRARY_MANAGER

inherit

	XM_XPATH_FUNCTION_LIBRARY

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			create libraries.make_default
		end

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent an available function with `an_arity'?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_FUNCTION_LIBRARY]
		do
			from
				a_cursor := libraries.new_cursor; a_cursor.start
			until
				Result = True or else a_cursor.after
			loop
				Result := a_cursor.item.is_function_available (a_fingerprint, an_arity, is_restricted)
				a_cursor.forth
			end
		end

feature -- Element change

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function'.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_FUNCTION_LIBRARY]
			found: BOOLEAN
		do
			from
				a_cursor := libraries.new_cursor; a_cursor.start
			until
				found
			loop
				found := a_cursor.item.is_function_available (a_fingerprint, some_arguments.count, is_restricted)

				-- Precondition implies a binding WILL be found

				if found then
					a_cursor.item.bind_function (a_fingerprint, some_arguments, is_restricted)
					last_bound_function := a_cursor.item.last_bound_function
				else
					a_cursor.forth
				end
			end			
		end

	add_function_library (a_library: XM_XPATH_FUNCTION_LIBRARY) is
			-- Add `a_library' to list of managed function libraries.
		require
			function_library_not_void: a_library /= Void
		do
			libraries.force_last (a_library)
		end

feature {NONE} -- Initialization

	libraries: DS_ARRAYED_LIST [XM_XPATH_FUNCTION_LIBRARY]
			-- Managed libraries

invariant

	libraries_not_void: libraries /= Void

end
	
