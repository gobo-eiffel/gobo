indexing

	description:

		"Objects that provide access to standard XSLT and core XPATH functions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SYSTEM_FUNCTION_LIBRARY

inherit

	XM_XPATH_CORE_FUNCTION_LIBRARY
		redefine
			is_function_available, bind_function
		end

create

	make

feature -- Access

	is_function_available (a_fingerprint, an_arity: INTEGER; is_restricted: BOOLEAN): BOOLEAN is
			-- Does `a_fingerprint' represent an available function with `an_arity'?
		do
			if a_fingerprint = Current_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 0
			elseif a_fingerprint = Current_group_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 0
			elseif a_fingerprint = Current_grouping_key_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 0
			elseif a_fingerprint = Document_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2
			elseif a_fingerprint = Element_available_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			elseif a_fingerprint = Format_date_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 5
			elseif a_fingerprint = Format_datetime_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 5
			elseif a_fingerprint = Format_number_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 3
			elseif a_fingerprint = Format_time_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 5			
			elseif a_fingerprint = Function_available_function_type_code then
				Result := an_arity = -1 or else an_arity = 1 or else an_arity = 2
			elseif a_fingerprint = Generate_id_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 0 or else an_arity = 1
			elseif a_fingerprint = Key_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 2 or else an_arity = 3
			elseif a_fingerprint = Regex_group_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			elseif a_fingerprint = System_property_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			elseif a_fingerprint = Type_available_function_type_code then
				Result := an_arity = -1 or else an_arity = 1
			elseif a_fingerprint = Unparsed_entity_uri_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 1
			elseif a_fingerprint = Unparsed_entity_public_id_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 1
			elseif a_fingerprint = Unparsed_text_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			elseif a_fingerprint = Unparsed_text_available_function_type_code and then not is_restricted then
				Result := an_arity = -1 or else an_arity = 1  or else an_arity = 2
			else			
				Result := Precursor (a_fingerprint, an_arity, is_restricted)
			end
		end

feature -- Element change

	bind_function (a_fingerprint: INTEGER; some_arguments: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]; is_restricted: BOOLEAN) is
			-- Bind `a_fingerprint' to it's definition as `last_bound_function'.
		local
			a_function_call: XM_XPATH_FUNCTION_CALL
			precursor_called: BOOLEAN
		do
			if a_fingerprint = Current_function_type_code then
				create {XM_XSLT_CURRENT} a_function_call.make
			elseif a_fingerprint = Current_group_function_type_code then
				create {XM_XSLT_CURRENT_GROUP} a_function_call.make
			elseif a_fingerprint = Current_grouping_key_function_type_code then
				create {XM_XSLT_CURRENT_GROUPING_KEY} a_function_call.make
			elseif a_fingerprint = Document_function_type_code then
				create {XM_XSLT_DOCUMENT_FUNCTION} a_function_call.make
			elseif a_fingerprint = Element_available_function_type_code then
				create {XM_XSLT_ELEMENT_AVAILABLE} a_function_call.make								
			elseif a_fingerprint = Format_date_function_type_code then
				create {XM_XSLT_FORMAT_DATE_TIME} a_function_call.make_date
			elseif a_fingerprint = Format_datetime_function_type_code then
				create {XM_XSLT_FORMAT_DATE_TIME} a_function_call.make_date_time
			elseif a_fingerprint = Format_number_function_type_code then
				create {XM_XSLT_FORMAT_NUMBER} a_function_call.make
			elseif a_fingerprint = Format_time_function_type_code then
				create {XM_XSLT_FORMAT_DATE_TIME} a_function_call.make_time				
			elseif a_fingerprint = Function_available_function_type_code then
				create {XM_XSLT_FUNCTION_AVAILABLE} a_function_call.make				
			elseif a_fingerprint = Generate_id_function_type_code then
				create {XM_XSLT_GENERATE_ID} a_function_call.make
			elseif a_fingerprint = Key_function_type_code then
				create {XM_XSLT_KEY_FUNCTION} a_function_call.make
			elseif a_fingerprint = Regex_group_function_type_code then
				create {XM_XSLT_REGEX_GROUP} a_function_call.make				
			elseif a_fingerprint = System_property_function_type_code then
				create {XM_XSLT_SYSTEM_PROPERTY} a_function_call.make				
			elseif a_fingerprint = Type_available_function_type_code then
				create {XM_XSLT_TYPE_AVAILABLE} a_function_call.make				
			elseif a_fingerprint = Unparsed_entity_uri_function_type_code then
				create {XM_XSLT_UNPARSED_ENTITY_URI} a_function_call.make								
			elseif a_fingerprint = Unparsed_entity_public_id_function_type_code then
				create {XM_XSLT_UNPARSED_ENTITY_PUBLIC_ID} a_function_call.make								
			elseif a_fingerprint = Unparsed_text_function_type_code then
				create {XM_XSLT_UNPARSED_TEXT} a_function_call.make								
			elseif a_fingerprint = Unparsed_text_available_function_type_code then
				create {XM_XSLT_UNPARSED_TEXT_AVAILABLE} a_function_call.make								
			else
				precursor_called := True
				Precursor (a_fingerprint, some_arguments, is_restricted)
			end
			if not precursor_called then
				check
					function_bound: a_function_call /= Void
					-- From pre-condition
				end
				a_function_call.set_arguments (some_arguments)
				last_bound_function := a_function_call
			end
		end

end
	
