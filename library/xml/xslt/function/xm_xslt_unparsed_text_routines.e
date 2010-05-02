note

	description:

		"Objects that support the XSLT unparsed-text[-available]() functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_UNPARSED_TEXT_ROUTINES

inherit

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_INTEGER_ROUTINES

	XM_XPATH_STANDARD_NAMESPACES

	XM_XPATH_ERROR_TYPES

	UT_SHARED_URL_ENCODING

feature {NONE} -- Access

	evaluated_unparsed_text (a_uri: UT_URI; an_encoding: STRING; a_context: XM_XPATH_CONTEXT; is_availability_check: BOOLEAN): XM_XPATH_ITEM
			-- Unparsed text (or availability thereof) for `a_uri'
		require
			absolute_uri: a_uri /= Void and then a_uri.is_absolute and then not a_uri.has_fragment
			dynamic_context_not_void: a_context /= Void
		local
			an_evaluation_context: XM_XSLT_EVALUATION_CONTEXT
			a_transformer: XM_XSLT_TRANSFORMER
			a_text: STRING
		do
			an_evaluation_context ?= a_context
			a_transformer := an_evaluation_context.transformer
			if not is_availability_check then
				a_text := a_transformer.cached_unparsed_text (a_uri.full_uri, an_encoding)
				if a_text /= Void then
					create {XM_XPATH_STRING_VALUE} Result.make (a_text)
				end
				a_transformer.clear_unparsed_text_cache
			end
			if Result = Void then
				if not is_recognized_encoding (an_encoding) then
					if is_availability_check then
						create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
					else
						create {XM_XPATH_INVALID_ITEM} Result.make_from_string (STRING_.concat (an_encoding, " is not supported by this implementation"),
																								  Xpath_errors_uri, "XTDE1190", Dynamic_error)
					end
				else
					Result := resolved_text_uri (a_uri, an_encoding, an_evaluation_context, is_availability_check)
				end
			end
		ensure
			result_not_void: Result /= Void
			availability_check_implies_no_error: is_availability_check implies not Result.is_error and then Result.is_boolean_value
			no_error_implies_string_value: not  is_availability_check and then not Result.is_error implies Result.is_string_value
		end

	resolved_text_uri (a_uri: UT_URI; an_encoding: STRING; a_context: XM_XSLT_EVALUATION_CONTEXT; is_availability_check: BOOLEAN): XM_XPATH_ITEM
			-- Resolved unparsed text (or availability thereof) for `a_uri'
		require
			absolute_uri: a_uri /= Void and then a_uri.is_absolute and then not a_uri.has_fragment
			dynamic_context_not_void: a_context /= Void
			recognized_encoding: is_recognized_encoding (an_encoding)
		local
			a_resolver:  XM_URI_REFERENCE_RESOLVER
			a_stream: XM_EIFFEL_INPUT_STREAM
			a_media_type: UT_MEDIA_TYPE
			a_charset: STRING
		do
			a_resolver := a_context.configuration.uri_resolver
			a_resolver.resolve_uri (a_uri.full_uri)
			if a_resolver.has_uri_reference_error then
				if is_availability_check then
					create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
				else
					create {XM_XPATH_INVALID_ITEM} Result.make_from_string ("Failed to resolve URI",
																							  Xpath_errors_uri, "XTDE1170", Dynamic_error)
				end
			else
				create a_stream.make_from_stream (a_resolver.last_uri_reference_stream)
				if	a_resolver.has_media_type then
					a_media_type := a_resolver.last_media_type
					if a_media_type.has_parameter (Charset) then
						a_charset := a_media_type.parameter (Charset)
						if not is_recognized_encoding (a_charset) then
							if is_availability_check then
								create {XM_XPATH_BOOLEAN_VALUE} Result.make (False)
							else
								create {XM_XPATH_INVALID_ITEM} Result.make_from_string (STRING_.concat (a_charset, " is not supported by this implementation"),
																										  Xpath_errors_uri, "XTDE1190", Dynamic_error)
							end
						end
					elseif not is_xml_media_type (a_media_type) then
						if an_encoding /= Void then
							a_stream.set_encoding (an_encoding)
						else
							a_stream.set_encoding ("utf-8")
						end
					end
				elseif an_encoding /= Void then
					a_stream.set_encoding (an_encoding)
				else
					a_stream.set_encoding ("utf-8")
				end
			end
			if Result = Void then
				Result := retrieved_text (a_stream, a_uri, an_encoding, a_context, is_availability_check)
			end
		ensure
			result_not_void: Result /= Void
			availability_check_implies_no_error: is_availability_check implies not Result.is_error and then Result.is_boolean_value
			no_error_implies_string_value: not  is_availability_check and then not Result.is_error implies Result.is_string_value
		end

	retrieved_text (a_stream: XM_EIFFEL_INPUT_STREAM; a_uri: UT_URI; an_encoding: STRING; a_context: XM_XSLT_EVALUATION_CONTEXT; is_availability_check: BOOLEAN): XM_XPATH_ITEM
			-- Resolved unparsed text (or availability thereof) from `a_stream' for `a_uri'
		require
			stream_not_void: a_stream /= Void
			absolute_uri: a_uri /= Void and then a_uri.is_absolute and then not a_uri.has_fragment
			dynamic_context_not_void: a_context /= Void
			recognized_encoding: is_recognized_encoding (an_encoding)
		local
			a_text: STRING
		do
			a_stream.read_string (INTEGER_.Platform.Maximum_integer)
			a_text := a_stream.last_string
			if is_availability_check then
				a_context.transformer.cache_unparsed_text (a_text, a_uri.full_uri, an_encoding)
				create {XM_XPATH_BOOLEAN_VALUE} Result.make (True)
			else
				create {XM_XPATH_STRING_VALUE} Result.make (a_text)
			end
		ensure
			result_not_void: Result /= Void
			availability_check_implies_no_error: is_availability_check implies not Result.is_error and then Result.is_boolean_value
			no_error_implies_string_value: not  is_availability_check and then not Result.is_error implies Result.is_string_value
		end

	is_recognized_encoding (an_encoding: STRING): BOOLEAN
		-- Is `an_encoding' supported or `Void'?
		do
			if an_encoding = Void then
				Result := True
			elseif STRING_.same_string (an_encoding, "utf-8") then
				Result := True
			elseif STRING_.same_string (an_encoding, "utf-16") then
				Result := True
			elseif STRING_.same_string (an_encoding, "us-ascii") then
				Result := True
			elseif STRING_.same_string (an_encoding, "iso-8859-1") then
				Result := True
			end
		end

	is_xml_media_type (a_media_type: UT_MEDIA_TYPE): BOOLEAN
			-- Is `a_media_type' an XML media type?
		require
			media_type_not_void: a_media_type /= Void
		local
			a_sub_type: STRING
		do
			Result := STRING_.same_string (a_media_type.type, "text") or else STRING_.same_string (a_media_type.type, "application")
			if Result then
				a_sub_type := a_media_type.subtype
				Result := STRING_.same_string (a_sub_type, "xml")
				if not Result then
					Result := a_sub_type.count > 4 and then
						STRING_.same_string (a_sub_type.substring (a_sub_type.count - 4, a_sub_type.count), "+xml")
				end
			end
		end

	Charset: STRING = "charset"
			-- Charset parameter

end

