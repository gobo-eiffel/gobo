indexing

	description:

		"Pretty printers for XML document with namespaces resolved (as in http://www.jclark.com/xml/xmlns.htm)"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	comment: "The output is not XML compliant, prefixes are replaced with resolved namespace URI in brackets"	

class XM_NAMESPACE_PRETTY_PRINT_FILTER

inherit

	XM_PRETTY_PRINT_FILTER
		redefine
			on_start_tag,
			on_end_tag,
			on_attribute
		end
	
creation
	
	make_null,
	set_next
	
feature

	on_start_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Print start of start tag.
		do
			output_constant (Stag_start)
			output_namespace (a_namespace)
			output (a_local_part)
			next.on_start_tag (a_namespace, a_prefix, a_local_part)
		end

	on_attribute (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING; a_value: STRING) is
			-- Print attribute.
		do
			output_constant (Space_s)
			output_namespace (a_namespace)	
			output (a_local_part)
			output_constant (Eq_s)
			output_constant (Quot_s)
			output_quote_escaped (a_value)
			output_constant (Quot_s)
			next.on_attribute (a_namespace, a_prefix, a_local_part, a_value)
		end

	on_end_tag (a_namespace: STRING; a_prefix: STRING; a_local_part: STRING) is
			-- Print start of start tag.
		do
			output_constant (Etag_start)
			output_namespace (a_namespace)
			output (a_local_part)
			output_constant (Etag_end)
			next.on_end_tag (a_namespace, a_prefix, a_local_part)
		end
		
feature {NONE} -- Implementation

	output_namespace (a: STRING) is
			-- Output namespace.
		do
			if a /= Void and then a.count > 0 then
				output_constant (Ns_start)
				output (a)
				output_constant (Ns_end)
			end
		end
		
	Ns_start: STRING is "{"
	Ns_end: STRING is "}"

end
