class GEXACE

inherit
   
   KL_IMPORTED_INPUT_STREAM_ROUTINES
   
   KL_SHARED_EXCEPTIONS
   
   KL_SHARED_STANDARD_FILES
   
   XA_SHARED_VARIABLES
   
   XA_SHARED_ERROR_HANDLER
   
   GEXACE_COMMAND_LINE_PARSER
      rename
	 reset as reset_command_line_parser
      end

creation
   
   make

feature
   
   make is
      local
	 cs: DS_LINKED_LIST_CURSOR [GEXACE_COMMAND]
      do
	 reset_command_line_parser
	 !! commands.make
	 process_arguments 
	 from
	    cs := commands.new_cursor
	    cs.start
	 until
	    cs.off
	 loop
	    cs.item.execute
	    cs.forth
	 end
	 if
	    error_handler.is_error
	  then
	    std.error.put_string (array_to_string (<< "Exiting with ", error_handler.error_count.out, " error(s)%N">>))
	    Exceptions.die (1)
	 end
      end

feature
   
   commands: DS_LINKED_LIST [GEXACE_COMMAND]
   
feature -- command line argument processing   
   
   process_arguments is
	 -- process command line arguments
      do
	 process_define
	 process_options
	 process_command
      end
   
   process_define is
	 -- process define option.
      do
	 if
	    match_long_option ("define")
	  then
	    if
	       is_next_option_long_option and then
	       has_next_option_value
	     then
	       process_define_string (next_option_value)
	       consume_option
	    else
	       -- TODO: replace with `report_error'
	       io.put_string ("Error: found --define without a value%N")
	       print_usage	
	       Exceptions.die (1)
	    end
	 end
      end
   
   process_options is
	 -- process general options
      do
	 if
	    match_long_option ("verbose")
	  then
	    error_handler.enable_verbose
	    error_handler.report_other_message ("verbose mode on")
	    consume_option
	 end
      end
   
   process_command is
	 -- exactly one command must be specified
	 -- posible commands are:
	 -- "--build"
      do
	 if
	    match_long_option ("build")
	  then
	    consume_option
	    process_build
	 elseif
	    match_long_option ("compile")
	  then
	    -- TODO: replace with `report_error'
	    std.error.put_string ("command --compile not yet implemented%N")
	    Exceptions.die (1)
	 elseif
	    match_long_option ("run")
	  then
	    -- TODO: replace with `report_error'
	    std.error.put_string ("command --run not yet implemented%N")
	    Exceptions.die (1)
	 elseif
	    match_long_option ("rename-class")
	  then
	    -- TODO: replace with `report_error'
	    std.error.put_string ("command --rename-class not yet implemented%N")
	    Exceptions.die (1)
	 elseif
	    match_long_option ("rename-feature")
	  then
	    -- TODO: replace with `report_error'
	    std.error.put_string ("command --rename-feature not yet implemented%N")
	    Exceptions.die (1)
	 elseif
	    match_long_option ("validate")
	  then
	    consume_option
	    process_validate
	 else
	    -- TODO: replace with `report_error'
	    std.error.put_string ("Error: missing command%N")
	    print_usage	
	    Exceptions.die (1)
	 end
      end
   
   process_build is
      local
	 command: GEXACE_BUILD_COMMAND
      do
	 !! command.make
	 commands.put_last (command)
	 process_compilers (command)
	 process_system_file (command)
      end
   
   process_validate is
      local
	 command: GEXACE_VALIDATE_COMMAND
      do
	 !! command.make
	 commands.put_last (command)
	 process_system_file (command)
      end
   
   process_compilers (command: GEXACE_BUILD_COMMAND) is
	 -- process compilers to output code for
	 -- possible options are:
	 -- "--ise", "--se", "--ve", "--hact"
	 -- at least one compiler must be given.
	 -- A variable with the upper case option name
	 -- will automatically defined.
      require
	 command_not_void: command /= Void
      local
	 stop: BOOLEAN
	 g: XA_GENERATOR
      do
	 from
	 until
	    stop or not has_next_option
	 loop
	    if
	       match_long_option ("se")
	     then
	       !XA_SE_GENERATOR! g.make
	       command.xa_generators.put_last (g)
	       variables.set ("EIF_COMPILER", "se")
	       consume_option
	    elseif
	       match_long_option ("ise")
	     then
	       !XA_ISE_GENERATOR! g.make
	       command.xa_generators.put_last (g)
	       variables.set ("EIF_COMPILER", "ise")
	       consume_option
	    elseif
	       match_long_option ("ve")
	     then
	       !XA_VE_GENERATOR! g.make
	       command.xa_generators.put_last (g)
	       variables.set ("EIF_COMPILER", "ve")
	       consume_option
	    elseif
	       match_long_option ("hact")
	     then
	       error_handler.report_other_error ("--hact not implemented yet")
	       variables.set ("EIF_COMPILER", "hact")
	       consume_option
	    elseif
	       match_long_option ("debug")
	     then
	       !XA_DEBUG_GENERATOR! g.make
	       command.xa_generators.put_last (g)
	       consume_option
	    else
	       stop := True
	    end
	 end
	 
	 if
	    command.xa_generators.is_empty
	  then
	    -- no compiler was specified
	    -- TODO: replace with `report_error'
	    std.error.put_string ("Error: no compiler was specified%N")
	    print_usage	
	    Exceptions.die (1)
	 end
      end
   
   process_define_string (s: STRING) is
	 -- process `s' and set shared variables accordingly.
	 -- `s' is the content of a --define option
      require
	 s_not_void: s /= Void
      local
	 l: DS_LINKED_LIST [STRING]
	 cs: DS_LINKED_LIST_CURSOR [STRING]
	 pair: DS_PAIR [STRING, STRING]
      do
	 l := split_string (s, ' ')
	 from
	    cs := l.new_cursor
	    cs.start
	 until
	    cs.off
	 loop
	    pair := split_on_first (cs.item, '=')
	    if
	       pair.second = Void
	     then
	       variables.set (cs.item, "")
	    else
	       variables.set (pair.first, pair.second)
	    end
	    cs.forth
	 end
      end
   
   process_system_file (command: GEXACE_COMMAND) is
	 -- process xace-file-name
      require
	 command_not_void: command /= Void
      do
	 if
	    not has_next_option
	  then
	    command.set_system_file_name (default_system_file_name)
	 else
	    command.set_system_file_name (next_option)
	    consume_option
	 end
      ensure
	 system_file_name_set: command.system_file_name /= Void
      end
   
feature
   
   default_system_file_name: STRING is "system.xace"
      
   print_usage is
      do
	 std.error.put_string (usage_string)
      end
   
   usage_string: STRING is
      "xace [variable-definitions] [options] command  [command-options] [xace-file]%N%
      %%N%
      %%Tvariable-definitions:%T%T%T--define=%"VAR_NAME[=VALUE]( VAR_NAME[=VALUE])*%"%N%
      %%Toptions:%T%T%T%T--verbose%N%
      %%Tcommand:%T%T%T%T--build|--compile|--run|--rename-class|--rename-feature|--validate%N%
      %%Tcommand-options for --build:%T%T[--se|--ise|--ve|--hact|--debug]*%N%
      %%Tcommand-options for --rename-class:%T--from=%"OLD_CLASS_NAME%" --to=%"NEW_CLASS_NAME%"%N"
      
end

