class XF_EVENT_PARSER_FACTORY

obsolete "Use XM_EIFFEL_PARSER or XM_EXPAT_PARSER(_FACTORY)"

inherit

	XM_EVENT_PARSER_FACTORY

feature

	is_available: BOOLEAN is False

	new_event_parser: XM_EVENT_PARSER is
		do
		end

	new_event_parser_imp: XI_EVENT_PARSER is
		do
		end

end

