indexing

	description:

		 "Callbacks filter that resolves namespaces"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_RESOLVER

inherit

	XM_CALLBACKS_FILTER
		redefine
			on_finish,
			on_start,
			on_start_tag,
			on_attribute,
			on_start_tag_finish,
			on_end_tag
		end

	XM_MARKUP_CONSTANTS
		export {NONE} all end

	XM_UNICODE_STRUCTURE_FACTORY
		export {NONE} all end

creation

	make_null,
	set_next

feature -- Document

	on_finish is
			-- Forward to `next'.
		do
			next.on_finish
		end

	on_start is
			-- Initialize document variables.
		do
			create context.make
			attributes_make
			next.on_start
		end

feature -- Element

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Process start of start tag.
		do
			context.push
			check empty_attributes: attributes_is_empty end
				-- Save for when we can resolve it, event deferred.
			element_prefix := a_prefix
			element_local_part := a_local_part
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Process attribute.
		do
			if not has_prefix (a_prefix) and is_xmlns (a_local_part) then
					-- Default declaration.
				context.add_default (a_value)
			elseif is_xmlns (a_prefix) then
					-- Prefix declaration.
				if context.shallow_has (a_prefix) then
					on_error (Duplicate_namespace_declaration_error)
				else
					context.add (a_value, a_local_part)
				end
			else
					-- Queue ordinary attribute for when all namespace
					-- declarations have been seen as they can be used
					-- to declare attributes prefixes.
				attributes_force (a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish is
			-- Process end of start tag.
		local
			an_element_namespace: STRING
			a_namespace: STRING
		do
				-- Resolve element.
			if has_prefix (element_prefix) then
				if context.has (element_prefix) then
					an_element_namespace := context.resolve (element_prefix)
				else
					on_error (Undeclared_namespace_error)
				end
			else
				an_element_namespace := context.resolve_default
			end
			next.on_start_tag (an_element_namespace, element_prefix, element_local_part)
				-- Resolve attributes.
			from
			until
				attributes_is_empty
			loop
				if has_prefix (attributes_prefix.item) then
					if context.has (attributes_prefix.item) then
						a_namespace := context.resolve (attributes_prefix.item)
					else
						on_error (Undeclared_namespace_error)
					end
				else
					a_namespace := an_element_namespace
				end
				next.on_attribute (a_namespace,
					attributes_prefix.item, attributes_local_part.item,
					attributes_value.item)
					-- Forth:
				attributes_remove
			end
			Precursor
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Process end tag.
		do
			if has_prefix (a_prefix) then
				Precursor (context.resolve (a_prefix), a_prefix, a_local_part)
			else
				Precursor (context.resolve_default, a_prefix, a_local_part)
			end
			context.pop
		end

feature {NONE} -- Context

	context: XM_NAMESPACE_RESOLVER_CONTEXT
			-- Context

feature {NONE} -- Context

	is_xmlns (a: STRING): BOOLEAN is
			-- Is this an xmlns declaration?
		do
			Result := a /= Void and then same_string (Xmlns, a)
		end

feature {NONE} -- Element

	element_prefix: STRING
	element_local_part: STRING

feature {NONE} -- Attributes

	-- mean version of:
	-- attributes: DS_QUEUE [PREFIX_LOCALPART_VALUE]

	attributes_make is
			-- Intialize queue.
		do
			attributes_prefix := new_string_queue
			attributes_local_part := new_string_queue
			attributes_value := new_string_queue
		end

	attributes_force (a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Like attributes.force.
		do
			attributes_prefix.force (a_prefix)
			attributes_local_part.force (a_local_part)
			attributes_value.force (a_value)
		end

	attributes_remove is
			-- Like attributes.remove.
		require
			not_empty: not attributes_is_empty
		do
			attributes_prefix.remove
			attributes_local_part.remove
			attributes_value.remove
		end

	attributes_is_empty: BOOLEAN is
			-- Like attributes.is_empty.
		do
			Result := attributes_prefix.is_empty
		end

	attributes_prefix: DS_QUEUE [STRING]
	attributes_local_part: DS_QUEUE [STRING]
	attributes_value: DS_QUEUE [STRING]

feature {NONE} -- Error

	Undeclared_namespace_error: STRING is "Undeclare namespace error"
	Duplicate_namespace_declaration_error: STRING is "Namespace declared twice"
			-- Error messages

end
