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

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_SHARED_CONFORMANCE

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_EXCEPTIONS

	KL_SHARED_STANDARD_FILES

feature -- Initialization

	initialize_type_tables is
		do
			if type_names.all_default then

				define_type (Any_item, "item")
				define_type (Any_node, "node")
				define_type (Element_node, "element")
				define_type (Document_node, "document")
				define_type (Attribute_node, "attribute")
				define_type (Text_node, "text")
				define_type (Comment_node, "comment")
				define_type (Processing_instruction_node, "processing-instruction")
				define_type (Namespace_node, "namespace")

				define_type (Empty_item, "empty")
				if not conformance.basic_xslt_processor then
					define_type (Number_type, "number")
				end

				define_builtin_type (Untyped_atomic_type, "xdt:untypedAtomic")
				define_builtin_type (Untyped_type, "xdt:untyped")
				define_builtin_type (Atomic_type, "xdt:anyAtomicType")
				define_builtin_type (Year_month_duration_type, "xdt:yearMonthDuration")
				define_builtin_type (Day_Time_duration_type, "xdt:dayTimeDuration")

				define_builtin_type (String_type, "xs:string")
				define_builtin_type (Boolean_type, "xs:boolean")
				define_builtin_type (Decimal_type, "xs:decimal")
				if not conformance.basic_xslt_processor then
					define_builtin_type (Float_type, "xs:float")
				end
				define_builtin_type (Double_type, "xs:double")
				if not conformance.basic_xslt_processor then
					define_builtin_type (Duration_type, "xs:duration")
				end
				define_builtin_type (Date_time_type, "xs:dateTime")
				define_builtin_type (Time_type, "xs:time")
				define_builtin_type (Date_type, "xs:date")
				if not conformance.basic_xslt_processor then
					define_builtin_type (G_year_month_type, "xs:gYearMonth")
					define_builtin_type (G_year_type, "xs:gYear")
					define_builtin_type (G_month_day_type, "xs:gMonthDay")
					define_builtin_type (G_day_type, "xs:gDay")
					define_builtin_type (G_month_type, "xs:gMonth")
					define_builtin_type (Hex_binary_type, "xs:hexBinary");
					define_builtin_type (Base64_binary_type, "xs:base64Binary")
				end
				define_builtin_type (Any_uri_type, "xs:anyURI")
				define_builtin_type (Qname_type, "xs:QName")
				if not conformance.basic_xslt_processor then
					define_builtin_type (Notation_type, "xs:NOTAETION")
				end
				define_builtin_type (Integer_type, "xs:integer")
				if not conformance.basic_xslt_processor then
					define_builtin_type (Non_positive_integer_type,"xs:nonPositiveInteger")
					define_builtin_type (Negative_integer_type, "xs:negativeInteger")
					define_builtin_type (Long_type, "xs:long")
					define_builtin_type (Int_type, "xs:int")
					define_builtin_type (Short_type, "xs:short")
					define_builtin_type (Byte_type, "xs:byte")
					define_builtin_type (Non_negative_integer_type, "xs:nonNegativeInteger")
					define_builtin_type (Positive_integer_type, "xs:positiveInteger")
					define_builtin_type (Unsigned_long_type, "xs:unsignedLong")
					define_builtin_type (Unsigned_int_type, "xs:unsignedInt")
					define_builtin_type (Unsigned_short_type, "xs:unsignedShort")
					define_builtin_type (Unsigned_byte_type, "xs:unsignedByte")				
					define_builtin_type (Normalized_string_type, "xs:normalizedString")
					define_builtin_type (Token_type, "xs:token")
					define_builtin_type (Language_type, "xs:language")
					define_builtin_type (Nmtoken_type, "xs:NMTOKEN")
					define_builtin_type (Nmtokens_type, "xs:NMTOKENS")
					define_builtin_type (Name_type, "xs:Name")
					define_builtin_type (Ncname_type, "xs:NCName")				
					define_builtin_type (Id_type, "xs:ID")
					define_builtin_type (Idref_type, "xs:IDREF")
					define_builtin_type (Idrefs_type, "xs:IDREFS")				
					define_builtin_type (Entity_type, "xs:ENTITY")
					define_builtin_type (Entities_type, "xs:ENTITIES")
				end
				define_builtin_type (Object_type, "eiffel:ANY")				
																																																																			
				define_sub_type (Any_item, Any_node)
				
				define_sub_type (Any_node, Element_node)
				define_sub_type (Any_node, Attribute_node)
				define_sub_type (Any_node, Document_node)
				define_sub_type (Any_node, Text_node)
				define_sub_type (Any_node, Comment_node)
				define_sub_type (Any_node, Processing_instruction_node)
				define_sub_type (Any_node, Namespace_node)

				define_sub_type (Any_item, Untyped_type)
				define_sub_type (Any_item, Atomic_type)
				
				define_sub_type (Atomic_type, String_type)
				define_sub_type (Atomic_type, Boolean_type)
				if conformance.basic_xslt_processor then
					define_sub_type (Atomic_type, Decimal_type)
					define_sub_type (Atomic_type, Double_type)
				else
					define_sub_type (Atomic_type, Number_type)
					define_sub_type (Number_type, Decimal_type)
					define_sub_type (Number_type, Double_type)
					define_sub_type (Number_type, Float_type)
				end
				if conformance.basic_xslt_processor then
					define_sub_type (Atomic_type, Year_month_duration_type)
					define_sub_type (Atomic_type, Day_time_duration_type)

				else
					define_sub_type (Atomic_type, Duration_type)
					define_sub_type (Duration_type, Year_month_duration_type)
					define_sub_type (Duration_type, Day_time_duration_type)
				end
				define_sub_type (Atomic_type, Date_time_type)
				define_sub_type (Atomic_type, Date_type)
				if not conformance.basic_xslt_processor then
					define_sub_type (Atomic_type, G_year_month_type)
					define_sub_type (Atomic_type, G_month_day_type)
					define_sub_type (Atomic_type, G_day_type)
					define_sub_type (Atomic_type, G_month_type)
					define_sub_type (Atomic_type, Hex_binary_type)
					define_sub_type (Atomic_type, Base64_binary_type)
				end
				define_sub_type (Atomic_type, Any_uri_type)
				define_sub_type (Atomic_type, Qname_type)
				if not conformance.basic_xslt_processor then
					define_sub_type (Atomic_type, Notation_type)
				end
				
				define_sub_type (Atomic_type, Untyped_atomic_type)

				define_sub_type (Atomic_type, Object_type)

				define_sub_type (Decimal_type, Integer_type)

				if not conformance.basic_xslt_processor then
					define_sub_type (Integer_type, Non_positive_integer_type)
					define_sub_type (Non_positive_integer_type, Negative_integer_type)
					define_sub_type (Integer_type, Long_type)
					define_sub_type (Long_type, Int_type)
					define_sub_type (Int_type, Short_type)
					define_sub_type (Short_type, Byte_type)
					define_sub_type (Integer_type, Non_negative_integer_type)
					define_sub_type (Non_negative_integer_type, Positive_integer_type)
					define_sub_type (Non_negative_integer_type, Unsigned_long_type)
					define_sub_type (Unsigned_long_type, Unsigned_int_type)
					define_sub_type (Unsigned_int_type, Unsigned_short_type)
					define_sub_type (Unsigned_short_type, Unsigned_byte_type)
					
					define_sub_type (String_type, Normalized_string_type)
					define_sub_type (Normalized_string_type, Token_type)
					define_sub_type (Token_type, Language_type)
					define_sub_type (Token_type, Name_type)
					define_sub_type (Token_type, Nmtoken_type)
					define_sub_type (Name_type, Ncname_type)
					define_sub_type (Ncname_type, Id_type)
					define_sub_type (Ncname_type, Idref_type)
					define_sub_type (Ncname_type, Entity_type)
				end
			end
		ensure
			type_names_filled: type_names.count > 0
			hierarchy_filled: hierarchy.count > 0
			type_table_filled: type_table.count > 0
		end

