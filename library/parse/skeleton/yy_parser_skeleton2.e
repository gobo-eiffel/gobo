indexing

	description:

		"Skeletons for parsers implemented with tables"

	note:

		"This class provides an alternative implementation for %
		%routine `parse'. This routine is normally implemented %
		%with a loop whose body is a big inspect instruction. %
		%This is a mere translation of C gotos into Eiffel. %
		%Needless to say that I'm not very proud of this piece %
		%of code. However I performed some benchmarks and the %
		%results were that this implementation runs 25 to 50%% %
		%faster than the alternative implementation provided here, %
		%where every branch of the inspect instruction was written %
		%in a separate routine. I think that the performance penalty %
		%is due to the routine call overhead and the depth of the %
		%call stack. Anyway, I prefer to provide you with a big and %
		%ugly but fast parsing routine rather than a nice and slow %
		%version. I hope you won't blame me for that! :-)"


	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_PARSER_SKELETON2 [G]

inherit

	YY_PARSER [G]

	KL_SHARED_STANDARD_FILES

feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		do
			!! yyvs.make (1, yyInitial_stack_size)
			!! yyss.make (1, yyInitial_stack_size)
			yy_build_parser_tables
		end

feature -- Parsing

	parse is
			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		local
			void_value: G
		do
			yystate := 0
			error_count := 0
			yy_lookahead_needed := True
			yyerrstatus := 0
			yyvsp := 0
			yyssp := 0
			yystacksize := yyss.count
			yy_parsing_status := yyContinue
			yyNewstate
			yyval := void_value
			--yyvs.clear_all
			--yyss.clear_all
		rescue
			abort
		end

feature -- Status report

	syntax_error: BOOLEAN is
			-- Has last parsing been unsuccesful?
		do
			Result := yy_parsing_status = yyAccepted
		end

feature -- Access

	error_count: INTEGER
			-- Number of errors detected during last parsing

feature {YY_PARSER_ACTION} -- Status report

	is_recovering: BOOLEAN is
			-- Is current parser recovering from a syntax error?
		do
			Result := yyerrstatus /= 0
		end

feature {YY_PARSER_ACTION} -- Element change

	accept is
			-- Stop parsing successfully.
		do
			yy_parsing_status := yyAccepted
		end

	abort is
			-- Abort parsing.
			-- Do not print error message.
		do
			yy_parsing_status := yyAborted
		end

	raise_error is
			-- Raise a syntax error.
			-- Report error using `report_error' and
			-- perform normal error recovery if possible.
		do
			yy_parsing_status := yyError_raised
		end

	recover is
			-- Recover immediately after a parse error.
		do
			yyerrstatus := 0
			yy_parsing_status := yyContinue
		end

	report_error (a_message: STRING) is
			-- Print error message.
		do
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

	clear_token is
			-- Clear the previous lookahead token.
			-- Used in error-recovery rule actions.
		do
			yy_lookahead_needed := True
		end

feature {NONE} -- Tables

	yytranslate: ARRAY [INTEGER]
	yyr1: ARRAY [INTEGER]
	yyr2: ARRAY [INTEGER]
	yydefact: ARRAY [INTEGER]
	yydefgoto: ARRAY [INTEGER]
	yypact: ARRAY [INTEGER]
	yypgoto: ARRAY [INTEGER]
	yytable: ARRAY [INTEGER]
	yycheck: ARRAY [INTEGER]

