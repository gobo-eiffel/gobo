indexing

    description:

        ""

    status:  "See notice at end of class."
    author:  "Andreas Leitner"
    note:    ""

deferred class XM_EVENT_PARSER_FACTORY

feature {ANY}

    is_available: BOOLEAN is
        deferred
        end

    new_event_parser: XM_EVENT_PARSER is
            -- Create a event based parser
        require
            is_available: is_available
        deferred
        end

    new_event_parser_imp: XI_EVENT_PARSER is
            -- Create a event based parser implementation
        require
            is_available: is_available
        deferred
        end

end -- class XM_EVENT_PARSER_FACTORY

