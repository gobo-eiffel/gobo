
*) Specification of XACE

Status: Draft V4

There are two XACE documents "system" documents and "cluster" documents. A "system" document specifies the build requirements for a certain application just like a regular ACE file does. A "cluster" document on the other hand describes a library - that is a collection of classes.

*) "cluster" document

**) Typical application

A library ships with an "cluster" document. People using this library no longer need to copy&paste the ACE file from the examples of the library over and over again. Taking care of changes in the cluster structure and other details. In their applications "system" document they simply refere to the libraries "cluster" document.

**) Syntax

The root element of the "cluster" document is the "cluster" element.
The root element of the "system" document is the "system" element.

***) "cluster" element
A cluster can be seen as a tree structure containing further clusters, classes, options and externals.
****) Attribute "name" (optional)
Assigns a name to a cluster (or library).
****) Attribute "location" (optional)
Assigns a directory to a cluster. Any Eiffel source files found in this directory are said to be contained in this cluster. If the attribute is omitted the cluster does not contain classes directly. It still may contain other clusters thus contain classes indirectly. Only clusters found directly in the specified are contained in the cluster. Subdirectories and their classes are not.
****) "cluster" element (occurence: >=0)
Nests another clusters one in another. The outer cluster is called the parent cluster and the inner cluster sub-cluster.
****) "mount" element (occurence: >=0)
Specifies a cluster defined in another "cluster" document. The specified cluster and all it's sub-clusters are "mounted" into the outer cluster. 
*****) Attribute "location" (required)
Specifies the external "cluster" document
*****) Attribute "cluster" (optional)
Selects a certain cluster (and it's sub-clusters) in the "cluster" document to be included instead of the root cluster of the document. For a syntax description of the "cluster" value see section "Qualified Cluster Names"
****) "description" element (occurence: >=0)
used for plain text description of cluster. this element may change in the future.
****) "options" element
"option" elements in nested clusters overide their grand siblings.
*****) "require" element
******) Attribute "enable" (optional)
Maybe "True" or "False". Defaults to "True"
*****) "ensure" element
******) Attribute "enable"
Maybe "True" or "False". Defaults to "True"
*****) "invariant" element
******) Attribute "enable"
Maybe "True" or "False". Defaults to "True"
*****) "loop" element
******) Attribute "enable"
Maybe "True" or "False". Defaults to "True"
*****) "check" element
******) Attribute "enable"
Maybe "True" or "False". Defaults to "True"
*****) "debug" element
******) Attribute "enable"
Maybe "True" or "False". Defaults to "True"
******) Attribute "name" (optional)
Name of debug assertion to turn on.
If ommitted all debug instructions are turned on.

***) "system" element
A "system" element describes the elements of an application and how to put them together.
****) Attribute "name" (required)
Specifies the name of theb executable to build.
****) "root" element (occurences: =1)
Specfies the root class name and creation procedure name of the executable.
*****) Attribute "class" (required)
Specifies the root class name
*****) Attribute "creation" (required)
Specifies the creation procedure name of the root class
****) "cluster" element (occurences: >=1)
See description above.

**) Attribute Value expansion
"name" and "location" attribute values may contain variables of the form "${VAR_NAME}". If they are defined they will be expanded, otherwise they will be left untouched.

**) Directory Seperators
Only slashes ("/") are allowed to sperate directories. On platforms where this is not the native seperator the path will be converted to the native standards in all output files. Windows drive letter constructs are prohibited.


**) Qualified Cluster Names
To address cluster in a nested cluster structer qualified cluster name are used. To address a given cluster prepend it's name with the name of it's parents seperated by a dot (".") followed by the name of the cluster to address. A qualified cluster name may contain variables. 


**) Parent Reference 
If you leave out the "location" attribute of a cluster element, but provide a "name" attribute, the path name of the cluster will be the concatenation of the parents cluster a slash and the current cluster name.

**) Variables

The XACE tool can be given a set of variable->value pairs. Variable names can be used in qualfied cluster names to dynamically change the cluster tree at tool invocation time.

**) Syntax Outlook

Future versions are likely to make certain attributes (like "creation") optional and assume sensible defaults. It is also likely that that new attributes will be introduced to allow finer control over what get's included (like "recursive" for "cluster" and "ref").

Additionally there it will be allowed to nest "external" and "option" elements in "cluster" elements to specify external C dependencies and and Eiffel and C compile options.

**) Good style in writing XACE files

With packages like GOBO and eXML it is of advantage to include all Eiffel source dirs in the main XACE file. They can be referenced from the examples system documents like this:
--
<mount location="..." cluster="example.tree.formatter"/> 
--
This means that the root cluster of such cluster documents should nest "example" and "library" so one can still address the library only: 
--
<mount location="..." cluster="library/xml"/>
--
The advantage of this approach comes with the possiblities XACE offer. Image a tool that renames a class (say hey-ho to refaturing tools): 
--
gexace --rename-class --from="DS_LIFT" --to="DS_LIST" gobo.xace
--

