indexing

    description:

        "common heir for xml-nodes that consist of character data"

    status:  "See notice at end of class."
    author:  "Andreas Leitner"

deferred class XI_CHARACTER_DATA

inherit

    XI_NODE

feature {ANY} -- Access

    content: UC_STRING is
            -- the actual character data of this node.
        deferred
        end

feature {ANY} -- Element change

    append_content (other: XM_CHARACTER_DATA) is
            -- append the content of 'other' to
            -- the content of Current
        require
            other /= Void
        deferred
        end

invariant

    content_not_void: content /= Void

end -- XI_CHARACTER_DATA

--|-------------------------------------------------------------------------
--| eXML, Eiffel XML Parser Toolkit
--| Copyright (C) 1999  Andreas Leitner and others
--| See the file forum.txt included in this package for licensing info.
--|
--| Comments, Questions, Additions to this library? please contact:
--|
--| Andreas Leitner
--| Arndtgasse 1/3/5
--| 8010 Graz
--| Austria
--| email: andreas.leitner@chello.at
--| www: http://exml.dhs.org
--|-------------------------------------------------------------------------
