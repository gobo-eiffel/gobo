
indexing

	description:
		
		"Pretty printer with resolved namespaces"
	
	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
class XM_NAMESPACE_PRETTY_PRINT_FILTER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			on_start_tag,
			on_attribute,
			output_name
		end

feature -- Tag

	on_start_tag (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Print start of start tag.
		do
			namespace := a_namespace
			Precursor (a_namespace, a_prefix, a_local_part)
			namespace := Void
		end
		
	on_attribute (a_namespace: UC_STRING; a_prefix: UC_STRING; a_local_part: UC_STRING; a_value: UC_STRING) is
			-- Print attribute.
		do
			namespace := a_namespace
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
			namespace := Void
		end
		
feature {NONE} -- Name output

	namespace: UC_STRING
			-- Namespace stored for output.
	
	output_name (a_prefix: UC_STRING; a_local_part: UC_STRING) is
			-- Output prefix:name, with namespace annotation.
		do
			if namespace /= Void then
				output_constant ("{")
				output (namespace)
				output_constant ("}")
			end
			Precursor (a_prefix, a_local_part)
		end
		
end
