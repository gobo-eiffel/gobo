indexing

	description:

		"Objects that remove duplicate namespace declarations."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class	XM_XSLT_NAMESPACE_REDUCER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			start_element, end_element, notify_namespace, notify_attribute, start_content
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_NAME_UTILITIES

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

	-- This class also ensures that an xmlns="" undeclaration is output when necessary.
	-- Used on its own, it simply eliminates unwanted namespace declarations.
	-- It can also be subclassed, in which case the subclass can use it's services to resolve QNames.
	-- It also validates namespace-sensitive content.

create

	make

feature {NONE} -- Initialization

	make (an_underlying_receiver: XM_XPATH_RECEIVER) is
			-- Establish invariant.
		require
			underlying_receiver_not_void: an_underlying_receiver /= Void
		do
			base_receiver := an_underlying_receiver
			create namespaces_in_scope.make (50)
			create count_stack.make (50)
			xml_namespace_code := shared_name_pool.namespace_code ("xml", Xml_uri)
			null_namespace_code := shared_name_pool.namespace_code ("", Null_uri)
			system_id := ""
		ensure
			base_receiver_set: base_receiver = an_underlying_receiver
		end
		
feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER) is
			-- Notify the start of an element
		do
			Precursor (a_name_code, a_type_code, properties)

			-- If disinheriting namespaces, keep a list of namespaces that need to be undeclared.

			if is_disinherit_namespaces (properties) then
				create pending_undeclarations.make_from_linear (namespaces_in_scope)
			else
				pending_undeclarations := Void
			end
			count_stack.force (0)

			-- Ensure that the element namespace is output, unless this is done
			--  automatically by the caller (which is true, for example,
			--  for a literal result element).

			if not is_namespace_declared (properties) then
				if not shared_name_pool.is_namespace_code_allocated_for_name_code (a_name_code) then
					shared_name_pool.allocate_namespace_code_for_name_code (a_name_code)
				end
				notify_namespace (shared_name_pool.namespace_code_from_name_code (a_name_code), 0)
			end
		end

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER) is
			-- Notify a namespace.
		do

			-- Keep the namespace only if it is actually needed

			if is_needed (a_namespace_code) then
				namespaces_in_scope.force_last (a_namespace_code)
				count_stack.replace (count_stack.item + 1)
				Precursor (a_namespace_code, properties)
			end
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER) is
			-- Notify an attribute.
		local
			new_properties: INTEGER
			a_splitter: ST_SPLITTER
			tokens: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
		do
			if is_prefix_check_needed (properties) then

				-- TODO: handle lists that mix QNames with other types

				if a_value.index_of (' ', 1) = 0 then
					check_qname_prefix (a_value)
				else
					create a_splitter.make
					a_splitter.set_separators (" ")
					tokens := a_splitter.split (a_value)
					from
						a_cursor := tokens.new_cursor; a_cursor.start
					variant
						tokens.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						check_qname_prefix (a_cursor.item)
						a_cursor.forth
					end
				end
				new_properties := properties - Prefix_check_needed
			else
				new_properties := properties
			end
			Precursor (a_name_code, a_type_code, a_value, new_properties)
		end

	start_content is
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code: INTEGER
		do
			if pending_undeclarations /= Void then
				from
					a_cursor := pending_undeclarations.new_cursor; a_cursor.start
				variant
					pending_undeclarations.count + 1 - a_cursor.index
				until
					a_cursor.after
				loop
					a_namespace_code := a_cursor.item
					if a_namespace_code /= -1 then
						base_receiver.notify_namespace ((a_namespace_code // bits_16) * bits_16, 0)
					end
					a_cursor.forth
				end
			end
			pending_undeclarations := Void
			Precursor
		end

	end_element is
			-- Notify the end of an element.
		local
			a_namespace_count: INTEGER
		do
			
			-- Discard the namespaces declared on this element

			a_namespace_count := count_stack.item
			count_stack.remove
			namespaces_in_scope.prune_last (a_namespace_count)
			Precursor
		end

feature {NONE} -- Implementation

	xml_namespace_code: INTEGER
			-- Namespace code for "xml"

	null_namespace_code: INTEGER
			-- Namespace code for null namespace

	namespaces_in_scope: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes in scope

	count_stack: DS_ARRAYED_STACK [INTEGER]
			-- Count of namespaces per element

	pending_undeclarations: DS_ARRAYED_LIST [INTEGER]
			-- Pending undeclarations

	is_needed (a_namespace_code: INTEGER): BOOLEAN is
			-- Is declaration for `a_namespace_code' needed?
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_prefix_code: INTEGER --_16
			decided: BOOLEAN
		do
			if a_namespace_code /= xml_namespace_code then
				a_prefix_code := prefix_code_from_namespace_code (a_namespace_code)

				-- First cancel any pending undeclaration of this namespace prefix

				if pending_undeclarations /= Void then
					from
						a_cursor := pending_undeclarations.new_cursor; a_cursor.start
					variant
						pending_undeclarations.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						if a_prefix_code = prefix_code_from_namespace_code (a_cursor.item) then
							a_cursor.replace (-1)
							a_cursor.go_after
						else
							a_cursor.forth
						end
					end
				end

				from
					a_cursor := namespaces_in_scope.new_cursor; a_cursor.finish
				variant
					a_cursor.index
				until
					a_cursor.before
				loop
					if a_namespace_code = a_cursor.item then

						-- it's a duplicate so we don't need it

						Result := False
						decided := True
						a_cursor.go_before
					elseif a_prefix_code = prefix_code_from_namespace_code (a_cursor.item) then

						-- same prefix, different URI, so we do need it

						Result := True
						decided := True
						a_cursor.go_before
					else
						a_cursor.back
					end
				end

				-- we need it unless it's a redundant xmlns=""

				if not decided then Result := a_namespace_code /= null_namespace_code end
			end
		end

	check_qname_prefix (a_qname: STRING) is
			-- Check prefix of `a_qname' against namespace context in result tree
		require
			qname_not_void: a_qname /= Void
			valid_qname: is_qname (a_qname)
		local
			a_splitter: ST_SPLITTER
			parts: DS_LIST [STRING]
			a_prefix_code: INTEGER
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			ok: BOOLEAN
		do
			create a_splitter.make
			a_splitter.set_separators (":")
			parts := a_splitter.split (a_qname)
			if parts.count = 2 then
				a_prefix_code := shared_name_pool.code_for_prefix (parts.item (1))
				if a_prefix_code = -1 then
					on_error (STRING_.concat ("Unknown prefix in QName content: ", a_qname))
				else
					from
						a_cursor := namespaces_in_scope.new_cursor; a_cursor.finish
					variant
						a_cursor.index
					until
						a_cursor.before
					loop
						if a_prefix_code = prefix_code_from_namespace_code (a_cursor.item) then
							a_cursor.go_before
							ok := True
						else
							a_cursor.back
						end
					end
					if not ok then
						on_error (STRING_.concat ("namespace not declared for prefix in QName content: ", a_qname))
					end
				end
			end
		end

	uri_code (a_prefix_code: INTEGER): INTEGER is
			-- URI code for `a_prefix_code' from in-scope namespaces
		do

			-- This is for the benefit of sub-classes

			todo ("uri_code", False)
		end

invariant

	namespaces_in_scope_not_void: namespaces_in_scope /= Void
	count_stack_not_void: count_stack /= Void

end
	
