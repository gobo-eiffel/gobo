note

	description:

		"Objects that remove duplicate namespace declarations."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

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

create

	make

feature {NONE} -- Initialization

	make (an_underlying_receiver: XM_XPATH_RECEIVER)
			-- Establish invariant.
		require
			underlying_receiver_not_void: an_underlying_receiver /= Void
		do
			base_receiver := an_underlying_receiver
			document_uri := base_receiver.document_uri
			base_uri := base_receiver.base_uri
			create namespaces_in_scope.make_default
			create count_stack.make_default
			create disinherit_stack.make_default
			stack_depth := 1
			count_stack.put (0, 1)
			disinherit_stack.put (False, 1)
		ensure
			base_receiver_set: base_receiver = an_underlying_receiver
		end

feature -- Events

	start_element (a_name_code: INTEGER; a_type_code: INTEGER; properties: INTEGER)
			-- Notify the start of an element
		do
			Precursor (a_name_code, a_type_code, properties)

			-- If disinheriting namespaces, keep a list of namespaces that need to be undeclared.

			if stack_depth > 1 and then disinherit_stack.item (stack_depth - 1) then
				create pending_undeclarations.make_from_linear (namespaces_in_scope)
			else
				pending_undeclarations := Void
			end
			if stack_depth <= count_stack.count then
				count_stack.replace (0, stack_depth)
				disinherit_stack.replace (is_disinherit_namespaces (properties), stack_depth)
			else
				count_stack.put (0, stack_depth)
				disinherit_stack.put (is_disinherit_namespaces (properties), stack_depth)
			end
			stack_depth := stack_depth + 1
			if count_stack.capacity < stack_depth then
				count_stack.resize (stack_depth * 2)
				disinherit_stack.resize (stack_depth * 2)
			end

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

	notify_namespace (a_namespace_code: INTEGER; properties: INTEGER)
			-- Notify a namespace.
		local
			l_prefix_code: INTEGER --_16
		do

			-- Keep the namespace only if it is actually needed

			l_prefix_code := prefix_code_from_namespace_code (a_namespace_code)
			cancel_pending_undeclarations (l_prefix_code)
			if is_needed (a_namespace_code, l_prefix_code) then
				namespaces_in_scope.force_last (a_namespace_code)
				count_stack.replace (count_stack.item (stack_depth - 1) + 1, stack_depth - 1)
				Precursor (a_namespace_code, properties)
			end
			mark_as_written
		end

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; properties: INTEGER)
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
					until
						a_cursor.after
					loop
						check_qname_prefix (a_cursor.item)
						a_cursor.forth
					variant
						tokens.count + 1 - a_cursor.index
					end
				end
				new_properties := properties - Prefix_check_needed
			else
				new_properties := properties
			end
			Precursor (a_name_code, a_type_code, a_value, new_properties)
		end

	start_content
			-- Notify the start of the content, that is, the completion of all attributes and namespaces.
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code: INTEGER
		do
			if attached pending_undeclarations as l_pending_undeclarations then
				from
					a_cursor := l_pending_undeclarations.new_cursor; a_cursor.start
				until
					a_cursor.after
				loop
					a_namespace_code := a_cursor.item
					if a_namespace_code /= -1 then
						notify_namespace ((a_namespace_code // bits_16) * bits_16, 0)
					end
					a_cursor.forth
				variant
					l_pending_undeclarations.count + 1 - a_cursor.index
				end
			end
			pending_undeclarations := Void
			Precursor
		end

	end_element
			-- Notify the end of an element.
		local
			a_namespace_count: INTEGER
		do
			stack_depth := stack_depth - 1
			check
				strictly_positive_stack_depth: stack_depth > 0
				-- element nesting logic
			end

			-- Discard the namespaces declared on this element

			a_namespace_count := count_stack.item (stack_depth)
			namespaces_in_scope.prune_last (a_namespace_count)
			Precursor
		end

feature {NONE} -- Implementation

	namespaces_in_scope: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes in scope

	stack_depth: INTEGER
			-- Index into `count_stack' and `disinherit_stack'

	count_stack: DS_ARRAYED_LIST [INTEGER]
			-- Count of namespaces per element

	pending_undeclarations: detachable DS_ARRAYED_LIST [INTEGER]
			-- Pending undeclarations

	disinherit_stack: DS_ARRAYED_LIST [BOOLEAN]
			-- Should namespaces be disinherited at next level?

	cancel_pending_undeclarations (a_prefix_code: INTEGER)
			-- Cancel any pending undeclarations for `a_prefix_code'.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if attached pending_undeclarations as l_pending_undeclarations then
				from
					l_cursor := l_pending_undeclarations.new_cursor; l_cursor.start
				until
					l_cursor.after
				loop
					if a_prefix_code = prefix_code_from_namespace_code (l_cursor.item) then
						l_cursor.replace (-1)
					end
					l_cursor.forth
				variant
					l_pending_undeclarations.count + 1 - l_cursor.index
				end
			end
		end

	is_needed (a_namespace_code, a_prefix_code: INTEGER): BOOLEAN
			-- Is declaration for `a_namespace_code' needed?
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_decided: BOOLEAN
		do
			if a_namespace_code /= Xml_namespace_code then

				-- First cancel any pending undeclaration of this namespace prefix

				from
					l_cursor := namespaces_in_scope.new_cursor; l_cursor.finish
				until
					l_cursor.before
				loop
					if a_namespace_code = l_cursor.item then

						-- it's a duplicate so we don't need it

						Result := False
						l_decided := True
						l_cursor.go_before
					elseif a_prefix_code = prefix_code_from_namespace_code (l_cursor.item) then

						-- same prefix, different URI, so we do need it

						Result := True
						l_decided := True
						l_cursor.go_before
					else
						l_cursor.back
					end
				variant
					l_cursor.index
				end

				-- we need it unless it's a redundant xmlns=""

				if not l_decided then Result := a_namespace_code /= Null_namespace_code end
			end
		end

	check_qname_prefix (a_qname: STRING)
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
					until
						a_cursor.before
					loop
						if a_prefix_code = prefix_code_from_namespace_code (a_cursor.item) then
							a_cursor.go_before
							ok := True
						else
							a_cursor.back
						end
					variant
						a_cursor.index
					end
					if not ok then
						on_error (STRING_.concat ("namespace not declared for prefix in QName content: ", a_qname))
					end
				end
			end
		end

invariant

	namespaces_in_scope_not_void: namespaces_in_scope /= Void
	count_stack_not_void: count_stack /= Void
	disinherit_stack_not_void: disinherit_stack /= Void
	consistent_stack_depth: count_stack.capacity = disinherit_stack.capacity and
		count_stack.count = disinherit_stack.count and
		count_stack.capacity >= stack_depth and count_stack.count >= stack_depth - 1

end

