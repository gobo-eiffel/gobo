note

	description:

		"Shared ISE Eiffel version numbers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2006-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_ISE_VERSIONS

inherit

	ANY -- Needed for SE.

feature -- Access

	ise_5_6_0: UT_VERSION
			-- ISE 5.6.0
		once
			create Result.make (5, 6, 0, 0)
		ensure
			instance_free: class
			ise_5_6_0_not_void: Result /= Void
		end

	ise_5_6_latest: UT_VERSION
			-- After the last release ISE 5.6
		once
			create Result.make_major_minor (5, 6)
		ensure
			instance_free: class
			ise_5_6_latest_not_void: Result /= Void
		end

	ise_5_7_0: UT_VERSION
			-- ISE 5.7.0
		once
			create Result.make (5, 7, 0, 0)
		ensure
			instance_free: class
			ise_5_7_0_not_void: Result /= Void
		end

	ise_5_7_0827: UT_VERSION
			-- ISE 5.7.0827
			-- Last release with EIFGEN and Ace.
			-- Following releases use EIFGENs and ecf.
		once
			create Result.make (5, 7, 0827, 0)
		ensure
			instance_free: class
			ise_5_7_0827_not_void: Result /= Void
		end

	ise_5_7_59914: UT_VERSION
			-- ISE 5.7.59914
			-- First release with:
			-- * optional 'is' keyword
			-- * bracket expression as target of qualified calls
		once
			create Result.make (5, 7, 59914, 0)
		ensure
			instance_free: class
			ise_5_7_59914_not_void: Result /= Void
		end

	ise_5_7_60362: UT_VERSION
			-- ISE 5.7.60362
			-- First release with basic type mapping:
			--  STRING -> STRING_8
			--  INTEGER -> INTEGER_32
			--  etc.
		once
			create Result.make (5, 7, 60362, 0)
		ensure
			instance_free: class
			ise_5_7_60362_not_void: Result /= Void
		end

	ise_5_7_62488: UT_VERSION
			-- ISE 5.7.62488
			-- First release with expanded basic types conforming to
			-- their reference ancestors (instead of converting to them)
		once
			create Result.make (5, 7, 62488, 0)
		ensure
			instance_free: class
			ise_5_7_62488_not_void: Result /= Void
		end

	ise_5_7_latest: UT_VERSION
			-- After the last release ISE 5.7
		once
			create Result.make_major_minor (5, 7)
		ensure
			instance_free: class
			ise_5_7_latest_not_void: Result /= Void
		end

	ise_6_0_0: UT_VERSION
			-- ISE 6.0.0
		once
			create Result.make (6, 0, 0, 0)
		ensure
			instance_free: class
			ise_6_0_0_not_void: Result /= Void
		end

	ise_6_0_6_7057: UT_VERSION
			-- ISE 6.0.6.7057
			-- First release using FreeELKS.
		once
			create Result.make (6, 0, 6, 7057)
		ensure
			instance_free: class
			ise_6_0_6_7057_not_void: Result /= Void
		end

	ise_6_0_6_7358: UT_VERSION
			-- ISE 6.0.6.7358
			-- First release with multiple generic constraints.
		once
			create Result.make (6, 0, 6, 7358)
		ensure
			instance_free: class
			ise_6_0_6_7358_not_void: Result /= Void
		end

	ise_6_0_latest: UT_VERSION
			-- After the last release ISE 6.0
		once
			create Result.make_major_minor (6, 0)
		ensure
			instance_free: class
			ise_6_0_latest_not_void: Result /= Void
		end

	ise_6_1_0: UT_VERSION
			-- ISE 6.1.0
		once
			create Result.make (6, 1, 0, 0)
		ensure
			instance_free: class
			ise_6_1_0_not_void: Result /= Void
		end

	ise_6_1_latest: UT_VERSION
			-- After the last release ISE 6.1
		once
			create Result.make_major_minor (6, 1)
		ensure
			instance_free: class
			ise_6_1_latest_not_void: Result /= Void
		end

	ise_6_2_0: UT_VERSION
			-- ISE 6.2.0
		once
			create Result.make (6, 2, 0, 0)
		ensure
			instance_free: class
			ise_6_2_0_not_void: Result /= Void
		end

	ise_6_2_7_2567: UT_VERSION
			-- ISE 6.2.7.2567
			-- First release with support for keyword 'note'.
		once
			create Result.make (6, 2, 7, 2567)
		ensure
			instance_free: class
			ise_6_2_7_2567: Result /= Void
		end

	ise_6_2_7_2906: UT_VERSION
			-- ISE 6.2.7.2906
			-- Last release with 'like Current', 'INTEGER', 'REAL' and 'DOUBLE'
			-- in signatures of basic expanded classes in FreeELKS.
		once
			create Result.make (6, 2, 7, 2906)
		ensure
			instance_free: class
			ise_6_2_7_2906: Result /= Void
		end

	ise_6_2_latest: UT_VERSION
			-- After the last release ISE 6.2
		once
			create Result.make_major_minor (6, 2)
		ensure
			instance_free: class
			ise_6_2_latest_not_void: Result /= Void
		end

	ise_6_3_0: UT_VERSION
			-- ISE 6.3.0
		once
			create Result.make (6, 3, 0, 0)
		ensure
			instance_free: class
			ise_6_3_0_not_void: Result /= Void
		end

	ise_6_3_7_4554: UT_VERSION
			-- ISE 6.3.7.4554
			-- First release with the 'variant' clause at the end
			-- of the 'loop' instruction.
			-- First release with support for keyword 'attribute'.
		once
			create Result.make (6, 3, 7, 4554)
		ensure
			instance_free: class
			ise_6_3_7_4554_not_void: Result /= Void
		end

	ise_6_3_7_5660: UT_VERSION
			-- ISE 6.3.7.5660
			-- First release that accepts object-tests in preconditions and check instructions.
		once
			create Result.make (6, 3, 7, 5660)
		ensure
			instance_free: class
			ise_6_3_7_5660_not_void: Result /= Void
		end

	ise_6_3_latest: UT_VERSION
			-- After the last release ISE 6.3
		once
			create Result.make_major_minor (6, 3)
		ensure
			instance_free: class
			ise_6_3_latest_not_void: Result /= Void
		end

	ise_6_4_0: UT_VERSION
			-- ISE 6.4.0
		once
			create Result.make (6, 4, 0, 0)
		ensure
			instance_free: class
			ise_6_4_0_not_void: Result /= Void
		end

	ise_6_4_7_6592: UT_VERSION
			-- ISE 6.4.7.6592
			-- First release where keywords 'attribute' and 'note'
			-- are accepted by default.
		once
			create Result.make (6, 4, 7, 6592)
		ensure
			instance_free: class
			ise_6_4_7_6592_not_void: Result /= Void
		end

	ise_6_4_7_7252: UT_VERSION
			-- ISE 6.4.7.7252
			-- First release that accepts keywords 'attached' and 'detachable'.
			-- First release that accepts to have several object-tests with
			-- the same local name in a given feature or inline agent, provided
			-- that their scopes do not overlap.
		once
			create Result.make (6, 4, 7, 7252)
		ensure
			instance_free: class
			ise_6_4_7_7252_not_void: Result /= Void
		end

	ise_6_4_latest: UT_VERSION
			-- After the last release ISE 6.4
		once
			create Result.make_major_minor (6, 4)
		ensure
			instance_free: class
			ise_6_4_latest_not_void: Result /= Void
		end

	ise_6_5_0: UT_VERSION
			-- ISE 6.5.0
		once
			create Result.make (6, 5, 0, 0)
		ensure
			instance_free: class
			ise_6_5_0_not_void: Result /= Void
		end

	ise_6_5_latest: UT_VERSION
			-- After the last release ISE 6.5
		once
			create Result.make_major_minor (6, 5)
		ensure
			instance_free: class
			ise_6_5_latest_not_void: Result /= Void
		end

	ise_6_6_0: UT_VERSION
			-- ISE 6.6.0
		once
			create Result.make (6, 6, 0, 0)
		ensure
			instance_free: class
			ise_6_6_0_not_void: Result /= Void
		end

	ise_6_6_latest: UT_VERSION
			-- After the last release ISE 6.6
		once
			create Result.make_major_minor (6, 6)
		ensure
			instance_free: class
			ise_6_6_latest_not_void: Result /= Void
		end

	ise_17_11_0: UT_VERSION
			-- ISE 17.11.0
		once
			create Result.make (17, 11, 0, 0)
		ensure
			instance_free: class
			ise_17_11_0_not_void: Result /= Void
		end

	ise_latest: UT_VERSION
			-- After the latest release of ISE
		once
			create Result.make_latest
		ensure
			instance_free: class
			ise_latest_not_void: Result /= Void
		end

end
