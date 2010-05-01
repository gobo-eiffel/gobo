note

	description:

		"XML markup constants"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_MARKUP_CONSTANTS

feature -- Constants

	Stag_start: STRING is once Result := "<" end
	Stag_end: STRING is once Result := ">" end
	Etag_start: STRING is once Result := "</" end
	Etag_end: STRING is once Result := Stag_end end
	Emptytag_start: STRING is once Result := Stag_start end
	Emptytag_end: STRING is once Result := "/>" end

	Pi_start: STRING is once Result := "<?" end
	Pi_end: STRING is once Result := "?>" end

	Space_s: STRING is once Result := " " end
	Eq_s: STRING is once Result := "=" end
	Quot_s: STRING is once Result := "%"" end
	Lf_s: STRING is once Result := "%N" end
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

	Char_entity_prefix: STRING is once Result := "&#" end
	Entity_suffix: STRING is once Result := ";" end
	
	Comment_start: STRING is once Result := "<!--" end
	Comment_end: STRING is once Result := "-->" end

	Default_namespace: STRING is once Result := "" end
	Xmlns: STRING is once Result := "xmlns" end
	
	Xml_prefix: STRING is once Result := "xml" end
	Xml_space: STRING is once Result := "space" end
	
	Xml_space_preserve: STRING is once Result := "preserve" end
	
	Xml_version_1_0: STRING is "1.0"
	Xml_version_1_1: STRING is "1.1"
	
	Xml_prefix_namespace: STRING is once Result := "http://www.w3.org/XML/1998/namespace" end
	Xmlns_namespace: STRING is once Result := "http://www.w3.org/2000/xmlns/" end

	Xml_id: STRING is once Result := "id" end
	Xml_id_with_prefix: STRING is once Result := "xml:id" end

	Xml_lang: STRING is once Result := "lang" end
	Xml_lang_with_prefix: STRING is once Result := "xml:lang" end

	Xml_base: STRING is once Result := "base" end
	Xml_base_with_prefix: STRING is once Result := "xml:base" end

end
