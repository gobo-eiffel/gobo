class
   
   GEXACE_VALIDATE_COMMAND
   
inherit
   
   GEXACE_COMMAND
      rename
	 make as make_command
      end

   UT_STRING_ROUTINES
   
   XA_ELEMENT_CONSTANTS

creation
   
   make

feature   
   
   make is
      do
	 make_command
      end

feature
   
   execute is
      local
	 parser: expanded XA_PARSER
	 validator: expanded XA_VALIDATOR
	 tree_parser: XM_TREE_PARSER
	 uc: UC_STRING
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
	       tree_parser := parser.new_tree_parser
	       !! uc.make_from_string (system_file_name)
	       tree_parser.parse_from_file_name (uc)
	       if
		  tree_parser.is_correct
		then
		  check
		     position_table_enabled: tree_parser.is_position_table_enabled
		  end
		  if
		     tree_parser.document.root_element.name.is_equal (uc_system)
		   then
		     validator.validate_system_doc (tree_parser.document, tree_parser.last_position_table)
		  elseif
		     tree_parser.document.root_element.name.is_equal (uc_cluster)
		   then
		     validator.validate_cluster_doc (tree_parser.document, tree_parser.last_position_table)
		  else
		     error_handler.report_other_error (array_to_string (<<system_file_name, " does not seem to be a XACE file">>))
		  end
	       else
		  error_handler.report_other_error (array_to_string (<<tree_parser.last_error_extended_description>>))
	       end
	    end
	 end
      end
   
end
