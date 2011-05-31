note

	description:

		"ECF XML element names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ELEMENT_NAMES

feature -- Constants

	xml_all_classes: STRING = "all_classes"
			-- "all_classes" attribute name

	xml_build: STRING = "build"
			-- "build" attribute name

	xml_class: STRING = "class"
			-- "class" attribute name

	xml_cluster: STRING = "cluster"
			-- "cluster" element name

	xml_compiler: STRING = "compiler"
			-- "compiler" attribute value

	xml_condition: STRING = "condition"
			-- "condition" element name

	xml_custom: STRING = "custom"
			-- "custom" element name

	xml_dotnet: STRING = "dotnet"
			-- "dotnet" attribute name

	xml_dynamic_runtime: STRING = "dynamic_runtime"
			-- "dynamic_runtime" attribute name

	xml_exclude: STRING = "exclude"
			-- "exclude" attribute name

	xml_excluded_value: STRING = "excluded_value"
			-- "excluded_value" attribute name

	xml_external_include: STRING = "external_include"
			-- "external_include" element name

	xml_external_library: STRING = "external_library"
			-- "external_library" element name

	xml_external_object: STRING = "external_object"
			-- "external_object" element name

	xml_feature: STRING = "feature"
			-- "feature" attribute name

	xml_file_rule: STRING = "file_rule"
			-- "file_rule" element name

	xml_include: STRING = "include"
			-- "include" attribute name

	xml_library: STRING = "library"
			-- "library" attribute name

	xml_library_target: STRING = "library_target"
			-- "library_target" attribute name

	xml_min: STRING = "min"
			-- "min" attribute name

	xml_max: STRING = "max"
			-- "max" attribute name

	xml_msil_clr: STRING = "msil_clr"
			-- "msil_clr" attribute value

	xml_multithreaded: STRING = "multithreaded"
			-- "multithreaded" attribute name

	xml_name: STRING = "name"
			-- "name" attribute name

	xml_new_name: STRING = "new_name"
			-- "new_name" attribute name

	xml_location: STRING = "location"
			-- "location" attribute name

	xml_old_name: STRING = "old_name"
			-- "old_name" attribute name

	xml_override: STRING = "override"
			-- "override" element name

	xml_platform: STRING = "platform"
			-- "platform" element name

	xml_recursive: STRING = "recursive"
			-- "recursive" attribute name

	xml_renaming: STRING = "renaming"
			-- "renaming" element name

	xml_root: STRING = "root"
			-- "root" element name

	xml_system: STRING = "system"
			-- "system" element name

	xml_target: STRING = "target"
			-- "target" element name

	xml_type: STRING = "type"
			-- "type" attribute name

	xml_uuid: STRING = "uuid"
			-- "target" element name

	xml_value: STRING = "value"
			-- "value" attribute name

	xml_variable: STRING = "variable"
			-- "variable" element name

	xml_version: STRING = "version"
			-- "version" element name

feature -- Namespaces

	namespace_1_0_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-0-0"
			-- ECF namespace corresponding to ISE 5.7

	namespace_1_2_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-2-0"
			-- ECF namespace corresponding to ISE 6.0

	namespace_1_3_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-3-0"
			-- ECF namespace corresponding to ISE 6.1

	namespace_1_4_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-4-0"
			-- ECF namespace corresponding to ISE 6.2

	namespace_1_5_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-5-0"
			-- ECF namespace corresponding to ISE 6.4

end
