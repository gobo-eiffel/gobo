note
	description: "[
		Eiffel runtime panic
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	EIFFEL_RUNTIME_PANIC

inherit
	SYS_EXCEPTION

feature -- Access

	frozen code: INTEGER
			-- Exception code
		do
			if internal_code = {EXCEP_CONST}.Eiffel_runtime_fatal_error then
				Result := internal_code
			else
					-- Default to `Eiffel_runtime_panic'.
				Result := {EXCEP_CONST}.Eiffel_runtime_panic
			end
		end

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("Eiffel run-time panic.")
		end

feature {EXCEPTION_MANAGER} -- Status setting

	set_code (a_code: like code)
			-- Set `code' with `a_code'.
		do
			internal_code := code
		end

feature {NONE} -- Accesss

	internal_code: like code
			-- Internal code

end
