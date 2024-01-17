note

	description:

		"Equality testers for UT_URI, based on full_reference equality"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"

class UT_URI_EQUALITY_TESTER

inherit

	KL_EQUALITY_TESTER [UT_URI]
		redefine
			test
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature -- Status report

	test (v, u: detachable UT_URI): BOOLEAN
			-- Are `v' and `u' considered equal?
			-- (Comparison of UT_URIs based on `full_reference')
		do
			if v = u then
				Result := True
			elseif v = Void then
				Result := False
			elseif u = Void then
				Result := False
			else
				Result := STRING_.same_string (v.full_reference, u.full_reference)
			end
		end

end
