indexing
	
	description:
	
		"Test no namespace parsing event tester"
		
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_NO_NAMESPACE_CHECKER

inherit

	XM_NAMESPACE_CHECKER
		rename
			check_namespace as check_local_part
		redefine
			on_start_tag,
			on_attribute
		end
		
creation

	make_null, set_next
	
feature

	on_start_tag (a_ns, a_pre, a_local: STRING) is
		do
			check_local_part (a_local)
			next.on_start_tag (a_ns, a_pre, a_local)
		end
		
	on_attribute (a_ns, a_pre, a_local: STRING; a_value: STRING) is
		do
			check_local_part (a_local)
			next.on_attribute (a_ns, a_pre, a_local, a_value)
		end

end
