indexing

    description:

        "class representing xml comment"

    status:  "See notice at end of class."
    author:  "Andreas Leitner"

class XT_COMMENT

inherit

    XI_COMMENT

    XT_NODE

creation

    make

feature {NONE} -- Initialisation

    make (a_parent: XM_COMPOSITE; a_data: UC_STRING) is
        require
            a_data_not_void: a_data /= Void
            a_parent_not_void: a_parent /= Void
        do
            data := a_data
            parent := a_parent
        end

feature {ANY} -- Access

    data: UC_STRING
            -- the actual character data of this comment.

end -- XT_COMMENT

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
