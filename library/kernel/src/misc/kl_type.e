note

	description:

		"Operations of objects of a given type (the generic parameter)."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TYPE [G]

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Status report

	same_objects (u, v: G): BOOLEAN
			-- Are `u' and `v' the same objects?
			-- Use '=', except in case of {REAL_32}.Nan and {REAL_64}.Nan
			-- where NaNs are considered the same.
		do
			Result := same_detachable_objects (u, v)
		ensure
			instance_free: class
		end

	same_detachable_objects (u, v: detachable G): BOOLEAN
			-- Are `u' and `v' the same objects?
			-- Use '=', except in case of {REAL_32}.Nan and {REAL_64}.Nan
			-- where NaNs are considered the same.
		do
			if u = v then
				Result := True
			elseif u = u or v = v then
				Result := False
			elseif attached {REAL_64_REF} u as l_ud and then l_ud.is_nan then
				Result := attached {REAL_64_REF} v as l_vd and then l_vd.is_nan
			elseif attached {REAL_32_REF} u as l_ur and then l_ur.is_nan then
				Result := attached {REAL_32_REF} v as l_vr and then l_vr.is_nan

			end
		ensure
			instance_free: class
		end

end
