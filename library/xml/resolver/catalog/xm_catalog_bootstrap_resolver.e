indexing

	description:

		"Resolvers used in parsing OASIS XML Catalogs"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class  XM_CATALOG_BOOTSTRAP_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER
		redefine
			resolve_public, resolve_finish
		end

	XM_URI_REFERENCE_RESOLVER

	KL_SHARED_EXECUTION_ENVIRONMENT

	KL_SHARED_FILE_SYSTEM

	KL_IMPORTED_STRING_ROUTINES

	UC_SHARED_STRING_EQUALITY_TESTER

creation

	make

feature {NONE} -- Initialization
	
	make is
			-- Establish invariant.
		local
			a_resolver_factory: XM_RESOLVER_FACTORY
		do
			create a_resolver_factory
			uri_scheme_resolver := a_resolver_factory.new_file_resolver_current_directory
			create well_known_system_ids.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			well_known_system_ids.put (Xml_catalog_dtd, Xml_catalog_system_id)
			create well_known_public_ids.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			well_known_public_ids.put (Xml_catalog_dtd, Xml_catalog_public_id)
			create well_known_uri_references.make_with_equality_testers (2, string_equality_tester, string_equality_tester)
			well_known_uri_references.put (Xml_catalog_xsd, Xml_catalog_xsd_id)
			well_known_uri_references.put (Xml_catalog_rng, Xml_catalog_rng_id)
		end

