deferred class
   
   GEXACE_COMMAND

inherit
   
   XA_SHARED_ERROR_HANDLER
   
feature
   
   make is
      do
      end

feature   
   
   system_file_name: STRING
	 -- file name of xace file
feature
   
   set_system_file_name (fn: STRING) is
      require
	 fn_not_void: fn /= Void
      do
	 system_file_name := fn
      ensure
	 system_file_name_set: system_file_name = fn
      end
   
feature
   
   execute is
      require
	 system_file_name_not_void: system_file_name /= Void
      deferred
      end

end
