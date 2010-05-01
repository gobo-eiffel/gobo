note
	
	description:
	
		"Filter that generates consistent xmlns declarations (existings ones if any are replaced)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
		
class XM_XMLNS_GENERATOR

inherit
	
	XM_CALLBACKS_FILTER
		redefine
			has_resolved_namespaces,
			on_start,
			on_start_tag,
			on_attribute,
			on_start_tag_finish,
			on_end_tag,
			on_finish
		end
	
	XM_MARKUP_CONSTANTS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end
	
create

	make_null,
	set_next
	
feature {NONE} -- Default element namespace handling

	on_default (a_namespace: STRING) is
			-- Process default namespace declaration.
		require
			not_void: a_namespace /= Void
		do
			if not context.is_same_as_default (a_namespace) then
					-- Change of default namespace, issue a declaration.
				context.set_default (a_namespace)
				next.on_attribute (Xmlns_namespace, Void, Xmlns, a_namespace)
			end
		end
		
feature {NONE} -- Unique prefix

	last_unique_prefix: INTEGER
			-- Number used to make unique numeric prefix
					
	unique_prefix: STRING is
			-- Unique prefix.
		do
			create Result.make_empty
			Result := STRING_.appended_string (Result, "ns")
			Result := STRING_.appended_string (Result, last_unique_prefix.out)
		ensure
			result_not_void: Result /= Void
			not_implicit: not is_implicit (Result)
		end
	
	reset_unique_prefix is
			-- Reset unique prefix generator.
		do
			last_unique_prefix := 0
		end	
		
	next_unique_prefix is
			-- Go to next unique prefix.
		do
			last_unique_prefix := last_unique_prefix + 1
		end
		
feature {NONE} -- Prefix handling

	context: XM_XMLNS_GENERATOR_CONTEXT
			-- xmlns context
			
	handle_prefix (a_namespace: STRING; a_prefix: STRING): STRING is
			-- Handle prefix.
		require
			a_namespace_not_void: a_namespace /= Void
			a_prefix_not_void: a_prefix /= Void
		do
			if context.has (a_namespace) then
					-- Ignore the prefix and use the previously declared one
				Result := context.item (a_namespace)
			else
				if a_prefix = Void or else a_prefix.is_empty 
					or else context.element_has_prefix (a_prefix) 
				then
						-- There is no prefix, or the prefix is in use and 
						-- declared in this element so cannot be overridden: 
						-- generage new prefix.
					from
						next_unique_prefix
						Result := unique_prefix
					-- variant: known_prefixes - attempts + 2
					until
						not context.element_has_prefix (Result)
					loop
						next_unique_prefix
						Result := unique_prefix
					end
				else
						-- Use declared prefix
					Result := a_prefix
				end 
				context.force (Result, a_namespace)
			end
			context.element_prefix (Result)
		ensure
			result_not_void: Result /= Void
			not_implicit: not is_implicit (Result)
		end
		
	is_implicit (a_prefix: STRING): BOOLEAN is
			-- Is this an implicit prefix? eg xml:
		do
			Result := STRING_.same_string (a_prefix, Xml_prefix)
		end
		
feature -- Events

	on_start is
			-- Reset context.
		do
			create context.make
			reset_unique_prefix
			
			next.on_start
		end
		
	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Start tag, handle default namespace.
		do
			check resolved: a_namespace /= Void end
			
			context.on_start_element
			if a_prefix = Void or else a_prefix.is_empty then
				next.on_start_tag (a_namespace, a_prefix, a_local_part)
				on_default (a_namespace)
			else
				next.on_start_tag (a_namespace,
					handle_prefix (a_namespace, a_prefix),
					a_local_part)
			end
		end
		
	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Process attribute's prefix.
		do
			check resolved: a_namespace /= Void end

			if STRING_.same_string (a_namespace, Xmlns_namespace) then
					-- Override preexisting xmlns declaration.
			elseif STRING_.same_string (a_namespace, Default_namespace) then
					-- Default namespace means unprefixed.
				next.on_attribute (Default_namespace, Void, a_local_part, a_value)
			elseif is_implicit (a_prefix) then
					-- Implicit namespaces are not declared.
				next.on_attribute (a_namespace,
					a_prefix, 
					a_local_part, a_value)
			else
				next.on_attribute (a_namespace,
					handle_prefix (a_namespace, a_prefix), 
					a_local_part, a_value)
			end
		end
		
	on_start_tag_finish is
			-- Issue xmlns attributes
		local
			a_cursor: DS_HASH_TABLE_CURSOR [STRING, STRING]
		do
			from
				a_cursor := context.new_element_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				next.on_attribute (Xmlns_namespace, Xmlns, a_cursor.item, a_cursor.key)
				a_cursor.forth
			end
			next.on_start_tag_finish
		end
	
	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING)is
			-- End tag, reset context.
		do
			context.on_end_element
			next.on_end_tag (a_namespace, a_prefix, a_local_part)
		end
		
	on_finish is
		do
			-- free context
			create context.make
			next.on_finish
		end

feature -- Events mode

	has_resolved_namespaces: BOOLEAN is
			-- Namespaces required
		do
			Result := True
		end

end
