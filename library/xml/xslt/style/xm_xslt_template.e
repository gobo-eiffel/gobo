indexing

	description:

		"xsl:template element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_TEMPLATE

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make
		end

creation

	make

feature {NONE} -- Initialization

		
	make (a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
			a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		do
			internal_fingerprint := -1 -- Not yet calculated, or not a named template
			Precursor (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end

feature -- Access

	template_fingerprint: INTEGER is
			-- Fingerprint of named template;
			-- This can be called before attributes are proceseed.
			-- WARNING: This is NOT a pure function - it is implemented 
			--  as a memo function, and also has a side effect
			--  of generating a name code in the name pool.
		local
			a_name: STRING
		do
			if internal_fingerprint = -1 then
				a_name := attribute_value_by_name ("", Name_attribute)
				if a_name /= Void then
					a_name.left_adjust
					a_name.right_adjust
					generate_name_code (a_name)
					internal_fingerprint := last_generated_name_code \\ bits_20
				end
			end
			Result := internal_fingerprint
		end

	redundant_named_template: BOOLEAN
			-- Current is a redundant named template

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		do
			todo ("prepare_attributes", False)
		end

	set_redundant_named_template is
			-- Mark as a redundant named template.
		do
			redundant_named_template := True
		ensure
			redundant_named_template_set:	redundant_named_template = True
		end

feature {NONE} -- Implementation

	internal_fingerprint: INTEGER
			-- Used by `template_fingerprint'

end
