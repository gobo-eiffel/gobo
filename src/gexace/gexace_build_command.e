class
   
   GEXACE_BUILD_COMMAND
   
inherit
   
   GEXACE_COMMAND
      rename
	 make as make_command
      end

creation
   
   make

feature   
   
   make is
      do
	 make_command
	 !! xa_generators.make
      end

feature
   
   xa_generators: DS_LINKED_LIST [XA_GENERATOR]
	 -- list of all generators to run the system on
   
feature
   
   execute is
      local
	 parser: expanded XA_PARSER
	 xa_system: XA_SYSTEM
      do
	 if
	    not parser.is_parser_available
	  then
	    error_handler.report_other_error ("toe or eiffel xml-parser not compiled in%N")
	 else
	    if
	       not parser.is_file_readable (system_file_name)
	     then
	       error_handler.report_cannot_read_file_error (system_file_name)
	    else
	       xa_system := parser.new_system_from_file_name (system_file_name)
	       if
		  xa_system /= Void and then
		  xa_system.cluster /= Void 
		then
		  xa_system.cluster.expand_variables_in_path_name_recursivly
--		  xa_system.cluster.resolve_cluster_references
		  execute_generators (xa_system)
	       end
	    end
	 end
      end
   
   execute_generators (xa_system: XA_SYSTEM) is
      require
	 xa_system_not_void: xa_system /= Void
      local
	 cs: DS_LINKED_LIST_CURSOR [XA_GENERATOR]
      do
	 from
	    cs := xa_generators.new_cursor
	    cs.start
	 until
	    cs.off
	 loop
	    cs.item.generate (xa_system)
	    cs.forth
	 end
      end
   
invariant
   
   xa_generator_items_not_void: not xa_generators.has (Void)

end
