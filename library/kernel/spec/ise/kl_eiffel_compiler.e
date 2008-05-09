indexing

	description:

		"Eiffel compiler used to compile this program"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_EIFFEL_COMPILER

inherit

	ANY -- Needed for SE 2.1b1.

feature -- Access

	vendor: STRING is
			-- Vendor of Eiffel compiler used to compiled this program
		once




			Result := ise_vendor





		ensure
			vendor_not_void: Result /= Void
		end

	ge_vendor: STRING is "ge"
			-- Gobo Eiffel vendor

	ise_vendor: STRING is "ise"
			-- ISE Eiffel vendor

	hact_vendor: STRING is
			-- Halstenbach vendor
		obsolete
			"[040922] HACT not supported anymore."
		once
			Result := "hact"
		ensure
			vendor_not_void: Result /= Void
		end

	se_vendor: STRING is "se"
			-- SmartEiffel vendor

	ve_vendor: STRING is
			-- Visual Eiffel vendor
		obsolete
			"[080419] VE not supported anymore."
		once
			Result := "ve"
		ensure
			vendor_not_void: Result /= Void
		end

feature -- Status report

	is_ge: BOOLEAN is
			-- Has this program been compiled with Gobo Eiffel?
		once
			Result := (vendor = ge_vendor)
		ensure
			definition: Result = (vendor = ge_vendor)
		end

	is_ise: BOOLEAN is
			-- Has this program been compiled with ISE Eiffel?
		once
			Result := (vendor = ise_vendor)
		ensure
			definition: Result = (vendor = ise_vendor)
		end

	is_hact: BOOLEAN is
			-- Has this program been compiled with Halstenbach?
		obsolete
			"[040922] HACT not supported anymore."
		once
			Result := False
		ensure
			definition: not Result
		end

	is_se: BOOLEAN is
			-- Has this program been compiled with SmartEiffel?
		once
			Result := (vendor = se_vendor)
		ensure
			definition: Result = (vendor = se_vendor)
		end

	is_ve: BOOLEAN is
			-- Has this program been compiled with Visual Eiffel?
		obsolete
			"[040922] VE not supported anymore."
		once
			Result := False
		ensure
			definition: not Result
		end

end
