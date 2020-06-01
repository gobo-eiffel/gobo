note

	description:

	"[
		Eiffel AST printers.
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_PRINTER

inherit

	ET_AST_ITERATOR
		rename
			make as make_null
		redefine
			make_null,
			process_break,
			process_binary_integer_constant,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_class,
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_hexadecimal_integer_constant,
			process_octal_integer_constant,
			process_regular_integer_constant,
			process_underscored_integer_constant,
			process_regular_real_constant,
			process_underscored_real_constant,
			process_regular_manifest_string,
			process_special_manifest_string,
			process_verbatim_string,
			process_symbol,
			process_token
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_SHARED_STREAMS

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file)
			-- Create a new AST printer, using `a_file' as output file.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			file := a_file
			bom_enabled := True
			create buffer.make_empty
		ensure
			file_set: file = a_file
			bom_enabled: bom_enabled
		end

	make_null
			-- Create a new AST printer, initialized with a null output stream.
		do
			make (null_output_stream)
		ensure then
			file_set: file = null_output_stream
			bom_enabled: bom_enabled
		end

feature -- Access

	file: KI_CHARACTER_OUTPUT_STREAM
			-- Output file

feature -- Setting

	set_file (a_file: like file)
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	set_null_file
			-- Set `file' to `null_output_stream'.
		do
			file := null_output_stream
		ensure
			file_set: file = null_output_stream
		end

feature -- BOM

	print_bom
			-- Byte order mark (BOM) for UTF-8 (0xEF,0xBB,0xBF)
			-- See http://en.wikipedia.org/wiki/Byte_order_mark
		do
			file.put_string ({UC_UTF8_ROUTINES}.utf8_bom)
		end

	bom_enabled: BOOLEAN
			-- Should the byte order mark (BOM) for UTF-8 be printed when
			-- it was found in the class file when parsing the class text?
			-- `print_bom' should be called explicitly otherwise.

	set_bom_enabled (b: BOOLEAN)
			-- Set `bom_enabled' to `b'.
		do
			bom_enabled := b
		ensure
			bom_enabled_set: bom_enabled = b
		end

