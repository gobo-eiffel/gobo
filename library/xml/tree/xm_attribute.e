indexing

	description:

		"Objects that represent XML attribute nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_ATTRIBUTE

inherit

	XM_NAMED_NODE
		redefine
			implementation
		end

creation

	make_from_implementation

feature {ANY} -- Access

	value: UC_STRING is
			-- The value of this attribute.
		do
			Result := implementation.value
		end

	is_namespace_declaration: BOOLEAN is
			-- Is this attribute a namespace declaration ?
		do
			if (has_prefix and then (equal (ns_prefix, uc_xmlns))) or equal (name, uc_xmlns) then
				Result := True
			end
		end

	namespace_declaration: XM_NAMESPACE is
			-- If this attribute is a namespace declaration, create 
			-- and return an object representing this declaration.
		require
			is_namespace_declaration: is_namespace_declaration
		local
			a_prefix: UC_STRING
			a_uri: UC_STRING
		do
			if has_prefix then
				a_prefix := name
			else
				!! a_prefix.make (0)
			end
			if value.count > 0 then
				a_uri := value
			end
			!! Result.make (a_prefix, a_uri)
		end

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
			-- Processing procedure for Visitor Pattern.
		do
			x.process_attribute (Current)
		end

	set_value (a_value: UC_STRING) is
			-- Set `a_value' to `value'.
		require
			a_value_not_void: a_value /= Void
		do
			implementation.set_value (a_value)
		ensure
			value_set: value = a_value
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_ATTRIBUTE

feature {NONE} -- Constants

	uc_xmlns: UC_STRING is
		once
			!! Result.make_from_string ("xmlns")
		end

invariant

	value_not_void: value /= Void

end -- class XM_ATTRIBUTE

