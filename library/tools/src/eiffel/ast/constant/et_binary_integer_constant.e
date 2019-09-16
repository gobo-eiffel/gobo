note

	description:

		"Eiffel integer constants in binary format"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_BINARY_INTEGER_CONSTANT

inherit

	ET_INTEGER_CONSTANT
		redefine
			is_integer_8,
			is_integer_16,
			is_integer_32,
			is_integer_64,
			to_integer_8,
			to_integer_16,
			to_integer_32,
			to_integer_64,
			is_binary
		end

create

	make

feature {NONE} -- Initialization

	make (a_literal: like literal; a_value: NATURAL_64; a_has_overflow: BOOLEAN)
			-- Create a new Integer constant.
		require
			a_literal_not_void: a_literal /= Void
			valid_literal: {ET_BINARY_INTEGER_CONSTANT}.valid_literal (a_literal)
		do
			literal := a_literal
			value := a_value
			has_overflow := a_has_overflow
			make_leaf
		ensure
			literal_set: literal = a_literal
			value_set: value = a_value
			has_overflow_set: has_overflow = a_has_overflow
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	to_integer_8: INTEGER_8
			-- INTEGER_8 value of current integer constant
		do
			if attached sign as l_sign and then l_sign.is_minus then
				if value = integer_8_min_value_abs then
					Result := {INTEGER_8}.Min_value
				else
					Result := -value.as_integer_8
				end
			elseif value <= {INTEGER_8}.max_value.as_natural_64 then
				Result := value.as_integer_8
			else
				Result := (value - integer_8_min_value_abs).as_integer_8 + {INTEGER_8}.Min_value
			end
		end

	to_integer_16: INTEGER_16
			-- INTEGER_16 value of current integer constant
		do
			if attached sign as l_sign and then l_sign.is_minus then
				if value = integer_16_min_value_abs then
					Result := {INTEGER_16}.Min_value
				else
					Result := -value.as_integer_16
				end
			elseif value <= {INTEGER_16}.max_value.as_natural_64 then
				Result := value.as_integer_16
			else
				Result := (value - integer_16_min_value_abs).as_integer_16 + {INTEGER_16}.Min_value
			end
		end

	to_integer_32: INTEGER_32
			-- INTEGER_32 value of current integer constant
		do
			if attached sign as l_sign and then l_sign.is_minus then
				if value = integer_32_min_value_abs then
					Result := {INTEGER_32}.Min_value
				else
					Result := -value.as_integer_32
				end
			elseif value <= {INTEGER_32}.max_value.as_natural_64 then
				Result := value.as_integer_32
			else
				Result := (value - integer_32_min_value_abs).as_integer_32 + {INTEGER_32}.Min_value
			end
		end

	to_integer_64: INTEGER_64
			-- INTEGER_64 value of current integer constant
		do
			if attached sign as l_sign and then l_sign.is_minus then
				if value = integer_64_min_value_abs then
					Result := {INTEGER_64}.Min_value
				else
					Result := -value.as_integer_64
				end
			elseif value <= {INTEGER_64}.max_value.as_natural_64 then
				Result := value.as_integer_64
			else
				Result := (value - integer_64_min_value_abs).as_integer_64 + {INTEGER_64}.Min_value
			end
		end

feature -- Status report

	is_binary: BOOLEAN = True
			-- Is current constant in binary format

	is_integer_8: BOOLEAN
			-- Is current integer constant representable as an INTEGER_8?
		do
			if has_overflow then
				Result := False
			elseif not attached sign as l_sign then
				Result := value <= {NATURAL_8}.Max_value
			elseif l_sign.is_minus then
				Result := value <= integer_8_min_value_abs
			else
				Result := value <= {INTEGER_8}.Max_value.as_natural_64
			end
		end

	is_integer_16: BOOLEAN
			-- Is current integer constant representable as an INTEGER_16?
		do
			if has_overflow then
				Result := False
			elseif not attached sign as l_sign then
				Result := value <= {NATURAL_16}.Max_value
			elseif l_sign.is_minus then
				Result := value <= integer_16_min_value_abs
			else
				Result := value <= {INTEGER_16}.Max_value.as_natural_64
			end
		end

	is_integer_32: BOOLEAN
			-- Is current integer constant representable as an INTEGER_32?
		do
			if has_overflow then
				Result := False
			elseif not attached sign as l_sign then
				Result := value <= {NATURAL_32}.Max_value
			elseif l_sign.is_minus then
				Result := value <= integer_32_min_value_abs
			else
				Result := value <= {INTEGER_32}.Max_value.as_natural_64
			end
		end

	is_integer_64: BOOLEAN
			-- Is current integer constant representable as an INTEGER_64?
		do
			if has_overflow then
				Result := False
			elseif not attached sign as l_sign then
				Result := True
			elseif l_sign.is_minus then
				Result := value <= integer_64_min_value_abs
			else
				Result := value <= {INTEGER_64}.Max_value.to_natural_64
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_binary_integer_constant (Current)
		end

feature {NONE} -- Implementation

	literal_regexp: STRING = "0[bB]_*[0-1]+(_+[0-1]+)*_*"
			-- Regular expression for `literal'
			-- (Note that the optional leading and trailing underscores
			-- are not part of the Eiffel standard.)

end
