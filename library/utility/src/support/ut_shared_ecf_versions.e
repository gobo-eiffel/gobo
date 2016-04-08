note

	description:

		"Shared ECF version numbers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2009-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_ECF_VERSIONS

feature -- Access

	ecf_1_0_0: UT_VERSION
			-- ECF 1.0.0
			-- Corresponding to ISE 5.7
		once
			create Result.make (1, 0, 0, 0)
		ensure
			ecf_1_0_0_not_void: Result /= Void
		end

	ecf_1_2_0: UT_VERSION
			-- ECF 1.2.0
			-- Corresponding to ISE 6.0
		once
			create Result.make (1, 2, 0, 0)
		ensure
			ecf_1_2_0_not_void: Result /= Void
		end

	ecf_1_3_0: UT_VERSION
			-- ECF 1.3.0
			-- Corresponding to ISE 6.1
		once
			create Result.make (1, 3, 0, 0)
		ensure
			ecf_1_3_0_not_void: Result /= Void
		end

	ecf_1_4_0: UT_VERSION
			-- ECF 1.4.0
			-- Corresponding to ISE 6.2
		once
			create Result.make (1, 4, 0, 0)
		ensure
			ecf_1_4_0_not_void: Result /= Void
		end

	ecf_1_5_0: UT_VERSION
			-- ECF 1.5.0
			-- Corresponding to ISE 6.4
		once
			create Result.make (1, 5, 0, 0)
		ensure
			ecf_1_5_0_not_void: Result /= Void
		end

	ecf_1_15_0: UT_VERSION
			-- ECF 1.15.0
			-- Corresponding to ISE 15.12
		once
			create Result.make (1, 15, 0, 0)
		ensure
			ecf_1_15_0_not_void: Result /= Void
		end
		
	ecf_latest: UT_VERSION
			-- After the last ECF version
		once
			create Result.make_latest
		ensure
			ecma_latest_not_void: Result /= Void
		end

end
