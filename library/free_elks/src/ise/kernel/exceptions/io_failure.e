note
	description: "[
		IO failure
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class
	IO_FAILURE

inherit
	DATA_EXCEPTION

feature -- Access

	frozen code: INTEGER
			-- Exception code
		do
			if internal_code = {EXCEP_CONST}.Io_exception then
				Result := internal_code
			else
					-- Default to `Runtime_io_exception'.
				Result := {EXCEP_CONST}.Runtime_io_exception
			end
		end

	error_code: INTEGER
			-- Error code

	tag: IMMUTABLE_STRING_32
			-- <Precursor>
		once
			create Result.make_from_string_8 ("I/O error.")
		end

feature {EXCEPTION_MANAGER} -- Status setting

	set_error_code (a_code: like error_code)
			-- Set `error_code' with `a_code'
		do
			error_code := a_code
		end

	set_code (a_code: like code)
			-- Set `code' with `a_code'.
		do
			internal_code := a_code
		end

feature {NONE} -- Accesss

	internal_code: like code
			-- Internal code
end
