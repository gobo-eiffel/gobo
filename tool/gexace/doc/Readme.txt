Note: Some parts of this file are rather old (especially the
beginning of the file) and might be out of date. Information
found in the file options.txt is more up-to-date even if it
only covers the <option> elements.

==========================================================

*) Specification of XACE

Status: Draft V4

There are two XACE documents "system" documents and "cluster" documents. A "system" document specifies the build requirements for a certain application just like a regular ACE file does. A "cluster" document on the other hand describes a library - that is a collection of classes.

*) "cluster" document

**) Typical application

A library ships with an "cluster" document. People using this library no longer need to copy&paste the ACE file from the examples of the library over and over again. Taking care of changes in the cluster structure and other details. In their applications "system" document they simply refer to the libraries "cluster" document.

**) Syntax

The root element of the "cluster" document is the "cluster" element.
The root element of the "system" document is the "system" element.

***) "cluster" element
A cluster can be seen as a tree structure containing further clusters, classes, options and externals.
****) Attribute "name" (optional)
Assigns a name to a cluster (or library).
****) Attribute "location" (optional)
Assigns a directory to a cluster. Any Eiffel source files found in this directory are said to be contained in this cluster. If the attribute is omitted the cluster does not contain classes directly. It still may contain other clusters thus contain classes indirectly. Only clusters found directly in the specified directory are contained in the cluster. Subdirectories and their classes are not.
****) "cluster" element (occurrence: >=0)
Nests another clusters one in another. The outer cluster is called the parent cluster and the inner cluster sub-cluster.
****) "mount" element (occurrence: >=0)
Specifies a cluster defined in another "cluster" document. The specified cluster and all its sub-clusters are "mounted" into the outer cluster. 
*****) Attribute "location" (required)
Specifies the external "cluster" document
*****) Attribute "cluster" (optional)
Selects a certain cluster (and its sub-clusters) in the "cluster" document to be included instead of the root cluster of the document. For a syntax description of the "cluster" value see section "Qualified Cluster Names"
****) "description" element (occurrence: >=0)
used for plain text description of cluster. this element may change in the future.
****) "options" element
"option" elements in nested clusters override their grand siblings.
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
Specifies the name of the executable to build.
****) "root" element (occurrences: =1)
Specifies the root class name and creation procedure name of the executable.
*****) Attribute "class" (required)
Specifies the root class name
*****) Attribute "creation" (required)
Specifies the creation procedure name of the root class
****) "cluster" element (occurrences: >=1)
See description above.

**) Attribute Value expansion
"name" and "location" attribute values may contain variables of the form "${VAR_NAME}". If they are defined they will be expanded, otherwise they will be left untouched.

**) Directory Separators
Only slashes ("/") are allowed to separate directories. On platforms where this is not the native separator the path will be converted to the native standards in all output files. Windows drive letter constructs are prohibited.


**) Qualified Cluster Names
To address cluster in a nested cluster structure qualified cluster name are used. To address a given cluster prepend its name with the name of its parents separated by a dot (".") followed by the name of the cluster to address. A qualified cluster name may contain variables. 


**) Parent Reference 
If you leave out the "location" attribute of a cluster element, but provide a "name" attribute, the path name of the cluster will be the concatenation of the parents cluster, a slash and the current cluster name.

**) Variables

The XACE tool can be given a set of variable->value pairs. Variable names can be used in qualified cluster names to dynamically change the cluster tree at tool invocation time.

**) Syntax Outlook

Future versions are likely to make certain attributes (like "creation") optional and assume sensible defaults. It is also likely that new attributes will be introduced to allow finer control over what get's included (like "recursive" for "cluster" and "ref").

Additionally it will be allowed to nest "external" and "option" elements in "cluster" elements to specify external C dependencies and Eiffel and C compile options.

**) Good style in writing XACE files

With packages like GOBO and eXML it is of advantage to include all Eiffel source dirs in the main XACE file. They can be referenced from the example system documents like this:
--
<mount location="..." cluster="example.tree.formatter"/> 
--
This means that the root cluster of such cluster documents should nest "example" and "library" so one can still address the library only: 
--
<mount location="..." cluster="library/xml"/>
--
The advantage of this approach comes with the possiblities XACE offer. Imagine a tool that renames a class (say hey-ho to refacturing tools): 
--
gexace --rename-class --from="DS_LIFT" --to="DS_LIST" gobo.xace
--

This command would do everything you would otherwise need to do by hand. It would rename the file "ds_lift.e" to "ds_list.e" and change in all classes "DS_LIFT" to "DS_LIST". If the example clusters are not contained in the library's cluster document, you would need to run the command for each example again.