feature {NONE} -- Implementation

	yy_translate (i: INTEGER): INTEGER is
			-- Translate lexical token `i' into 
			-- geyacc internal token code.
		require
			i_positive: i >= 0
		do
			if i <= yyMax_token then
				Result := yytranslate.item (i)
			else
				Result := yyNsyms
			end
		end

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		deferred
		end

	yy_build_parser_tables is
			-- Build parser tables.
		deferred
		ensure
			yytranslate_not_void: yytranslate /= Void
			yyr1_not_void: yyr1 /= Void
			yyr2_not_void: yyr2 /= Void
			yydefact_not_void: yydefact /= Void
			yydefgoto_not_void: yydefgoto /= Void
			yypact_not_void: yypact /= Void
			yypgoto_not_void: yypgoto /= Void
			yytable_not_void: yytable /= Void
			yycheck_not_void: yycheck /= Void
		end

	yyvs: ARRAY [G]
			-- Semantic value stack

	yyss: ARRAY [INTEGER]
			-- State stack

	yyvsp: INTEGER
			-- Top of semantic value stack

	yyssp: INTEGER
			-- Top of state stack

	yyval: G
			-- Semantic value from action

	yy_lookahead_needed: BOOLEAN
			-- Is a lookahead token needed?

	yyerrstatus: INTEGER
			-- Number of tokens to shift before
			-- error messages enabled

	yy_parsing_status: INTEGER
			-- Parsing status

	yystacksize: INTEGER
	yystate: INTEGER
			-- Current state
	yylen: INTEGER
			-- Number of elements in the current rule
	yyn: INTEGER
	yychar1: INTEGER

	yyNewstate is
		do
			yyssp := yyssp + 1
			if yyssp > yystacksize then
				yystacksize := yystacksize + yyInitial_stack_size
				yyvs.resize (1, yystacksize)
				yyss.resize (1, yystacksize)
				debug ("GEYACC")
					std.error.put_string ("Stack size increased to ")
					std.error.put_integer (yystacksize)
					std.error.put_character ('%N')
				end
			end
			debug ("GEYACC")
				std.error.put_string ("Entering state ")
				std.error.put_integer (yystate)
				std.error.put_character ('%N')
			end
			yyss.put (yystate, yyssp)
				-- Do appropriate processing given the current state.
				-- Read a lookahead token if one is needed.
			yyn := yypact.item (yystate)
				-- First try to decide what to do without reference
				-- lookahead token.
			if yyn = yyFlag then
				yyDefault
			else
					-- Not known => get a lookahead token if don't
					-- already have one.
				if yy_lookahead_needed then
					debug ("GEYACC")
						std.error.put_string ("Reading a token%N")
					end
					read_token
					yy_lookahead_needed := False
				end
					-- Convert token to internal form (in `yychar1')
					-- for indexing tables.
				if last_token <= yyEof then
						-- This means end of input.
					yychar1 := 0
					debug ("GEYACC")
						std.error.put_string ("Now at end of input.%N")
					end
				else
					yychar1 := yy_translate (last_token)
					debug ("GEYACC")
						std.error.put_string ("Next token is ")
						std.error.put_integer (last_token)
						std.error.put_string (" (")
						-- std.error.put_string (yytname.item (yychar1))
						-- print_token (std.error, last_token, last_value)
						std.error.put_string (")%N")
					end
				end
				yyn := yyn + yychar1
				if
					(yyn < 0 or yyn > yyLast) or else
					yycheck.item (yyn) /= yychar1
				then
					yyDefault
				else
					yyn := yytable.item (yyn)
						-- `yyn' is what to do for this token type in
						-- this state:
						-- Negative => reduce, -`yyn' is rule number.
						-- Positive => shift, `yyn' is new state.
						-- New state is final state => don't bother to
						--		shift, just return success.
						-- 0, or most negative number => error.
					if yyn < 0 then
						if yyn = yyFlag then
							yyErrlab
						else
							yyn := -yyn
							yyReduce
						end
					elseif yyn = 0 then
						yyErrlab
					elseif yyn = yyFinal then
						accept
					else
							-- Shift the lookahead token.
						debug ("GEYACC")
							std.error.put_string ("Shifting token ")
							std.error.put_integer (last_token)
							std.error.put_string (" (")
							-- std.error.put_string (yytname.item (yychar1))
							std.error.put_string (")%N")
						end
							-- Discard the token being shifted
							-- unless it is eof.
						if last_token > yyEof then
							yy_lookahead_needed := True
						end
						yyvsp := yyvsp + 1
						yyvs.put (last_value, yyvsp)
							-- Count tokens shifted since error;
							-- after three, turn off error status.
						if yyerrstatus /= 0 then
							yyerrstatus := yyerrstatus - 1
						end
						yystate := yyn
						yyNewstate
					end
				end
			end
		end

	yyDefault is
			-- Do the default action for the current state.
		do
			yyn := yydefact.item (yystate)
			if yyn = 0 then
				yyErrlab
			else
				yyReduce
			end
		end

	yyReduce is
			-- Do a reduction. `yyn' is the number of a rule
			-- to reduce with.
		local
			index, yyss_top: INTEGER
		do
			yylen := yyr2.item (yyn)
			if yylen > 0 then
				yyval := yyvs.item (yyvsp - yylen + 1)
			end
			debug ("GEYACC")
				-- TO DO
			end
			yy_do_action (yyn)
			inspect yy_parsing_status
			when yyContinue then
				yyssp := yyssp - yylen
				debug ("GEYACC")
						-- TO DO
				end
				yyvsp := yyvsp - yylen + 1
				yyvs.put (yyval, yyvsp)
					-- Now "shift" the result of the reduction.
					-- Determine what state that goes to,
					-- based on the state we popped back to 
					-- and the rule number reduced by.
				yyn := yyr1.item (yyn)
				yyss_top := yyss.item (yyssp)
				index := yyn - yyNtbase
				yystate := yypgoto.item (index) + yyss_top
				if
					(yystate >= 0 and yystate <= yyLast) and then
					yycheck.item (yystate) = yyss_top
				then
					yystate := yytable.item (yystate)
				else
					yystate := yydefgoto.item (index)
				end
				yyNewstate
			when yyError_raised then
					-- Handle error raised explicitly by an action.
				yy_parsing_status := yyContinue
				yyErrlab
			else
					-- Accepted or aborted.
			end
		end

	yyErrlab is
			-- Detect error.
		do
			if yyerrstatus = 3 then
					-- If just tried and failed to reuse lookahead
					-- token after an error, discard it. Return
					-- failure if at end of input.
				if last_token <= yyEof then
					abort
				else
					debug ("GEYACC")
						std.error.put_string ("Discarding token ")
						std.error.put_integer (last_token)
						std.error.put_string (" (")
						-- std.error.put_string (yytname.item (yychar1))
						std.error.put_string (").%N")
					end
					yy_lookahead_needed := True
					yyErrhandle
				end
			else
				if yyerrstatus = 0 then
						-- If not already recovering from an error,
						-- report this error.
					error_count := error_count + 1
					report_error ("parse error")
				end
				yyerrstatus := 3
				yyErrhandle
			end
		end

	yyErrhandle is
			-- Handle error.
		do
			yyn := yypact.item (yystate)
			if yyn = yyFlag then
				yyErrpop
			else
				yyn := yyn + yyTerror
				if
					(yyn < 0 or yyn > yyLast) or else
					yycheck.item (yyn) /= yyTerror
				then
					yyErrpop
				else
					yyn := yytable.item (yyn)
					if yyn < 0 then
						if yyn = yyFlag then
							yyErrpop
						else
							yyn := -yyn
							yyReduce
						end
					elseif yyn = 0 then
						yyErrpop
					elseif yyn = yyFinal then
						accept
					else
						yyvsp := yyvsp + 1
						yyvs.put (last_value, yyvsp)
						yystate := yyn
						yyNewstate
					end
				end
			end
		end

	yyErrpop is
			-- Pop the current state because it cannot handle
			-- the error token.
		do
			if yyssp = 0 then
				abort
			else
				yyvsp := yyvsp - 1
				yyssp := yyssp - 1
				yystate := yyss.item (yyssp)
				yyErrhandle
				debug ("GEYACC")
					-- TO DO
				end
			end
		end

