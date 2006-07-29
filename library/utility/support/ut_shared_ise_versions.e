indexing

	description:

		"Shared ISE Eiffel version numbers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_SHARED_ISE_VERSIONS

inherit

	ANY -- Needed for SE.

feature -- Access

	ise_5_6_0: UT_VERSION is
			-- ISE 5.6.0
		once
			create Result.make (5, 6, 0)
		ensure
			ise_5_6_0_not_void: Result /= Void
		end

	ise_5_6_latest: UT_VERSION is
			-- After the last release ISE 5.6
		once
			create Result.make_major_minor (5, 6)
		ensure
			ise_5_6_latest_not_void: Result /= Void
		end

	ise_5_7_0: UT_VERSION is
			-- ISE 5.7.0
		once
			create Result.make (5, 7, 0)
		ensure
			ise_5_7_0_not_void: Result /= Void
		end

	ise_5_7_0827: UT_VERSION is
			-- ISE 5.7.0827
			-- Last release with EIFGEN and Ace.
			-- Following releases use EIFGENs and ecf.
		once
			create Result.make (5, 7, 0827)
		ensure
			ise_5_7_0827_not_void: Result /= Void
		end

	ise_5_7_60362: UT_VERSION is
			-- ISE 5.7.60362
			-- First release with basic type mapping:
			--  STRING -> STRING_8
			--  INTEGER -> INTEGER_32
			--  etc.
		once
			create Result.make (5, 7, 60362)
		ensure
			ise_5_7_60362_not_void: Result /= Void
		end

	ise_5_7_latest: UT_VERSION is
			-- After the last release ISE 5.7
		once
			create Result.make_major_minor (5, 7)
		ensure
			ise_5_7_latest_not_void: Result /= Void
		end

	ise_latest: UT_VERSION is
			-- After the latest release of ISE
		once
			create Result.make_latest
		ensure
			ise_latest_not_void: Result /= Void
		end

end
