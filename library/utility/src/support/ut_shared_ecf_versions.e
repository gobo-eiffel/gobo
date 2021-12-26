note

	description:

		"Shared ECF version numbers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2009-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_ECF_VERSIONS

feature -- Access

	ecf_1_0_0: UT_VERSION
			-- ECF 1.0.0
			-- Introduced in ISE 5.7
		once
			create Result.make (1, 0, 0, 0)
		ensure
			instance_free: class
			ecf_1_0_0_not_void: Result /= Void
		end

	ecf_1_2_0: UT_VERSION
			-- ECF 1.2.0
			-- Introduced in ISE 6.0
		once
			create Result.make (1, 2, 0, 0)
		ensure
			instance_free: class
			ecf_1_2_0_not_void: Result /= Void
		end

	ecf_1_3_0: UT_VERSION
			-- ECF 1.3.0
			-- Introduced in ISE 6.1
		once
			create Result.make (1, 3, 0, 0)
		ensure
			instance_free: class
			ecf_1_3_0_not_void: Result /= Void
		end

	ecf_1_4_0: UT_VERSION
			-- ECF 1.4.0
			-- Introduced in ISE 6.2
		once
			create Result.make (1, 4, 0, 0)
		ensure
			instance_free: class
			ecf_1_4_0_not_void: Result /= Void
		end

	ecf_1_5_0: UT_VERSION
			-- ECF 1.5.0
			-- Introduced in ISE 6.4
		once
			create Result.make (1, 5, 0, 0)
		ensure
			instance_free: class
			ecf_1_5_0_not_void: Result /= Void
		end

	ecf_1_6_0: UT_VERSION
			-- ECF 1.6.0
			-- Introduced in ISE 6.6.
		once
			create Result.make (1, 6, 0, 0)
		ensure
			instance_free: class
			ecf_1_6_0_not_void: Result /= Void
		end

	ecf_1_7_0: UT_VERSION
			-- ECF 1.7.0
			-- Introduced in ISE 6.7.
		once
			create Result.make (1, 7, 0, 0)
		ensure
			instance_free: class
			ecf_1_7_0_not_void: Result /= Void
		end

	ecf_1_8_0: UT_VERSION
			-- ECF 1.8.0
			-- Introduced in ISE 6.8.
		once
			create Result.make (1, 8, 0, 0)
		ensure
			instance_free: class
			ecf_1_8_0_not_void: Result /= Void
		end

	ecf_1_9_0: UT_VERSION
			-- ECF 1.9.0
			-- Introduced in ISE 7.0.
		once
			create Result.make (1, 9, 0, 0)
		ensure
			instance_free: class
			ecf_1_9_0_not_void: Result /= Void
		end

	ecf_1_10_0: UT_VERSION
			-- ECF 1.10.0
			-- Introduced in ISE 7.1.
		once
			create Result.make (1, 10, 0, 0)
		ensure
			instance_free: class
			ecf_1_10_0_not_void: Result /= Void
		end

	ecf_1_11_0: UT_VERSION
			-- ECF 1.11.0
			-- Introduced in ISE 7.3.
		once
			create Result.make (1, 11, 0, 0)
		ensure
			instance_free: class
			ecf_1_11_0_not_void: Result /= Void
		end

	ecf_1_12_0: UT_VERSION
			-- ECF 1.12.0
			-- Introduced in ISE 13.11.
		once
			create Result.make (1, 12, 0, 0)
		ensure
			instance_free: class
			ecf_1_12_0_not_void: Result /= Void
		end

	ecf_1_13_0: UT_VERSION
			-- ECF 1.13.0
			-- Introduced in ISE 14.05.
		once
			create Result.make (1, 13, 0, 0)
		ensure
			instance_free: class
			ecf_1_13_0_not_void: Result /= Void
		end

	ecf_1_14_0: UT_VERSION
			-- ECF 1.14.0
			-- Introduced in ISE 15.12.
		once
			create Result.make (1, 14, 0, 0)
		ensure
			instance_free: class
			ecf_1_14_0_not_void: Result /= Void
		end

	ecf_1_15_0: UT_VERSION
			-- ECF 1.15.0
			-- Introduced in ISE 15.12.
		once
			create Result.make (1, 15, 0, 0)
		ensure
			instance_free: class
			ecf_1_15_0_not_void: Result /= Void
		end

	ecf_1_16_0: UT_VERSION
			-- ECF 1.16.0
			-- Introduced in ISE 17.01.
		once
			create Result.make (1, 16, 0, 0)
		ensure
			instance_free: class
			ecf_1_16_0_not_void: Result /= Void
		end

	ecf_1_17_0: UT_VERSION
			-- ECF 1.17.0
			-- Introduced in ISE 18.01.
		once
			create Result.make (1, 17, 0, 0)
		ensure
			instance_free: class
			ecf_1_17_0_not_void: Result /= Void
		end

	ecf_1_18_0: UT_VERSION
			-- ECF 1.18.0
			-- Introduced in ISE 18.07.
		once
			create Result.make (1, 18, 0, 0)
		ensure
			instance_free: class
			ecf_1_18_0_not_void: Result /= Void
		end

	ecf_1_19_0: UT_VERSION
			-- ECF 1.19.0
			-- Introduced in ISE 18.11.
		once
			create Result.make (1, 19, 0, 0)
		ensure
			instance_free: class
			ecf_1_19_0_not_void: Result /= Void
		end

	ecf_1_20_0: UT_VERSION
			-- ECF 1.20.0
			-- Introduced in ISE 19.05.
		once
			create Result.make (1, 20, 0, 0)
		ensure
			instance_free: class
			ecf_1_20_0_not_void: Result /= Void
		end

	ecf_1_21_0: UT_VERSION
			-- ECF 1.21.0
			-- Introduced in ISE 19.11.
		once
			create Result.make (1, 21, 0, 0)
		ensure
			instance_free: class
			ecf_1_21_0_not_void: Result /= Void
		end

	ecf_1_22_0: UT_VERSION
			-- ECF 1.22.0
			-- Introduced in ISE 21.11.
		once
			create Result.make (1, 22, 0, 0)
		ensure
			instance_free: class
			ecf_1_22_0_not_void: Result /= Void
		end

	ecf_last_known: UT_VERSION
			-- Last known ECF version
			-- (Typically the most recent version of ECF supported
			-- by the latest offical release of ISE EiffelStudio)
		once
			Result := ecf_1_22_0
		ensure
			instance_free: class
			ecf_last_known_not_void: Result /= Void
		end

	ecf_latest: UT_VERSION
			-- After the last ECF version
		once
			create Result.make_latest
		ensure
			instance_free: class
			ecf_latest_not_void: Result /= Void
		end

end
