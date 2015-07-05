note

	description:

		"Callbacks filter that resolves namespaces"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_RESOLVER

inherit

	XM_CALLBACKS_FILTER
		redefine
			initialize,
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

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make_null,
	make_next

feature {NONE} -- Initialize

	initialize
			-- Initialize current callbacks.
		do
			create context.make
			attributes_make
		end

feature -- Document

	on_finish
			-- Forward to `next'.
		do
			next.on_finish
		end

	on_start
			-- Initialize document variables.
		do
			initialize
			next.on_start
		end

feature -- Forwarding policy

	forward_xmlns: BOOLEAN
			-- Should xmlns[:] attributes be forwarded to next filter?

	set_forward_xmlns (a_boolean: BOOLEAN)
			-- Set forwarding of xmlns[:] attributes policy.
			-- Default (False): do not forward.
		do
			forward_xmlns := a_boolean
		ensure
			set: forward_xmlns = a_boolean
		end

feature -- Element

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Process start of start tag.
		do
			context.push
			check empty_attributes: attributes_is_empty end
				-- Save for when we can resolve it, event deferred.
			element_prefix := a_prefix
			element_local_part := a_local_part
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Process attribute.
		do
			if not has_prefix (a_prefix) and is_xmlns (a_local_part) then
					-- Default declaration.
				context.add_default (a_value)
					-- Optionally do not eat xmlns attributes
				if forward_xmlns then
					attributes_force (a_prefix, a_local_part, a_value)
				end
			elseif a_prefix /= Void and then is_xmlns (a_prefix) then
					-- Prefix declaration.
				if context.shallow_has (a_prefix) then
					on_error (Duplicate_namespace_declaration_error)
				else
					context.add (a_value, a_local_part)
				end
					-- Optionally do not eat xmlns: attributes
				if forward_xmlns then
					attributes_force (a_prefix, a_local_part, a_value)
				end
			else
					-- Queue ordinary attribute for when all namespace
					-- declarations have been seen as they can be used
					-- to declare attributes prefixes.
				attributes_force (a_prefix, a_local_part, a_value)
			end
		end

	on_start_tag_finish
			-- Process end of start tag.
		local
			error_msg: STRING
		do
			check attached element_local_part as l_element_local_part then
				if attached element_prefix as l_element_prefix and then has_prefix (l_element_prefix) then
					if context.has (l_element_prefix) then
						next.on_start_tag (context.resolve (l_element_prefix),
								l_element_prefix, l_element_local_part)
						on_delayed_attributes
					else
						error_msg := STRING_.cloned_string (Undeclared_namespace_error)
						error_msg := STRING_.appended_string (error_msg, " in tag <")
						error_msg := STRING_.appended_string (error_msg, l_element_prefix)
						error_msg := STRING_.appended_string (error_msg, ":")
						error_msg := STRING_.appended_string (error_msg, l_element_local_part)
						error_msg := STRING_.appended_string (error_msg, ">")
						on_error (error_msg)
					end
				else
					next.on_start_tag (context.resolve_default,
							element_prefix, l_element_local_part)
					on_delayed_attributes
				end
				Precursor
			end
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Process end tag.
		do
			if a_prefix /= Void and then has_prefix (a_prefix) then
				Precursor (context.resolve (a_prefix), a_prefix, a_local_part)
			else
				Precursor (context.resolve_default, a_prefix, a_local_part)
			end
			context.pop
		end

feature {NONE} -- Attribute events

	on_delayed_attributes
			-- Resolve attributes.
		local
			l_attribute_prefix: detachable STRING
		do
			from
			until
				attributes_is_empty
			loop
				l_attribute_prefix := attributes_prefix.item
				if l_attribute_prefix /= Void and then has_prefix (l_attribute_prefix) then
					-- Resolve the attribute's prefix if it has any.
					if context.has (l_attribute_prefix) then
						next.on_attribute (context.resolve (l_attribute_prefix),
							l_attribute_prefix, attributes_local_part.item,
							attributes_value.item)
					elseif is_xml (l_attribute_prefix) then
							-- xml: prefix has implicit namespace
						next.on_attribute (Xml_prefix_namespace,
							l_attribute_prefix,
							attributes_local_part.item,
							attributes_value.item)
					elseif is_xmlns (l_attribute_prefix) then
							-- xmlns: prefix has implicit namespace
						next.on_attribute (Xmlns_namespace,
							l_attribute_prefix,
							attributes_local_part.item,
							attributes_value.item)
					else
						on_error (Undeclared_namespace_error)
					end
				else
					next.on_attribute (Unprefixed_attribute_namespace,
						l_attribute_prefix, attributes_local_part.item,
						attributes_value.item)
				end
					-- Forth:
				attributes_remove
			end
		end

feature {NONE} -- Context

	context: XM_NAMESPACE_RESOLVER_CONTEXT
			-- Context

feature {NONE} -- Context

	is_xmlns (a: STRING): BOOLEAN
			-- Is this an xmlns[:] declaration?
		do
			Result := a /= Void and then same_string (Xmlns, a)
		end

	is_xml (a: STRING): BOOLEAN
			-- Is this a xml: declaration?
		do
			Result := a /= Void and then same_string (Xml_prefix, a)
		end

	Unprefixed_attribute_namespace: STRING
			-- Namespace used for unprefixed attributes.
		do
			Result := Default_namespace
		end

feature {NONE} -- Element

	element_prefix: detachable STRING
	element_local_part: detachable STRING

feature {NONE} -- Attributes

	-- mean version of:
	-- attributes: DS_QUEUE [PREFIX_LOCALPART_VALUE]

	attributes_make
			-- Intialize queue.
		do
			attributes_prefix := new_string_queue
			attributes_local_part := new_string_queue
			attributes_value := new_string_queue
		end

	attributes_force (a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Like attributes.force.
		do
			attributes_prefix.force (a_prefix)
			attributes_local_part.force (a_local_part)
			attributes_value.force (a_value)
		end

	attributes_remove
			-- Like attributes.remove.
		require
			not_empty: not attributes_is_empty
		do
			attributes_prefix.remove
			attributes_local_part.remove
			attributes_value.remove
		end

	attributes_is_empty: BOOLEAN
			-- Like attributes.is_empty.
		do
			Result := attributes_prefix.is_empty
		end

	attributes_prefix: DS_QUEUE [detachable STRING]
	attributes_local_part: DS_QUEUE [STRING]
	attributes_value: DS_QUEUE [STRING]

feature {NONE} -- Error

	Undeclared_namespace_error: STRING = "Undeclared namespace error"
	Duplicate_namespace_declaration_error: STRING = "Namespace declared twice"
			-- Error messages

invariant

	context_not_void: context /= Void
	attributes_prefix_not_void: attributes_prefix /= Void
	attributes_local_part_not_void: attributes_local_part /= Void
	no_void_attribute_local_part: not attributes_local_part.has_void
	attributes_value_not_void: attributes_value /= Void
	no_void_attribute_value: not attributes_value.has_void

end