feature {ET_AST_NODE} -- Processing

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_break (a_break: detachable ET_BREAK)
			-- Process `a_break'.
		do
			if a_break /= Void then
				file.put_string (a_break.text)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			c, b: NATURAL_32
		do
			precursor (a_constant)
			file.put_character ('%'')
			c := {UC_UTF8_ROUTINES}.natural_32_code_to_utf8 (a_constant.literal.natural_32_code)
			file.put_character (((c & 0xFF000000) |>> (3 * {PLATFORM}.natural_8_bits)).to_character_8)
			b := c & 0x00FF0000
			if b /= 0 then
				file.put_character ((b |>> (2 * {PLATFORM}.natural_8_bits)).to_character_8)
				b := c & 0x0000FF00
				if b /= 0 then
					file.put_character ((b |>> {PLATFORM}.natural_8_bits).to_character_8)
					b := c & 0x000000FF
					if b /= 0 then
						file.put_character (b.to_character_8)
					end
				end
			end
			file.put_character ('%'')
			process_break (a_constant.break)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_character ('%'')
			file.put_character ('%%')
			file.put_character (a_constant.literal)
			file.put_character ('%'')
			process_break (a_constant.break)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_character ('%'')
			file.put_character ('%%')
			file.put_character ('/')
			file.put_string (a_constant.literal)
			file.put_character ('/')
			file.put_character ('%'')
			process_break (a_constant.break)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			if bom_enabled and then a_class.has_utf8_bom then
				print_bom
			end
			precursor (a_class)
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		local
			l_old_file: like file
			l_expression: ET_EXPRESSION
			l_break: detachable ET_BREAK
			l_pretty_printer: like pretty_printer
		do
			tokens.create_keyword.process (Current)
			file.put_character (' ')
			tokens.left_brace_symbol.process (Current)
			l_pretty_printer := pretty_printer
			l_pretty_printer.reset
			l_pretty_printer.set_comments_ignored (True)
			l_pretty_printer.set_use_as_type (True)
			l_pretty_printer.set_file (buffer)
			a_convert_expression.type.process (l_pretty_printer)
			l_pretty_printer.set_null_file
			if file /= buffer then
				file.put_string (buffer.string)
				buffer.string.wipe_out
			end
			tokens.right_brace_symbol.process (Current)
			tokens.dot_symbol.process (Current)
			a_convert_expression.name.process (Current)
			file.put_character (' ')
			tokens.left_parenthesis_symbol.process (Current)
			l_old_file := file
			file := buffer
			l_expression := a_convert_expression.expression
			l_expression.process (Current)
			l_break := l_expression.last_leaf.break
			if l_break /= Void then
				buffer.string.remove_tail (l_break.text.count)
			end
			file := l_old_file
			if l_old_file /= buffer then
				file.put_string (buffer.string)
				buffer.string.wipe_out
			end
			tokens.right_parenthesis_symbol.process (Current)
			process_break (l_break)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		local
			l_need_parentheses: BOOLEAN
			l_expression: ET_EXPRESSION
			l_old_file: like file
			l_break: detachable ET_BREAK
		do
			l_expression := a_convert_expression.expression
			if
				not attached {ET_PARENTHESIZED_EXPRESSION} l_expression and
				not attached {ET_IDENTIFIER} l_expression and
				not attached {ET_UNQUALIFIED_CALL_EXPRESSION} l_expression and
				not attached {ET_QUALIFIED_CALL_EXPRESSION} l_expression and
				not attached {ET_BRACKET_EXPRESSION} l_expression
			then
				l_need_parentheses := True
			end
			if l_need_parentheses then
				tokens.left_parenthesis_symbol.process (Current)
			end
			l_old_file := file
			file := buffer
			l_expression.process (Current)
			l_break := l_expression.last_leaf.break
			if l_break /= Void then
				buffer.string.remove_tail (l_break.text.count)
			end
			file := l_old_file
			if l_old_file /= buffer then
				file.put_string (buffer.string)
				buffer.string.wipe_out
			end
			if l_need_parentheses then
				tokens.right_parenthesis_symbol.process (Current)
			end
			tokens.dot_symbol.process (Current)
			a_convert_expression.name.process (Current)
			process_break (l_break)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		do
			precursor (a_string)
			file.put_character ('%"')
			file.put_string (a_string.literal)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		do
			precursor (a_string)
			file.put_character ('%"')
			file.put_string (a_string.literal)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_symbol (a_symbol: ET_SYMBOL)
			-- Process `a_symbol'.
		do
			file.put_string (a_symbol.text)
			process_break (a_symbol.break)
		end

	process_token (a_token: ET_TOKEN)
			-- Process `a_token'.
		do
			file.put_string (a_token.text)
			process_break (a_token.break)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			precursor (a_constant)
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		do
			precursor (a_string)
			file.put_character ('%"')
			file.put_string (a_string.marker)
			if a_string.is_left_aligned then
				file.put_character ('[')
			else
				file.put_character ('{')
			end
			file.put_string (a_string.open_white_characters)
			file.put_string (a_string.literal)
			file.put_string (a_string.close_white_characters)
			if a_string.is_left_aligned then
				file.put_character (']')
			else
				file.put_character ('}')
			end
			file.put_string (a_string.marker)
			file.put_character ('%"')
			process_break (a_string.break)
		end

feature {NONE} -- Implementation

	buffer: KL_STRING_OUTPUT_STREAM
			-- Internal buffer

	pretty_printer: ET_AST_PRETTY_PRINTER
			-- Internal pretty-printer
		do
			if attached internal_pretty_printer as l_pretty_printer then
				Result := l_pretty_printer
			else
				create Result.make_null
				internal_pretty_printer := Result
			end
		ensure
			pretty_printer_not_void: Result /= Void
		end

	internal_pretty_printer: detachable ET_AST_PRETTY_PRINTER
			-- Internal pretty-printer (for lazy initialization)

invariant

	file_not_void: file /= Void
	file_is_open_write: file.is_open_write
	buffer_not_void: buffer /= Void

end
