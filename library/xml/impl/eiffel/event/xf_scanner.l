%{

indexing

	description:

		""

	author:     "Sven Ehrke <sven.ehrke@ubs.com>"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	note:	    "Based on mexp source"
class
   XF_SCANNER
inherit
   YY_COMPRESSED_SCANNER_SKELETON

--   UT_CHACRACTER_CODES


   KL_IMPORTED_INTEGER_ROUTINES
   KL_IMPORTED_STRING_ROUTINES
   KL_SHARED_PLATFORM
   KL_SHARED_EXCEPTIONS
   KL_SHARED_ARGUMENTS

   XF_TOKENS

creation

   make
%}

%option nodefault outfile="xf_scanner.e"
%option line position

S_LT_QM		"<?"
S_QM_GT		"?>"
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
--S_TEXT        [a-zA-Z0-9()\ \t\r_!#$%&'\(+\-]*
S_TEXT        [a-zA-Z0-9\t\r_\x20-\x2f\x3a\x3b\x3d\x3f\x40\x5a-\x60\x7a-\x7e]*
--S_ATTR_TEXT   [a-zA-Z0-9\t\r_\x20\x21\x23-\x2f\x3a\x3b\x3d\x3f\x40\x5a-\x60\x7a-\x7e]*
S_ATTR_TEXT   [^\n"]*
S_XML	      [x|X][m|M][l|L]
S_START_COMMENT "<!--"
S_END_COMMENT "-->"

-- missing in S_TEXT:
--   ",<, *,)
S_WORD        [+\-a-zA-Z0-9()_]*
S_NS_WORD     {S_WORD}:{S_WORD}

%s B_IN_TAG B_IN_CONTENT B_IN_PI B_IN_XML_DECL
%s B_IN_PI_AFTER_TARGET B_IN_COMMENT B_IN_COMMENT_AFTER_CONTENT
%x B_IN_ATTR_TEXT B_IN_XML_DECL_ATTR_TEXT

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

-- xml decls
{S_LT_QM}/{S_XML}	{
			last_token := T_LT_QM
			set_start_condition (B_IN_XML_DECL)
			}

<B_IN_XML_DECL>{S_XML} {
			last_token := T_XML
			}

<B_IN_XML_DECL>{S_WORD} {
			last_token := T_WORD
			}

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

-- comments 

<B_IN_CONTENT>{S_START_COMMENT}	{
			last_token := T_START_COMMENT
			set_start_condition (B_IN_COMMENT)
		}

<B_IN_COMMENT>.*/{S_END_COMMENT} {
			last_token := T_COMMENT_CONTENT
			handle_found_text
			set_start_condition (B_IN_COMMENT_AFTER_CONTENT)
		}

<B_IN_COMMENT_AFTER_CONTENT>{S_END_COMMENT} {
			last_token := T_END_COMMENT
			set_start_condition (B_IN_CONTENT)
		}


. {
	handle_found_text 
  }

%%

feature {NONE} -- Initialization

feature -- Initialization

feature -- Access

	handle_found_text is
	        do
		        !! last_value.make_from_string (text)
	        end


	last_value: UC_STRING
			-- Last value read (only valid for some tokens)

end 














