class FACULTY
inherit PERSON

feature {ANY}
   get_faculty_addr():STRING  is do Result := get_addr() end  -- assign lab semantics to addr
   set_faculty_addr(a:STRING) is do set_addr(a) end

   do_benchwork() is
     do
       io.put_string(name + " do_benchwork in the: " + get_faculty_addr() + "%N");
     end
end
