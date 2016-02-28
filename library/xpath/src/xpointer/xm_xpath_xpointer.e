note

	description:

		"Objects that process XPointers against XPath Data Model instances"

	library: "Gobo Eiffel XPointer Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_XPOINTER

inherit

	XM_XPATH_ERROR_TYPES

	XM_XPATH_STANDARD_NAMESPACES
		export
			{NONE} all
			{ANY} is_qname
		end

		--	XM_UNICODE_CHARACTERS_1_0
		-- Commented out on 26/09/2005, as the 1.1 definitions
		--  are now imported via  XM_XPATH_STANDARD_NAMESPACES.
		-- This means not 100% compliant with the XPointer recommendation,
		--  which refers to XML Names 1.0 for the definitions of NCName and QName

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (report_scheme_errors: BOOLEAN)
			-- Establish invariant.
		do
			create registered_schemes.make_with_equality_testers (3, Void, string_equality_tester)
			create namespace_bindings.make
			is_reporting_scheme_errors := report_scheme_errors
		end

feature -- Access

	is_reporting_scheme_errors: BOOLEAN
			-- Are scheme errors to be reported to the application?

	is_valid_name (a_name: STRING): BOOLEAN
			-- Is `a_name' a valid in-scope QName?
		require
			qname: a_name /= Void and then is_qname (a_name)
		local
			a_parser: XM_XPATH_QNAME_PARSER
		do
			create a_parser.make (a_name)
			Result := a_parser.is_valid and then a_parser.is_prefix_present and then attached a_parser.optional_prefix as l_optional_prefix implies namespace_bindings.is_prefix_declared (l_optional_prefix)
		end

	expanded_name (a_name: STRING): STRING
			-- Expanded version of `a_name'
		require
			qname: a_name /= Void and then is_qname (a_name)
			valid_name: is_valid_name (a_name)
		local
			a_parser: XM_XPATH_QNAME_PARSER
		do
			create a_parser.make (a_name)
			check is_valid_name: a_parser.is_valid end
			check
					-- Invariant 'local_name_not_void' in class XM_XPATH_QNAME_PARSER:
				local_name_not_void: attached a_parser.local_name as l_local_name
			then
				if attached a_parser.optional_prefix as l_optional_prefix and then l_optional_prefix.count > 0 then
					check is_prefix_present: a_parser.is_prefix_present end
					Result := expanded_name_from_components (namespace_bindings.namespace_uri (l_optional_prefix), l_local_name)
				else
					Result := l_local_name
				end
			end
		end

	value: detachable XM_XPATH_VALUE
			-- Evaluation result;
			-- Usually a node sequence, but can be more general
			-- (For instance, the xpointer scheme includes points and ranges).
			-- Even if this is not in error, it may not be a valid result for
			--  the application - for instance, XSLT requires a node sequence.

	is_registered (a_scheme_name: STRING): BOOLEAN
			-- Is `a_scheme_name' the expanded name of a registered scheme processor?
		require
			scheme_name_not_void: a_scheme_name /= Void
		do
			Result := registered_schemes.has (a_scheme_name)
		end


feature -- Evaluation

	evaluate (an_xpointer: STRING; a_resource: XM_XPATH_DOCUMENT)
			-- Evaluate `an_xpointer' against `a_resource'.
		require
			xpointer_not_empty: an_xpointer /= Void and then an_xpointer.count > 0
			xml_resource_not_void: a_resource /= Void -- N.B. this may be an external parsed entity, or a well-formed document
		local
			a_parser: XM_XPOINTER_PARSER
			an_element: detachable XM_XPATH_ELEMENT
			a_cursor:  DS_ARRAYED_LIST_CURSOR [STRING]
			a_scheme_name: STRING
			a_processor: XM_XPATH_XPOINTER_SCHEME
			l_value: XM_XPATH_EMPTY_SEQUENCE
		do
			value := Void
			create a_parser.make
			a_parser.parse (an_xpointer)
			if attached a_parser.error_message as l_error_message and attached a_parser.error_code as l_error_code then
				check is_error: a_parser.is_error end
				create {XM_XPATH_INVALID_VALUE} value.make_from_string (l_error_message, Gexslt_eiffel_type_uri, l_error_code, Static_error)
			elseif attached a_parser.shorthand as l_shorthand then
				check is_shorthand: a_parser.is_shorthand end
				an_element := a_resource.selected_id (l_shorthand)
				if an_element = Void then
					create l_value.make
					l_value.set_last_error_from_string ("Could not find shorthand element", Gexslt_eiffel_type_uri, "XPOINTER_EVALUATION", Static_error)
					value := l_value
				else
					create {XM_XPATH_SINGLETON_NODE} value.make (an_element)
				end
			else
				from
					a_cursor := a_parser.scheme_sequence.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					if is_valid_name (a_cursor.item) then
						a_scheme_name := expanded_name (a_cursor.item)
					else
						a_scheme_name := ""
					end
					if is_registered (a_scheme_name) then
						a_processor := registered_schemes.item (a_scheme_name)
						a_processor.evaluate (a_resource, namespace_bindings, a_parser.scheme_data.item (a_cursor.index))
						if a_processor.were_resources_found then
							value := a_processor.value
							a_cursor.go_after
						else
							if a_processor.is_error and then is_reporting_scheme_errors then
								value := a_processor.value
							end
							a_cursor.forth
						end
					else
						a_cursor.forth
					end
				variant
					a_parser.scheme_sequence.count + 1 - a_cursor.index
				end
				if value = Void then
					create {XM_XPATH_EMPTY_SEQUENCE} value.make
				end
			end
		ensure
			value_may_be_in_error: value /= Void
		end

feature -- Element change

	register_scheme (a_scheme: XM_XPATH_XPOINTER_SCHEME)
			-- Register `a_scheme' as an XPointer scheme.
		require
			scheme_not_empty: a_scheme /= Void
			scheme_not_already_registered: not is_registered (a_scheme.expanded_name)
		do
			registered_schemes.force_new (a_scheme, a_scheme.expanded_name)
		ensure
			scheme_registered: is_registered (a_scheme.expanded_name) and then registered_schemes.item (a_scheme.expanded_name) = a_scheme
		end

feature {NONE} -- Implementation

	registered_schemes: DS_HASH_TABLE [XM_XPATH_XPOINTER_SCHEME, STRING]
			-- Registered scheme processors, indexed by expanded-name

	namespace_bindings: XM_XPOINTER_NAMESPACE_CONTEXT

invariant

	registered_schemes_not_void: registered_schemes /= Void
	namespace_bindings_not_void: namespace_bindings /= Void

end

