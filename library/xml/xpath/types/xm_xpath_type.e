indexing

	description:

		"XPath types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TYPE

inherit

	XM_XPATH_SHARED_TYPE_FACTORY

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_STANDARD_NAMESPACES

feature -- Access

	-- The following are the DOM node type definitions for those nodes
	-- actually used by XPath;
	-- All should be INTEGER_16 when this is available

	Element_node: INTEGER is 1
	Attribute_node: INTEGER is 2
	Text_node: INTEGER is 3
	Processing_instruction_node: INTEGER is 7
	Comment_node: INTEGER is 8
	Document_node: INTEGER is 9
	Namespace_node: INTEGER is 13

	Any_node: INTEGER is 0

	Any_item_fingerprint: INTEGER is 88

	common_super_type (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE is
			-- Common supertype of two given types
		require
			types_not_void: t1 /= Void and then t2 /= void
		local
			a_no_node_test: XM_XPATH_NO_NODE_TEST
		do
			a_no_node_test ?= t1
			if a_no_node_test /= Void then
				Result := t2
			else
				a_no_node_test ?= t2
				if a_no_node_test /= Void then
					Result := t1
				elseif t1 = t2 then
					Result := t1
				elseif is_sub_type (t1, t2) then
					Result := t2
				elseif is_sub_type (t2, t1) then
					Result := t1
				else
					Result := common_super_type (t2.super_type, t1)
					
					-- eventually we will hit a type that is a supertype of t2. We reverse
					-- the arguments so we go up each branch of the tree alternately.
					-- If we hit the root of the tree, one of the earlier conditions will be satisfied,
					-- so the recursion will stop.
				end
			end
		ensure
			result_not_void: Result /= void
		end

	node_type_name (a_node_type: INTEGER): STRING is
			-- name of `a_node_type'
		require
			valid_node_type: is_node_type (a_node_type)
		do
			inspect
				a_node_type
			when Element_node then
				Result := "element"
			when Document_node then
				Result := "document"
			when Text_node then
				Result := "text"
			when Comment_node then
				Result := "comment"
			when Attribute_node then
				Result := "attribute"
			when Namespace_node then
				Result := "namespace"
			when Processing_instruction_node then
				Result := "processing-instruction"
			when Any_node then
				Result := "node()"
			end
		ensure
			node_type_name_not_void: Result /= Void
		end

feature -- Status report

	is_node_type (a_type: INTEGER): BOOLEAN is
			-- `True' if `a_type' type is node() or a subtype of node()
		do
			Result := a_type = Element_node
				or else a_type = Attribute_node
				or else a_type = Text_node
				or else a_type = Processing_instruction_node
				or else a_type = Comment_node
				or else a_type = Document_node
				or else a_type = Namespace_node
				or else a_type = Any_node
		end

	is_node_item_type (a_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- `True' if `a_type' is node() or a subtype of node()
		require
			type_not_void: a_type /= Void
		local
			a_node_test: XM_XPATH_NODE_TEST
		do
			a_node_test ?= a_type
			Result := a_node_test /= void
		end
	
	is_sub_type (a_sub_type, a_super_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `a_sub_type' a (non-proper) descendant of `a_super_type'?
		require
			super_type_not_void: a_super_type /= Void
		local
			a_no_node_test: XM_XPATH_NO_NODE_TEST
		do
			if a_sub_type /= Void then
				if a_sub_type.is_same_type (a_super_type) then
					Result := True
				else
					if any_item = a_super_type then
						Result := True
					elseif any_item = a_sub_type then
							Result := False
					else
						a_no_node_test ?= a_sub_type
						if a_no_node_test /= Void then
							Result := True
						else
							Result := is_sub_type (a_sub_type.super_type, a_super_type)
						end
					end
				end
			end
		end
	
	is_promotable (a_source_type, a_target_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Can `a_source_type' be numerically promoted to `a_target_type?
			--  (e.g. xs:integer is promotable to xs:double)
		require
			target_type_not_void: a_target_type /= Void
		do
			if is_sub_type (a_source_type, type_factory.decimal_type) then
				Result := a_target_type = type_factory.double_type
			end
		end

	are_types_comparable (a_type, another_type: INTEGER): BOOLEAN is
			-- Is `a_type' comparable with `another_type'?
		local
			t1, t2: INTEGER
		do
			if a_type = Any_atomic_type_code or else
				another_type = Any_atomic_type_code then
				Result := True -- as far as we know
			else
				t1 := a_type
				t2 := another_type
				if t1 = Untyped_atomic_type_code then
					t1 := String_type_code
				end
				if t2 = Untyped_atomic_type_code then
					t2 := String_type_code
				end
				if t1 = Double_type_code or else
					t1 = Decimal_type_code or else
					t1 = Float_type_code or else
					t1 = Integer_type_code then
					t1 := Numeric_type_code
				end
				if t2 = Integer_type_code or else
					t2 = Decimal_type_code or else
					t2 = Float_type_code or else
					t2 = Double_type_code then
					t2 := Numeric_type_code
				end
				Result := t1 = t2
			end
		end

end