feature -- Access

	type_name (type: INTEGER): STRING is
		-- Name of `type'
		require
			type_in_range: type > 0 and type <= 255
		do
			if type_names.valid_index (type) then
				Result := type_names.item (type)
				if Result = Void then
					create Result.make_from_string (type.out)
				end
			else
				create Result.make_from_string (type.out)
			end
		ensure
			result_not_void: Result /= Void
		end

	type_code (name: STRING): INTEGER is
			-- Type code associated with `name'
		require
			valid_name: name /= Void and then is_type_name_valid (name)
		do
			Result := type_table.item (name)
		ensure
			valid_type_code: is_valid_type (Result)
		end

	primitive_type (type: INTEGER): INTEGER is
			-- For an atomic type, get the primitive type (treating NUMBER as a primitive type)
		require
			valid_type: is_valid_type (type) and type /= Any_item
		local
			s: INTEGER
		do
			s := super_type (type)
			if s = Atomic_type then
				Result := type
			else
				Result := primitive_type (s)
			end
		end

	common_super_type (t1: INTEGER; t2: INTEGER): INTEGER is
			-- Common supertype of two given types
		require
			first_argument_valid: is_valid_type (t1)
			second_argument_valid: is_valid_type (t2)
		do
			if t1 = Empty_item then
				Result := t2
			elseif t2 = Empty_item then
				Result := t1
			elseif t1 = t2 then
				Result := t1
			elseif is_sub_type (t1, t2) then
				Result := t2
			elseif is_sub_type (t2, t1) then
				Result := t1
			else
				Result := common_super_type (super_type (t2), t1)
				-- eventually we will hit a type that is a supertype of t2. We reverse
				-- the arguments so we go up each branch of the tree alternately.
				-- If we hit the root of the tree, one of the earlier conditions will be satisfied,
				-- so the recursion will stop.
			end
		ensure
			in_range: is_valid_type (Result)
		end

	named_type (uri: STRING; local_name: STRING): INTEGER is
			-- Type with a given expanded name
		require
			local_name_not_void: local_name /= Void
			uri_not_void: uri /= Void
			valid_qname: is_qname_valid_type (uri, local_name)
		local
			qname: STRING
		do
			if STRING_.same_string (uri, Xml_schema_uri) or else STRING_.same_string (uri, Xml_schema_datatypes_uri) then
				create qname.make_from_string ("xs:")
			elseif STRING_.same_string (uri, Xpath_defined_datatypes_uri) then
				create qname.make_from_string ("xdt:")
			elseif STRING_.same_string (uri, Gexslt_eiffel_type_uri) then
				create qname.make_from_string ("eiffel:")
			else
				Exceptions.raise ("URI is not recognized")	
			end
			qname.append_string (local_name)
			Result := type_code (qname)
		ensure
			valid_type_code: is_valid_type (Result)			
		end

	system_type (name: STRING): INTEGER is
			-- Name of a system type;
			-- I.e. `name' is a keyword rather than a QName;
			-- These include the node kinds, such as element,
			--  the generic typrs such as node() and item(),
			--  and the pseudo-type empty()
		require
			name_not_void: name /= Void
			system_type_name: is_system_type (name)
		do
			if STRING_.same_string (name, "item") then
				Result := Any_item
			elseif STRING_.same_string (name, "empty") then
				Result := Empty_item
			elseif STRING_.same_string (name, "node") then
				Result := Any_node
			elseif STRING_.same_string (name, "document") then
				Result := Document_node
			elseif STRING_.same_string (name, "element") then
				Result := Element_node
			elseif STRING_.same_string (name, "attribute") then
				Result := Attribute_node
			elseif STRING_.same_string (name, "text") then
				Result := Text_node
			elseif STRING_.same_string (name, "comment") then
				Result := Comment_node
			elseif STRING_.same_string (name, "processing-instruction") then
				Result := Processing_instruction_node
			elseif STRING_.same_string (name, "namespace") then
				Result := Namespace_node
			else
				Exceptions.raise ("Not a system type")
			end
		ensure
			valid_type_code: is_valid_type (Result)			
		end

feature -- Status report
	
	is_type_name_valid (name: STRING): BOOLEAN is
		require
			name_not_void: name /= Void
		do
			Result := type_table.has (name)
		end

	is_qname_valid_type (uri: STRING; local_name: STRING): BOOLEAN is
			-- Is the expanded name specified by `uri' and `local_name' a registered type?
		require
			uri_not_void: uri /= Void
			local_name_not_void: local_name /= Void
		local
			qname: STRING
		do
			Result := True
			if STRING_.same_string (uri, Xml_schema_uri) or else STRING_.same_string (uri, Xml_schema_datatypes_uri) then
				create qname.make_from_string ("xs:")
				qname.append_string (local_name)
			elseif STRING_.same_string (uri, Xpath_defined_datatypes_uri) then
				create qname.make_from_string ("xdt:")
			elseif STRING_.same_string (uri, Gexslt_eiffel_type_uri) then
				create qname.make_from_string ("eiffel:")
			else
				Result := False
			end
			if Result = True then
				Result := is_type_name_valid (qname)
			end
		end

	is_system_type (name: STRING): BOOLEAN is
			-- Is `name' a system type
		require
			name_not_void: name /= Void
		do
			if STRING_.same_string (name, "item") then
				Result := True
			elseif STRING_.same_string (name, "empty") then
				Result := True
			elseif STRING_.same_string (name, "node") then
				Result := True
			elseif STRING_.same_string (name, "document") then
				Result := True
			elseif STRING_.same_string (name, "element") then
				Result := True
			elseif STRING_.same_string (name, "attribute") then
				Result := True
			elseif STRING_.same_string (name, "text") then
				Result := True
			elseif STRING_.same_string (name, "comment") then
				Result := True
			elseif STRING_.same_string (name, "processing-instruction") then
				Result := True
			elseif STRING_.same_string (name, "namespace") then
				Result := True
			else
				Result := False
			end
		end

	is_atomic_type (type: INTEGER): BOOLEAN is
			-- Is `type' atomic?
		require
			positive_type: type > 0
		do
			Result := is_sub_type (type, Atomic_type)
		end
	
	is_node_type (type: INTEGER): BOOLEAN is
			-- `True' if the item type is node() or a subtype of node()
		require
			positive_type: type > 0
		do
			Result := type <= Maximum_node
		end
	
	is_valid_type (type: INTEGER): BOOLEAN is
			-- Is `type' a registered type code?
		require
			in_range: type > 0 and type <= 255
		do
			Result := type_names.item (type) /= Void
		end

	is_sub_type (sub_type: INTEGER; super: INTEGER): BOOLEAN is
			-- Is `sub_type' a descendant of `super'?
		require
			valid_super_type: is_valid_type (super)
			valid_sub_type: is_valid_type (sub_type)
		local
			s: INTEGER
		do
			if sub_type = super then
				Result := True
			elseif super = Any_item then
				Result := True
			elseif sub_type = Any_item then
				Result := False
			elseif sub_type = Untyped_type then
				Result := False
			elseif sub_type = Empty_item then
				Result := True -- an empty sequence can satisfy any required item type
			else
				s := super_type (sub_type)
				Result := is_sub_type (s, super)
			end
		end

	is_promotable (source_type: INTEGER; target_type: INTEGER): BOOLEAN is
			-- Can `source_type' be numerically promoted to `target_type?
			--  (e.g. xs:integer is promotable to xs:double)
		require
			valid_source_type: is_valid_type (source_type)
			valid_target_type: is_valid_type (target_type)
		do
			if is_sub_type (source_type, Decimal_type) then
				Result := target_type = Float_type or else target_type = Double_type
			elseif is_sub_type (source_type, Float_type) then
				Result := target_type = Double_type
			end
		end

