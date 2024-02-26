note

	description:

		"Event filters that normalize text and attribute nodes."

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007-2015, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_NORMALIZING_FILTER

inherit

	XM_XPATH_PROXY_RECEIVER
		redefine
			notify_characters, notify_attribute
		end

	XM_XSLT_NORMALIZATION_SETTER
		rename
			make as make_normalizer
		end

create

	make

feature {NONE} -- Initialization

	make (a_receiver: like base_receiver; a_serializer: like serializer; a_output_properties: like output_properties)
			-- Initialize `Current'
		require
			a_receiver_not_void: a_receiver /= Void
			a_serializer_not_void: a_serializer /= Void
			a_output_properties_not_void: a_output_properties /= Void
		do
			base_receiver := a_receiver
			base_uri := a_receiver.base_uri
			make_normalizer (a_serializer, a_output_properties)
		ensure
			base_receiver_set: base_receiver = a_receiver
			serializer_set: serializer = a_serializer
			output_properties_set: output_properties = a_output_properties
		end


feature -- Events

	notify_attribute (a_name_code: INTEGER; a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER)
			-- Notify an attribute.
		local
			l_value: STRING
		do
			if not is_output_escaping_disabled (a_properties) then
				if attached normalizer as l_normalizer then
					l_value := l_normalizer.normalized_string (a_value)
				else
					l_value := a_value
				end
				Precursor (a_name_code, a_type_code, l_value, a_properties)
			else
				Precursor (a_name_code, a_type_code, a_value, a_properties)
			end
		end

	notify_characters (a_chars: STRING; a_properties: INTEGER)
			-- Notify character data.
		local
			l_value: STRING
		do
			if not is_output_escaping_disabled (a_properties) then
				if attached normalizer as l_normalizer then
					l_value := l_normalizer.normalized_string (a_chars)
				else
					l_value := a_chars
				end
				Precursor (l_value, a_properties)
			else
				Precursor (a_chars, a_properties)
			end
		end

end

