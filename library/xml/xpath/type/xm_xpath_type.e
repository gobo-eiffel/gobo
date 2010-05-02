note

	description:

		"XPath types"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TYPE

inherit

	ANY -- required by SE 2.1b1

	KL_CLONABLE

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

	XM_XPATH_SHARED_ANY_ITEM_TYPE
		export {NONE} all end

	XM_XPATH_SHARED_NO_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

feature -- Access

	-- The following are the DOM node type definitions for those nodes
	-- actually used by XPath;
	-- All should be INTEGER_16 when this is available

	Element_node: INTEGER = 1
	Attribute_node: INTEGER = 2
	Text_node: INTEGER = 3
	Processing_instruction_node: INTEGER = 7
	Comment_node: INTEGER = 8
	Document_node: INTEGER = 9
	Namespace_node: INTEGER = 13

	Any_node: INTEGER = 0

	Any_item_fingerprint: INTEGER = 88

	Same_item_type: INTEGER = 1
	Subsuming_type: INTEGER = 2
	Subsumed_type: INTEGER = 3
	Overlapping_types: INTEGER = 4
	Disjoint_types: INTEGER = 5
			-- Type realtionships

	node_kind_description (a_node_kind: INTEGER): STRING
			-- Node test description
		require
			valid_node_type: is_node_type (a_node_kind)
		do
			inspect
				a_node_kind
			when Document_node then
				Result := "document-node()"
			when Element_node then
				Result := "element()"
			when Attribute_node then
				Result := "attribute()"
			when Comment_node then
				Result := "comment()"
			when Text_node then
				Result := "text()"
			when Processing_instruction_node then
				Result := "processing-instruction()"
			when Namespace_node then
				Result := "namespace()"
			else
				Result := "Unexpected node kind"
			end
		ensure
			result_not_void: Result /= Void
		end

	common_super_type (t1, t2: XM_XPATH_ITEM_TYPE): XM_XPATH_ITEM_TYPE
			-- Common supertype of two given types
		require
			types_not_void: t1 /= Void and then t2 /= void
		do
			if t1.is_no_node_test then
				Result := t2
			else
				if t2.is_no_node_test then
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

	node_type_name (a_node_type: INTEGER): STRING
			-- Name of `a_node_type'
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
			when Processing_instruction_node then
				Result := "processing-instruction"
			when Namespace_node then
				Result := "namespace"
			when Any_node then
				Result := "node()"
			end
		ensure
			node_type_name_not_void: Result /= Void
		end

	built_in_item_type (a_uri, a_local_name: STRING): XM_XPATH_ITEM_TYPE
			-- Built-in type named by `a_uri', `a_local_name'
		require
			uri_not_void: a_uri /= Void
			local_name_not_void: a_local_name /= Void
		local
			a_fingerprint: INTEGER
		do
			if is_reserved_namespace (a_uri) then
				a_fingerprint := type_factory.standard_fingerprint (a_uri, a_local_name)
				if a_fingerprint /= -1 then
					Result := type_factory.schema_type (a_fingerprint)
				end
			end
		end