This command would do everything you would otherwise need to do by hand. It would rename the file "ds_lift.e" to "ds_list.e" and change in all classes "DS_LIFT" to "DS_LIST". If the examples clusters are not contained in the library's cluster document, you would need to run the command for each example again.

The same can be done for feature renaming, which will in practice probably occur more often, but will be a little bit trickier to implement (search&replace more difficult)


*) Discussion of "options" element

"options" children are a natural choice for the "condition" attribute. 
Typical use of "condition": release and debug builds.
   
**) Possible children of "option"

***) "assertions"

SE supports only a global level ("boost", "require", "check", ...)
ISE supports assertion checking to differ in clusters. It supports selective "check"s and IIRC selective checking of preconditions, postconditions, ... is comming down the pipe.
VE supports ???
What can we do? Find the highest common denominator? Bad idea. If we support a finer grade control, compilers who do not understand these details can be given the highest debug level found in the XACE file.

We should go for the finest control. Compilers that do not support that level, the highest level will be used. The reason is that it is vert likely that in the future all compilers support fine grain control.

--
<require enable="True|False"/>
<ensure enable="True|False"/>
<invariant enable="True|False"/>
<loop enable="True|False"/>
<check enable="True|False"/>
<debug enable="True|False" name="..."/>
--



***) "console_application" 

Only supported by ISE, but does other compilers no harm. We could
easily support it.

TODO: Find other options

*) "external"

children of externals are a natural choice for the "condition" attribute. 
Typical use of "condition": link different libraries on different platforms.

**) Possible Children of "externals"

***) "link"

Specifies object files or libraries to link with the
application. "conditional" attribute allowed

***) "include_dir"

Specifies additional c-header directories

***) "export"

Specifies Eiffel callback features for C.
Generates cecil.se file for SE and "visible" clause for ISE. TODO:
What about VE and HACT?
Example:
--
<export class="GTK_COMMAND_TYPE">
	<feature name="enty_from_gtk" alias="eiffel_entry_from_gtk"/>
	<feature name="gtk_function_entry" alias="eiffel_gtk_function_entry"/>
</export>
--




*) Real life examples of XACE

-- xace.xace the system document used to build the xace tool itself
<system name="xace">
	<root class="XACE" creation="make"/>
	<cluster>
		<cluster name="xace" location="${EXML}/src/xace/"/>

		<mount location="${EXML}/library/exml.xace" cluster="exml.interface"/>
		<mount location="${EXML}/library/exml.xace" cluster="exml.impl.no_expat"/>
		<mount location="${EXML}/library/exml.xace" cluster="exml.impl.eiffel"/>
		<mount location="${EXML}/library/exml.xace" cluster="exml.impl.tree_on_event"/>
		<mount location="${GOBO}/library/gobo.xace" cluster="gobo"/>
		<mount location="${GOBO}/library/kernel.xace" cluster="kernel.${EIF_COMPILER}"/>
	</cluster>
</system>

-- kernel.xace cluster document for various kernels
<cluster name="kernel">
  <cluster name="se" location="${SE}/lib_std"/>
  <cluster name="ise" location="${EIFFEL4}/library/base/kernel">
    <cluster name="support" location="${EIFFEL4}/library/base/support"/>
  </cluster>
</cluster>
-- gobo.xace cluster document for GOBO
<cluster name="gobo" location="${GOBO}/library">

	<cluster name="kernel" >
		<cluster name="spec" >
			 <cluster name="${EIF_COMPILER}" />
		</cluster>
	</cluster>
	<cluster name="structure" />
	<cluster name="parse"  />

</cluster>