The same can be done for feature renaming, which will in practice probably occur more often, but will be a little bit trickier to implement (search&replace more difficult)


*) Discussion of "options" element

"options" children are a natural choice for the "condition" attribute. 
Typical use of "condition": release and debug builds.
   
**) Possible children of "option"

***) "assertions"

SE supports only a global level ("boost", "require", "check", ...)
ISE supports assertion checking to differ in clusters. It supports selective "check"s and IIRC selective checking of preconditions, postconditions, ... is coming down the pipe.
VE supports ???
What can we do? Find the highest common denominator? Bad idea. If we support a finer grade control, compilers who do not understand these details can be given the highest debug level found in the XACE file.

We should go for the finest control. Compilers that do not support that level, the highest level will be used. The reason is that it is very likely that in the future all compilers support fine grain control.

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
		and all its sub-clusters, because there are class name clashes
		due to the factory in use.
		You have to select "exml.interface" recursively and then
		from the "exml.impl" cluster the parsers you wish to compile in.
		You can choose all, but if you decide to leave out a certain parser 
		you must select its counterpart from "exml.no_impl" to keep the 
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
***) refactor element "options"
****) How can we select to (not) override options in mounted cluster?
****) How can we override default options for certain classes?
****) How does overriding options in nested clusters work exactly?
***) find out more about VE external and callback mechanisms
***) introduce conditionals to support:
****) multiple builds (release, debug) look into "option"
****) multiple platforms/external dependencies look into "external"
***) rename "xace" tool to "gexace"
***) add hact generation
***) finish ve generation
***) rework cli
****) switch from '--build --se' to '--build="se"'
****) assure standard xace file name "system.xace"
***) (post 1.0) add "recursive" attribute to "cluster" and "mount"
***) (post 1.0) add "abstract" attribute to "cluster"
***) (post 1.0) variable declaration
****) (post 1.0) a variable used in an XACE file must be declared first. 
****) (post 1.0) Additional meta data about its use should be given
****) (post 1.0) declare whether it must be an env var, a define or whether it can be both
****) (post 1.0) declare it as a fixed enum (like EIF_COMPILER may be "ise", "se", "ve", "hact")
****) (post 1.0) add command or tool to generate etags file


**) Quality Assurance
***) refactor gobo related classes and try to push them into gobo
***) move xml error classes into eXML
***) add feature documentation
***) add indexing clauses
***) add test-suite
***) think about renaming "inlcude_dir" into "include"
***) refacture code generation


=====================================================

Subject: Re: [gobo-eiffel-develop] Xace: attribute "prefix" in <cluster>
Date: Sat, 27 Apr 2002 00:09:00 +0200
From: Eric Bezault <gobosoft@ifrance.com>
Reply-To: ericb@gobosoft.com
Organization: Gobo
To: gobodev <gobo-eiffel-develop@lists.sourceforge.net>

I have implemented the new Xace syntax in 'gexace' and
it is now available in CVS (you would have to run the
bootstrap again). The old syntax will still be accepted
for some time, although you may get a lot of warning
messages and you may get some cluster name clashes in
the generated Ace files (because of the new way we
handle possible name clashes, with "prefix" in <mount>
and "relative" in <cluster>).

What's new?

. Files 'cluster.xace' have been renamed as 'library.xace'.
. The top element in 'library.xace' is <library> instead
  of <cluster>.
. The element <library> has a compulsory attribute "name".
. Elements <cluster> and <mount> (and possibly <option>
  and <external>) are possible subelements of <library>.
. There is no empty <cluster> element in <system> anymore.
  Elements <option>, <cluster> and <mount> (and possibly
  <external>) are directly under <system>.
. There is a new attribute "relative" in <cluster> as
  explained in my previous message in this thread:

