note

	description:

		"Eiffel compiler used to compile this program"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_EIFFEL_COMPILER

inherit

	ANY -- Needed for SE 2.1b1.

feature -- Access

	vendor: STRING
			-- Vendor of Eiffel compiler used to compiled this program
		once




			Result := ise_vendor




		ensure
			vendor_not_void: Result /= Void
		end

	ge_vendor: STRING = "ge"
			-- Gobo Eiffel vendor

	ise_vendor: STRING = "ise"
			-- ISE Eiffel vendor

	unknown_vendor: STRING = "unknown"
			-- Unknown Eiffel vendor

	se_vendor: STRING
			-- SmartEiffel vendor
		obsolete
			"[080724] SE not supported anymore."
		once
			Result := "se"
		ensure
			vendor_not_void: Result /= Void
		end

	ve_vendor: STRING
			-- Visual Eiffel vendor
		obsolete
			"[080419] VE not supported anymore."
		once
			Result := "ve"
		ensure
			vendor_not_void: Result /= Void
		end

feature -- Status report

	is_ge: BOOLEAN
			-- Has this program been compiled with Gobo Eiffel?
		once
			Result := (vendor = ge_vendor)
		ensure
			definition: Result = (vendor = ge_vendor)
		end

	is_ise: BOOLEAN
			-- Has this program been compiled with ISE Eiffel?
		once
			Result := (vendor = ise_vendor)
		ensure
			definition: Result = (vendor = ise_vendor)
		end

	is_se: BOOLEAN
			-- Has this program been compiled with SmartEiffel?
		obsolete
			"[080724] SE not supported anymore."
		once
			Result := False
		ensure
			definition: not Result
		end

	is_ve: BOOLEAN
			-- Has this program been compiled with Visual Eiffel?
		obsolete
			"[080419] VE not supported anymore."
		once
			Result := False
		ensure
			definition: not Result
		end

end