feature -- DOM Node types

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
	Maximum_node: INTEGER is 15

	Any_node: INTEGER is 14
			-- Matches any node
	
	Any_item: INTEGER is 88
			-- Matches any item

	Empty_item: INTEGER is 16
			-- Matches no items at all

feature -- XPath types

	Atomic_type: INTEGER is 90
			-- xdt:anyAtomicType;
			-- Any atomic type (the union of all primitive types and types
			--  derived from primitive types by restriction or by union)

	Number_type: INTEGER is 91
			-- Any numeric type (the union of float, double, and decimal)

	Any_simple_type: INTEGER is 92
			-- Type of a simple-valued element or attribute
			--  whose actual type is unknown

	Any_type: INTEGER is 93
			-- Type of a simple-or-complex-valued element that is
			--  allowed to have any content

	Untyped_type: INTEGER is 94
			-- Type of a simple-or-complex-valued element whose actual
			--  type is unknown

	Untyped_atomic_type: INTEGER is 125
			-- xdt:untypedAtomic;
			--  type of the content of a schema-less node

	Year_month_duration_type: INTEGER is 240
			-- xdt:yearMonthDuration

	Day_Time_duration_type: INTEGER is 241
			-- xdt:dayTimeDuration
	
feature -- XML Schema (part 2) types

	String_type: INTEGER is 101
			-- xs:string

	Boolean_type: INTEGER is 102
			-- xs:boolean
	
	Decimal_type: INTEGER is 103
			-- xs:decimal

	Float_type: INTEGER is 104
			-- xs:float
	
	Double_type: INTEGER is 105
			-- xs:double

	Duration_type: INTEGER is 106
			-- xs:duration

	Date_time_type: INTEGER is 107
			-- xs:dateTime

	Time_type: INTEGER is 108
			-- xs:time
	
	Date_type: INTEGER is 109
			-- xs:date

	G_year_month_type: INTEGER is 110
			-- xs:gYearMonth

	G_year_type: INTEGER is 111
			-- xs:gYear

	G_month_day_type: INTEGER is 112
			-- xs:gMonthDay

	G_day_type: INTEGER is 113
			-- xs:gDay

	G_month_type: INTEGER is 114
			-- xs:gMonth

	Hex_binary_type: INTEGER is 115
			-- xs:hexBinary

	Base64_binary_type: INTEGER is 116
			-- xs:base64Binary

	Any_uri_type: INTEGER is 117
			-- xs:anyURI

	Qname_type: INTEGER is 118
			-- xs:QName
	
	Notation_type: INTEGER is 119
			-- xs:NOTATION

	Integer_type: INTEGER is 200
			-- xs:integer

	Non_positive_integer_type: INTEGER is 201
			-- xs:nonPositiveInteger
	
	Negative_integer_type: INTEGER is 202
			-- xs:negativeInteger

	Long_type: INTEGER is 203
			-- xs:long
	
	Int_type: INTEGER is 204
			-- xs:int

	Short_type: INTEGER is 205
			-- xs:short
	
	Byte_type: INTEGER is 206
			-- xs:byte
		
	Non_negative_integer_type: INTEGER is 207
			-- xs:nonNegativeInteger

	Positive_integer_type: INTEGER is 208
			-- xs:positiveInteger

	Unsigned_long_type: INTEGER is 209
			-- xs:unsignedLong
	
	Unsigned_int_type: INTEGER is 210
			-- xs:unsignedInt

	Unsigned_short_type: INTEGER is 211
			-- xs:unsignedShort

	Unsigned_byte_type: INTEGER is 212
			-- xs:unsignedByte

	Normalized_string_type: INTEGER is 220
			-- xs:normalizedString

	Token_type: INTEGER is 221
			-- xs:token

	Language_type: INTEGER is 222
			-- xs:language

	Nmtoken_type: INTEGER is 223
			-- xs:NMTOKEN

	Nmtokens_type: INTEGER is 224
			-- xs:NMTOKENS;
			-- N.B. This is a list type

	Name_type: INTEGER is 225
			-- xs:NAME

	Ncname_type: INTEGER is 226
			-- xs:NCNAME

	Id_type: INTEGER is 227
			-- xs:ID

	Idref_type: INTEGER is 228
			-- xs:IDREF

	Idrefs_type: INTEGER is 229
			-- xs:IDREFS;
			-- N.B. This is a list type

	Entity_type: INTEGER is 230
			-- xs:ENTITY

	Entities_type: INTEGER is 231
			-- xs:ENTITIES;
			-- N.B. This is a list type