feature -- Access

	uri_scheme_resolver: XM_URI_EXTERNAL_RESOLVER
			-- Resolver used for opening streams

	Xml_catalog_xsd_id: STRING is "http://www.oasis-open.org/committees/entity/release/1.0/catalog.xsd"
			-- URI of the W3C XML Schema for OASIS XML Catalog files

	Xml_catalog_rng_id: STRING is "http://www.oasis-open.org/committees/entity/release/1.0/catalog.rng"
			-- URI of the RELAX NG Grammar for OASIS XML Catalog files

	Xml_catalog_public_id: STRING is "-//OASIS//DTD XML Catalogs V1.0//EN"
			-- Public identifier for OASIS XML Catalog files

	Xml_catalog_system_id: STRING is "http://www.oasis-open.org/committees/entity/release/1.0/catalog.dtd"
			-- System identifier for OASIS XML Catalog files

	Reserved_directory_path: STRING is
			-- Path to  directory
		once
			Result := Execution_environment.variable_value ("GOBO")
			Result := unix_file_system.pathname_from_file_system (Result, file_system)
			if Result /= Void and then Result.item (Result.count) = '/' then
				Result := STRING_.appended_string (Result, "misc/")
			else
				Result := STRING_.appended_string (Result, "/misc/")
			end
			Result := file_system.pathname_from_file_system (Result, unix_file_system)
		end

	Xml_catalog_dtd: STRING is
			-- OASIS XML Catalogs DTD
		once
			Result := "<!-- $Id$ -->" +
				"<!ENTITY %% pubIdChars %"CDATA%">" +
				"<!ENTITY %% publicIdentifier %"%%pubIdChars;%">" +
				"<!ENTITY %% partialPublicIdentifier %"%%pubIdChars;%">" +
				"<!ENTITY %% uriReference %"CDATA%">" +
				"<!ENTITY %% string %"CDATA%">" +
				"<!ENTITY %% systemOrPublic %"(system|public)%">" +
				"<!ENTITY %% p %"%">" +
				"<!ENTITY %% s %"%">" +
				"<!ENTITY %% nsdecl %"xmlns%%s;%">" +
				"<!ENTITY %% catalog %"%%p;catalog%">" +
				"<!ENTITY %% public %"%%p;public%">" +
				"<!ENTITY %% system %"%%p;system%">" +
				"<!ENTITY %% uri %"%%p;uri%">" +
				"<!ENTITY %% rewriteSystem %"%%p;rewriteSystem%">" +
				"<!ENTITY %% rewriteURI %"%%p;rewriteURI%">" +
				"<!ENTITY %% delegatePublic %"%%p;delegatePublic%">" +
				"<!ENTITY %% delegateSystem %"%%p;delegateSystem%">" +
				"<!ENTITY %% delegateURI %"%%p;delegateURI%">" +
				"<!ENTITY %% nextCatalog %"%%p;nextCatalog%">" +
				"<!ENTITY %% group %"%%p;group%">" +
				"<!ENTITY %% local.catalog.mix %"%">" +
				"<!ENTITY %% local.catalog.attribs %"%">" +
				"<!ELEMENT %%catalog; (%%public;|%%system;|%%uri;|%%rewriteSystem;|%%rewriteURI;|%%delegatePublic;|%%delegateSystem;|%%delegateURI;|%%nextCatalog;|%%group; %%local.catalog.mix;)+>" +
				"<!ATTLIST %%catalog; %%nsdecl;	%%uriReference;		#FIXED 'urn:oasis:names:tc:entity:xmlns:xml:catalog'	prefer		%%systemOrPublic;	#IMPLIED	xml:base	%%uriReference;" +
				"#IMPLIED	%%local.catalog.attribs;>" +
				"<!ENTITY %% local.public.attribs %"%">" +
				"<!ELEMENT %%public; EMPTY>" +
				"<!ATTLIST %%public;	id		ID			#IMPLIED	publicId	%%publicIdentifier;	#REQUIRED	uri		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.public.attribs;>" +
				"<!ENTITY %% local.system.attribs %"%">" +
				"<!ELEMENT %%system; EMPTY>" +
				"<!ATTLIST %%system;	id		ID			#IMPLIED	systemId	%%string;		#REQUIRED	uri		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.system.attribs;>" +
				"<!ENTITY %% local.uri.attribs %"%">" +
				"<!ELEMENT %%uri; EMPTY>" +
				"<!ATTLIST %%uri;	id		ID			#IMPLIED	name		%%string;		#REQUIRED	uri		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.uri.attribs;>" +
				"<!ENTITY %% local.rewriteSystem.attribs %"%">" +
				"<!ELEMENT %%rewriteSystem; EMPTY>" +
				"<!ATTLIST %%rewriteSystem;	id		ID			#IMPLIED	systemIdStartString	%%string;	#REQUIRED	rewritePrefix		%%string;		#REQUIRED        %%local.rewriteSystem.attribs;>" +
				"<!ENTITY %% local.rewriteURI.attribs %"%">" +
				"<!ELEMENT %%rewriteURI; EMPTY>" +
				"<!ATTLIST %%rewriteURI;	id		ID			#IMPLIED	uriStartString	%%string;		#REQUIRED	rewritePrefix	%%string;		#REQUIRED        %%local.rewriteURI.attribs;>" +
				"<!ENTITY %% local.delegatePublic.attribs %"%">" +
				"<!ELEMENT %%delegatePublic; EMPTY>" +
				"<!ATTLIST %%delegatePublic;	id		ID			#IMPLIED	publicIdStartString	%%partialPublicIdentifier;	#REQUIRED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.delegatePublic.attribs;>" +
				"<!ENTITY %% local.delegateSystem.attribs %"%">" +
				"<!ELEMENT %%delegateSystem; EMPTY>" +
				"<!ATTLIST %%delegateSystem;	id		ID			#IMPLIED	systemIdStartString	%%string;	#REQUIRED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.delegateSystem.attribs;>" +
				"<!ENTITY %% local.delegateURI.attribs %"%">" +
				"<!ELEMENT %%delegateURI; EMPTY>" +
				"<!ATTLIST %%delegateURI;	id		ID			#IMPLIED	uriStartString	%%string;		#REQUIRED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.delegateURI.attribs;>" +
				"<!ENTITY %% local.nextCatalog.attribs %"%">" +
				"<!ELEMENT %%nextCatalog; EMPTY>" +
				"<!ATTLIST %%nextCatalog;	id		ID			#IMPLIED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.nextCatalog.attribs;>" +
				"<!ENTITY %% local.group.mix %"%">" +
				"<!ENTITY %% local.group.attribs %"%">" +
				"<!ELEMENT %%group; (%%public;|%%system;|%%uri;|%%rewriteSystem;|%%rewriteURI;|%%delegatePublic;|%%delegateSystem;|%%delegateURI;|%%nextCatalog; %%local.group.mix;)+>" +
				"<!ATTLIST %%group;	id		ID			#IMPLIED	prefer		%%systemOrPublic;	#IMPLIED	xml:base	%%uriReference;		#IMPLIED        %%local.group.attribs;>"
		ensure
			xml_catalog_dtd_not_void: Result /= Void
		end

	Xml_catalog_xsd: STRING is
			-- OASIS XML Catalogs W3C schema
		once
			Result := "<?xml version=%"1.0%" encoding=%"utf-8%"?>" +
				"<xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:er='urn:oasis:names:tc:entity:xmlns:xml:catalog' targetNamespace='urn:oasis:names:tc:entity:xmlns:xml:catalog' elementFormDefault='qualified'>" +
				"<!-- $Id$ -->" +
				"<xs:simpleType name='pubIdChars'>" +
				"<!-- A string of the characters defined as pubIdChar in production 13 of the Second Edition of the XML 1.0 Recommendation. Does not include the whitespace characters because they're normalized by XML parsing. -->" +
				"<xs:restriction base='xs:string'>" +
				"<xs:pattern value=%"[a-zA-Z0-9-'()+,./:=?;!*#@$_%%]*%"/>" +
				"</xs:restriction>" +
				"</xs:simpleType>" +
				"<xs:simpleType name='publicIdentifier'>" +
				"<xs:restriction base='er:pubIdChars'/>" +
				"</xs:simpleType>" +
				"<xs:simpleType name='partialPublicIdentifier'>" +
				"<xs:restriction base='er:pubIdChars'/>" +
				"</xs:simpleType>" +
				"<xs:simpleType name='systemOrPublic'>" +
				"<xs:restriction base='xs:string'>" +
				"<xs:enumeration value='system'/>" +
				"<xs:enumeration value='public'/>" +
				"</xs:restriction>" +
				"</xs:simpleType>" +
				"<!-- The global attribute xml:base is not explicitly declared; -->" +
				"<!-- it is allowed by the anyAttribute declarations. -->" +
				"<xs:complexType name='catalog'>" +
				"<xs:choice minOccurs='1' maxOccurs='unbounded'>" +
				"<xs:element ref='er:public'/>" +
				"<xs:element ref='er:system'/>" +
				"<xs:element ref='er:uri'/>" +
				"<xs:element ref='er:rewriteSystem'/>" +
				"<xs:element ref='er:rewriteURI'/>" +
				"<xs:element ref='er:delegatePublic'/>" +
				"<xs:element ref='er:delegateSystem'/>" +
				"<xs:element ref='er:delegateURI'/>" +
				"<xs:element ref='er:nextCatalog'/>" +
				"<xs:element ref='er:group'/>" +
				"<xs:any namespace='##other' processContents='skip'/>" +
				"</xs:choice>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:attribute name='prefer' type='er:systemOrPublic'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:complexType>" +
				"<xs:complexType name='public'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"publicId%" type=%"er:publicIdentifier%" use=%"required%"/>" +
				"<xs:attribute name=%"uri%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='system'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"systemId%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name=%"uri%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='uri'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"name%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name=%"uri%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='rewriteSystem'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"systemIdStartString%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name=%"rewritePrefix%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='rewriteURI'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"uriIdStartString%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name=%"rewritePrefix%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='delegatePublic'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"publicIdStartString%" type=%"er:partialPublicIdentifier%"	use=%"required%"/>" +
				"<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='delegateSystem'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"systemIdStartString%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='delegateURI'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"uriStartString%" type=%"xs:string%" use=%"required%"/>" +
				"<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='nextCatalog'>" +
				"<xs:complexContent>" +
				"<xs:restriction base=%"xs:anyType%">" +
				"<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:restriction>" +
				"</xs:complexContent>" +
				"</xs:complexType>" +
				"<xs:complexType name='group'>" +
				"<xs:choice minOccurs='1' maxOccurs='unbounded'>" +
				"<xs:element ref='er:public'/>" +
				"<xs:element ref='er:system'/>" +
				"<xs:element ref='er:uri'/>" +
				"<xs:element ref='er:rewriteSystem'/>" +
				"<xs:element ref='er:rewriteURI'/>" +
				"<xs:element ref='er:delegatePublic'/>" +
				"<xs:element ref='er:delegateSystem'/>" +
				"<xs:element ref='er:delegateURI'/>" +
				"<xs:element ref='er:nextCatalog'/>" +
				"<xs:any namespace='##other' processContents='skip'/>" +
				"</xs:choice>" +
				"<xs:attribute name='prefer' type='er:systemOrPublic'/>" +
				"<xs:attribute name='id' type='xs:ID'/>" +
				"<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>" +
				"</xs:complexType>" +
				"<xs:element name=%"catalog%" type=%"er:catalog%"/>" +
				"<xs:element name=%"public%" type=%"er:public%"/>" +
				"<xs:element name=%"system%" type=%"er:system%"/>" +
				"<xs:element name=%"uri%" type=%"er:uri%"/>" +
				"<xs:element name=%"rewriteSystem%" type=%"er:rewriteSystem%"/>" +
				"<xs:element name=%"rewriteURI%" type=%"er:rewriteURI%"/>" +
				"<xs:element name=%"delegatePublic%" type=%"er:delegatePublic%"/>" +
				"<xs:element name=%"delegateSystem%" type=%"er:delegateSystem%"/>" +
				"<xs:element name=%"delegateURI%" type=%"er:delegateURI%"/>" +
				"<xs:element name=%"nextCatalog%" type=%"er:nextCatalog%"/>" +
				"<xs:element name=%"group%" type=%"er:group%"/>" +
				"</xs:schema>"
		ensure
			xml_catalog_xsd_not_void: Result /= Void
		end

	Xml_catalog_rng: STRING is
			-- Path to OASIS XML Catalogs RELAX NG grammar
		once
			Result := "<?xml version=%"1.0%"?>" +
				"<grammar xmlns=%"http://relaxng.org/ns/structure/1.0%" ns=%"urn:oasis:names:tc:entity:xmlns:xml:catalog%" datatypeLibrary=%"http://www.w3.org/2001/XMLSchema-datatypes%">" +
				"<!-- $Id$ -->" +
				"<start>" +
				"<choice>" +
				"<ref name=%"Catalog%"/>" +
				"</choice>" +
				"</start>" +
				"<define name=%"pubIdChars%">" +
				"<data type=%"string%">" +
				"<param name=%"pattern%">[a-zA-Z0-9-'()+,./:=?;!*#@$_%%]*</param>" +
				"</data>" +
				"</define>" +
				"<define name=%"publicIdentifier%">" +
				"<ref name=%"pubIdChars%"/>" +
				"</define>" +
				"<define name=%"partialPublicIdentifier%">" +
				"<ref name=%"pubIdChars%"/>" +
				"</define>" +
				"<define name=%"systemOrPublic%">" +
				"<choice>" +
				"<value>system</value>" +
				"<value>public</value>" +
				"</choice>" +
				"</define>" +
				"<define name=%"uriReference%">" +
				"<data type=%"anyURI%"/>" +
				"</define>" +
				"<define name=%"OptionalAttributes%">" +
				"<optional>" +
				"<attribute name=%"id%">" +
				"<data type=%"ID%"/>" +
				"</attribute>" +
				"</optional>" +
				"<zeroOrMore>" +
				"<attribute>" +
				"<anyName>" +
				"<except>" +
            "<nsName ns=%"%"/>" +
            "<nsName/>" +
				"</except>" +
				"</anyName>" +
				"</attribute>" +
				"</zeroOrMore>" +
				"</define>" +
				"<define name=%"PreferAttribute%">" +
				"<attribute name=%"prefer%">" +
				"<ref name=%"systemOrPublic%"/>" +
				"</attribute>" +
				"</define>" +
				"<define name=%"Catalog%">" +
				"<element name=%"catalog%">" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<optional>" +
				"<ref name=%"PreferAttribute%"/>" +
				"</optional>" +
				"<oneOrMore>" +
				"<choice>" +
				"<ref name=%"Group%"/>" +
				"<ref name=%"Public%"/>" +
				"<ref name=%"System%"/>" +
				"<ref name=%"Uri%"/>" +
				"<ref name=%"RewriteSystem%"/>" +
				"<ref name=%"RewriteURI%"/>" +
				"<ref name=%"DelegatePublic%"/>" +
				"<ref name=%"DelegateSystem%"/>" +
				"<ref name=%"DelegateURI%"/>" +
				"<ref name=%"NextCatalog%"/>" +
				"<ref name=%"AnyOtherElement%"/>" +
				"</choice>" +
				"</oneOrMore>" +
				"</element>" +
				"</define>" +
				"<define name=%"Group%">" +
				"<element name=%"group%">" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<optional>" +
				"<ref name=%"PreferAttribute%"/>" +
				"</optional>" +
				"<oneOrMore>" +
				"<choice>" +
				"<ref name=%"Public%"/>" +
				"<ref name=%"System%"/>" +
				"<ref name=%"Uri%"/>" +
				"<ref name=%"RewriteSystem%"/>" +
				"<ref name=%"RewriteURI%"/>" +
				"<ref name=%"DelegatePublic%"/>" +
				"<ref name=%"DelegateSystem%"/>" +
				"<ref name=%"DelegateURI%"/>" +
				"<ref name=%"NextCatalog%"/>" +
				"<ref name=%"AnyOtherElement%"/>" +
				"</choice>" +
				"</oneOrMore>" +
				"</element>" +
				"</define>" +
				"<define name=%"Public%">" +
				"<element name=%"public%">" +
				"<attribute name=%"publicId%">" +
				"<ref name=%"publicIdentifier%"/>" +
				"</attribute>" +
				"<attribute name=%"uri%">" +
				"<ref name=%"uriReference%"/>" +
				"</attribute>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"System%">" +
				"<element name=%"system%">" +
				"<attribute name=%"systemId%"/>" +
				"<attribute name=%"uri%">" +
				"<ref name=%"uriReference%"/>" +
				"</attribute>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"Uri%">" +
				"<element name=%"uri%">" +
				"<attribute name=%"name%"/>" +
				"<attribute name=%"uri%">" +
				"<ref name=%"uriReference%"/>" +
				"</attribute>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"RewriteSystem%">" +
				"<element name=%"rewriteSystem%">" +
				"<attribute name=%"systemIdStartString%"/>" +
				"<attribute name=%"rewritePrefix%"/>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"RewriteURI%">" +
				"<element name=%"rewriteURI%">" +
				"<attribute name=%"uriStartString%"/>" +
				"<attribute name=%"rewritePrefix%"/>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"DelegatePublic%">" +
				"<element name=%"delegatePublic%">" +
				"<attribute name=%"publicIdStartString%"/>" +
				"<attribute name=%"catalog%"/>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"DelegateSystem%">" +
				"<element name=%"delegateSystem%">" +
				"<attribute name=%"systemIdStartString%"/>" +
				"<attribute name=%"catalog%"/>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"DelegateURI%">" +
				"<element name=%"delegateURI%">" +
				"<attribute name=%"uriStartString%"/>" +
				"<attribute name=%"catalog%"/>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"NextCatalog%">" +
				"<element name=%"nextCatalog%">" +
				"<attribute name=%"catalog%"/>" +
				"<ref name=%"OptionalAttributes%"/>" +
				"<empty/>" +
				"</element>" +
				"</define>" +
				"<define name=%"AnyOtherElement%">" +
				"<choice>" +
				"<element>" +
				"<anyName>" +
				"<except>" +
            "<nsName ns=%"%"/>" +
            "<nsName/>" +
				"</except>" +
				"</anyName>" +
				"<zeroOrMore>" +
				"<attribute>" +
            "<anyName/>" +
				"</attribute>" +
				"</zeroOrMore>" +
				"<ref name=%"AnyContent%"/>" +
				"</element>" +
				"<text/>" +
				"</choice>" +
				"</define>" +				
				"<define name=%"AnyContent%">" +
				"<mixed>" +
				"<zeroOrMore>" +
				"<element>" +
				"<anyName/>" +
				"<zeroOrMore>" +
            "<attribute>" +
				"<anyName/>" +
            "</attribute>" +
				"</zeroOrMore>" +
				"<zeroOrMore>" +
            "<ref name=%"AnyContent%"/>" +
				"</zeroOrMore>" +
				"</element>" +
				"</zeroOrMore>" +
				"</mixed>" +
				"</define>" +
				"</grammar>"
		ensure
			xml_catalog_rng_not_void: Result /= Void
		end

	well_known_system_ids: DS_HASH_TABLE [STRING, STRING]
			-- Map of well-known system ids to file names

	well_known_public_ids: DS_HASH_TABLE [STRING, STRING]
			-- Map of well-known public ids to file names

	well_known_uri_references: DS_HASH_TABLE [STRING, STRING]
			-- Map of well-known URI references to file names

feature -- Action(s)

	resolve (a_system: STRING) is
			-- Resolve a system identifier to an input stream
			-- on behalf of an XML parser.
		local
			a_system_id: STRING
		do
			if well_known_system_ids.has (a_system) then
				a_system_id := well_known_system_ids.item (a_system)
				create {KL_STRING_INPUT_STREAM} last_stream.make (a_system_id)
			else
				a_system_id := a_system -- best effort
				uri_scheme_resolver.resolve (a_system_id)
				last_stream := uri_scheme_resolver.last_stream
				resolve_finish
			end
		end
		
	resolve_public (a_public: STRING; a_system: STRING) is
			-- Resolve a public/system identified pair to an input stream.
			-- (Default implementation: resolve using system ID only.)
		local
			a_public_id, a_system_id: STRING		
		do
			if well_known_system_ids.has (a_system) then
				a_system_id := well_known_system_ids.item (a_system)
				create {KL_STRING_INPUT_STREAM} last_stream.make (a_system_id)
			elseif well_known_public_ids.has (a_public) then
				a_public_id := well_known_public_ids.item (a_public)
				create {KL_STRING_INPUT_STREAM} last_stream.make (a_public_id)
			else
				uri_scheme_resolver.resolve_public (a_public, a_system) -- best effort
				last_stream := uri_scheme_resolver.last_stream
				resolve_finish
			end
		end
		
	resolve_finish is
			-- The parser has finished with the last resolved entity.
			-- The previously resolved entity becomes the last resolved one.
			-- Note: `last_stream' is not required to be restored accordingly.
		do
			uri_scheme_resolver.resolve_finish
		end

	resolve_uri (a_uri_reference: STRING) is
			-- Resolve `a_uri_reference' on behalf of an application.
		local
			a_system_id: STRING
		do
			if well_known_uri_references.has (a_uri_reference) then
				a_system_id := well_known_uri_references.item (a_uri_reference)
				create {KL_STRING_INPUT_STREAM} last_uri_reference_stream.make (a_system_id)
			else
				a_system_id := a_uri_reference
				uri_scheme_resolver.resolve (a_uri_reference)
				last_uri_reference_stream := uri_scheme_resolver.last_stream
				resolve_finish
			end
			create last_system_id.make (a_system_id)
		end

feature -- Result

	last_stream: KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from external entity.

	has_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			Result := uri_scheme_resolver.has_error
		end
		
	last_error: STRING is
			-- Last error message.
		do
			Result := uri_scheme_resolver.last_error
		end

	last_uri_reference_stream: KI_CHARACTER_INPUT_STREAM
			-- Last stream initialised from URI reference.

	last_system_id: UT_URI
			-- System id used to actually open `last_uri_reference_stream'

	has_uri_reference_error: BOOLEAN is
			-- Did the last resolution attempt succeed?
		do
			Result := uri_scheme_resolver.has_error
		end
		
	last_uri_reference_error: STRING is
			-- Last error message.
		do
			Result := uri_scheme_resolver.last_error
		end

end

	
