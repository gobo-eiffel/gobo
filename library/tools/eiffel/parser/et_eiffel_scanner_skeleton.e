indexing

	description:

		"Scanner skeletons for Eiffel parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999-2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ET_EIFFEL_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	ET_EIFFEL_TOKENS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM

feature {NONE} -- Initialization

	make (a_filename: STRING; an_error_handler: like error_handler) is
			-- Create a new Eiffel scanner.
		require
			a_filename_not_void: a_filename /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			make_with_buffer (Empty_buffer)
			filename := a_filename
			error_handler := an_error_handler
		ensure
			filename_set: filename = a_filename
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			last_class := Void
		end

feature -- Access

	filename: STRING
			-- Name of file being parsed

	last_class: ET_CLASS
			-- Class being parsed

	last_value: ANY
			-- Semantic value to be passed to the parser

	current_position: ET_POSITION is
			-- Current position
			-- (Create a new object at each call.)
		do
			if last_class /= Void then
				!ET_CLASS_POSITION! Result.make (last_class, line, column)
			else
				!ET_FILE_POSITION! Result.make (filename, line, column)
			end
		ensure
			current_position_not_void: Result /= Void
		end

	error_handler: ET_ERROR_HANDLER
			-- Error handler

feature -- Status report

	create_keyword: BOOLEAN
			-- Should `create' be considered as
			-- a keyword (otherwise identifier)?

feature -- Statut setting

	set_create_keyword (b: BOOLEAN) is
			-- Set `create_keyword' to `b'.
		do
			create_keyword := b
		ensure
			create_keyword_set: create_keyword = b
		end

feature -- AST factory

	new_bit_constant (a_literal: STRING): ET_BIT_CONSTANT is
			-- New bit constant
		require
			a_literal_not_void: a_literal /= Void
		do
			!! Result.make (a_literal, current_position)
		ensure
			bit_constant_not_void: Result /= Void
		end

	new_c2_character_constant (a_value: CHARACTER): ET_CHARACTER_CONSTANT is
			-- New character constant of the form '%A'
		do
			!ET_C2_CHARACTER_CONSTANT! Result.make (a_value, current_position)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_c3_character_constant (a_literal: STRING): ET_CHARACTER_CONSTANT is
			-- New character constant of the form '%/code/`'
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
		do
			!ET_C3_CHARACTER_CONSTANT! Result.make (a_literal, current_position)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_character_constant (a_value: CHARACTER): ET_CHARACTER_CONSTANT is
			-- New character constant of the form 'A'
		do
			!ET_C1_CHARACTER_CONSTANT! Result.make (a_value, current_position)
		ensure
			character_constant_not_void: Result /= Void
		end

	new_false_constant: ET_FALSE_CONSTANT is
			-- New False constant
		do
			!! Result.make (current_position)
		ensure
			false_constant_not_void: Result /= Void
		end

	new_identifier (a_text: STRING): ET_IDENTIFIER is
			-- New identifier
		require
			a_text_not_void: a_text /= Void
		do
			!! Result.make (a_text, current_position)
		ensure
			identifier_not_void: Result /= Void
		end

	new_integer_constant (a_literal: STRING): ET_INTEGER_CONSTANT is
			-- New integer constant with no underscore
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: [0-9]+
		do
			!ET_REGULAR_INTEGER_CONSTANT! Result.make (a_literal, current_position)
		ensure
			integer_constant_not_void: Result /= Void
		end

	new_manifest_string (a_literal: STRING): ET_MANIFEST_STRING is
			-- New manifest string with no special character
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"[^"%\n]*\"
		do
			!ET_REGULAR_MANIFEST_STRING! Result.make (a_literal, current_position)
		ensure
			manifest_string_not_void: Result /= Void
		end

	new_real_constant (a_literal: STRING): ET_REAL_CONSTANT is
			-- New real constant with no underscore
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?
		do
			!ET_REGULAR_REAL_CONSTANT! Result.make (a_literal, current_position)
		ensure
			real_constant_not_void: Result /= Void
		end

	new_special_manifest_string (a_literal: STRING): ET_MANIFEST_STRING is
			-- New manifest string with special characters
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: \"([^"%\n]|%([^\n]|\/[0-9]+\/|[ \t\r]*\n[ \t\r\n]*%))*\"
		do
			!ET_SPECIAL_MANIFEST_STRING! Result.make (a_literal, current_position)
		ensure
			manifest_string_not_void: Result /= Void
		end

	new_token (a_text: STRING): ET_TOKEN is
			-- New token
		require
			a_text_not_void: a_text /= Void
		do
			!! Result.make (a_text, current_position)
		ensure
			token_not_void: Result /= Void
		end

	new_true_constant: ET_TRUE_CONSTANT is
			-- New True constant
		do
			!! Result.make (current_position)
		ensure
			true_constant_not_void: Result /= Void
		end

	new_underscored_integer_constant (a_literal: STRING): ET_INTEGER_CONSTANT is
			-- New integer constant with underscores
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: (_*[0-9]+_*)+
		do
			!ET_UNDERSCORED_INTEGER_CONSTANT! Result.make (a_literal, current_position)
		ensure
			integer_constant_not_void: Result /= Void
		end

	new_underscored_real_constant (a_literal: STRING): ET_REAL_CONSTANT is
			-- New real constant with underscores
		require
			a_literal_not_void: a_literal /= Void
			-- valid_literal: regexp: ((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?
		do
			!ET_UNDERSCORED_REAL_CONSTANT! Result.make (a_literal, current_position)
		ensure
			real_constant_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	ms_line, ms_column: INTEGER
			-- Line and column numbers of currently
			-- scanned special manifest string

feature {NONE} -- Processing

	process_one_character_symbol (a_token: INTEGER) is
			-- Process Eiffel symbol made up of one character.
		do
			last_token := a_token
			last_value := current_position
		end

	process_two_character_symbol (a_token: INTEGER) is
			-- Process Eiffel symbol made up of two characters.
		do
			last_token := a_token
			last_value := current_position
		end

	process_c2_character_constant (a_value: CHARACTER) is
			-- Process character constant of the form '%A'.
		do
			last_token := E_CHARACTER
			last_value := new_c2_character_constant ('%A')
		end

	process_lower_case_c2_character_constant (a_value: CHARACTER) is
			-- Process character constant of the form '%a'.
		do
				-- Syntax error: special character specification
				-- %l where l is a letter code should be in
				-- upper-case in character constant.
			column := column + 2
			error_handler.report_SCCU_error (current_position)
			column := column - 2

			last_token := E_CHARACTER
			last_value := new_c2_character_constant ('%A')
		end

invariant

	filename_not_void: filename /= Void
	error_handler_not_void: error_handler /= Void

end -- class ET_EIFFEL_SCANNER_SKELETON