feature -- Other types

	Object_type: INTEGER is 130
			-- For use by extension functions

	Same_as_first_argument_type: INTEGER is 999999
			-- Pseudo-type;
			-- Constant used in function signatures to indicate that
			--  the return item type of the function is the same as the
			--  actual item type of the first argument

feature {NONE} -- Implementation

	hierarchy: DS_HASH_TABLE [INTEGER, INTEGER] is
			-- Maps sub-types to their super-types
		once
			create Result.make (100)
		end

	type_names: ARRAY [STRING] is
			-- Names for the types
		once
			create Result.make (1, 255)
		end

	type_table: DS_HASH_TABLE [INTEGER, STRING] is
			-- Maps type-names to types
		once
			create Result.make (255)
		end

	define_builtin_type (type: INTEGER; name: STRING) is
			-- Add a type to the table of built-in types
			-- TODO changes needed for user-defined types
		require
			valid_name: name /= Void and then (name.substring_index ("xs:", 1) > 0 or else  name.substring_index ("xdt:", 1) > 0 or else  name.substring_index ("eiffel:", 1) > 0)
			type_in_range: type > 0 and type <= 255
		do
			type_names.put (name, type)
			type_table.put (type, name)
		ensure
			type_in_table: type_table.item (name) = type
			type_listed: STRING_.same_string (type_names.item (type), name)
		end

	define_type  (type: INTEGER; name: STRING) is
			-- Register a system type
		require
			valid_name: name /= Void and then name.substring_index ("xs:", 1) = 0 and  name.substring_index ("xdt:", 1) = 0 and  name.substring_index ("eiffel:", 1) = 0
			type_in_range: type > 0 and type <= 255
		do
			type_names.put (name, type)
			type_table.put (type, name)
		ensure
			type_in_table: type_table.item (name) = type
			type_listed: STRING_.same_string (type_names.item (type), name)
		end

	define_sub_type  (super: INTEGER; sub_type: INTEGER) is
			-- Register a type inheritance relationship
		require
			valid_super_type: is_valid_type (super)
			valid_sub_type: is_valid_type (sub_type)
		do
			hierarchy.put (super, sub_type)
		ensure
			relationship_defined: super_type (sub_type) = super
		end

	super_type (sub_type: INTEGER): INTEGER is
			-- Super-type for `sub_type'
		require
			valid_sub_type: is_valid_type (sub_type)
		do
			Result := hierarchy.item (sub_type)
		ensure
			in_range: is_valid_type (Result)
		end

end
