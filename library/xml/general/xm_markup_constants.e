indexing

	description: 

		"XML markup constants"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_MARKUP_CONSTANTS

feature {NONE} -- Constants

	Stag_start: STRING is once Result := "<" end
	Stag_end: STRING is once Result := ">" end
	Etag_start: STRING is once Result := "</" end
	Etag_end: STRING is once Result := Stag_end end

	Pi_start: STRING is once Result := "<?" end
	Pi_end: STRING is once Result := "?>" end
	
	Space_s: STRING is once Result := " " end
	Eq_s: STRING is once Result := "=" end
	Quot_s: STRING is once Result := "%"" end
	Prefix_separator: STRING is once Result := ":" end

	Lt_char: CHARACTER is '<'
	Gt_char: CHARACTER is '>'
	Amp_char: CHARACTER is '&'
	Quot_char: CHARACTER is '%"'
	
	Lf_char: CHARACTER is '%N'
	Cr_char: CHARACTER is '%R'
	Tab_char: CHARACTER is '%T'
	Space_char: CHARACTER is ' '

	Lt_entity: STRING is once Result := "&lt;" end
	Gt_entity: STRING is once Result := "&gt;" end
	Amp_entity: STRING is once Result := "&amp;" end
	Quot_entity: STRING is once Result := "&quot;" end

	Comment_start: STRING is once Result := "<!--" end
	Comment_end: STRING is once Result := "-->" end

	Default_namespace: STRING is once Result := "" end
	Xmlns: STRING is once Result := "xmlns" end

end
