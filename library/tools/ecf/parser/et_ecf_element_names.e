note

	description:

		"ECF XML element names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ELEMENT_NAMES

feature -- Constants

	xml_all_classes: STRING is "all_classes"
			-- "all_classes" attribute name

	xml_build: STRING is "build"
			-- "build" attribute name

	xml_class: STRING is "class"
			-- "class" attribute name

	xml_cluster: STRING is "cluster"
			-- "cluster" element name

	xml_compiler: STRING is "compiler"
			-- "compiler" attribute value

	xml_condition: STRING is "condition"
			-- "condition" element name

	xml_custom: STRING is "custom"
			-- "custom" element name

	xml_dotnet: STRING is "dotnet"
			-- "dotnet" attribute name

	xml_dynamic_runtime: STRING is "dynamic_runtime"
			-- "dynamic_runtime" attribute name

	xml_exclude: STRING is "exclude"
			-- "exclude" attribute name

	xml_excluded_value: STRING is "excluded_value"
			-- "excluded_value" attribute name

	xml_external_include: STRING is "external_include"
			-- "external_include" element name

	xml_external_library: STRING is "external_library"
			-- "external_library" element name

	xml_external_object: STRING is "external_object"
			-- "external_object" element name

	xml_feature: STRING is "feature"
			-- "feature" attribute name

	xml_file_rule: STRING is "file_rule"
			-- "file_rule" element name

	xml_include: STRING is "include"
			-- "include" attribute name

	xml_library: STRING is "library"
			-- "library" attribute name

	xml_library_target: STRING is "library_target"
			-- "library_target" attribute name

	xml_min: STRING is "min"
			-- "min" attribute name

	xml_max: STRING is "max"
			-- "max" attribute name

	xml_msil_clr: STRING is "msil_clr"
			-- "msil_clr" attribute value

	xml_multithreaded: STRING is "multithreaded"
			-- "multithreaded" attribute name

	xml_name: STRING is "name"
			-- "name" attribute name

	xml_location: STRING is "location"
			-- "location" attribute name

	xml_override: STRING is "override"
			-- "override" element name

	xml_platform: STRING is "platform"
			-- "platform" element name

	xml_recursive: STRING is "recursive"
			-- "recursive" attribute name

	xml_root: STRING is "root"
			-- "root" element name

	xml_system: STRING is "system"
			-- "system" element name

	xml_target: STRING is "target"
			-- "target" element name

	xml_type: STRING is "type"
			-- "type" attribute name

	xml_uuid: STRING is "uuid"
			-- "target" element name

	xml_value: STRING is "value"
			-- "value" attribute name

	xml_variable: STRING is "variable"
			-- "variable" element name

	xml_version: STRING is "version"
			-- "version" element name

feature -- Namespaces

	namespace_1_0_0: STRING is "http://www.eiffel.com/developers/xml/configuration-1-0-0"
			-- ECF namespace corresponding to ISE 5.7

	namespace_1_2_0: STRING is "http://www.eiffel.com/developers/xml/configuration-1-2-0"
			-- ECF namespace corresponding to ISE 6.0

	namespace_1_3_0: STRING is "http://www.eiffel.com/developers/xml/configuration-1-3-0"
			-- ECF namespace corresponding to ISE 6.1

	namespace_1_4_0: STRING is "http://www.eiffel.com/developers/xml/configuration-1-4-0"
			-- ECF namespace corresponding to ISE 6.2

	namespace_1_5_0: STRING is "http://www.eiffel.com/developers/xml/configuration-1-5-0"
			-- ECF namespace corresponding to ISE 6.4

end
