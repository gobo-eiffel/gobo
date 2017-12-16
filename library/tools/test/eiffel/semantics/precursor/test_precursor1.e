note

	description:

		"Test semantics of precursor expression calling itself another precursor"

	remark: "[
		This test is to reproduce a bug in gec/gelint reported in SourceForge as:
			bug#1867666: Precursor of Precursor
		See:
			https://sourceforge.net/tracker/index.php?func=detail&aid=1867666&group_id=24591&atid=381937

		The problem is that the Result type of the Precursor of the Precursor was
		not interpreted in the right context. Having 'ARRAY [G]' (from class 'BB')
		in the context of 'DD' is meaningless since 'DD' is not generic, hence
		the weird error:

			[VJAR] class DD (CC,14,14): the source of the assignment (of type
			'ARRAY [*UNKNOWN*]') does not conform nor convert to its target entity
			(of type 'ARRAY [INTEGER]').
	]"

	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_PRECURSOR1

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_precursor
			-- Test precursor of precursor expression.
		local
			d: DD
		do
			create d
			assert ("not_void", d.f /= Void)
			assert_integers_equal ("count", 2, d.f.count)
		end

end
