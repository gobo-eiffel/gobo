note

	description:

		"Eiffel compiler used to compile this program"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
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
			if {ISE_RUNTIME}.compiler_version > 608000000 then
					-- The Gobo compiler version starts with 
					-- 6080 (looks like GOBO) followed by 5 digits.
				Result := ge_vendor
			else
				Result := ise_vendor
			end
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
			"SE not supported anymore. [2008-07-24]"
		once
			Result := "se"
		ensure
			vendor_not_void: Result /= Void
		end

	ve_vendor: STRING
			-- Visual Eiffel vendor
		obsolete
			"VE not supported anymore. [2008-04-19]"
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
			"SE not supported anymore. [2008-07-24]"
		once
			Result := False
		ensure
			definition: not Result
		end

	is_ve: BOOLEAN
			-- Has this program been compiled with Visual Eiffel?
		obsolete
			"VE not supported anymore. [2008-04-19]"
		once
			Result := False
		ensure
			definition: not Result
		end

end
