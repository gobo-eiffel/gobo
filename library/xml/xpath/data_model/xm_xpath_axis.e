indexing

	description:

		"XPath axis definitions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_AXIS

inherit

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

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

	axis_number (an_axis: STRING): INTEGER is
			-- Numeric axis indication
		require
			valid_axis_name: is_axis_name_valid (an_axis)
		do
			if STRING_.same_string ("ancestor", an_axis) then
				Result := Ancestor_axis
			elseif STRING_.same_string ("ancestor-or-self", an_axis) then
				Result := Ancestor_or_self_axis
			elseif STRING_.same_string ("attribute", an_axis) then
				Result := Attribute_axis
			elseif STRING_.same_string ("child", an_axis) then
				Result := Child_axis
			elseif STRING_.same_string ("descendant", an_axis) then
				Result := Descendant_axis
			elseif STRING_.same_string ("descendant-or-self", an_axis) then
				Result := Descendant_or_self_axis
			elseif STRING_.same_string ("following", an_axis) then
				Result := Following_axis
			elseif STRING_.same_string ("following-sibling", an_axis) then
				Result := Following_sibling_axis
			elseif STRING_.same_string ("parent", an_axis) then
				Result := Parent_axis
			elseif STRING_.same_string ("preceding", an_axis) then
				Result := Preceding_axis
			elseif STRING_.same_string ("preceding-sibling", an_axis) then
				Result := Preceding_sibling_axis
			elseif STRING_.same_string ("self", an_axis) then
				Result := Self_axis
			end
		ensure
			axis_number_in_range: Ancestor_axis <= Result and then Result < Preceding_or_ancestor_axis -- (can't be used in XPath expression)
		end

	axis_name (an_axis: INTEGER): STRING is
			-- Name of axis
		require
			valid_axis: is_axis_valid (an_axis)
		do
			inspect
				an_axis
			when Ancestor_axis then
				Result := "ancestor"
			when Ancestor_or_self_axis then
				Result := "ancestor-or-seld"
			when Attribute_axis then
				Result := "attribute"
			when Child_axis then
				Result := "child"
			when Descendant_axis then
				Result := "descendant"
			when Descendant_or_self_axis then
				Result := "descendant-or-self"
			when Following_axis then
				Result := "following"
			when Following_sibling_axis then
				Result := "following-sibling"
			when Self_axis then
				Result := "self"
			when Parent_axis then
				Result := "parent"
			when Preceding_axis then
				Result := "preceding"
			when Preceding_sibling_axis then
				Result := "preceding-sibling"
			end
		ensure
			axis_name_not_void: Result /= Void
			correct_axis_name: axis_number (Result) = an_axis
		end

	axis_principal_node_type (an_axis: INTEGER): INTEGER is
		require
			valid_axis: is_axis_valid (an_axis)
		do
			if	an_axis = Attribute_axis then
				Result := Attribute_node
			else
				Result := Element_node
			end
		ensure
			axis_number_in_range: Result = Attribute_node or else Result = Element_node			
		end

feature -- Status report

	is_axis_valid (an_axis: INTEGER): BOOLEAN is
			-- Is `an_axis' a valid axis?
		do
			Result := an_axis >= Ancestor_axis and then an_axis <= Preceding_or_ancestor_axis
		end

	is_axis_name_valid (an_axis: STRING): BOOLEAN is
		require
			axis_name_not_void: an_axis /= Void
		do
			if STRING_.same_string ("ancestor", an_axis) then
				Result := True
			elseif STRING_.same_string ("ancestor-or-self", an_axis) then
				Result := True
			elseif STRING_.same_string ("attribute", an_axis) then
				Result := True
			elseif STRING_.same_string ("child", an_axis) then
				Result := True
			elseif STRING_.same_string ("descendant", an_axis) then
				Result := True
			elseif STRING_.same_string ("descendant-or-self", an_axis) then
				Result := True
			elseif STRING_.same_string ("following", an_axis) then
				Result := True
			elseif STRING_.same_string ("following-sibling", an_axis) then
				Result := True
			elseif STRING_.same_string ("parent", an_axis) then
				Result := True
			elseif STRING_.same_string ("preceding", an_axis) then
				Result := True
			elseif STRING_.same_string ("preceding-sibling", an_axis) then
				Result := True
			elseif STRING_.same_string ("self", an_axis) then
				Result := True
			else
				Result := False
			end				
		end

	is_forward_axis (an_axis: INTEGER): BOOLEAN is
			-- Is `an_axis' traveresed in reverse document order?
		require
			valid_axis: is_axis_valid (an_axis)
		do
			inspect
				an_axis
			when Attribute_axis then
				Result := True
			when Child_axis then
				Result := True
			when Descendant_axis then
				Result := True
			when Descendant_or_self_axis then
				Result := True
			when Following_axis then
				Result := True
			when Following_sibling_axis then
				Result := True
			when Self_axis then
				Result := True
			when Parent_axis then
				Result := True
			else
				Result := False
			end
		end

	is_reverse_axis (an_axis: INTEGER): BOOLEAN is
			-- Is `an_axis' traveresed in reverse document order?
		require
			valid_axis: is_axis_valid (an_axis)
		do
			inspect
				an_axis
			when Ancestor_axis then
				Result := True
			when Ancestor_or_self_axis then
				Result := True
			when Parent_axis then
				Result := True
			when Preceding_axis then
				Result := True
			when Preceding_sibling_axis then
				Result := True
			when Self_axis then
				Result := True
			when Preceding_or_ancestor_axis then
				Result := True
			else
				Result := False
			end
		end

	is_peer_axis (an_axis: INTEGER): BOOLEAN is
			-- Does `an_axis' have any nodes which are ancestors of others on same axis?
		require
			valid_axis: is_axis_valid (an_axis)
		do
			inspect
				an_axis
			when Attribute_axis then
				Result := True
			when Child_axis then
				Result := True
			when Following_sibling_axis then
				Result := True
			when Preceding_sibling_axis then
				Result := True				
			when Self_axis then
				Result := True
			when Parent_axis then
				Result := True
			else
				Result := False
			end
		end

	is_subtree_axis (an_axis: INTEGER): BOOLEAN is
			-- Is `an_axis' a sub-tree rooted at origin node?
		require
			valid_axis: is_axis_valid (an_axis)
		do
			inspect
				an_axis
			when Attribute_axis then
				Result := True
			when Child_axis then
				Result := True
			when Self_axis then
				Result := True
			when Descendant_axis then
				Result := True
			when Descendant_or_self_axis then
				Result := True
			else
				Result := False
			end
		end

	is_axis_always_empty (an_axis, a_node_kind: INTEGER): BOOLEAN is
			-- Is `an_axis' always empty of nodes of type `a_node_kind'?
		require
			valid_axis: is_axis_valid (an_axis)
			valid_node_type: is_node_type (a_node_kind)
		do
			Result := INTEGER_.bit_and (empty_axis_table.item (an_axis), INTEGER_.bit_shift_left (1, a_node_kind)) /= 0
		end

	axis_contains_node_kind (an_axis, a_node_kind: INTEGER): BOOLEAN is
			-- Does `an_axis' contain nodes of type `a_node_kind'?
		require
			valid_axis: is_axis_valid (an_axis)
			valid_node_type: is_node_type (a_node_kind)
		do
			Result :=  INTEGER_.bit_and (axis_node_kind_table.item (an_axis), INTEGER_.bit_shift_left (1, a_node_kind)) /= 0
		end
			
feature {NONE} -- Implementation


	document_kind: INTEGER is
		once
			Result := INTEGER_.bit_shift_left (1, Document_node)
		end

	element_kind: INTEGER is
		once
			Result := INTEGER_.bit_shift_left (1, Element_node)
		end

	attribute_kind: INTEGER is
		once
			Result := INTEGER_.bit_shift_left (1, Attribute_node)
		end

	comment_kind: INTEGER is
		once
			Result := INTEGER_.bit_shift_left (1, Comment_node)
		end

	processing_instruction_kind: INTEGER is
		once
			Result := INTEGER_.bit_shift_left (1, Processing_instruction_node)
		end

	text_kind: INTEGER is
		once
			Result := INTEGER_.bit_shift_left (1, Text_node)
		end

	miscellaneous_kinds: INTEGER is
			-- Mask for commonly used multiple kinds
		once
			Result := INTEGER_.bit_or (comment_kind,
												INTEGER_.bit_or (processing_instruction_kind, text_kind))
																																	 
		end

	empty_axis_table: ARRAY [INTEGER] is
		-- Table used by `is_axis_always_empty'
		once
			create Result.make (Ancestor_axis, Preceding_or_ancestor_axis)
			Result.put (document_kind, Ancestor_axis)
			Result.put (0, Ancestor_or_self_axis)
			Result.put (INTEGER_.bit_or (document_kind, INTEGER_.bit_or (miscellaneous_kinds, attribute_kind)), Attribute_axis)
			Result.put (INTEGER_.bit_or (miscellaneous_kinds, attribute_kind), Child_axis)
			Result.put (INTEGER_.bit_or (miscellaneous_kinds, attribute_kind), Descendant_axis)
			Result.put (0, Descendant_or_self_axis)
			Result.put (document_kind, Following_axis)
			Result.put (INTEGER_.bit_or (document_kind, attribute_kind), Following_sibling_axis)
			Result.put (document_kind, Parent_axis)
			Result.put (document_kind, Preceding_axis)
			Result.put (INTEGER_.bit_or (document_kind, attribute_kind), Preceding_sibling_axis)
			Result.put (0, Self_axis)
		end
	
	axis_node_kind_table: ARRAY [INTEGER] is
		-- Table uses by `axis_contains_node_kind'
		once
			create Result.make (Ancestor_axis, Preceding_or_ancestor_axis)
			Result.put (INTEGER_.bit_or (document_kind, element_kind), Ancestor_axis)
			Result.put (INTEGER_.bit_or (document_kind, INTEGER_.bit_or (attribute_kind, INTEGER_.bit_or (element_kind, miscellaneous_kinds))), Ancestor_or_self_axis)
			Result.put (attribute_kind, Attribute_axis)
			Result.put (INTEGER_.bit_or (miscellaneous_kinds, element_kind), Child_axis)
			Result.put (INTEGER_.bit_or (miscellaneous_kinds, element_kind), Descendant_axis)
			Result.put (INTEGER_.bit_or (attribute_kind, INTEGER_.bit_or (document_kind, INTEGER_.bit_or (element_kind, miscellaneous_kinds))), Descendant_or_self_axis)
			Result.put (INTEGER_.bit_or (miscellaneous_kinds, element_kind), Following_axis)
			Result.put (INTEGER_.bit_or (miscellaneous_kinds, element_kind), Following_sibling_axis)
			Result.put (INTEGER_.bit_or (document_kind, element_kind), Parent_axis)
			Result.put (INTEGER_.bit_or (document_kind, INTEGER_.bit_or (element_kind, miscellaneous_kinds)), Preceding_axis)
			Result.put (INTEGER_.bit_or (element_kind, miscellaneous_kinds), Preceding_sibling_axis)
			Result.put (INTEGER_.bit_or (attribute_kind, INTEGER_.bit_or (document_kind, INTEGER_.bit_or (element_kind, miscellaneous_kinds))), Self_axis)
		end
	
end
	
