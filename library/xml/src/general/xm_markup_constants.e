note

	description:

		"XML markup constants"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"

class XM_MARKUP_CONSTANTS

feature -- Constants

	Stag_start: STRING  once Result := "<" end
	Stag_end: STRING  once Result := ">" end
	Etag_start: STRING  once Result := "</" end
	Etag_end: STRING  once Result := Stag_end end
	Emptytag_start: STRING  once Result := Stag_start end
	Emptytag_end: STRING  once Result := "/>" end

	Pi_start: STRING  once Result := "<?" end
	Pi_end: STRING  once Result := "?>" end

	Space_s: STRING  once Result := " " end
	Eq_s: STRING  once Result := "=" end
	Quot_s: STRING  once Result := "%"" end
	Lf_s: STRING  once Result := "%N" end
	Prefix_separator: STRING  once Result := ":" end

	Lt_char: CHARACTER = '<'
	Gt_char: CHARACTER = '>'
	Amp_char: CHARACTER = '&'
	Quot_char: CHARACTER = '%"'

	Lf_char: CHARACTER = '%N'
	Cr_char: CHARACTER = '%R'
	Tab_char: CHARACTER = '%T'
	Space_char: CHARACTER = ' '

	Lt_entity: STRING  once Result := "&lt;" end
	Gt_entity: STRING  once Result := "&gt;" end
	Amp_entity: STRING  once Result := "&amp;" end
	Quot_entity: STRING  once Result := "&quot;" end

	Char_entity_prefix: STRING  once Result := "&#" end
	Entity_suffix: STRING  once Result := ";" end

	Comment_start: STRING  once Result := "<!--" end
	Comment_end: STRING  once Result := "-->" end

	Default_namespace: STRING  once Result := "" end
	Xmlns: STRING  once Result := "xmlns" end

	Xml_prefix: STRING  once Result := "xml" end
	Xml_space: STRING  once Result := "space" end

	Xml_space_preserve: STRING  once Result := "preserve" end

	Xml_version_1_0: STRING = "1.0"
	Xml_version_1_1: STRING = "1.1"

	Xml_prefix_namespace: STRING  once Result := "http://www.w3.org/XML/1998/namespace" end
	Xmlns_namespace: STRING  once Result := "http://www.w3.org/2000/xmlns/" end

	Xml_id: STRING  once Result := "id" end
	Xml_id_with_prefix: STRING  once Result := "xml:id" end

	Xml_lang: STRING  once Result := "lang" end
	Xml_lang_with_prefix: STRING  once Result := "xml:lang" end

	Xml_base: STRING  once Result := "base" end
	Xml_base_with_prefix: STRING  once Result := "xml:base" end

end
