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
			uri_scheme_resolver ?= a_resolver_factory.new_resolver_current_directory
			check
				uri_scheme_resolver_not_void: uri_scheme_resolver /= Void
				-- as the factory does indeed create an XM_SIMPLE_URI_EXTERNAL_RESOLVER
			end
			create well_known_system_ids.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			well_known_system_ids.put (Xml_catalog_dtd, Xml_catalog_system_id)
			create well_known_public_ids.make_with_equality_testers (1, string_equality_tester, string_equality_tester)
			well_known_public_ids.put (Xml_catalog_dtd, Xml_catalog_public_id)
			create well_known_uri_references.make_with_equality_testers (2, string_equality_tester, string_equality_tester)
			well_known_uri_references.put (Xml_catalog_xsd, Xml_catalog_xsd_id)
			well_known_uri_references.put (Xml_catalog_rng, Xml_catalog_rng_id)
		end

feature -- Access

	uri_scheme_resolver: XM_SIMPLE_URI_EXTERNAL_RESOLVER
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
			Result := clone ("<!-- $Id$ -->")
			Result.append_string ("<!ENTITY %% pubIdChars %"CDATA%">")
			Result.append_string ("<!ENTITY %% publicIdentifier %"%%pubIdChars;%">")
			Result.append_string ("<!ENTITY %% partialPublicIdentifier %"%%pubIdChars;%">")
			Result.append_string ("<!ENTITY %% uriReference %"CDATA%">")
			Result.append_string ("<!ENTITY %% string %"CDATA%">")
			Result.append_string ("<!ENTITY %% systemOrPublic %"(system|public)%">")
			Result.append_string ("<!ENTITY %% p %"%">")
			Result.append_string ("<!ENTITY %% s %"%">")
			Result.append_string ("<!ENTITY %% nsdecl %"xmlns%%s;%">")
			Result.append_string ("<!ENTITY %% catalog %"%%p;catalog%">")
			Result.append_string ("<!ENTITY %% public %"%%p;public%">")
			Result.append_string ("<!ENTITY %% system %"%%p;system%">")
			Result.append_string ("<!ENTITY %% uri %"%%p;uri%">")
			Result.append_string ("<!ENTITY %% rewriteSystem %"%%p;rewriteSystem%">")
			Result.append_string ("<!ENTITY %% rewriteURI %"%%p;rewriteURI%">")
			Result.append_string ("<!ENTITY %% delegatePublic %"%%p;delegatePublic%">")
			Result.append_string ("<!ENTITY %% delegateSystem %"%%p;delegateSystem%">")
			Result.append_string ("<!ENTITY %% delegateURI %"%%p;delegateURI%">")
			Result.append_string ("<!ENTITY %% nextCatalog %"%%p;nextCatalog%">")
			Result.append_string ("<!ENTITY %% group %"%%p;group%">")
			Result.append_string ("<!ENTITY %% local.catalog.mix %"%">")
			Result.append_string ("<!ENTITY %% local.catalog.attribs %"%">")
			Result.append_string ("<!ELEMENT %%catalog; (%%public;|%%system;|%%uri;|%%rewriteSystem;|%%rewriteURI;|%%delegatePublic;|%%delegateSystem;|%%delegateURI;|%%nextCatalog;|%%group; %%local.catalog.mix;)+>")
			Result.append_string ("<!ATTLIST %%catalog; %%nsdecl;	%%uriReference;		#FIXED 'urn:oasis:names:tc:entity:xmlns:xml:catalog'	prefer		%%systemOrPublic;	#IMPLIED	xml:base	%%uriReference;")
			Result.append_string ("#IMPLIED	%%local.catalog.attribs;>")
			Result.append_string ("<!ENTITY %% local.public.attribs %"%">")
			Result.append_string ("<!ELEMENT %%public; EMPTY>")
			Result.append_string ("<!ATTLIST %%public;	id		ID			#IMPLIED	publicId	%%publicIdentifier;	#REQUIRED	uri		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.public.attribs;>")
			Result.append_string ("<!ENTITY %% local.system.attribs %"%">")
			Result.append_string ("<!ELEMENT %%system; EMPTY>")
			Result.append_string ("<!ATTLIST %%system;	id		ID			#IMPLIED	systemId	%%string;		#REQUIRED	uri		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.system.attribs;>")
			Result.append_string ("<!ENTITY %% local.uri.attribs %"%">")
			Result.append_string ("<!ELEMENT %%uri; EMPTY>")
			Result.append_string ("<!ATTLIST %%uri;	id		ID			#IMPLIED	name		%%string;		#REQUIRED	uri		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.uri.attribs;>")
			Result.append_string ("<!ENTITY %% local.rewriteSystem.attribs %"%">")
			Result.append_string ("<!ELEMENT %%rewriteSystem; EMPTY>")
			Result.append_string ("<!ATTLIST %%rewriteSystem;	id		ID			#IMPLIED	systemIdStartString	%%string;	#REQUIRED	rewritePrefix		%%string;		#REQUIRED        %%local.rewriteSystem.attribs;>")
			Result.append_string ("<!ENTITY %% local.rewriteURI.attribs %"%">")
			Result.append_string ("<!ELEMENT %%rewriteURI; EMPTY>")
			Result.append_string ("<!ATTLIST %%rewriteURI;	id		ID			#IMPLIED	uriStartString	%%string;		#REQUIRED	rewritePrefix	%%string;		#REQUIRED        %%local.rewriteURI.attribs;>")
			Result.append_string ("<!ENTITY %% local.delegatePublic.attribs %"%">")
			Result.append_string ("<!ELEMENT %%delegatePublic; EMPTY>")
			Result.append_string ("<!ATTLIST %%delegatePublic;	id		ID			#IMPLIED	publicIdStartString	%%partialPublicIdentifier;	#REQUIRED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.delegatePublic.attribs;>")
			Result.append_string ("<!ENTITY %% local.delegateSystem.attribs %"%">")
			Result.append_string ("<!ELEMENT %%delegateSystem; EMPTY>")
			Result.append_string ("<!ATTLIST %%delegateSystem;	id		ID			#IMPLIED	systemIdStartString	%%string;	#REQUIRED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.delegateSystem.attribs;>")
			Result.append_string ("<!ENTITY %% local.delegateURI.attribs %"%">")
			Result.append_string ("<!ELEMENT %%delegateURI; EMPTY>")
			Result.append_string ("<!ATTLIST %%delegateURI;	id		ID			#IMPLIED	uriStartString	%%string;		#REQUIRED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.delegateURI.attribs;>")
			Result.append_string ("<!ENTITY %% local.nextCatalog.attribs %"%">")
			Result.append_string ("<!ELEMENT %%nextCatalog; EMPTY>")
			Result.append_string ("<!ATTLIST %%nextCatalog;	id		ID			#IMPLIED	catalog		%%uriReference;		#REQUIRED	xml:base	%%uriReference;		#IMPLIED        %%local.nextCatalog.attribs;>")
			Result.append_string ("<!ENTITY %% local.group.mix %"%">")
			Result.append_string ("<!ENTITY %% local.group.attribs %"%">")
			Result.append_string ("<!ELEMENT %%group; (%%public;|%%system;|%%uri;|%%rewriteSystem;|%%rewriteURI;|%%delegatePublic;|%%delegateSystem;|%%delegateURI;|%%nextCatalog; %%local.group.mix;)+>")
			Result.append_string ("<!ATTLIST %%group;	id		ID			#IMPLIED	prefer		%%systemOrPublic;	#IMPLIED	xml:base	%%uriReference;		#IMPLIED        %%local.group.attribs;>")
		ensure
			xml_catalog_dtd_not_void: Result /= Void
		end

	Xml_catalog_xsd: STRING is
			-- OASIS XML Catalogs W3C schema
		once
			Result := clone ("<?xml version=%"1.0%" encoding=%"utf-8%"?>")
			Result.append_string ("<xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema' xmlns:er='urn:oasis:names:tc:entity:xmlns:xml:catalog' targetNamespace='urn:oasis:names:tc:entity:xmlns:xml:catalog' elementFormDefault='qualified'>")
			Result.append_string ("<!-- $Id$ -->")
			Result.append_string ("<xs:simpleType name='pubIdChars'>")
			Result.append_string ("<!-- A string of the characters defined as pubIdChar in production 13 of the Second Edition of the XML 1.0 Recommendation. Does not include the whitespace characters because they're normalized by XML parsing. -->")
			Result.append_string ("<xs:restriction base='xs:string'>")
			Result.append_string ("<xs:pattern value=%"[a-zA-Z0-9-'()+,./:=?;!*#@$_%%]*%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:simpleType>")
			Result.append_string ("<xs:simpleType name='publicIdentifier'>")
			Result.append_string ("<xs:restriction base='er:pubIdChars'/>")
			Result.append_string ("</xs:simpleType>")
			Result.append_string ("<xs:simpleType name='partialPublicIdentifier'>")
			Result.append_string ("<xs:restriction base='er:pubIdChars'/>")
			Result.append_string ("</xs:simpleType>")
			Result.append_string ("<xs:simpleType name='systemOrPublic'>")
			Result.append_string ("<xs:restriction base='xs:string'>")
			Result.append_string ("<xs:enumeration value='system'/>")
			Result.append_string ("<xs:enumeration value='public'/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:simpleType>")
			Result.append_string ("<!-- The global attribute xml:base is not explicitly declared; -->")
			Result.append_string ("<!-- it is allowed by the anyAttribute declarations. -->")
			Result.append_string ("<xs:complexType name='catalog'>")
			Result.append_string ("<xs:choice minOccurs='1' maxOccurs='unbounded'>")
			Result.append_string ("<xs:element ref='er:public'/>")
			Result.append_string ("<xs:element ref='er:system'/>")
			Result.append_string ("<xs:element ref='er:uri'/>")
			Result.append_string ("<xs:element ref='er:rewriteSystem'/>")
			Result.append_string ("<xs:element ref='er:rewriteURI'/>")
			Result.append_string ("<xs:element ref='er:delegatePublic'/>")
			Result.append_string ("<xs:element ref='er:delegateSystem'/>")
			Result.append_string ("<xs:element ref='er:delegateURI'/>")
			Result.append_string ("<xs:element ref='er:nextCatalog'/>")
			Result.append_string ("<xs:element ref='er:group'/>")
			Result.append_string ("<xs:any namespace='##other' processContents='skip'/>")
			Result.append_string ("</xs:choice>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:attribute name='prefer' type='er:systemOrPublic'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='public'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"publicId%" type=%"er:publicIdentifier%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"uri%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='system'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"systemId%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"uri%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='uri'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"name%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"uri%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='rewriteSystem'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"systemIdStartString%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"rewritePrefix%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='rewriteURI'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"uriIdStartString%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"rewritePrefix%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='delegatePublic'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"publicIdStartString%" type=%"er:partialPublicIdentifier%"	use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='delegateSystem'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"systemIdStartString%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='delegateURI'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"uriStartString%" type=%"xs:string%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='nextCatalog'>")
			Result.append_string ("<xs:complexContent>")
			Result.append_string ("<xs:restriction base=%"xs:anyType%">")
			Result.append_string ("<xs:attribute name=%"catalog%" type=%"xs:anyURI%" use=%"required%"/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:restriction>")
			Result.append_string ("</xs:complexContent>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:complexType name='group'>")
			Result.append_string ("<xs:choice minOccurs='1' maxOccurs='unbounded'>")
			Result.append_string ("<xs:element ref='er:public'/>")
			Result.append_string ("<xs:element ref='er:system'/>")
			Result.append_string ("<xs:element ref='er:uri'/>")
			Result.append_string ("<xs:element ref='er:rewriteSystem'/>")
			Result.append_string ("<xs:element ref='er:rewriteURI'/>")
			Result.append_string ("<xs:element ref='er:delegatePublic'/>")
			Result.append_string ("<xs:element ref='er:delegateSystem'/>")
			Result.append_string ("<xs:element ref='er:delegateURI'/>")
			Result.append_string ("<xs:element ref='er:nextCatalog'/>")
			Result.append_string ("<xs:any namespace='##other' processContents='skip'/>")
			Result.append_string ("</xs:choice>")
			Result.append_string ("<xs:attribute name='prefer' type='er:systemOrPublic'/>")
			Result.append_string ("<xs:attribute name='id' type='xs:ID'/>")
			Result.append_string ("<xs:anyAttribute namespace=%"##other%" processContents=%"lax%"/>")
			Result.append_string ("</xs:complexType>")
			Result.append_string ("<xs:element name=%"catalog%" type=%"er:catalog%"/>")
			Result.append_string ("<xs:element name=%"public%" type=%"er:public%"/>")
			Result.append_string ("<xs:element name=%"system%" type=%"er:system%"/>")
			Result.append_string ("<xs:element name=%"uri%" type=%"er:uri%"/>")
			Result.append_string ("<xs:element name=%"rewriteSystem%" type=%"er:rewriteSystem%"/>")
			Result.append_string ("<xs:element name=%"rewriteURI%" type=%"er:rewriteURI%"/>")
			Result.append_string ("<xs:element name=%"delegatePublic%" type=%"er:delegatePublic%"/>")
			Result.append_string ("<xs:element name=%"delegateSystem%" type=%"er:delegateSystem%"/>")
			Result.append_string ("<xs:element name=%"delegateURI%" type=%"er:delegateURI%"/>")
			Result.append_string ("<xs:element name=%"nextCatalog%" type=%"er:nextCatalog%"/>")
			Result.append_string ("<xs:element name=%"group%" type=%"er:group%"/>")
			Result.append_string ("</xs:schema>")
		ensure
			xml_catalog_xsd_not_void: Result /= Void
		end

	Xml_catalog_rng: STRING is
			-- Path to OASIS XML Catalogs RELAX NG grammar
		once
			Result := clone ("<?xml version=%"1.0%"?>")
			Result.append_string ("<grammar xmlns=%"http://relaxng.org/ns/structure/1.0%" ns=%"urn:oasis:names:tc:entity:xmlns:xml:catalog%" datatypeLibrary=%"http://www.w3.org/2001/XMLSchema-datatypes%">")
			Result.append_string ("<!-- $Id$ -->")
			Result.append_string ("<start>")
			Result.append_string ("<choice>")
			Result.append_string ("<ref name=%"Catalog%"/>")
			Result.append_string ("</choice>")
			Result.append_string ("</start>")
			Result.append_string ("<define name=%"pubIdChars%">")
			Result.append_string ("<data type=%"string%">")
			Result.append_string ("<param name=%"pattern%">[a-zA-Z0-9-'()+,./:=?;!*#@$_%%]*</param>")
			Result.append_string ("</data>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"publicIdentifier%">")
			Result.append_string ("<ref name=%"pubIdChars%"/>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"partialPublicIdentifier%">")
			Result.append_string ("<ref name=%"pubIdChars%"/>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"systemOrPublic%">")
			Result.append_string ("<choice>")
			Result.append_string ("<value>system</value>")
			Result.append_string ("<value>public</value>")
			Result.append_string ("</choice>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"uriReference%">")
			Result.append_string ("<data type=%"anyURI%"/>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"OptionalAttributes%">")
			Result.append_string ("<optional>")
			Result.append_string ("<attribute name=%"id%">")
			Result.append_string ("<data type=%"ID%"/>")
			Result.append_string ("</attribute>")
			Result.append_string ("</optional>")
			Result.append_string ("<zeroOrMore>")
			Result.append_string ("<attribute>")
			Result.append_string ("<anyName>")
			Result.append_string ("<except>")
			Result.append_string ("<nsName ns=%"%"/>")
			Result.append_string ("<nsName/>")
			Result.append_string ("</except>")
			Result.append_string ("</anyName>")
			Result.append_string ("</attribute>")
			Result.append_string ("</zeroOrMore>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"PreferAttribute%">")
			Result.append_string ("<attribute name=%"prefer%">")
			Result.append_string ("<ref name=%"systemOrPublic%"/>")
			Result.append_string ("</attribute>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"Catalog%">")
			Result.append_string ("<element name=%"catalog%">")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<optional>")
			Result.append_string ("<ref name=%"PreferAttribute%"/>")
			Result.append_string ("</optional>")
			Result.append_string ("<oneOrMore>")
			Result.append_string ("<choice>")
			Result.append_string ("<ref name=%"Group%"/>")
			Result.append_string ("<ref name=%"Public%"/>")
			Result.append_string ("<ref name=%"System%"/>")
			Result.append_string ("<ref name=%"Uri%"/>")
			Result.append_string ("<ref name=%"RewriteSystem%"/>")
			Result.append_string ("<ref name=%"RewriteURI%"/>")
			Result.append_string ("<ref name=%"DelegatePublic%"/>")
			Result.append_string ("<ref name=%"DelegateSystem%"/>")
			Result.append_string ("<ref name=%"DelegateURI%"/>")
			Result.append_string ("<ref name=%"NextCatalog%"/>")
			Result.append_string ("<ref name=%"AnyOtherElement%"/>")
			Result.append_string ("</choice>")
			Result.append_string ("</oneOrMore>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"Group%">")
			Result.append_string ("<element name=%"group%">")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<optional>")
			Result.append_string ("<ref name=%"PreferAttribute%"/>")
			Result.append_string ("</optional>")
			Result.append_string ("<oneOrMore>")
			Result.append_string ("<choice>")
			Result.append_string ("<ref name=%"Public%"/>")
			Result.append_string ("<ref name=%"System%"/>")
			Result.append_string ("<ref name=%"Uri%"/>")
			Result.append_string ("<ref name=%"RewriteSystem%"/>")
			Result.append_string ("<ref name=%"RewriteURI%"/>")
			Result.append_string ("<ref name=%"DelegatePublic%"/>")
			Result.append_string ("<ref name=%"DelegateSystem%"/>")
			Result.append_string ("<ref name=%"DelegateURI%"/>")
			Result.append_string ("<ref name=%"NextCatalog%"/>")
			Result.append_string ("<ref name=%"AnyOtherElement%"/>")
			Result.append_string ("</choice>")
			Result.append_string ("</oneOrMore>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"Public%">")
			Result.append_string ("<element name=%"public%">")
			Result.append_string ("<attribute name=%"publicId%">")
			Result.append_string ("<ref name=%"publicIdentifier%"/>")
			Result.append_string ("</attribute>")
			Result.append_string ("<attribute name=%"uri%">")
			Result.append_string ("<ref name=%"uriReference%"/>")
			Result.append_string ("</attribute>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"System%">")
			Result.append_string ("<element name=%"system%">")
			Result.append_string ("<attribute name=%"systemId%"/>")
			Result.append_string ("<attribute name=%"uri%">")
			Result.append_string ("<ref name=%"uriReference%"/>")
			Result.append_string ("</attribute>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"Uri%">")
			Result.append_string ("<element name=%"uri%">")
			Result.append_string ("<attribute name=%"name%"/>")
			Result.append_string ("<attribute name=%"uri%">")
			Result.append_string ("<ref name=%"uriReference%"/>")
			Result.append_string ("</attribute>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"RewriteSystem%">")
			Result.append_string ("<element name=%"rewriteSystem%">")
			Result.append_string ("<attribute name=%"systemIdStartString%"/>")
			Result.append_string ("<attribute name=%"rewritePrefix%"/>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"RewriteURI%">")
			Result.append_string ("<element name=%"rewriteURI%">")
			Result.append_string ("<attribute name=%"uriStartString%"/>")
			Result.append_string ("<attribute name=%"rewritePrefix%"/>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"DelegatePublic%">")
			Result.append_string ("<element name=%"delegatePublic%">")
			Result.append_string ("<attribute name=%"publicIdStartString%"/>")
			Result.append_string ("<attribute name=%"catalog%"/>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"DelegateSystem%">")
			Result.append_string ("<element name=%"delegateSystem%">")
			Result.append_string ("<attribute name=%"systemIdStartString%"/>")
			Result.append_string ("<attribute name=%"catalog%"/>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"DelegateURI%">")
			Result.append_string ("<element name=%"delegateURI%">")
			Result.append_string ("<attribute name=%"uriStartString%"/>")
			Result.append_string ("<attribute name=%"catalog%"/>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"NextCatalog%">")
			Result.append_string ("<element name=%"nextCatalog%">")
			Result.append_string ("<attribute name=%"catalog%"/>")
			Result.append_string ("<ref name=%"OptionalAttributes%"/>")
			Result.append_string ("<empty/>")
			Result.append_string ("</element>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"AnyOtherElement%">")
			Result.append_string ("<choice>")
			Result.append_string ("<element>")
			Result.append_string ("<anyName>")
			Result.append_string ("<except>")
			Result.append_string ("<nsName ns=%"%"/>")
			Result.append_string ("<nsName/>")
			Result.append_string ("</except>")
			Result.append_string ("</anyName>")
			Result.append_string ("<zeroOrMore>")
			Result.append_string ("<attribute>")
			Result.append_string ("<anyName/>")
			Result.append_string ("</attribute>")
			Result.append_string ("</zeroOrMore>")
			Result.append_string ("<ref name=%"AnyContent%"/>")
			Result.append_string ("</element>")
			Result.append_string ("<text/>")
			Result.append_string ("</choice>")
			Result.append_string ("</define>")
			Result.append_string ("<define name=%"AnyContent%">")
			Result.append_string ("<mixed>")
			Result.append_string ("<zeroOrMore>")
			Result.append_string ("<element>")
			Result.append_string ("<anyName/>")
			Result.append_string ("<zeroOrMore>")
			Result.append_string ("<attribute>")
			Result.append_string ("<anyName/>")
			Result.append_string ("</attribute>")
			Result.append_string ("</zeroOrMore>")
			Result.append_string ("<zeroOrMore>")
			Result.append_string ("<ref name=%"AnyContent%"/>")
			Result.append_string ("</zeroOrMore>")
			Result.append_string ("</element>")
			Result.append_string ("</zeroOrMore>")
			Result.append_string ("</mixed>")
			Result.append_string ("</define>")
			Result.append_string ("</grammar>")
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
			end
		end
		
	resolve_uri (a_uri_reference: STRING) is
			-- Resolve `a_uri_reference' on behalf of an application.
		local
			a_system_id: STRING
		do
			if well_known_uri_references.has (a_uri_reference) then

				-- TODO: the following two lines will need to change if we implement `Current' as a general-purpose resolver-cache

				has_media_type := False
				last_media_type := Void

				a_system_id := well_known_uri_references.item (a_uri_reference)
				create {KL_STRING_INPUT_STREAM} last_uri_reference_stream.make (a_system_id)
			else
				a_system_id := a_uri_reference
				uri_scheme_resolver.resolve (a_uri_reference)
				has_media_type := uri_scheme_resolver.has_media_type
				last_media_type := uri_scheme_resolver.last_media_type
				last_uri_reference_stream := uri_scheme_resolver.last_stream
			end
			create last_system_id.make (a_system_id)
		end

	resolve_finish is
		do
			uri_scheme_resolver.resolve_finish
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
	
	has_media_type: BOOLEAN
			-- Is the media type available.

	last_media_type: UT_MEDIA_TYPE
			-- Media type, if available.

end

	
