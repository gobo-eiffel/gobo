
deferred class YY_PARSER [STACK_TYPE]

feature -- lexical analyser interface

   read_token is
         -- this feature is called when next token is needed.
      deferred
      ensure
         valid_token: last_token >= token_eof
      end

   last_token: INTEGER           -- last token read by `read_token'

   last_value: STACK_TYPE        -- last value read by `read_token'

   void_value: STACK_TYPE        -- the void value

   Token_undefined: INTEGER is -1   -- value for undefined token

   Token_eof: INTEGER is 0       -- value for eof token

   Token_error: INTEGER is 256      -- value for error token

feature -- Initialization

   initial_stack_size: INTEGER is 150  -- initial stack size

   reset is
         -- reset parser to initial state.
      do
         if yyexca = Void then
            !!yyexca.make_from_array(yyexca_m, 0)
            !!yyact.make_from_array(yyact_m, 0)
            !!yypact.make_from_array(yypact_m, 0)
            !!yypgo.make_from_array(yypgo_m, 0)
            !!yyr1.make_from_array(yyr1_m, 0)
            !!yyr2.make_from_array(yyr2_m, 0)
            !!yychk.make_from_array(yychk_m, 0)
            !!yydef.make_from_array(yydef_m, 0)
         end
         yyaccept := 0
         yystate := 0
         clear_input
         clear_error
         !!yysstack.make(initial_stack_size)
         !!yyvstack.make(initial_stack_size)
         yysstack.put(yystate)
         yyvstack.put(void_value)

         debug
            io.put_string ("reset parser: push state ")
            io.put_integer (yystate)
            io.put_string (", value ")
            print_item (void_value)
            io.put_character ('%N')
         end
      ensure
         reset: is_reset
      end -- reset

feature -- status report

   is_reset: BOOLEAN is
         -- is parser reset?
      do
         Result := yysstack /= Void and yyvstack /= Void
                  and yyexca /= Void and yyact /= Void and yypact /= Void
                  and yypgo /= Void and yyr1 /= Void and yyr2 /= Void
                  and yychk /= Void and yydef /= Void and yylast > 0
                  and not is_accepted and not is_rejected
      end

   is_accepted: BOOLEAN is
         -- is input accepted?
      do
         Result := yyaccept = 1
      end

   is_rejected: BOOLEAN is
         -- is input rejected?
      do
         Result := yyaccept = -1
      end

