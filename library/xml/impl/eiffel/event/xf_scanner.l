%{

indexing

	description:

		"Scanner for XML Parsers"

	library:    "Gobo Eiffel XML Library"
	author:     "Sven Ehrke <sven.ehrke@web.de>"
	copyright:  "Copyright (c) 1999-2002, Sven Ehrke and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class XF_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON

--	UT_CHACRACTER_CODES


	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS
	
	XF_TOKENS

	UC_UNICODE_FACTORY
		export {NONE} all end

creation

	make
%}

%option nodefault outfile="xf_scanner.e"
%option line position

S_LT_QM         "<?"
S_QM_GT         "?>"
S_LT            "<"
S_LT_SL         "</"
S_GT            ">"
S_SL_GT         "/>"
S_WS            [ \t\r]+
S_NL            "\n"
S_SLASH         "/"
S_EQUAL         "="
--S_COLON       ":"
S_DOUBLE_QUOTES         "\""
--"
--S_TEXT        [a-zA-Z0-9()\ \t\r_!#$%&'\(+\-]*
S_TEXT        [a-zA-Z0-9\t\r_\x20-\x2f\x3a\x3b\x3d\x3f\x40\x5a-\x60\x7a-\x7e]*
S_ATTR_TEXT   [a-zA-Z0-9\t\r_\x20\x21\x23-\x25\x27-\x2f\x3a\x3b\x3d\x3f\x40\x5a-\x60\x7a-\x7e]*
S_GT_ENTITY  "&gt;"
S_LT_ENTITY  "&lt;"
S_AMP_ENTITY "&amp;"
S_XML	       "xml"
S_VERSION    "version"
S_ENCODING   "encoding"
S_STANDALONE "standalone"
S_DOCTYPE       "<!DOCTYPE"
S_SYSTEM        "SYSTEM"
S_PUBLIC        "PUBLIC"
S_START_COMMENT "<!--"
S_END_COMMENT "-->"

-- missing in S_TEXT:
--   ",<, *,)
S_WORD        [.+\-a-zA-Z0-9()_]*
S_NS_WORD     {S_WORD}:{S_WORD}

%s B_IN_TAG B_IN_CONTENT B_IN_PI B_IN_XML_DECL B_IN_DOCTYPE
%s B_IN_PI_AFTER_TARGET
%x B_IN_ATTR_TEXT B_IN_XML_DECL_ATTR_TEXT
%x B_IN_COMMENT B_IN_COMMENT_AFTER_CONTENT

%%

{S_WS}          -- Ignore whitespaces.

{S_NL}          -- ignore newline

{S_LT}  {
        last_token := T_LT
        handle_found_text
        set_start_condition(B_IN_TAG)
        }

-- "</"
{S_LT_SL}       {
        last_token := T_LT_SL
        handle_found_text
        set_start_condition(B_IN_TAG)
        }

-- "/>"
{S_SL_GT}       { -- "/>"
        last_token := T_SL_GT
        handle_found_text
        set_start_condition(B_IN_CONTENT)
 }

-- ">"
{S_GT} {
        last_token := T_GT
        handle_found_text
        set_start_condition(B_IN_CONTENT)
  }

-- xml decls <?xml version="1.0" encoding="iso-8859-1" standalone="yes"?>
{S_LT_QM}/{S_XML}	{
			last_token := T_LT_QM
			set_start_condition (B_IN_XML_DECL)
			}

<B_IN_XML_DECL>{S_XML} {
			last_token := T_XML
			}
<B_IN_XML_DECL>{S_VERSION} {
			last_token := T_VERSION
			}

<B_IN_XML_DECL>{S_ENCODING} {
			last_token := T_ENCODING
			}

<B_IN_XML_DECL>{S_STANDALONE} {
			last_token := T_STANDALONE
			}

--  <B_IN_XML_DECL>{S_WORD} {
--  			last_token := T_WORD
--  			}

<B_IN_XML_DECL>{S_DOUBLE_QUOTES}	{
					last_token := T_DOUBLE_QUOTES
					set_start_condition (B_IN_XML_DECL_ATTR_TEXT)
					}

<B_IN_XML_DECL_ATTR_TEXT>{S_DOUBLE_QUOTES}	{
					last_token := T_DOUBLE_QUOTES
					set_start_condition (B_IN_XML_DECL)
					}

<B_IN_XML_DECL_ATTR_TEXT>{S_ATTR_TEXT}	{
					last_token := T_ATTR_TEXT
					handle_found_text
					}

<B_IN_XML_DECL_ATTR_TEXT>.|\n	{
					last_token := text_item (1).code
					}

<B_IN_XML_DECL>{S_EQUAL}	{
				last_token := T_EQUAL
				}

<B_IN_XML_DECL>{S_QM_GT}	{
			last_token := T_QM_GT
			set_start_condition (B_IN_CONTENT)
			}

-- doctype <!DOCTYPE root SYSTEM "example.dtd">
{S_DOCTYPE}		{
			last_token := T_DOCTYPE
			set_start_condition (B_IN_DOCTYPE)
			}

<B_IN_DOCTYPE>{S_SYSTEM}	{
			last_token := T_SYSTEM
			}

<B_IN_DOCTYPE>(\"[^\"]*\")|('[^']*')	{ --"
			handle_found_text
			last_token := T_LITERAL
			}

<B_IN_DOCTYPE>{S_PUBLIC}	{
			last_token := T_PUBLIC
			}

<B_IN_DOCTYPE>{S_WORD}	{
			handle_found_text
			last_token := T_WORD
			}

-- processing inistruction
{S_LT_QM}		{
			last_token := T_LT_QM
			set_start_condition (B_IN_PI)
			}

<B_IN_PI>{S_WORD}	{
			last_token := T_WORD
			handle_found_text
			set_start_condition (B_IN_PI_AFTER_TARGET)
			}

<B_IN_PI_AFTER_TARGET>.*/{S_QM_GT}	{
					last_token := T_PI_CONTENT
					handle_found_text
					set_start_condition (B_IN_PI)
					}

<B_IN_PI_AFTER_TARGET,B_IN_PI>{S_QM_GT}		{
				last_token := T_QM_GT
				set_start_condition (B_IN_CONTENT)
				}

-- "namespace:tag"      -- to support namespaces
<B_IN_TAG>{S_NS_WORD} {
        last_token := T_NS_WORD
        handle_found_text
 }

-- "/"
--?? is this necessary ?, sven
<B_IN_TAG>{S_SLASH}     {
        last_token := T_SLASH
        handle_found_text
        }

<B_IN_TAG>{S_EQUAL}     {
        last_token := T_EQUAL
        handle_found_text
        }

--- handle attribute text ---
<B_IN_TAG>{S_DOUBLE_QUOTES}     {
        last_token := T_DOUBLE_QUOTES
        handle_found_text
        set_start_condition(B_IN_ATTR_TEXT)
        }

<B_IN_ATTR_TEXT>{S_ATTR_TEXT} {
        last_token := T_ATTR_TEXT
        handle_found_text
  }

<B_IN_ATTR_TEXT>{S_GT_ENTITY} {
		last_token := T_GT_ENTITY
	}

<B_IN_ATTR_TEXT>{S_LT_ENTITY} {
		last_token := T_LT_ENTITY
	}

<B_IN_ATTR_TEXT>{S_AMP_ENTITY} {
		last_token := T_AMP_ENTITY
	}

<B_IN_ATTR_TEXT>{S_DOUBLE_QUOTES} {
        last_token := T_DOUBLE_QUOTES
        handle_found_text
        set_start_condition(B_IN_TAG)
        }

<B_IN_ATTR_TEXT>.|\n	{
	last_token := text_item (1).code
	}

---
<B_IN_TAG>{S_WORD} {
        last_token := T_WORD
        handle_found_text
  }

<B_IN_CONTENT>{S_TEXT} {
        last_token := T_TEXT
        handle_found_text
  }

-- Comments

<B_IN_CONTENT>{S_START_COMMENT} {
			last_token := T_START_COMMENT
			set_start_condition (B_IN_COMMENT)
		}

<B_IN_COMMENT>{
	[^-]+ {
				-- A sequence of characters not including a
				-- minus sign can be included in the comment
				-- token.
			more
		}
	\-[^-] {
				-- A minus sign followed by a character which
				-- is not itself a minus sign can be included
				-- in the comment token.
			more
		}
	\-\-[^->] {
				-- Two minus signs followed by a character which
				-- is not a greater-than or a minus sign can be
				-- included in the comment token.
			more
		}
	\-/\-\- {
				-- If we have three consecutive minus signs, we
				-- we include the first one in the comment token
				-- and see if the two others are not part of the
				-- end of comment marker.
			more
		}
	\-\-> {
				-- This is the end of comment marker.
			less (text_count - 3)
			last_token := T_COMMENT_CONTENT
			handle_found_text
			set_start_condition (B_IN_COMMENT_AFTER_CONTENT)
		}
}

<B_IN_COMMENT_AFTER_CONTENT>{S_END_COMMENT} {
			last_token := T_END_COMMENT
			set_start_condition (B_IN_CONTENT)
		}

-- Unexpected characters

<*>.|\n {
			last_token := T_UNKNOWN
		}

%%

feature -- Access

	handle_found_text is
		do
			last_value := new_unicode_string (text)
		end

	last_value: UC_STRING
			-- Last value read (only valid for some tokens)

end -- class XF_SCANNER
