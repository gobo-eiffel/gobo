note

	description: "Parser token codes"
	generator: "geyacc"

deferred class ET_TYPE_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_detachable_et_keyword_value: detachable ET_KEYWORD
	last_detachable_et_agent_keyword_value: detachable ET_AGENT_KEYWORD
	last_detachable_et_invariant_keyword_value: detachable ET_INVARIANT_KEYWORD
	last_detachable_et_precursor_keyword_value: detachable ET_PRECURSOR_KEYWORD
	last_detachable_et_boolean_constant_value: detachable ET_BOOLEAN_CONSTANT
	last_detachable_et_current_value: detachable ET_CURRENT
	last_detachable_et_identifier_value: detachable ET_IDENTIFIER
	last_detachable_et_keyword_operator_value: detachable ET_KEYWORD_OPERATOR
	last_detachable_et_result_value: detachable ET_RESULT
	last_detachable_et_retry_instruction_value: detachable ET_RETRY_INSTRUCTION
	last_detachable_et_void_value: detachable ET_VOID
	last_detachable_et_position_value: detachable ET_POSITION
	last_detachable_et_symbol_value: detachable ET_SYMBOL
	last_detachable_et_semicolon_symbol_value: detachable ET_SEMICOLON_SYMBOL
	last_detachable_et_bracket_symbol_value: detachable ET_BRACKET_SYMBOL
	last_detachable_et_question_mark_symbol_value: detachable ET_QUESTION_MARK_SYMBOL

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when E_ALIAS then
				Result := "E_ALIAS"
			when E_ALL then
				Result := "E_ALL"
			when E_AS then
				Result := "E_AS"
			when E_CHECK then
				Result := "E_CHECK"
			when E_CLASS then
				Result := "E_CLASS"
			when E_CREATE then
				Result := "E_CREATE"
			when E_CREATION then
				Result := "E_CREATION"
			when E_DEBUG then
				Result := "E_DEBUG"
			when E_DO then
				Result := "E_DO"
			when E_ELSE then
				Result := "E_ELSE"
			when E_ELSEIF then
				Result := "E_ELSEIF"
			when E_END then
				Result := "E_END"
			when E_ENSURE then
				Result := "E_ENSURE"
			when E_EXPORT then
				Result := "E_EXPORT"
			when E_EXTERNAL then
				Result := "E_EXTERNAL"
			when E_FEATURE then
				Result := "E_FEATURE"
			when E_FROM then
				Result := "E_FROM"
			when E_FROZEN then
				Result := "E_FROZEN"
			when E_IF then
				Result := "E_IF"
			when E_INDEXING then
				Result := "E_INDEXING"
			when E_INHERIT then
				Result := "E_INHERIT"
			when E_INSPECT then
				Result := "E_INSPECT"
			when E_IS then
				Result := "E_IS"
			when E_LIKE then
				Result := "E_LIKE"
			when E_LOCAL then
				Result := "E_LOCAL"
			when E_LOOP then
				Result := "E_LOOP"
			when E_NOTE then
				Result := "E_NOTE"
			when E_OBSOLETE then
				Result := "E_OBSOLETE"
			when E_ONCE then
				Result := "E_ONCE"
			when E_ONCE_STRING then
				Result := "E_ONCE_STRING"
			when E_REDEFINE then
				Result := "E_REDEFINE"
			when E_RENAME then
				Result := "E_RENAME"
			when E_REQUIRE then
				Result := "E_REQUIRE"
			when E_RESCUE then
				Result := "E_RESCUE"
			when E_SELECT then
				Result := "E_SELECT"
			when E_STRIP then
				Result := "E_STRIP"
			when E_WHEN then
				Result := "E_WHEN"
			when E_THEN then
				Result := "E_THEN"
			when E_UNDEFINE then
				Result := "E_UNDEFINE"
			when E_UNIQUE then
				Result := "E_UNIQUE"
			when E_UNTIL then
				Result := "E_UNTIL"
			when E_VARIANT then
				Result := "E_VARIANT"
			when E_DEFERRED then
				Result := "E_DEFERRED"
			when E_EXPANDED then
				Result := "E_EXPANDED"
			when E_REFERENCE then
				Result := "E_REFERENCE"
			when E_SEPARATE then
				Result := "E_SEPARATE"
			when E_ATTACHED then
				Result := "E_ATTACHED"
			when E_DETACHABLE then
				Result := "E_DETACHABLE"
			when E_ATTRIBUTE then
				Result := "E_ATTRIBUTE"
			when E_CONVERT then
				Result := "E_CONVERT"
			when E_ASSIGN then
				Result := "E_ASSIGN"
			when E_ACROSS then
				Result := "E_ACROSS"
			when E_SOME then
				Result := "E_SOME"
			when E_AGENT then
				Result := "E_AGENT"
			when E_INVARIANT then
				Result := "E_INVARIANT"
			when E_PRECURSOR then
				Result := "E_PRECURSOR"
			when E_FALSE then
				Result := "E_FALSE"
			when E_TRUE then
				Result := "E_TRUE"
			when E_CURRENT then
				Result := "E_CURRENT"
			when E_IDENTIFIER then
				Result := "E_IDENTIFIER"
			when E_TUPLE then
				Result := "E_TUPLE"
			when E_NONE then
				Result := "E_NONE"
			when E_AND then
				Result := "E_AND"
			when E_OR then
				Result := "E_OR"
			when E_XOR then
				Result := "E_XOR"
			when E_NOT then
				Result := "E_NOT"
			when E_IMPLIES then
				Result := "E_IMPLIES"
			when E_RESULT then
				Result := "E_RESULT"
			when E_RETRY then
				Result := "E_RETRY"
			when E_VOID then
				Result := "E_VOID"
			when E_OLD then
				Result := "E_OLD"
			when E_UNKNOWN then
				Result := "E_UNKNOWN"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	E_ALIAS: INTEGER = 258
	E_ALL: INTEGER = 259
	E_AS: INTEGER = 260
	E_CHECK: INTEGER = 261
	E_CLASS: INTEGER = 262
	E_CREATE: INTEGER = 263
	E_CREATION: INTEGER = 264
	E_DEBUG: INTEGER = 265
	E_DO: INTEGER = 266
	E_ELSE: INTEGER = 267
	E_ELSEIF: INTEGER = 268
	E_END: INTEGER = 269
	E_ENSURE: INTEGER = 270
	E_EXPORT: INTEGER = 271
	E_EXTERNAL: INTEGER = 272
	E_FEATURE: INTEGER = 273
	E_FROM: INTEGER = 274
	E_FROZEN: INTEGER = 275
	E_IF: INTEGER = 276
	E_INDEXING: INTEGER = 277
	E_INHERIT: INTEGER = 278
	E_INSPECT: INTEGER = 279
	E_IS: INTEGER = 280
	E_LIKE: INTEGER = 281
	E_LOCAL: INTEGER = 282
	E_LOOP: INTEGER = 283
	E_NOTE: INTEGER = 284
	E_OBSOLETE: INTEGER = 285
	E_ONCE: INTEGER = 286
	E_ONCE_STRING: INTEGER = 287
	E_REDEFINE: INTEGER = 288
	E_RENAME: INTEGER = 289
	E_REQUIRE: INTEGER = 290
	E_RESCUE: INTEGER = 291
	E_SELECT: INTEGER = 292
	E_STRIP: INTEGER = 293
	E_WHEN: INTEGER = 294
	E_THEN: INTEGER = 295
	E_UNDEFINE: INTEGER = 296
	E_UNIQUE: INTEGER = 297
	E_UNTIL: INTEGER = 298
	E_VARIANT: INTEGER = 299
	E_DEFERRED: INTEGER = 300
	E_EXPANDED: INTEGER = 301
	E_REFERENCE: INTEGER = 302
	E_SEPARATE: INTEGER = 303
	E_ATTACHED: INTEGER = 304
	E_DETACHABLE: INTEGER = 305
	E_ATTRIBUTE: INTEGER = 306
	E_CONVERT: INTEGER = 307
	E_ASSIGN: INTEGER = 308
	E_ACROSS: INTEGER = 309
	E_SOME: INTEGER = 310
	E_AGENT: INTEGER = 311
	E_INVARIANT: INTEGER = 312
	E_PRECURSOR: INTEGER = 313
	E_FALSE: INTEGER = 314
	E_TRUE: INTEGER = 315
	E_CURRENT: INTEGER = 316
	E_IDENTIFIER: INTEGER = 317
	E_TUPLE: INTEGER = 318
	E_NONE: INTEGER = 319
	E_AND: INTEGER = 320
	E_OR: INTEGER = 321
	E_XOR: INTEGER = 322
	E_NOT: INTEGER = 323
	E_IMPLIES: INTEGER = 324
	E_RESULT: INTEGER = 325
	E_RETRY: INTEGER = 326
	E_VOID: INTEGER = 327
	E_OLD: INTEGER = 328
	E_UNKNOWN: INTEGER = 329

end
