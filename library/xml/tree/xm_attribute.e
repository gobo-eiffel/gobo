indexing

	description:

		"Objects representing a XML-attribute"

	status:  "See notice at end of class."
	author:  "Andreas Leitner"

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
			-- the value of the attribute.
		do
			Result := implementation.value
		end

	is_namespace_declaration: BOOLEAN is
			-- is this attribute a namespace declaration ?
		do
			if (has_prefix and then (equal (ns_prefix, uc_xmlns))) or equal (name, uc_xmlns) then
				Result := True
			end
		end

	namespace_declaration: XM_NAMESPACE is
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
		do
			x.process_attribute (Current)
		end

	set_value (a_value: UC_STRING) is
			-- Set `foo' to `a_foo'.
		require
			a_value_not_void: a_value /= Void
		do
			implementation.set_value (a_value)
		ensure
			value_set: value = a_value
		end

feature {DP_IMPLEMENTATION, DP_INTERFACE} -- Implementation

	implementation: XI_ATTRIBUTE

feature {NONE}

	uc_xmlns: UC_STRING is
		once
			!! Result.make_from_string ("xmlns")
		end

invariant

	value_not_void: value /= Void

end -- class XM_ATTRIBUTE
--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------