> So, now we can have:
>
>    <cluster name="foo" location="bar"/>
>      -- cluster named "foo" with pathname "bar" which is
>      -- not relative to the parent cluster's pathname.
>      -- Examples:
>      --      <cluster name="list" location="/a/b/c/list"/>
>      --      <cluster name="list" location="${GOBO}/list"/>
>      --      <cluster name="root_cluster" location="."/>
>      -- Note that even though the pathname is not relative
>      -- to the parent cluster's pathname, this pathname is
>      -- not necessarily an absolute pathname in the underlying
>      -- file system.
>
>   <cluster name="foo" location="bar" relative="true"/>
>      -- cluster named "foo" with pathname "bar" which is
>      -- relative to the parent cluster's pathname.
>      -- Examples:
>      --   <cluster name="my_list" location="my-list" relative="true"/>
>      --   <cluster name="ds_list" location="list" relative="true"/>
>      --   <cluster name="list" location="../list" relative="true"/>
>      -- If I recall correctly, the first example addresses a request
>      -- that Glenn had a few months ago when one of his directory
>      -- names was not a valid cluster name. The second example is a
>      -- better way to solve name clashes than my initial "prefix"
>      -- suggestion. The third example will produce the following
>      -- pathname: "parent-full-pathname/../list" ("$/../list" in
>      -- ISE's syntax).
>
> Finally, the following construct:
>
>   <cluster name="foo"/>
>
> is equivalent to:
>
>   <cluster name="foo" location="foo" relative="true"/>

. There is a new attribute "prefix" in <mount>. All clusters
  declared in the mounted library will have their names
  prefixed by the corresponding value.
. The clusters of the mounted libraries with the same pathname
  (i.e. the same value for the attribute "location" in <mount>)
  will appear only once in the generated Ace file.
. If there are two mounted libraries with the same pathname
  but different prefixes, then the clash can be resolved in
  either <library> or <system> by repeating the <mount> element
  but with the chosen prefix (which will overwrite the others).
  Note that this is slightly different from my initial suggestion
  where I only mentioned <system>. The advantage of allowing
  clash resolution in <library> as well is that it allows to
  solve these clashes once and for all in a file 'library.xace'
  and mount this file in the 'system.xace' files instead of
  having to repeat again and again this name clash resolution
  in each and every 'system.xace'. See for example:

     $GOBO/library/library.xace

  which contains the prefix declarations and:

     $GOBO/library/src/gexace/system.xace

  where there is no need to declare these prefixes individually
  again.
  If there is still a prefix name clash, then 'gexace' emits
  an error message.
. In the generated Ace file, the cluster names are those declared
  in the Xace files with the possible prefixes specified in <mount>.
  There is no cluster name concatenation anymore behind the scene
  in 'gexace'.
. The command-line option --cluster in 'gexace' has been renamed
  as --library and the corresponding default input filename is
  'library.xace' instead of 'cluster.xace'.

I think that I will nevertheless add the attribute "prefix"
in <cluster>, but in a recursive meaning contrary to my
initial proposal. The reason why I think that we need "prefix"
despite the availability of "relative" in <cluster> comes from
this observation (in file $GOBO/library/xml/library.xace):

------------
<cluster name="impl_interface" location="interface" relative="true" abstract="true">
    <cluster name="impl_interface_general" location="general" relative="true"/>
    <cluster name="impl_interface_event" location="event" relative="true"/>
    <cluster name="impl_interface_tree" location="tree" relative="true"/>
</cluster>
<cluster name="impl_expat" location="expat" relative="true" abstract="true" if="${GOBO_XML_EXPAT}">
    <cluster name="impl_expat_api" location="api" relative="true"/>
    <cluster name="impl_expat_general" location="general" relative="true"/>
    <cluster name="impl_expat_event" location="event" relative="true"/>
</cluster>
------------

There are similar things in $GOBO/library/tools/library.xace.
Wouldn't it look nicer to have:

------------
<cluster name="interface" prefix="impl_interface" abstract="true">
    <cluster name="general"/>
    <cluster name="event"/>
    <cluster name="tree"/>
</cluster>
<cluster name="expat" prefix="impl_expat" abstract="true" if="${GOBO_XML_EXPAT}">
    <cluster name="api"/>
    <cluster name="general"/>
    <cluster name="event"/>
</cluster>
------------

and have the prefix applied recursively to the subclusters?

--
Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com

=====================================================

Subject: Re: [gobo-eiffel-develop] Xace: attribute "prefix" in <cluster>
Date: Mon, 29 Apr 2002 22:08:48 +0200
From: Eric Bezault <gobosoft@ifrance.com>
Reply-To: ericb@gobosoft.com
Organization: Gobo
To: gobo-eiffel-develop@lists.sourceforge.net

Eric Bezault wrote:
>
> Yes, I have a similar pattern in $GOBO/library/tools/library.xace
> with similar cluster names for eiffel/lace/xace parsers and AST
> classes. I have now implemented the "prefix" attribute in <cluster>
> in my working version (not committed yet to CVS) and the Xace file
> is much simplier now. I also added an attribute "prefix" to
> <library> to provide a default prefix value to be overwritten
> by the "prefix" attribute of <mount>. Here again the Xace files
> are simpler because there is no need to repeat a possible prefix
> in <mount> in many Xace files when the default value provided
> in <library> is OK.

The attributes "prefix" in <cluster> and <library> are now
available in CVS. You need to run the bootstrap to take
advantage of it.

--
Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com

=====================================================

Subject: Re: [gobo-eiffel-develop] Xace class' <option> and cluster's <external>
Date: Thu, 23 May 2002 18:56:05 +0200
From: Eric Bezault <gobosoft@ifrance.com>
Reply-To: ericb@gobosoft.com
Organization: Gobo
To: gobodev <gobo-eiffel-develop@lists.sourceforge.net>


Eric Bezault wrote:
>
> Following the modifications in 'gexace' that I committed to CVS
> yesterday, we can now set options to the whole system or to all
> classes of a cluster. But in Ace files we can also set options
> on a per class basis:
> 
>   my_cluster: "pathname"
>       default
>            assertion (require)
>       option
>            assertion (ensure): FOO, BAR
>       end
> 
> The 'default' section contains cluster-level options and the 'option'
> section contains class-level options. In the same way we have elements
> <system> and <cluster> in Xace, I suggest to add the element <class>
> to support this new kind of options:
> 
>   <cluster name="my_cluster" location="pathname">
>       <option name="assertion" value="require"/>
>       <class name="FOO">
>           <option name="assertion" value="ensure"/>
>       </class>
>       <class name="BAR">
>           <option name="assertion" value="ensure"/>
>       </class>
>   </cluster>
> 
> Now, I looked at the different clauses of the <external> section
> and considering that we already put many things in <option>, I
> don't see why we should have these specific elements anymore.
> For example:
> 
>   <include_dir location="pathname"/>
> 
> could just be:
> 
>   <option name="include" value="pathname"/>
> 
> and:
> 
>   <link_library location="pathname"/>
> 
> could be:
> 
>   <option name="link" value="pathname"/>
> 
> (Note that "linker" is already used as a system-level options.)
> 
> It is a little bit more complicated for:
> 
>  <export class="FOO">
>      <feature name="eiffel_feature1" alias="external_feature1"/>
>      <feature name="eiffel_feature2" alias="external_feature2"/>
>  </export>
> 
> but now that we have <class>, we could also have <feature> to
> be more complete, and write:
> 
>   <cluster name="my_cluster" location="pathname">
>       <option name="assertion" value="require"/>
>       <option name="include" value="/usr/include"/>
>       <option name="link" value="libfoo.a"/>
>       <class name="FOO">
>           <option name="assertion" value="ensure"/>
>           <feature name="eiffel_feature1">
>               <option name="export" value="external_feature1"/>
>           </feature>
>           <feature name="eiffel_feature2">
>               <option name="export" value="external_feature2"/>
>           </feature>
>       </class>
>       <class name="BAR">
>           <option name="assertion" value="ensure"/>
>       </class>
>   </cluster>
> 
> According to LACE described in ETL2 page 530-531, the code above
> would generate:
> 
>    visible
>       FOO
>           export
>                eiffel_feature1, eiffel_feature2
>           rename
>                eiffel_feature1 as external_feature1,
>                eiffel_feature2 as external_feature2
>           end
>    end
> 
> whereas the following:
> 
>       <class name="FOO">
>           <feature name="eiffel_feature1">
>               <option name="export" value="eiffel_feature1"/>
>           </feature>
>       </class>
> 
> would generate only:
> 
>    visible
>       FOO
>           export
>                eiffel_feature1
>           end
>    end
> 
> Likewise, "export" could be an option of <class> and
> the following:
> 
>    <class name="FOO">
>        <option name="export" value="FOO"/>
>    </class>
> 
> would generate:
> 
>   visible
>      FOO
>   end
> 
> and the following:
> 
>    <class name="FOO">
>        <option name="export" value="BAR"/>
>    </class>
> 
> would generate:
> 
>   visible
>      FOO as BAR
>   end
> 
> And we could also combine the option "export" of <class>
> and <feature>.
> 
> With this new scheme, we have:
> 
>   <system>
>       <cluster>
>           <class>
>               <feature>
> 
> and everything else is an <option> at the different levels.
> With "export", not all compilers will support external class
> or feature renaming, I'm not even sure the VE can support
> "export" at all. So this fits well into the <option> policy.

All the above is now available in CVS. You'll need to run
the bootstrap because of this change of syntax in Xace.
As usual the old syntax will still be accepted for some
time with some warning messages.

Contrary to what is said above, the following element:

  <option name="include" value="pathname"/>

has been replaced by:

  <option name="header" value="pathname"/>

because "include" has another meaning in LACE (the
counterpart of "exclude").

I have also added more options at different levels. To have
details/explanations about the new options, please have a look
at $GOBO/doc/gexace/options.txt. This file has been updated
with new options, and it also has two new sections: CLASS
OPTIONS and FEATURE OPTIONS.

-- 
Eric Bezault
mailto:ericb@gobosoft.com
http://www.gobosoft.com


