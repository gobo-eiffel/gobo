indexing

	description:

		"Objects that implement the XPointer element scheme"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_XPOINTER_ELEMENT_SCHEME

inherit

	XM_XPATH_XPOINTER_SCHEME

	XM_XPATH_ERROR_TYPES

	XM_XPATH_AXIS

		--	XM_UNICODE_CHARACTERS_1_0
		-- Commented out on 26/09/2005, as the 1.1 definitions
		--  are now imported via  XM_XPATH_STANDARD_NAMESPACES.
		-- This means not 100% compliant with the XPointer recommendation,
		--  which refers to XML Names 1.0 for the definitions of NCName and QName

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Implementation

	make is
		do
		end

feature -- Access

	expanded_name: STRING is "element"
			-- Expanded name of implemented scheme;

	value: XM_XPATH_VALUE
			-- Result of last call to `evaluate'

feature -- Status report

	were_resources_found: BOOLEAN
			-- Were any XML resoureces found by last call to `evaluate'?

	is_error: BOOLEAN
			-- Did a syntax or evaluation error occur?

feature -- Element change

	evaluate (a_resource: XM_XPATH_DOCUMENT; a_namespace_context: XM_XPOINTER_NAMESPACE_CONTEXT; some_data: STRING) is
			-- Evaluate `some_data' against `a_resource' within `a_namespace_context'.
		local
			an_index, a_counter, a_child_number: INTEGER
			an_element: XM_XPATH_ELEMENT
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			evaluated := True
			were_resources_found := False
			parse (some_data)
			is_error := False
			if not is_error then
				from
					an_index := 1
				until
					is_error or else an_index > components.count
				loop
					if is_shorthand and then an_index = 1 then
						an_element := a_resource.selected_id (components.item (1))
						if an_element = Void then
							is_error := True
							create {XM_XPATH_INVALID_VALUE} value.make_from_string ("Element not located by shorthand", Gexslt_eiffel_type_uri, "XPOINTER_ELEMENT", Static_error)
						end
					else
						a_child_number := components.item (an_index).to_integer
						if an_element = Void then
							an_iterator := a_resource.new_axis_iterator_with_node_test (Child_axis, element_node_kind_test)
						else
							an_iterator := an_element.new_axis_iterator_with_node_test (Child_axis, element_node_kind_test)
						end
						from
							a_counter := 0; an_iterator.start
						until
							a_counter = a_child_number or else an_iterator.after
						loop
							a_counter := a_counter + 1
							if a_counter = a_child_number then
								an_element ?= an_iterator.item
							else
								an_iterator.forth
							end
						end
						if a_counter /= a_child_number then
							is_error := True
							create {XM_XPATH_INVALID_VALUE} value.make_from_string ("Element not located by child sequence", Gexslt_eiffel_type_uri, "XPOINTER_ELEMENT", Static_error)
						end
					end
					an_index := an_index + 1
				variant
					components.count + 1 - an_index
				end
				if an_element /= Void then
					were_resources_found := True
					create {XM_XPATH_SINGLETON_NODE} value.make (an_element)
				else
					check
						in_error: is_error
						-- As every step failure sets an error
					end
				end
			else
				create {XM_XPATH_INVALID_VALUE} value.make_from_string ("Parse error in scheme data", Gexslt_eiffel_type_uri, "XPOINTER_ELEMENT", Static_error)
			end
		end

feature {NONE} -- Implementation

	is_shorthand: BOOLEAN
			-- Does `components' start with a shorthand pointer?

	components: DS_LIST [STRING]
			-- Components of scheme data

	parse (some_data: STRING) is
			-- Parse scheme data.
		require
			scheme_data_not_void: some_data /= Void
			no_previous_error: not is_error
		local
			a_splitter: ST_SPLITTER
			an_index: INTEGER
		do
			is_shorthand := False
			create a_splitter.make
			a_splitter.set_separators ("/")
			components := a_splitter.split (some_data)
			if components.count = 0 then
				is_error := True
			else
				from
					an_index := 1
				until
					is_error or else an_index > components.count
				loop
					if not components.item (an_index).is_integer then
						if an_index = 1 and then is_ncname (components.item (1)) then
							is_shorthand := True
						else
							is_error := True
						end
					end
					an_index := an_index + 1
				variant
					components.count + 1 - an_index
				end
			end
		ensure
			components_not_void: components /= Void
		end

end

