class RESEARCH_ASSISTANT
inherit
	STUDENT rename addr as student_addr end  -- field student_addr inherit the dorm semantics
	FACULTY rename addr as faculty_addr end  -- field faculty_addr inherit the lab  semantics
	-- then select, NOTE: not needed by SmartEiffel, but needed by GOBO and ISE compiler
	PERSON  select addr end

create {ANY}
   make

feature {ANY}
   print_ra() is  -- print out all 3 addresses
     do
       io.put_string(name +" has 3 addresses: <"+ addr +", "+ student_addr +", "+ faculty_addr + ">%N")
     end

   make is  -- the constructor
     do
       name := "ResAssis"
       addr := "home"          -- the home semantics
       student_addr := "dorm"  -- the dorm semantics
       faculty_addr := "lab"   -- the lab  semantics
     end
end
