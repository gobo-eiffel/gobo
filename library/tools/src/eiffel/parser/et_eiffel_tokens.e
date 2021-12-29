note

	description: "Parser token codes"
	generator: "geyacc"

deferred class ET_EIFFEL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_detachable_et_keyword_value: detachable ET_KEYWORD
	last_detachable_et_agent_keyword_value: detachable ET_AGENT_KEYWORD
	last_detachable_et_precursor_keyword_value: detachable ET_PRECURSOR_KEYWORD
	last_detachable_et_symbol_value: detachable ET_SYMBOL
	last_detachable_et_position_value: detachable ET_POSITION
	last_detachable_et_boolean_constant_value: detachable ET_BOOLEAN_CONSTANT
	last_detachable_et_break_value: detachable ET_BREAK
	last_detachable_et_character_constant_value: detachable ET_CHARACTER_CONSTANT
	last_detachable_et_current_value: detachable ET_CURRENT
	last_detachable_et_free_operator_value: detachable ET_FREE_OPERATOR
	last_detachable_et_identifier_value: detachable ET_IDENTIFIER
	last_detachable_et_integer_constant_value: detachable ET_INTEGER_CONSTANT
	last_detachable_et_keyword_operator_value: detachable ET_KEYWORD_OPERATOR
	last_detachable_et_manifest_string_value: detachable ET_MANIFEST_STRING
	last_detachable_et_real_constant_value: detachable ET_REAL_CONSTANT
	last_detachable_et_result_value: detachable ET_RESULT
	last_detachable_et_retry_instruction_value: detachable ET_RETRY_INSTRUCTION
	last_detachable_et_symbol_operator_value: detachable ET_SYMBOL_OPERATOR
	last_detachable_et_void_value: detachable ET_VOID
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
			when E_INVARIANT then
				Result := "E_INVARIANT"
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
			when E_PRECURSOR then
				Result := "E_PRECURSOR"
			when E_ARROW then
				Result := "E_ARROW"
			when E_DOTDOT then
				Result := "E_DOTDOT"
			when E_LARRAY then
				Result := "E_LARRAY"
			when E_RARRAY then
				Result := "E_RARRAY"
			when E_ASSIGN_SYMBOL then
				Result := "E_ASSIGN_SYMBOL"
			when E_REVERSE then
				Result := "E_REVERSE"
			when E_UNKNOWN then
				Result := "E_UNKNOWN"
			when E_FALSE then
				Result := "E_FALSE"
			when E_TRUE then
				Result := "E_TRUE"
			when E_BREAK then
				Result := "E_BREAK"
			when E_CHARACTER then
				Result := "E_CHARACTER"
			when E_CURRENT then
				Result := "E_CURRENT"
			when E_FREEOP then
				Result := "E_FREEOP"
			when E_IDENTIFIER then
				Result := "E_IDENTIFIER"
			when E_TUPLE then
				Result := "E_TUPLE"
			when E_NONE then
				Result := "E_NONE"
			when E_INTEGER then
				Result := "E_INTEGER"
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
			when E_STRPLUS then
				Result := "E_STRPLUS"
			when E_STRMINUS then
				Result := "E_STRMINUS"
			when E_STRSTAR then
				Result := "E_STRSTAR"
			when E_STRSLASH then
				Result := "E_STRSLASH"
			when E_STRDIV then
				Result := "E_STRDIV"
			when E_STRMOD then
				Result := "E_STRMOD"
			when E_STRPOWER then
				Result := "E_STRPOWER"
			when E_STRLT then
				Result := "E_STRLT"
			when E_STRLE then
				Result := "E_STRLE"
			when E_STRGT then
				Result := "E_STRGT"
			when E_STRGE then
				Result := "E_STRGE"
			when E_STRAND then
				Result := "E_STRAND"
			when E_STROR then
				Result := "E_STROR"
			when E_STRXOR then
				Result := "E_STRXOR"
			when E_STRANDTHEN then
				Result := "E_STRANDTHEN"
			when E_STRORELSE then
				Result := "E_STRORELSE"
			when E_STRDOTDOT then
				Result := "E_STRDOTDOT"
			when E_STRBRACKET then
				Result := "E_STRBRACKET"
			when E_STRPARENTHESIS then
				Result := "E_STRPARENTHESIS"
			when E_STRIMPLIES then
				Result := "E_STRIMPLIES"
			when E_STRFREEOP then
				Result := "E_STRFREEOP"
			when E_STRNOT then
				Result := "E_STRNOT"
			when E_STRING then
				Result := "E_STRING"
			when E_STRANDSYMBOL then
				Result := "E_STRANDSYMBOL"
			when E_STRORSYMBOL then
				Result := "E_STRORSYMBOL"
			when E_STRXORSYMBOL then
				Result := "E_STRXORSYMBOL"
			when E_STRANDTHENSYMBOL then
				Result := "E_STRANDTHENSYMBOL"
			when E_STRORELSESYMBOL then
				Result := "E_STRORELSESYMBOL"
			when E_STRIMPLIESSYMBOL then
				Result := "E_STRIMPLIESSYMBOL"
			when E_STRNOTSYMBOL then
				Result := "E_STRNOTSYMBOL"
			when E_REAL then
				Result := "E_REAL"
			when E_RESULT then
				Result := "E_RESULT"
			when E_RETRY then
				Result := "E_RETRY"
			when E_DIV then
				Result := "E_DIV"
			when E_GE then
				Result := "E_GE"
			when E_LE then
				Result := "E_LE"
			when E_MOD then
				Result := "E_MOD"
			when E_VOID then
				Result := "E_VOID"
			when E_CHARERR then
				Result := "E_CHARERR"
			when E_STRERR then
				Result := "E_STRERR"
			when E_OLD then
				Result := "E_OLD"
			when E_FOR_ALL then
				Result := "E_FOR_ALL"
			when E_THERE_EXISTS then
				Result := "E_THERE_EXISTS"
			when E_BAR then
				Result := "E_BAR"
			when E_OPEN_REPEAT then
				Result := "E_OPEN_REPEAT"
			when E_CLOSE_REPEAT then
				Result := "E_CLOSE_REPEAT"
			when E_IMPLIES_SYMBOL then
				Result := "E_IMPLIES_SYMBOL"
			when E_OR_SYMBOL then
				Result := "E_OR_SYMBOL"
			when E_OR_ELSE_SYMBOL then
				Result := "E_OR_ELSE_SYMBOL"
			when E_XOR_SYMBOL then
				Result := "E_XOR_SYMBOL"
			when E_AND_SYMBOL then
				Result := "E_AND_SYMBOL"
			when E_AND_THEN_SYMBOL then
				Result := "E_AND_THEN_SYMBOL"
			when E_NOT_SYMBOL then
				Result := "E_NOT_SYMBOL"
			when E_NE then
				Result := "E_NE"
			when E_NOT_TILDE then
				Result := "E_NOT_TILDE"
			when E_ITERATION_CURSOR_SYMBOL then
				Result := "E_ITERATION_CURSOR_SYMBOL"
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
	E_INVARIANT: INTEGER = 280
	E_IS: INTEGER = 281
	E_LIKE: INTEGER = 282
	E_LOCAL: INTEGER = 283
	E_LOOP: INTEGER = 284
	E_NOTE: INTEGER = 285
	E_OBSOLETE: INTEGER = 286
	E_ONCE: INTEGER = 287
	E_ONCE_STRING: INTEGER = 288
	E_REDEFINE: INTEGER = 289
	E_RENAME: INTEGER = 290
	E_REQUIRE: INTEGER = 291
	E_RESCUE: INTEGER = 292
	E_SELECT: INTEGER = 293
	E_STRIP: INTEGER = 294
	E_WHEN: INTEGER = 295
	E_THEN: INTEGER = 296
	E_UNDEFINE: INTEGER = 297
	E_UNIQUE: INTEGER = 298
	E_UNTIL: INTEGER = 299
	E_VARIANT: INTEGER = 300
	E_DEFERRED: INTEGER = 301
	E_EXPANDED: INTEGER = 302
	E_REFERENCE: INTEGER = 303
	E_SEPARATE: INTEGER = 304
	E_ATTACHED: INTEGER = 305
	E_DETACHABLE: INTEGER = 306
	E_ATTRIBUTE: INTEGER = 307
	E_CONVERT: INTEGER = 308
	E_ASSIGN: INTEGER = 309
	E_ACROSS: INTEGER = 310
	E_SOME: INTEGER = 311
	E_AGENT: INTEGER = 312
	E_PRECURSOR: INTEGER = 313
	E_ARROW: INTEGER = 314
	E_DOTDOT: INTEGER = 315
	E_LARRAY: INTEGER = 316
	E_RARRAY: INTEGER = 317
	E_ASSIGN_SYMBOL: INTEGER = 318
	E_REVERSE: INTEGER = 319
	E_UNKNOWN: INTEGER = 320
	E_FALSE: INTEGER = 321
	E_TRUE: INTEGER = 322
	E_BREAK: INTEGER = 323
	E_CHARACTER: INTEGER = 324
	E_CURRENT: INTEGER = 325
	E_FREEOP: INTEGER = 326
	E_IDENTIFIER: INTEGER = 327
	E_TUPLE: INTEGER = 328
	E_NONE: INTEGER = 329
	E_INTEGER: INTEGER = 330
	E_AND: INTEGER = 331
	E_OR: INTEGER = 332
	E_XOR: INTEGER = 333
	E_NOT: INTEGER = 334
	E_IMPLIES: INTEGER = 335
	E_STRPLUS: INTEGER = 336
	E_STRMINUS: INTEGER = 337
	E_STRSTAR: INTEGER = 338
	E_STRSLASH: INTEGER = 339
	E_STRDIV: INTEGER = 340
	E_STRMOD: INTEGER = 341
	E_STRPOWER: INTEGER = 342
	E_STRLT: INTEGER = 343
	E_STRLE: INTEGER = 344
	E_STRGT: INTEGER = 345
	E_STRGE: INTEGER = 346
	E_STRAND: INTEGER = 347
	E_STROR: INTEGER = 348
	E_STRXOR: INTEGER = 349
	E_STRANDTHEN: INTEGER = 350
	E_STRORELSE: INTEGER = 351
	E_STRDOTDOT: INTEGER = 352
	E_STRBRACKET: INTEGER = 353
	E_STRPARENTHESIS: INTEGER = 354
	E_STRIMPLIES: INTEGER = 355
	E_STRFREEOP: INTEGER = 356
	E_STRNOT: INTEGER = 357
	E_STRING: INTEGER = 358
	E_STRANDSYMBOL: INTEGER = 359
	E_STRORSYMBOL: INTEGER = 360
	E_STRXORSYMBOL: INTEGER = 361
	E_STRANDTHENSYMBOL: INTEGER = 362
	E_STRORELSESYMBOL: INTEGER = 363
	E_STRIMPLIESSYMBOL: INTEGER = 364
	E_STRNOTSYMBOL: INTEGER = 365
	E_REAL: INTEGER = 366
	E_RESULT: INTEGER = 367
	E_RETRY: INTEGER = 368
	E_DIV: INTEGER = 369
	E_GE: INTEGER = 370
	E_LE: INTEGER = 371
	E_MOD: INTEGER = 372
	E_VOID: INTEGER = 373
	E_CHARERR: INTEGER = 374
	E_STRERR: INTEGER = 375
	E_OLD: INTEGER = 376
	E_FOR_ALL: INTEGER = 377
	E_THERE_EXISTS: INTEGER = 378
	E_BAR: INTEGER = 379
	E_OPEN_REPEAT: INTEGER = 380
	E_CLOSE_REPEAT: INTEGER = 381
	E_IMPLIES_SYMBOL: INTEGER = 382
	E_OR_SYMBOL: INTEGER = 383
	E_OR_ELSE_SYMBOL: INTEGER = 384
	E_XOR_SYMBOL: INTEGER = 385
	E_AND_SYMBOL: INTEGER = 386
	E_AND_THEN_SYMBOL: INTEGER = 387
	E_NOT_SYMBOL: INTEGER = 388
	E_NE: INTEGER = 389
	E_NOT_TILDE: INTEGER = 390
	E_ITERATION_CURSOR_SYMBOL: INTEGER = 391

end
