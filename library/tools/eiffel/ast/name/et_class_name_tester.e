indexing

	description:

		"Class name equality testers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_CLASS_NAME_TESTER

inherit

	DS_EQUALITY_TESTER [ET_CLASS_NAME]
		redefine
			test
		end

feature -- Status report

	test (v, u: ET_CLASS_NAME): BOOLEAN is
			-- Are `v' and `u' considered equal?
		do
			if v = Void then
				Result := (u = Void)
			elseif u = Void then
				Result := False
			else
				Result := v.same_class_name (u)
			end
		end

end
