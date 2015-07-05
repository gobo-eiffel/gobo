note

	description:

		"Pretty printers with resolved namespaces"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_NAMESPACE_PRETTY_PRINT_FILTER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			on_start_tag,
			on_end_tag,
			on_attribute,
			output_name
		end

create

	make_null,
	make_next

feature -- Tag

	on_start_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Print start of start tag.
		do
			namespace := a_namespace
			Precursor (a_namespace, a_prefix, a_local_part)
			namespace := Void
		end

	on_attribute (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING; a_value: STRING)
			-- Print attribute.
		do
			namespace := a_namespace
			Precursor (a_namespace, a_prefix, a_local_part, a_value)
			namespace := Void
		end

	on_end_tag (a_namespace: detachable STRING; a_prefix: detachable STRING; a_local_part: STRING)
			-- Print start of start tag.
		do
			namespace := a_namespace
			Precursor (a_namespace, a_prefix, a_local_part)
			namespace := Void
		end


feature {NONE} -- Name output

	namespace: detachable STRING
			-- Namespace stored for output

	output_name (a_prefix: detachable STRING; a_local_part: STRING)
			-- Output prefix:name, with namespace annotation.
		do
			if attached namespace as l_namespace and then l_namespace.count > 0 then
				output_constant ("{")
				output (l_namespace)
				output_constant ("}")
			end
			output (a_local_part)
		end

end