-- exml.xace cluster document for eXML
<cluster name="exml">

	<description>
		The Eiffel XML Parser Framework

		Please note that you cannot include the root ("exml") cluster
		and all it's sub-clusters, because there are class name clashes
		due to the factory in use.
		You have to select "exml.interface" recursivly and then
		from the "exml.impl" cluster the parsers you wish to compile in.
		You can choose all, but if you decide to leave out a certain parser 
		you must select it's counterpart from "exml.no_impl" to keep the 
		factory happy.
	</description>

	<cluster name="interface" >
		<cluster name="public" location="${EXML}/library" >
			<cluster name="factory" />
			<cluster name="position" />
			<cluster name="source" />
			<cluster name="general" />
			<cluster name="event" />
			<cluster name="tree" />
			<cluster name="formater" />
			<cluster name="xace" >
				<cluster name="support" />
				<cluster name="ast" />
				<cluster name="generator" />
				<cluster name="parse" />
				<cluster name="error" />
			</cluster>
		</cluster>
	        <cluster name="impl" location="${EXML}/library/impl/interface" >
		        <cluster name="general" />
			<cluster name="event" />
			<cluster name="tree" />
		</cluster>
	</cluster>

	<cluster name="impl" location="${EXML}/library/impl" >
		<cluster name="expat" >
			<cluster name="api" />
			<cluster name="general" />
			<cluster name="event" >
				<externals>
					<export class="EP_EVENT_PARSER">
						<feature name="on_element_declaration_procedure" alias="eif_exml_on_element_declaration_proc" />
						<feature name="on_attribute_declaration_procedure" alias="eif_exml_on_attribute_declaration_proc" />
						<feature name="on_xml_declaration_procedure" alias="eif_exml_on_xml_declaration_proc" />
						<feature name="on_entity_declaration_procedure" alias="eif_exml_on_entity_declaration_proc" />
						<feature name="on_start_tag_procedure" alias="eif_exml_on_start_tag_proc" />
						<feature name="on_end_tag_procedure" alias="eif_exml_on_end_tag_proc" />
						<feature name="on_content_procedure" alias="eif_exml_on_content_proc" />
						<feature name="on_processing_instruction_procedure" alias="eif_exml_on_processing_instruction_proc" />
						<feature name="on_comment_procedure" alias="eif_exml_on_comment_proc" />
						<feature name="on_start_cdata_section_procedure" alias="eif_exml_on_start_cdata_section_proc" />
						<feature name="on_end_cdata_section_procedure" alias="eif_exml_on_end_cdata_section_proc" />
						<feature name="on_default_procedure" alias="eif_exml_on_default_proc" />
						<feature name="on_default_expanded_procedure" alias="eif_exml_on_default_expanded_proc" />
						<feature name="on_start_doctype_procedure" alias="eif_exml_on_start_doctype_proc" />
						<feature name="on_end_doctype_procedure" alias="eif_exml_on_end_doctype_proc" />
						<feature name="on_notation_declaration_procedure" alias="eif_exml_on_notation_declaration_proc" />
						<feature name="on_start_namespace_declaration_procedure" alias="eif_exml_on_start_namespace_declaration_proc" />
						<feature name="on_end_namespace_declaration_procedure" alias="eif_exml_on_end_namespace_declaration_proc" />
						<feature name="on_not_standalone_procedure" alias="eif_exml_on_not_standalone_proc" />
						<feature name="on_external_entity_reference_procedure" alias="eif_exml_on_external_entity_reference_proc" />
						<feature name="on_unknown_encoding_procedure" alias="eif_exml_on_unknown_encoding_proc" />
					</export>
				</externals>
			</cluster>
			<cluster name="spec" >
				<cluster name="${EIF_COMPILER}" />
			</cluster>
			<externals>
				<include_dir location="${EXML}/library/impl/expat/spec/c"/>
				<link_library location="${EXML}/library/impl/expat/spec/c/libexml-expat-${EIF_COMPILER}.a"/>
				<link_library location="-lexpat"/>
			</externals>
		</cluster>
		<cluster name="eiffel" >
			<cluster name="event" />
		</cluster>
		<cluster name="tree_on_event" >
			<cluster name="tree" />
		</cluster>
		<cluster name="no_expat" >
			<cluster name="event" />
		</cluster>
		<cluster name="no_eiffel" >
			<cluster name="event" />
		</cluster>
		<cluster name="no_tree_on_event" >
			<cluster name="tree" />
		</cluster>
	</cluster>

</cluster>
--

*) xace tool todo:
**) Feature completeness
***) refacture element "options"
****) How can we select to (not) override options in mounted cluster?
****) How can we override default options for certain classes?
****) How does overriding options in nested clusters work exactly?
***) find out more about VE external and callback mechanisms
***) introduce conditionals to support:
****) multiple builds (release, debug) look into "option"
****) multiple platforms/external dependencies look into "external"
***) reaname "xace" tool to "gexace"
***) add hact generation
***) finish ve generation
***) rework cli
****) switch from '--build --se' to '--build="se"'
****) assue standard xace file name "system.xace"
***) (post 1.0) add "recursive" attribute to "cluster" and "mount"
***) (post 1.0) add "abstract" attribute to "cluster"
***) (post 1.0) variable declraration
****) (post 1.0) a variable used in an XACE file must be declared first. 
****) (post 1.0) Additional meta data about it's use should be given
****) (post 1.0) declare whether it must be a env var, a define or whether it can be both
****) (post 1.0) declare it as a fixed enum (like EIF_COMPILER may be "ise", "se", "ve", "hact")
****) (post 1.0) add command or tool to generate etags file


**) Quality Assurance
***) refacture gobo related classes and try to push them into gobo
***) move xml error classes into eXML
***) add feature documentation
***) add indexing clauses
***) add test-suite
***) think about renaming "inlcude_dir" into "include"
***) refacture code generation
