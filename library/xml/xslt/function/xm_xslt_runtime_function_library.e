indexing

	description:

		"Objects that provide access to functions at runtime"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_RUNTIME_FUNCTION_LIBRARY

inherit
	
	XM_XPATH_FUNCTION_LIBRARY

		-- This class is to support function-available when
		--  the function name is not known at compile time.
		-- As a result, `bind_function' is never called on `Current'

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			create function_table.make_default
		end

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent an available function with `an_arity'?
		local
			a_key: XM_XPATH_64BIT_NUMERIC_CODE
			a_cursor: DS_HASH_TABLE_CURSOR [XM_XSLT_FUNCTION, XM_XPATH_64BIT_NUMERIC_CODE]
		do
			if not is_restricted then
				if an_arity = -1 then

					-- Search on name alone

					from
						a_cursor := function_table.new_cursor; a_cursor.start
					until
						a_cursor.after
					loop
						a_key := a_cursor.key
						if a_key.high_word = a_fingerprint then
							Result := True
							a_cursor.go_after
						else
							a_cursor.forth
						end
					end
				else
					create a_key.make (a_fingerprint, an_arity)
					Result := function_table.has (a_key)
				end
			end
		end

feature -- Element change

	add_function (a_user_function: XM_XSLT_FUNCTION) is
			-- Add `a_user_function' to `function_table'.
		require
			user_function_not_void: a_user_function /= Void
		local
			a_key: XM_XPATH_64BIT_NUMERIC_CODE
		do
			create a_key.make (a_user_function.function_fingerprint, a_user_function.arity)
			function_table.force (a_user_function, a_key)
		end

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function', setting the arguments to `some_arguments'.
		do
			check
				never_called: False
				-- `bind_function' is only called during stylesheet-compilation 
			end
		end

feature {NONE} -- Implementation

	function_table: DS_HASH_TABLE [XM_XSLT_FUNCTION, XM_XPATH_64BIT_NUMERIC_CODE]
			-- Function table

invariant

	function_table_not_void: function_table /= Void

end
	
