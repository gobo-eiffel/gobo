note

	description:

		"Versions used in ECF"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_VERSION

inherit

	UT_VERSION
		rename
			revision as release,
			make_major_minor_revision as make_major_minor_release,
			has_revision as has_release,
			internal_revision as internal_release
		end

create

	make, 
	make_major,
	make_major_minor, 
	make_major_minor_release,
	make_latest

feature -- Access

	product: detachable STRING
			-- Product name
	
	company: detachable STRING
			-- Company name
	
	copyright: detachable STRING
			-- Copyright
	
	trademark: detachable STRING
			-- Trademark

feature -- Setting

	set_product (a_product: like product)
			-- Set `product' to `a_product'.
		do
			product := a_product
		ensure
			product_set: product = a_product
		end
	
	set_company (a_company: like company)
			-- Set `company' to `a_company'.
		do
			company := a_company
		ensure
			company_set: company = a_company
		end
		
	set_copyright (a_copyright: like copyright)
			-- Set `copyright' to `a_copyright'.
		do
			copyright := a_copyright
		ensure
			copyright_set: copyright = a_copyright
		end
	
	set_trademark (a_trademark: like trademark)
			-- Set `trademark' to `a_trademark'.
		do
			trademark := a_trademark
		ensure
			trademark_set: trademark = a_trademark
		end
		
end
