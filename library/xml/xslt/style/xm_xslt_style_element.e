indexing

	description:

		"Element nodes in an XSLT stylesheet"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_STYLE_ELEMENT

inherit

	XM_XPATH_TREE_ELEMENT

	XM_UNICODE_CHARACTERS_1_1

	XM_XPATH_DEBUGGING_ROUTINES

feature -- Access

	extension_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Namespace URI codes of extension elements

	excluded_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Namespace URI codes to be excluded from output

	default_xpath_namespace: STRING
			-- Default XPath namespace

	attribute_value_by_expanded_name (an_attribute_name: STRING): STRING is
			-- Value of `an_attribute_name'
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
		local
		do
			if not document.name_pool.is_expanded_name_allocated (an_attribute_name) then
				document.name_pool.allocate_expanded_name (an_attribute_name)
			end
			Result := attribute_value (document.name_pool.fingerprint_from_expanded_name (an_attribute_name))
		end

feature -- Status_report

	is_stylesheet_in_error: BOOLEAN is
			-- is any element of the stylsheet tree compiled in error?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_NODE]
			a_style_element: XM_XSLT_STYLE_ELEMENT
		do
			if is_error then Result := True
			else

				-- recusively check all the children

				from
					a_cursor := children.new_cursor
					a_cursor.start
				variant
					children.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_style_element ?= a_cursor.item
					if a_style_element /= Void then
						if a_style_element.is_stylesheet_in_error then
							Result := True
							a_cursor.go_after
						end
					end
					a_cursor.forth
				end
			end
		end
	
feature -- Status setting

	allocate_slots (an_expr: XM_XPATH_EXPRESSION) is
			-- TODO
		do
			todo ("allocate_slots", False)
		end

feature -- Element change

	prepare_attributes is
			-- Set the attribute list for the element.
		deferred
		end

	process_default_xpath_namespace_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]default-xpath-namespace attribute. 
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Xpath_default_namespace_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		do
			default_xpath_namespace := attribute_value_by_expanded_name (an_attribute_name)
		end

process_version_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]version attribute. 
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Version_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			a_version: STRING
		do
			a_version := attribute_value_by_expanded_name (an_attribute_name)
			todo ("process_version_attribute - need MA_DECIMAL", True)
		end

	process_extension_element_attribute (an_attribute_name: STRING) is
			--	Process the [xsl:]extension-element-prefixes attribute. 
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Extension_element_prefixes_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			extensions, an_extension: STRING
			a_splitter: ST_SPLITTER
			an_extension_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			extensions := attribute_value_by_expanded_name (an_attribute_name)
			if extensions /= Void then
				create a_splitter.make
				an_extension_list := a_splitter.split (extensions)
				if an_extension_list.count > 0 then
					create extension_namespaces.make (an_extension_list.count)
					from
						a_cursor := an_extension_list.new_cursor
						a_cursor.start
					variant
						an_extension_list.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						an_extension := a_cursor.item
						if STRING_.same_string (an_extension, "#default") then
							an_extension := ""
						end
						extension_namespaces.put_last (uri_code_for_prefix (an_extension))
						a_cursor.forth
					end
				end
			end
		end

	process_excluded_namespaces_attribute (an_attribute_name: STRING) is
			--	Process the  [xsl:]exclude-result-prefixes attribute.
		require
			valid_attribute_name: an_attribute_name /= Void
				and then	is_valid_expanded_name (an_attribute_name)
				and then STRING_.same_string (local_name_from_expanded_name (an_attribute_name), Exclude_result_prefixes_attribute)
				and then ( namespace_uri_from_expanded_name (an_attribute_name).count = 0
							  or else STRING_.same_string (namespace_uri_from_expanded_name (an_attribute_name), Xslt_uri))
		local
			exclusions, an_exclusion: STRING
			a_splitter: ST_SPLITTER
			an_exclusion_list: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			exclusions := attribute_value_by_expanded_name (an_attribute_name)
			if exclusions /= Void then
				exclusions.left_adjust
				exclusions.right_adjust
				if STRING_.same_string (exclusions, "#all") then
					todo ("process_excluded_namespaces_attribute - #all", True)
				else
					create a_splitter.make
					an_exclusion_list := a_splitter.split (exclusions)
					if an_exclusion_list.count > 0 then
						create excluded_namespaces.make (an_exclusion_list.count)
						from
							a_cursor := an_exclusion_list.new_cursor
							a_cursor.start
						variant
							an_exclusion_list.count + 1 - a_cursor.index
						until
							a_cursor.after
						loop
							an_exclusion := a_cursor.item
							if STRING_.same_string (an_exclusion, "#default") then
								an_exclusion := ""
							elseif STRING_.same_string (an_exclusion, "#all") then
								set_last_error_from_string ("In exclude-result-prefixes, cannot mix #all with other values", 0, Static_error)
								a_cursor.go_after
							end
							excluded_namespaces.put_last (uri_code_for_prefix (an_exclusion))
							a_cursor.forth
						end
					end					
				end
			end
		end

end
