note

	description:

		"ECF XML element names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ELEMENT_NAMES

feature -- Constants

	xml_abstract: STRING = "abstract"
			-- "abstract" attribute name

	xml_all_classes: STRING = "all_classes"
			-- "all_classes" attribute name

	xml_assembly: STRING = "assembly"
			-- "assembly" element name

	xml_assembly_culture: STRING = "assembly_culture"
			-- "assembly_culture" attribute name

	xml_assembly_key: STRING = "assembly_key"
			-- "assembly_key" attribute name

	xml_assembly_name: STRING = "assembly_name"
			-- "assembly_name" attribute name

	xml_assembly_version: STRING = "assembly_version"
			-- "assembly_version" attribute name

	xml_assertions: STRING = "assertions"
			-- "assertions" element name

	xml_build: STRING = "build"
			-- "build" attribute name

	xml_capability: STRING = "capability"
			-- "capability" element name

	xml_class: STRING = "class"
			-- "class" attribute name

	xml_class_option: STRING = "class_option"
			-- "class_option" element name

	xml_class_rename: STRING = "class_rename"
			-- "class_rename" attribute name

	xml_cluster: STRING = "cluster"
			-- "cluster" element name

	xml_command: STRING = "command"
			-- "command" attribute name

	xml_company: STRING = "company"
			-- "company" attribute name

	xml_compiler: STRING = "compiler"
			-- "compiler" attribute value

	xml_concurrency: STRING = "concurrency"
			-- "concurrency" element name

	xml_condition: STRING = "condition"
			-- "condition" element name

	xml_copyright: STRING = "copyright"
			-- "copyright" attribute name

	xml_custom: STRING = "custom"
			-- "custom" element name

	xml_debug: STRING = "debug"
			-- "debug" element name

	xml_description: STRING = "description"
			-- "description" element name

	xml_dotnet: STRING = "dotnet"
			-- "dotnet" attribute name

	xml_dynamic_runtime: STRING = "dynamic_runtime"
			-- "dynamic_runtime" attribute name

	xml_eifgens_location: STRING = "eifgens_location"
			-- "eifgens_location" attribute name

	xml_enabled: STRING = "enabled"
			-- "enabled" attribute name

	xml_exclude: STRING = "exclude"
			-- "exclude" attribute name

	xml_excluded_value: STRING = "excluded_value"
			-- "excluded_value" attribute name

	xml_extends: STRING = "extends"
			-- "extends" attribute name

	xml_extends_location: STRING = "extends_location"
			-- "extends_location" attribute name

	xml_external_cflag: STRING = "external_cflag"
			-- "external_cflag" element name

	xml_external_include: STRING = "external_include"
			-- "external_include" element name

	xml_external_library: STRING = "external_library"
			-- "external_library" element name

	xml_external_linker_flag: STRING = "external_linker_flag"
			-- "external_linker_flag" element name

	xml_external_make: STRING = "external_make"
			-- "external_make" element name

	xml_external_object: STRING = "external_object"
			-- "external_object" element name

	xml_external_resource: STRING = "external_resource"
			-- "external_resource" element name

	xml_feature: STRING = "feature"
			-- "feature" attribute name

	xml_feature_rename: STRING = "feature_rename"
			-- "feature_rename" attribute name

	xml_file_rule: STRING = "file_rule"
			-- "file_rule" element name

	xml_group: STRING = "group"
			-- "group" attribute name

	xml_hidden: STRING = "hidden"
			-- "hidden" attribute name

	xml_include: STRING = "include"
			-- "include" attribute name

	xml_library: STRING = "library"
			-- "library" attribute name

	xml_library_target: STRING = "library_target"
			-- "library_target" attribute name

	xml_location: STRING = "location"
			-- "location" attribute name

	xml_major: STRING = "major"
			-- "major" attribute name

	xml_mapping: STRING = "mapping"
			-- "mapping" element name

	xml_match: STRING = "match"
			-- "match" attribute name

	xml_max: STRING = "max"
			-- "max" attribute name

	xml_message: STRING = "message"
			-- "message" attribue name

	xml_min: STRING = "min"
			-- "min" attribute name

	xml_minor: STRING = "minor"
			-- "minor" attribute name

	xml_msil_clr: STRING = "msil_clr"
			-- "msil_clr" attribute value

	xml_multithreaded: STRING = "multithreaded"
			-- "multithreaded" attribute name

	xml_name: STRING = "name"
			-- "name" attribute name

	xml_new_name: STRING = "new_name"
			-- "new_name" attribute name

	xml_note: STRING = "note"
			-- "note" element name

	xml_old_name: STRING = "old_name"
			-- "old_name" attribute name

	xml_option: STRING = "option"
			-- "option" element name

	xml_override: STRING = "override"
			-- "override" element name

	xml_overrides: STRING = "overrides"
			-- "overrides" element name

	xml_platform: STRING = "platform"
			-- "platform" element name

	xml_post_compile_action: STRING = "post_compile_action"
			-- "post_compile_action" element name

	xml_pre_compile_action: STRING = "pre_compile_action"
			-- "pre_compile_action" element name

	xml_precompile: STRING = "precompile"
			-- "precompile" element name

	xml_prefix: STRING = "prefix"
			-- "prefix" attribute name

	xml_product: STRING = "product"
			-- "product" attribute name

	xml_readonly: STRING = "readonly"
			-- "recursive" attribute name

	xml_recursive: STRING = "recursive"
			-- "recursive" attribute name

	xml_redirection: STRING = "redirection"
			-- "redirection" element name

	xml_release: STRING = "release"
			-- "release" attribute name

	xml_renaming: STRING = "renaming"
			-- "renaming" element name

	xml_root: STRING = "root"
			-- "root" element name

	xml_setting: STRING = "setting"
			-- "setting" element name

	xml_succeed: STRING = "succeed"
			-- "succeed" attribute name

	xml_support: STRING = "support"
			-- "support" attribute name

	xml_system: STRING = "system"
			-- "system" element name

	xml_target: STRING = "target"
			-- "target" element name

	xml_trademark: STRING = "trademark"
			-- "trademark" attribute name

	xml_type: STRING = "type"
			-- "type" attribute name

	xml_use: STRING = "use"
			-- "use" attribute name

	xml_use_application_options: STRING = "use_application_options"
			-- "use_application_options" attribute name

	xml_uses: STRING = "uses"
			-- "uses" element name

	xml_uuid: STRING = "uuid"
			-- "uuid" attribue name

	xml_value: STRING = "value"
			-- "value" attribute name

	xml_variable: STRING = "variable"
			-- "variable" element name

	xml_version: STRING = "version"
			-- "version" element name

	xml_visible: STRING = "visible"
			-- "visible" element name

	xml_void_safety: STRING = "void_safety"
			-- "void_safety" element name

	xml_warning: STRING = "warning"
			-- "warning" element name

	xml_working_directory: STRING = "working_directory"
			-- "working_directory" attribute name

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

	namespace_1_15_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-15-0"
			-- ECF namespace corresponding to ISE 15.12

	namespace_1_16_0: STRING = "http://www.eiffel.com/developers/xml/configuration-1-16-0"
			-- ECF namespace corresponding to ISE 17.05

end
