note

	description:

		"Test features of class DIRECTORY"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2006-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_DIRECTORY

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_has_entry
			-- Test feature 'has_entry'.
		local
			d: DIRECTORY
		do
			create d.make (".")
			assert ("has1", d.has_entry ("TESTGEN"))
			assert ("has2", d.has_entry ("."))
			assert ("has3", d.has_entry (".."))
			assert ("not_has1", not d.has_entry ("foo.bar"))
		end

end
