indexing

	description:

		"Objects that identify the role in which an expression is used"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROLE_LOCATOR

inherit

	XM_XPATH_ROLE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_kind: INTEGER; a_container: STRING; an_operand: INTEGER; a_namespace_uri, an_error_code: STRING) is
		require
			strictly_positive_operand: an_operand > 0
			container_not_void: a_container /= Void and then a_container.count > 0
			kind_in_range: Function_role <= a_kind and then a_kind <= Template_result_role
			namespace_uri_not_void: a_namespace_uri /= Void
			error_code_not_void: an_error_code /= Void
		do
			kind := a_kind
			container := a_container
			operand := an_operand
			namespace_uri := a_namespace_uri
			error_code := an_error_code
		ensure
			kind_set: kind = a_kind
			container_set: container = a_container
			operand_set: operand = an_operand
			namespace_uri_set: namespace_uri = a_namespace_uri
			error_code_set: error_code = an_error_code
		end
	
feature  -- Access

	message: STRING is
			-- Description of `operand' and it's role within `container'
		local
			a_string, instruction_name, attribute_name: STRING
			an_index: INTEGER
		do
			inspect
				kind
			when Function_role then
				a_string := STRING_.appended_string (ordinal (operand), " argument of ")
				a_string := STRING_.appended_string (a_string, container)
				Result := STRING_.appended_string (a_string, "()")
			when Binary_expression_role then
				a_string := STRING_.appended_string (ordinal (operand), " operand of '")
				a_string := STRING_.appended_string (a_string, container)
				Result := STRING_.appended_string (a_string, "'")
			when Type_operation_role then
				a_string := STRING_.appended_string ("value in '", container)
				Result := STRING_.appended_string (a_string, "' expression")
			when Variable_role then
				Result := STRING_.appended_string ("variable ", container)
			when Instruction_role then
				an_index := container.index_of ('/', 1)
				instruction_name := container
				attribute_name := ""
				if an_index > 0 then
					instruction_name := container.substring (1, an_index)
					attribute_name := container.substring (an_index + 1, container.count)
				end
				a_string := STRING_.appended_string (attribute_name, " attribute of ")
				Result := STRING_.appended_string (a_string, instruction_name)
			when Function_result_role then
				Result := STRING_.appended_string ("result of function ", container)
			when Template_result_role then
				Result := STRING_.appended_string ("result of template ", container)
			when Order_by_role then
				Result := STRING_.appended_string (ordinal (operand), " sort key")
			end
		ensure
			message_not_void: Result /= Void
		end

	kind: INTEGER
			-- Role played by operand

	operand: INTEGER
			-- Operand's position within `container'

	container: STRING
			-- Containing XPath expression text

	namespace_uri, error_code: STRING
			-- Error message identifier

feature {NONE} -- Implementation

	ordinal (an_integer: INTEGER): STRING is
			-- Text of `an_integer' expressed as an ordinal number
		require
			integer_in_range: an_integer > 0
		do
			inspect
				an_integer
			when 1 then
				Result := "first"
			when 2 then
				Result := "second"
			when 3 then
				Result := "third"
			else

				-- Doesn't give good results for 21st and 22nd operands,
				--  but their appearance is going to be extremely rare,
				--  even in the concat() function.
				-- And then, it is probably computer-generated code.
				
				Result := STRING_.appended_string (an_integer.out, "th")
			end
		ensure
			ordinal_not_void: Result /= Void
		end

invariant

	strictly_positive_operand: operand > 0
	container_not_void: container /= Void and then container.count > 0
	kind_in_range: Function_role <= kind and then kind <= Template_result_role
	namespace_uri_not_void: namespace_uri /= Void
	error_code_not_void: error_code /= Void

end

