indexing

	description:

		"XPath axis definitions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AXIS

feature -- Access

	Ancestor_axis: INTEGER is 1
	Ancestor_or_self_axis: INTEGER is 2
	Attribute_axis: INTEGER is 3
	Child_axis: INTEGER is 4
	Descendant_axis: INTEGER is 5
	Descendant_or_self_axis: INTEGER is 6
	Following_axis: INTEGER is 7
	Following_sibling_axis: INTEGER is 8
	Parent_axis: INTEGER is 9
	Preceding_axis: INTEGER is 10
	Preceding_sibling_axis: INTEGER is 11
	Self_axis: INTEGER is 12
	Preceding_or_ancestor_axis: INTEGER is 13
			-- Used internally by xsl:number implementation
	
feature -- Status report

	is_axis_valid (axis: INTEGER): BOOLEAN is
			-- Is `axis' a valid axis?
		do
			Result := axis >= Ancestor_axis and then axis <= Preceding_or_ancestor_axis
		end
	
end
	
