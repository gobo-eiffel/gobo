indexing

	description:

		"xsl:transform or xsl:stylesheet element nodes"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_STYLESHEET

inherit

	XM_XSLT_STYLE_ELEMENT
		redefine
			make, target_name_pool, precedence, process_all_attributes
		end

	XM_XSLT_STRING_ROUTINES

	XM_XSLT_VALIDATION

creation {XM_XSLT_NODE_FACTORY}

	make

feature {NONE} -- Initialization
	
	make (a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
			a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		do
			target_name_pool := a_document.name_pool
			create named_templates_index.make_map (5)
			Precursor (a_document, a_parent, an_attribute_collection, a_namespace_list, a_name_code, a_sequence_number, a_line_number, a_base_uri)
		end

feature -- Access

	importer: like Current
			-- The stylesheet that imported or included `Current';
			-- `Void' for the prinicpal stylesheet.

	target_name_pool: XM_XPATH_NAME_POOL
			-- Name pool to be used at run-time;
			-- This namepool holds the names used in
			--  all XPath expressions and patterns.

	prepared_stylesheet: XM_XSLT_PREPARED_STYLESHEET
			-- Prepared stylesheet object used to load `Current'

	top_level_elements: DS_ARRAYED_LIST [XM_XSLT_STYLE_ELEMENT]
			-- Top-level elements in this logical stylesheet (after include/import processing)

	import_precedence: INTEGER
			-- Import precedence for top-level elements

	minmum_import_precedence: INTEGER
			-- Lowest precedence of any stylesheet imported by `Current'

	precedence: INTEGER is
			-- Import precedence of `Current'
		do
			if was_included then
				Result := importer.precedence
			else
				Result := import_precedence
			end
		end

	default_validation: INTEGER
			-- Default validation

feature -- Status report

	was_included: BOOLEAN
			-- Was `Current' pulled in by xsl:include?

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_name_code: INTEGER
			an_expanded_name: STRING
		do
			from
				a_cursor := attribute_collection.name_code_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				a_name_code := a_cursor.item
				an_expanded_name := document.name_pool.expanded_name_from_name_code (a_name_code)
				if STRING_.same_string (an_expanded_name, Version_attribute) then
					do_nothing
				elseif STRING_.same_string (an_expanded_name, Extension_element_prefixes_attribute) then
					do_nothing
				elseif STRING_.same_string (an_expanded_name, Exclude_result_prefixes_attribute) then
					do_nothing
				elseif STRING_.same_string (an_expanded_name, Id_attribute) then
					do_nothing
				elseif STRING_.same_string (an_expanded_name, Default_validation_attribute) then
					default_validation := validation_code (attribute_value_by_index (a_cursor.index))
					if default_validation = Validation_invalid then
						set_last_error_from_string ("Invalid value for default-validation attribute. Permitted values are (strict, lax, preserve, strip)", 0 , Static_error)
					elseif conformance.basic_xslt_processor and then default_validation /= Validation_strip then
						set_last_error_from_string ("Invalid value for default-validation attribute. Only 'strip' is permitted for a basic XSLT processor)", 0 , Static_error)
					end
				else
					check_unknown_attribute (a_name_code)
				end
				a_cursor.forth
			end
			if version = Void then
				set_last_error_from_string ("Element must have a 'version' attribute", 0, Static_error)
			end
		end

	set_prepared_stylesheet (a_prepared_stylesheet: like prepared_stylesheet) is
			-- Set `prepared_stylesheet'.
		require
			prepared_stylesheet_not_void: a_prepared_stylesheet /= Void
		do
			prepared_stylesheet := a_prepared_stylesheet
			target_name_pool := a_prepared_stylesheet.target_name_pool
			--TODO create rule_manager.make
		ensure
			prepared_stylesheet_set: prepared_stylesheet = a_prepared_stylesheet
		end

	preprocess is
			-- Perform all the processing possible before the source document is available.
			-- Done once per stylesheet, so the stylesheet can be reused for multiple source documents.
		do

			-- Process any xsl:include and xsl:import elements.

			splice_includes

			-- Build indices for selected top-level elements.

			if not is_error then build_indices end

			-- Process the attributes of every node in the tree

			if not is_error then process_all_attributes end

			-- Collect any namespace aliases.

			if not is_error then collect_namespace_aliases end

			-- Fix up references from XPath expressions to variables and functions, for static typing
			
			todo ("preprocess", True)
		end

	splice_includes is
			-- Process xsl:include and xsl:import elements.
		local
			a_previous_style_element: XM_XSLT_STYLE_ELEMENT
			a_child_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_child: XM_XPATH_NODE
			a_data_element: XM_XSLT_DATA_ELEMENT
			a_module: XM_XSLT_MODULE
			found_non_import: BOOLEAN
		do
			create top_level_elements.make (children.count)
			minmum_import_precedence := import_precedence
			a_previous_style_element := Current

			from
				a_child_iterator := new_axis_iterator (Child_axis)
				a_child_iterator.start
			until
				a_child_iterator.after
			loop
				a_child := a_child_iterator.item
				if a_child.node_type = Text_node then

					-- In an embedded stylesheet, white space nodes may still be there

					if not is_all_whitespace (a_child.string_value) then
						set_last_error_from_string ("No character data is allowed between top-level elements", 0, Static_error)
					end
				else
					a_data_element ?= a_child
					if a_data_element /= Void then
						found_non_import := True
					else
						a_previous_style_element ?= a_child
						check
							child_is_style_element: a_previous_style_element /= Void
							-- Only data elements, style elements and white-space text nodes may be present
						end
						a_module ?= a_child
						if a_module /= Void then
							todo ("splice_includes", True)
						else
							found_non_import := True
							if not top_level_elements.extendible (1) then
								top_level_elements.resize (2 * top_level_elements.count)
							end
							top_level_elements.put_last (a_previous_style_element)
						end
					end
				end
				a_child_iterator.forth
			end
		end

	build_indices is
			-- Build indices from selected top-level declarations.
		local
			a_template: XM_XSLT_TEMPLATE
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
		do
			from
				a_cursor := top_level_elements.new_cursor
				a_cursor.finish
			until
				a_cursor.before
			loop
				a_template ?= a_cursor.item
				if a_template /= Void and then not a_template.is_error then
					index_named_template (a_template)
				end
				a_cursor.back
			end
			todo ("build_indices", True)
		end

	index_named_template (a_template: XM_XSLT_TEMPLATE) is
			-- Conditionally add an index entry for `a_template'.
		require
			not_in_error: not is_error
			template_not_in_error: a_template /= Void and then not a_template.is_error
		local
			a_fingerprint: INTEGER
			another_template: XM_XSLT_TEMPLATE
			a_message: STRING
		do
			a_fingerprint := a_template.template_fingerprint
			if a_fingerprint /= -1 then

				-- Named template

				if named_templates_index.has (a_fingerprint) then

					-- Check the precedence.

					another_template := named_templates_index.item (a_fingerprint)
					if a_template.precedence = another_template.precedence then
						a_message := STRING_.appended_string ("Duplicate named template (see line ", "0") -- TODO another_template.line_number)
						a_message := STRING_.appended_string (a_message, " of ")
						-- TODO						a_message := STRING_.appended_string (a_message, another_template.system_id)
						a_message := STRING_.appended_string (a_message, ")")
						a_template.set_last_error_from_string (a_message, 0, Static_error)
					elseif a_template.precedence < another_template.precedence then
						a_template.set_redundant_named_template
					else

						-- This is not supposed to happen

						another_template.set_redundant_named_template
						named_templates_index.replace (a_template, a_fingerprint)
					end
				else
					if named_templates_index.is_full then
						named_templates_index.resize (2 * named_templates_index.count)
					end
					named_templates_index.put (a_template, a_fingerprint)
				end
			end
		end

	process_all_attributes is
			-- Process the attributes of every node in the stylesheet.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XSLT_STYLE_ELEMENT]
			a_style_element: like Current
		do
			prepare_attributes
			from
				a_cursor := top_level_elements.new_cursor
				a_cursor.start
			variant
				top_level_elements.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_style_element ?= a_cursor.item
				if a_style_element /= Void then
					a_style_element.process_all_attributes
				end
				a_cursor.forth
			end
		end

	collect_namespace_aliases is
			-- Collect any namespace aliases.
		do
			todo ("collect_namespace_aliases", False)
		end

feature {NONE} -- Implementation

	named_templates_index: DS_HASH_TABLE [XM_XSLT_TEMPLATE, INTEGER]
			-- Index of named templates by `template_fingerprint'
	

invariant

	target_name_pool_not_void: target_name_pool /= Void
	named_templates_index_not_void: named_templates_index /= Void

end