feature -- parse control

   clear_input is
         -- set current input to undefined value.
      do
         last_token := token_undefined
         last_value := void_value
      end

   clear_error is
         -- reset error recovering.
      do
         yyerrflag := 0
      end

   set_error is
         -- begin error recovering.
      require
         reset: is_reset
      do
         yyerrflag := 3
         if not yy_find_error_state then
            set_rejected
            abort
         end
      end -- set_error

   set_accepted is
         -- set status to accepted.
      do
         yyaccept := 1
      end

   set_rejected is
         -- set status to rejected.
      do
         yyaccept := -1
      end

   parse is
         -- do parsing.
      require
         reset: is_reset
      local
         action, n: INTEGER
      do
         from
            -- resetting is done hcite
         until
            yyaccept /= 0
         loop
            if not yy_shift_state then
               action := yy_find_action
               if action < 0 then
                  set_accepted
               elseif action = 0 then
                     -- have an error
                  if yyerrflag = 3 then
                     debug
                        io.put_string ("recovery discards token ")
                        yy_print_token (last_token)
                        io.put_character ('%N')
                     end
                                    -- no shift yet; eat a token
                     if last_token = token_eof then
                        set_rejected
                        abort
                     else
                        clear_input
                     end
                  else
                     if yyerrflag = 0 then
                        syntax_error   -- new error
                     end
                                    -- incomplete recovered error
                     set_error
                  end
               else
                  -- reduction by production 'action'
                  n := yyr2.item(action) // 2
                  debug
                     io.put_string ("reduce by (")
                     io.put_integer (action)
                     io.put_string (") %"")
                     io.put_string (yyreds.item(action))
                     io.put_string ("%"")
                     io.put_character ('%N')
                     yy_print_vstack (n)
                  end
                  if (yyr2.item(action) \\ 2) = 1 then
                     yy_do_action(action, n)
                  else
                     yy_do_default_action(n)
                  end
                  if yyaccept = 0 then
                     yysstack.remove(n)
                     yyvstack.remove(n)
                     yy_find_next_state(action)
                     yysstack.put(yystate)
                     yyvstack.put(yyval)
                     debug
                        io.put_string ("push state ")
                        io.put_integer (yystate)
                        io.put_string (", value ")
                        print_item (yyval)
                        io.put_character ('%N')
                     end
                  end
               end
            end
         end -- loop

         debug
            io.put_string ("maximum stack size reached: ")
            io.put_integer (yysstack.max_count)
            io.put_character ('%N')
         end
      end -- parse

   syntax_error is
         -- this feature is called when a syntax_error is encountered.
         -- default print "syntax error"
      do
         io.put_string ("%Nsyntax error%N")
      end

   abort is
         -- this feature is called when parsing aborts from error.
         -- default do nothing
      do
      end

feature -- debuging

   print_item (v: STACK_TYPE) is
         -- print item 'v'.
      do
         -- default: output separator only
         io.put_character (' ');
      end

feature {NONE}

   yyaccept: INTEGER
         -- acception status

   yyerrflag: INTEGER
         -- actual error state

   yyexca: YY_ARRAY [INTEGER]
         -- exception table

   yyact: YY_ARRAY [INTEGER]
         -- action table

   yypact: YY_ARRAY [INTEGER]
         -- state action table

   yypgo: YY_ARRAY [INTEGER]
         -- state goto table

   yyr1: YY_ARRAY [INTEGER]
         -- reduce table for next state

   yyr2: YY_ARRAY [INTEGER]
         -- reduce table parameter count

   yychk: YY_ARRAY [INTEGER]
         -- check table

   yydef: YY_ARRAY [INTEGER]
         -- definition table

   yystate: INTEGER                 -- actual state

   yysstack: PARSER_STACK[INTEGER]        -- state stack

   yyval: STACK_TYPE                -- LHS value

   yyvstack: PARSER_STACK[STACK_TYPE]     -- value stack

   yylast: INTEGER is
         -- highest state value
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yyexca_m: ARRAY[INTEGER] is
         -- exception table
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yyact_m: ARRAY[INTEGER] is
         -- action table
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yypact_m: ARRAY[INTEGER] is
         -- state action table
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yypgo_m: ARRAY[INTEGER] is
         -- state goto table
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yyr1_m: ARRAY[INTEGER] is
         -- reduce table for next state
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yyr2_m: ARRAY[INTEGER] is
         -- reduce table parameter count
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yychk_m: ARRAY[INTEGER] is
         -- check table
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yydef_m: ARRAY[INTEGER] is
         -- definition table
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yyreds: ARRAY[STRING] is
         -- table with rules in source format
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yytoks: ARRAY[STRING] is
         -- table with token and terminal as strings
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yytokv: ARRAY[INTEGER] is
         -- table with token and terminal as numbers
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yy_do_action (yy_a, yy_n: INTEGER) is
         -- this feature is called when a production action is executed
         -- the feature is generated by the ibyacc compiler
      deferred
      end

   yy_do_default_action (n: INTEGER) is
         -- do default action
      do
         if n > 0 then
            yyval := yyvstack.item(1 - n)
         else
            yyval := void_value
         end
      end

   yy_shift_state: BOOLEAN is
         -- test for shift state action
      local
         state: INTEGER
      do
         state := yypact.item(yystate)
         if state > -1000 then
            if last_token = token_undefined then
               read_token
               debug
                  io.put_string("receive token ")
                  yy_print_token(last_token)
                  io.put_character ('%N')
               end
            end
            state := state + last_token
            if state >= 0 and then state < yylast then
               state := yyact.item(state)
               if last_token = yychk.item(state) then
                     -- valid shift
                  yystate := state
                  yysstack.put(state)
                  yyvstack.put(last_value)
                  debug
                     io.put_string( "push state ")
                     io.put_integer (state)
                     io.put_string( ", value ")
                     print_item( last_value)
                     io.put_character ('%N')
                  end
                  clear_input
                  if yyerrflag > 0 then
                     yyerrflag := yyerrflag - 1
                  end
                  Result := true
               end          
            end
         end
      end -- yy_shift_state

   yy_find_action: INTEGER is
         -- find next action to do
      local
         i: INTEGER
      do
            -- default state action
         Result := yydef.item(yystate)
         if Result = -2 then
            if last_token = token_undefined then
               read_token
               debug
                  io.put_string ("receive token ")
                  yy_print_token (last_token)
                  io.put_character ('%N')
               end
            end
               -- look through exception table
            from
               i := 0
            until
               yyexca.item(i) = -1
               and then yyexca.item(i + 1) = yystate
            loop
               i := i + 2
            end
            from
               i := i + 2
            until
               yyexca.item(i) < 0
               or else yyexca.item(i) = last_token
            loop
               i := i + 2
            end
            Result := yyexca.item(i + 1)
         end
      end -- yy_find_action

   yy_find_next_state (a: INTEGER) is
         -- find next state for action 'a'
      local
         i, j: INTEGER
      do
         -- consult goto table to find next state
         i := yyr1.item(a)
         j := yypgo.item(i) + yysstack.item(0) + 1
         if j < yylast then
            yystate := yyact.item(j)
         end
         if j >= yylast or else yychk.item(yystate) /= -i then
            yystate := yyact.item(yypgo.item(i))
         end
      end -- yy_find_next_state

   yy_find_error_state: BOOLEAN is
         -- find state where "error" is a legal shift action
      local
         state: INTEGER
      do
         from
         until
            yysstack.empty or else Result
         loop
            state := yypact.item(yysstack.item(0)) + token_error
            if state >= 0 and then state < yylast and then
               yychk.item(yyact.item(state)) = token_error then
               yystate := yyact.item(state)
                  -- simulate shift of "error"
               yysstack.put(yystate)
               yyvstack.put(void_value)
               debug
                  io.put_string ("push state ")
                  io.put_integer (yystate)
                  io.put_string (", value ")
                  print_item(void_value)
                  io.put_character ('%N')
               end
               Result := true
            else
                  -- current state has no shift on "error", pop stack
               debug
                  io.put_string ("recovery pops ")
                  io.put_integer (yysstack.item(0))
                  io.put_string (", value ")
                  print_item (yyvstack.item(0))
                  io.put_character ('%N')
               end
               yysstack.remove(1)
               yyvstack.remove(1)
            end
         end
      end -- yy_find_error_state

   yy_print_token (t: INTEGER) is
         -- print token 't'
      local
         i: INTEGER
      do
         if t = 0 then
            io.put_string ("end-of-file")
         elseif t < 0 then
            io.put_string ("-none-")
         else
            from
               i := 1
            until
               yytokv.item(i) < 0 or yytokv.item(i) = t
            loop
               i := i + 1
            end
            if yytokv.item(i) = t then
               io.put_string (yytoks.item(i))
            end
         end
      end -- yy_print_token

   yy_print_vstack (n: INTEGER) is
         -- print value stack
      local
         i: INTEGER
      do
         from
            i := n - 1
         until
            i < 0
         loop
            io.put_string ("item(")
            io.put_integer (n - i)
            io.put_string ("):")
            print_item (yyvstack.item(-i))
            i := i - 1
         end
         io.put_character ('%N')
      end -- yy_print_vstack

end -- class YY_PARSER
