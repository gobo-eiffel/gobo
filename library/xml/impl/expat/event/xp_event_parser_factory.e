class
   XP_EVENT_PARSER_FACTORY
inherit
   XM_EVENT_PARSER_FACTORY
feature

   is_available: BOOLEAN is True

   new_event_parser: XM_EVENT_PARSER is
      do
	 !! Result.make_from_implementation (new_event_parser_imp)
      end

   new_event_parser_imp: XI_EVENT_PARSER is
      do
	 !XP_EVENT_PARSER! Result
      end

end -- class XP_EVENT_PARSER_FACTORY