feature {NONE} -- Constants

	yyAccepted: INTEGER is Unique
	yyAborted: INTEGER is Unique
	yyError_raised: INTEGER is Unique
	yyContinue: INTEGER is Unique
			-- Parsing status

	yyTerror: INTEGER is 1
	yyEof: INTEGER is 0
			-- Grammar-independent constants

	yyFinal: INTEGER is deferred end
	yyFlag: INTEGER is deferred end
	yyNtbase: INTEGER is deferred end
	yyLast: INTEGER is deferred end
	yyMax_token: INTEGER is deferred end
	yyNsyms: INTEGER is deferred end
			-- Grammar-dependent constants

	yyInitial_stack_size: INTEGER is 200
			-- Initial size of parser's stacks

invariant

	yyvs_not_void: yyvs /= Void
	yyss_not_void: yyss /= Void
	yytranslate_not_void: yytranslate /= Void
	yyr1_not_void: yyr1 /= Void
	yyr2_not_void: yyr2 /= Void
	yydefact_not_void: yydefact /= Void
	yydefgoto_not_void: yydefgoto /= Void
	yypact_not_void: yypact /= Void
	yypgoto_not_void: yypgoto /= Void
	yytable_not_void: yytable /= Void
	yycheck_not_void: yycheck /= Void

end -- class YY_PARSER_SKELETON2
