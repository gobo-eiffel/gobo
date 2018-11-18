note

	description: "Parser token codes"
	generator: "geyacc version 4.2"

deferred class EIFFEL_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_character_value: CHARACTER
	last_integer_value: INTEGER
	last_double_value: DOUBLE
	last_detachable_string_value: detachable STRING

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when E_CHARACTER then
				Result := "E_CHARACTER"
			when E_INTEGER then
				Result := "E_INTEGER"
			when E_REAL then
				Result := "E_REAL"
			when E_IDENTIFIER then
				Result := "E_IDENTIFIER"
			when E_STRING then
				Result := "E_STRING"
			when E_BIT then
				Result := "E_BIT"
			when E_FREEOP then
				Result := "E_FREEOP"
			when E_BITTYPE then
				Result := "E_BITTYPE"
			when E_BANGBANG then
				Result := "E_BANGBANG"
			when E_ARROW then
				Result := "E_ARROW"
			when E_DOTDOT then
				Result := "E_DOTDOT"
			when E_LARRAY then
				Result := "E_LARRAY"
			when E_RARRAY then
				Result := "E_RARRAY"
			when E_ASSIGN then
				Result := "E_ASSIGN"
			when E_REVERSE then
				Result := "E_REVERSE"
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
			when E_CREATION then
				Result := "E_CREATION"
			when E_DEBUG then
				Result := "E_DEBUG"
			when E_DEFERRED then
				Result := "E_DEFERRED"
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
			when E_EXPANDED then
				Result := "E_EXPANDED"
			when E_EXPORT then
				Result := "E_EXPORT"
			when E_EXTERNAL then
				Result := "E_EXTERNAL"
			when E_FALSE then
				Result := "E_FALSE"
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
			when E_INFIX then
				Result := "E_INFIX"
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
			when E_PREFIX then
				Result := "E_PREFIX"
			when E_REDEFINE then
				Result := "E_REDEFINE"
			when E_RENAME then
				Result := "E_RENAME"
			when E_REQUIRE then
				Result := "E_REQUIRE"
			when E_RESCUE then
				Result := "E_RESCUE"
			when E_RETRY then
				Result := "E_RETRY"
			when E_SELECT then
				Result := "E_SELECT"
			when E_SEPARATE then
				Result := "E_SEPARATE"
			when E_STRIP then
				Result := "E_STRIP"
			when E_THEN then
				Result := "E_THEN"
			when E_TRUE then
				Result := "E_TRUE"
			when E_UNDEFINE then
				Result := "E_UNDEFINE"
			when E_UNIQUE then
				Result := "E_UNIQUE"
			when E_UNTIL then
				Result := "E_UNTIL"
			when E_VARIANT then
				Result := "E_VARIANT"
			when E_WHEN then
				Result := "E_WHEN"
			when E_CURRENT then
				Result := "E_CURRENT"
			when E_RESULT then
				Result := "E_RESULT"
			when E_PRECURSOR then
				Result := "E_PRECURSOR"
			when E_CREATE then
				Result := "E_CREATE"
			when E_CHARERR then
				Result := "E_CHARERR"
			when E_INTERR then
				Result := "E_INTERR"
			when E_REALERR then
				Result := "E_REALERR"
			when E_STRERR then
				Result := "E_STRERR"
			when E_UNKNOWN then
				Result := "E_UNKNOWN"
			when E_NOMEMORY then
				Result := "E_NOMEMORY"
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
			when E_STRIMPLIES then
				Result := "E_STRIMPLIES"
			when E_STRFREEOP then
				Result := "E_STRFREEOP"
			when E_STRNOT then
				Result := "E_STRNOT"
			when E_IMPLIES then
				Result := "E_IMPLIES"
			when E_OR then
				Result := "E_OR"
			when E_XOR then
				Result := "E_XOR"
			when E_AND then
				Result := "E_AND"
			when E_NE then
				Result := "E_NE"
			when E_LE then
				Result := "E_LE"
			when E_GE then
				Result := "E_GE"
			when E_DIV then
				Result := "E_DIV"
			when E_MOD then
				Result := "E_MOD"
			when E_NOT then
				Result := "E_NOT"
			when E_OLD then
				Result := "E_OLD"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	E_CHARACTER: INTEGER = 258
	E_INTEGER: INTEGER = 259
	E_REAL: INTEGER = 260
	E_IDENTIFIER: INTEGER = 261
	E_STRING: INTEGER = 262
	E_BIT: INTEGER = 263
	E_FREEOP: INTEGER = 264
	E_BITTYPE: INTEGER = 265
	E_BANGBANG: INTEGER = 266
	E_ARROW: INTEGER = 267
	E_DOTDOT: INTEGER = 268
	E_LARRAY: INTEGER = 269
	E_RARRAY: INTEGER = 270
	E_ASSIGN: INTEGER = 271
	E_REVERSE: INTEGER = 272
	E_ALIAS: INTEGER = 273
	E_ALL: INTEGER = 274
	E_AS: INTEGER = 275
	E_CHECK: INTEGER = 276
	E_CLASS: INTEGER = 277
	E_CREATION: INTEGER = 278
	E_DEBUG: INTEGER = 279
	E_DEFERRED: INTEGER = 280
	E_DO: INTEGER = 281
	E_ELSE: INTEGER = 282
	E_ELSEIF: INTEGER = 283
	E_END: INTEGER = 284
	E_ENSURE: INTEGER = 285
	E_EXPANDED: INTEGER = 286
	E_EXPORT: INTEGER = 287
	E_EXTERNAL: INTEGER = 288
	E_FALSE: INTEGER = 289
	E_FEATURE: INTEGER = 290
	E_FROM: INTEGER = 291
	E_FROZEN: INTEGER = 292
	E_IF: INTEGER = 293
	E_INDEXING: INTEGER = 294
	E_INFIX: INTEGER = 295
	E_INHERIT: INTEGER = 296
	E_INSPECT: INTEGER = 297
	E_INVARIANT: INTEGER = 298
	E_IS: INTEGER = 299
	E_LIKE: INTEGER = 300
	E_LOCAL: INTEGER = 301
	E_LOOP: INTEGER = 302
	E_NOTE: INTEGER = 303
	E_OBSOLETE: INTEGER = 304
	E_ONCE: INTEGER = 305
	E_PREFIX: INTEGER = 306
	E_REDEFINE: INTEGER = 307
	E_RENAME: INTEGER = 308
	E_REQUIRE: INTEGER = 309
	E_RESCUE: INTEGER = 310
	E_RETRY: INTEGER = 311
	E_SELECT: INTEGER = 312
	E_SEPARATE: INTEGER = 313
	E_STRIP: INTEGER = 314
	E_THEN: INTEGER = 315
	E_TRUE: INTEGER = 316
	E_UNDEFINE: INTEGER = 317
	E_UNIQUE: INTEGER = 318
	E_UNTIL: INTEGER = 319
	E_VARIANT: INTEGER = 320
	E_WHEN: INTEGER = 321
	E_CURRENT: INTEGER = 322
	E_RESULT: INTEGER = 323
	E_PRECURSOR: INTEGER = 324
	E_CREATE: INTEGER = 325
	E_CHARERR: INTEGER = 326
	E_INTERR: INTEGER = 327
	E_REALERR: INTEGER = 328
	E_STRERR: INTEGER = 329
	E_UNKNOWN: INTEGER = 330
	E_NOMEMORY: INTEGER = 331
	E_STRPLUS: INTEGER = 332
	E_STRMINUS: INTEGER = 333
	E_STRSTAR: INTEGER = 334
	E_STRSLASH: INTEGER = 335
	E_STRDIV: INTEGER = 336
	E_STRMOD: INTEGER = 337
	E_STRPOWER: INTEGER = 338
	E_STRLT: INTEGER = 339
	E_STRLE: INTEGER = 340
	E_STRGT: INTEGER = 341
	E_STRGE: INTEGER = 342
	E_STRAND: INTEGER = 343
	E_STROR: INTEGER = 344
	E_STRXOR: INTEGER = 345
	E_STRANDTHEN: INTEGER = 346
	E_STRORELSE: INTEGER = 347
	E_STRIMPLIES: INTEGER = 348
	E_STRFREEOP: INTEGER = 349
	E_STRNOT: INTEGER = 350
	E_IMPLIES: INTEGER = 351
	E_OR: INTEGER = 352
	E_XOR: INTEGER = 353
	E_AND: INTEGER = 354
	E_NE: INTEGER = 355
	E_LE: INTEGER = 356
	E_GE: INTEGER = 357
	E_DIV: INTEGER = 358
	E_MOD: INTEGER = 359
	E_NOT: INTEGER = 360
	E_OLD: INTEGER = 361

end