feature -- Status report

	is_node_type (a_type: INTEGER): BOOLEAN
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

	is_node_item_type (a_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- `True' if `a_type' is node() or a subtype of node()
		require
			type_not_void: a_type /= Void
		do
			Result := is_sub_type (a_type, any_node_test)
		end

	is_atomic_item_type (a_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- `True' if `a_type' is an atomic value
		require
			type_not_void: a_type /= Void
		do
			Result := is_sub_type (a_type, type_factory.any_atomic_type)
		end

	is_numeric_primitive_type (a_fingerprint: INTEGER): BOOLEAN
			-- Is `a_fingerprint' a primitive numeric type?
		do
			Result := a_fingerprint = Integer_type_code or
				a_fingerprint = Double_type_code or
				a_fingerprint = Float_type_code or
				a_fingerprint = Decimal_type_code or
				a_fingerprint = Numeric_type_code
		end

	is_sub_type (a_sub_type, a_super_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `a_sub_type' a (non-proper) descendant of `a_super_type'?
		require
			super_type_not_void: a_super_type /= Void
		local
			a_relationship: INTEGER
		do
			if a_sub_type /= Void then
				a_relationship := type_relationship (a_sub_type, a_super_type)
				Result := a_relationship = Same_item_type or else a_relationship = Subsumed_type
			end
		end

	type_relationship (a_first_type, a_second_type: XM_XPATH_ITEM_TYPE): INTEGER
			-- Relation of `a_first_type' to `a_second_type'
		require
			types_not_void: a_first_type /= Void and then a_second_type /= Void
		local
			an_item_type: XM_XPATH_ITEM_TYPE
			finished: BOOLEAN
			a_fingerprint: INTEGER
		do
			if a_first_type.is_same_type (a_second_type) then
				Result := Same_item_type
			elseif a_first_type = any_item then
				if a_second_type = any_item then
					Result := Same_item_type
				else
					Result := Subsuming_type
				end
			elseif a_second_type = any_item then
				Result := Subsumed_type
			else
				if a_first_type.is_atomic_type then
					if a_second_type.is_node_test then
						Result := Disjoint_types
					else
						a_fingerprint := a_first_type.as_atomic_type.fingerprint
						if a_second_type.is_atomic_type and then
							a_fingerprint = a_second_type.as_atomic_type.fingerprint then
							Result := Same_item_type
						else
							Result := -1
							from
								an_item_type := a_second_type
							until
								finished
							loop
								if not an_item_type.is_atomic_type then
									finished := True
								else
									if a_fingerprint = an_item_type.as_atomic_type.fingerprint then
										Result := Subsuming_type
										finished := True
									else
										an_item_type := an_item_type.super_type
									end
								end
							end
							if Result = -1 then
								from
									finished := False
									a_fingerprint := a_second_type.as_atomic_type.fingerprint
									an_item_type := a_first_type
								until
									finished
								loop
									if not an_item_type.is_atomic_type then
										Result := Disjoint_types
										finished := True
									else
										if a_fingerprint = an_item_type.as_atomic_type.fingerprint then
											Result := Subsumed_type
											finished := True
										else
											an_item_type := an_item_type.super_type
										end
									end
								end
							end
						end
					end
				else

					-- `a_first_type' must be a node test

					if a_second_type.is_atomic_type then
						Result := Disjoint_types
					else
						check
							both_node_tests: a_first_type.is_node_test and then a_second_type.is_node_test
						end
						Result := node_test_relationship (a_first_type.as_node_test, a_second_type.as_node_test)
					end
				end
			end
		ensure
			valid_relationship: Result >= Same_item_type and then Disjoint_types >= Result
		end

	is_promotable (a_source_type, a_target_type: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Can `a_source_type' be numerically promoted to `a_target_type?
			--  (e.g. xs:integer is promotable to xs:double)
		require
			target_type_not_void: a_target_type /= Void
		do
			if is_sub_type (a_source_type, type_factory.decimal_type) then
				Result := a_target_type = type_factory.double_type
			end
		end

	are_types_comparable (a_type, another_type: INTEGER): BOOLEAN
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
				if t1 = Any_uri_type_code then
					t1 := String_type_code
				end
				if t2 = Any_uri_type_code then
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

	is_ordered (a_type: INTEGER): BOOLEAN
			-- Is primitive type `a_type' ordered according to the XPath (not XML Schema) rules?
		do
			inspect
				a_type
			when
				Any_atomic_type_code, Integer_type_code, Double_type_code,
				Float_type_code, Decimal_type_code, Numeric_type_code,
				Boolean_type_code, String_type_code, Any_uri_type_code,
				Date_time_type_code, Date_type_code, Time_type_code,
				Year_month_duration_type_code, Day_time_duration_type_code
			 then
				Result := True
			else
				Result := False
			end
		end

feature {NONE} -- Implementation

	node_test_relationship (a_node_test, another_node_test: XM_XPATH_NODE_TEST): INTEGER
			-- Relation of `a_node_test' to `another_node_test'
		require
			tests_not_void: a_node_test /= Void and then another_node_test /= Void
		local
			a_mask, another_mask, a_node_kind_relationship: INTEGER
		do
			Result := -1
			if a_node_test = any_node_test then
				if another_node_test = any_node_test then
					Result := Same_item_type
				else
					Result := Subsuming_type
				end
			elseif another_node_test = any_node_test then
				Result := Subsumed_type
			elseif a_node_test = empty_item then
				Result := Disjoint_types
			elseif another_node_test = empty_item then
				Result := Disjoint_types
			else

				-- Firstly, find the relationship between the node kinds allowed.

				a_mask := a_node_test.node_kind_mask; another_mask := another_node_test.node_kind_mask
				if INTEGER_.bit_and (a_mask, another_mask) = 0 then
					Result := Disjoint_types
				elseif a_mask = another_mask then
					a_node_kind_relationship := Same_item_type
				elseif INTEGER_.bit_and (a_mask, another_mask) = a_mask then
					a_node_kind_relationship := Subsumed_type
				elseif INTEGER_.bit_and (a_mask, another_mask) = another_mask then
					a_node_kind_relationship := Subsuming_type
				else
					a_node_kind_relationship := Overlapping_types
				end

				if Result /= Disjoint_types then Result := non_trivial_node_test_relationship (a_node_test, another_node_test, a_node_kind_relationship) end
			end
		ensure
			valid_relationship: Result >= Same_item_type and then Disjoint_types >= Result
		end

	non_trivial_node_test_relationship (a_node_test, another_node_test: XM_XPATH_NODE_TEST; a_node_kind_relationship: INTEGER): INTEGER
			-- Relation of `a_node_test' to `another_node_test'
		require
			tests_not_void: a_node_test /= Void and then another_node_test /= Void
			valid_relationship: a_node_kind_relationship >= Same_item_type and then Overlapping_types >= a_node_kind_relationship
		local
			a_node_name_relationship, a_content_relationship: INTEGER
		do
			a_node_name_relationship := node_name_relationship (a_node_test, another_node_test)
			a_content_relationship := content_relationship (a_node_test, another_node_test)

			if a_node_kind_relationship = Same_item_type
				and then a_node_name_relationship = Same_item_type and then a_content_relationship = Same_item_type then
				Result := Same_item_type
			elseif
				(a_node_name_relationship = Same_item_type or else a_node_name_relationship = Subsuming_type) and then
				(a_node_kind_relationship = Same_item_type or else a_node_kind_relationship = Subsuming_type) and then
				(a_content_relationship = Same_item_type or else a_content_relationship = Subsuming_type) then
				Result := Subsuming_type
			elseif
				(a_node_name_relationship = Same_item_type or else a_node_name_relationship = Subsumed_type) and then
				(a_content_relationship = Same_item_type or else a_content_relationship = Subsumed_type) and then
				(a_node_kind_relationship = Same_item_type or else a_node_kind_relationship = Subsumed_type) then
				Result := Subsumed_type
			elseif a_node_name_relationship = Disjoint_types or else a_node_kind_relationship = Disjoint_types or else a_content_relationship = Disjoint_types then
				Result := Disjoint_types
			else
				Result := Overlapping_types
			end
		ensure
			valid_relationship: Result >= Same_item_type and then Disjoint_types >= Result
		end

	node_name_relationship (a_node_test, another_node_test: XM_XPATH_NODE_TEST): INTEGER
			-- Relationship between two node names;
			-- N.B. Namespace tests and local name tests do not occur
			--  in sequence types, so we don't need to consider them.
		require
			tests_not_void: a_node_test /= Void and then another_node_test /= Void
		local
			a_set, another_set: DS_SET [INTEGER]
		do
			if a_node_test.is_at_most_one_name_constraint then
				a_set := a_node_test.constraining_node_names
			end
			if another_node_test.is_at_most_one_name_constraint then
				another_set := another_node_test.constraining_node_names
			end
			if a_set = Void then
				if another_set = Void then
					Result := Same_item_type
				else
					Result := Subsuming_type
				end
			elseif another_set = Void then
				Result := Subsumed_type
			elseif a_set.is_superset (another_set) then
				if a_set.is_equal (another_set) then
					Result := Same_item_type
				else
					Result := Subsuming_type
				end
			elseif another_set.is_superset (a_set) then
				Result := Subsumed_type
			else
				another_set.intersect (a_set)
				if another_set.count = 0 then
					Result := Disjoint_types
				else
					Result := Overlapping_types
				end
			end
		ensure
			valid_relationship: Result >= Same_item_type and then Disjoint_types >= Result
		end

	content_relationship (a_node_test, another_node_test: XM_XPATH_NODE_TEST): INTEGER
			-- Relationship between two node contents
		require
			tests_not_void: a_node_test /= Void and then another_node_test /= Void
		do
			if a_node_test.is_document_node_test then
				if another_node_test.is_document_node_test then
					Result := type_relationship (a_node_test.as_document_node_test.element_test, another_node_test.as_document_node_test.element_test)
				else
					Result := Subsuming_type
				end
			else
				if another_node_test.is_document_node_test then
					Result := Subsuming_type
				else
					Result := schema_type_relationship (a_node_test.content_type, another_node_test.content_type)
				end
			end
		ensure
			valid_relationship: Result >= Same_item_type and then Disjoint_types >= Result
		end

	schema_type_relationship (a_content_type, another_content_type: XM_XPATH_SCHEMA_TYPE): INTEGER
			-- Relationship between two content types
		require
			types_not_void: a_content_type /= Void and then another_content_type /= Void
		local
			finished: BOOLEAN
			a_type: XM_XPATH_SCHEMA_TYPE
		do
			if a_content_type.is_same_type (another_content_type) then
				Result := Same_item_type
			elseif a_content_type.is_any_type then
				Result := Subsuming_type
			elseif another_content_type.is_any_type then
				Result := Subsumed_type
			else
				from
					a_type := a_content_type
				until
					finished or else a_type = Void
				loop
					a_type := a_type.base_type
					if a_type /= Void then
						if a_type.is_same_type (another_content_type) then
							Result := Subsumed_type
							finished := True
						end
					end
				end
				if not finished then
					from
						a_type := another_content_type; finished := False
					until
						finished or else a_type = Void
					loop
						a_type := a_type.base_type
						if a_type /= Void then
							if a_type.is_same_type (a_type) then
								Result := Subsuming_type
								finished := True
							end
						end
					end
					if not finished then Result := Disjoint_types end
				end
			end
		ensure
			valid_relationship: Result >= Same_item_type and then Disjoint_types >= Result
		end

end
