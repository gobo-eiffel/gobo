indexing

	description:

		"XSKT comparsion key testers"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPARISON_KEY_TESTER

inherit

	KL_EQUALITY_TESTER [XM_XSLT_COMPARISON_KEY]
		redefine
			test
		end

feature -- Status report

	test (v, u: XM_XSLT_COMPARISON_KEY): BOOLEAN is
			-- Are `v' and `u' considered equal?
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := v.same_key (u)
			end
		end
	
end
	
