indexing

   description:
   
   "Unicode Database";

   library:    "Gobo Eiffel Unicode Library"
   author:     "michael kretschmar <majkel.kretschmar@epost.de>"
   copyright:  "Copyright (c) 2001, michael kretschmar and others"
   license:    "Eiffel Forum License v1 (see forum.txt)"
   date:       "$Date$"
   revision:   "$Revision$"

class UC_CTYPE

inherit
   UC_CONSTANTS
      end
   UC_CTYPE_CATEGORIES
      end
   UC_CTYPE_BIDI
      end
   UC_CTYPE_UPPERCASE
      end
   UC_CTYPE_LOWERCASE
      end
   UC_CTYPE_TITLECASE
      end

feature 

   to_lower(ucc: UC_CHARACTER): UC_CHARACTER is
	 -- convert `ucc' to lower. if there is no equivalent lower 
	 -- character, return `ucc' itself.
      local
	 code: INTEGER
      do
	 code := lowercase.item(ucc.code//256+1).item(ucc.code\\256+1)
	 if code = -1 then
	    Result := ucc
	 else
	    Result.set_code(code)
	 end
      end

   to_upper(ucc: UC_CHARACTER): UC_CHARACTER is
	 -- convert `ucc' to upper. if there is no equivalent upper 
	 -- character, return `ucc' itself.
      local
	 code: INTEGER
      do
	 code := uppercase.item(ucc.code//256+1).item(ucc.code\\256+1)
	 if code = -1 then
	    Result := ucc
	 else
	    Result.set_code(code)
	 end
      end

   to_title(ucc: UC_CHARACTER): UC_CHARACTER is
	 -- convert `ucc' to title. if there is no equivalent title
	 -- character, return `ucc' itself.
      local
	 code: INTEGER
      do
	 code := titlecase.item(ucc.code//256+1).item(ucc.code\\256+1)
	 if code = -1 then
	    Result := ucc
	 else
	    Result.set_code(code)
	 end
      end

   general_category (ucc: UC_CHARACTER): INTEGER is
	 -- return character's general category. if there is no
	 -- category, `gc_no_category' will be returned.
      do
	 Result := category.item(ucc.code // 256+1).item(ucc.code \\ 256+1)
      end

end

