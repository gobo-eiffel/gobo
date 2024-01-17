note

	description: "ISE html stylesheet constants"


	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_ISE_STYLESHEET_CONSTANTS

feature -- Access

	css_echar: STRING = "echar"
			-- CSS class "echar"

	css_eclass: STRING = "eclass"
			-- CSS class "eclass"

	css_ecluster: STRING = "ecluster"
			-- CSS class "ecluster"

	css_ecomment: STRING = "ecomment"
			-- CSS class "ecomment"

	css_edot: STRING = "edot"
			-- CSS class "edot"

	css_efeature: STRING = "efeature"
			-- CSS class "efeature"

	css_egeneric: STRING = "egeneric"
			-- CSS class "egeneric"

	css_eitag: STRING = "eitag"
			-- CSS class "eitag"

	css_ekeyword: STRING = "ekeyword"
			-- CSS class "ekeyword"

	css_elocal: STRING = "elocal"
			-- CSS class "elocal"

	css_enumber: STRING = "enumber"
			-- CSS class "enumber"

	css_equoted: STRING = "equoted"
			-- CSS class "equoted"

	css_estring: STRING = "estring"
			-- CSS class "estring"

	css_esymbol: STRING = "esymbol"
			-- CSS class "esymbol"

	css_etag: STRING = "etag"
			-- CSS class "etag"

	css_necluster: STRING = "necluster"
			-- CSS class "necluster"	

	css_file_content: STRING = "[
BODY {
	BACKGROUND-COLOR: white;
}

A {
    TEXT-DECORATION: none;
}

A:hover {
    TEXT-DECORATION: underline;
}

.eclass {
    COLOR: blue;
    FONT-STYLE: italic;
}

.neclass {
    COLOR: black;
    FONT-STYLE: italic;
}

.ekeyword {
    COLOR: navy;
    FONT-WEIGHT: bold;
}

.esymbol {
    COLOR: navy;
}

.eitag {
    COLOR: sienna;
    FONT: 91% "Courier New", serif;
}

.estring {
    COLOR: indigo;
    FONT: 91% "Courier New", serif;
}

.echar {
    COLOR: indigo;
    FONT-WEIGHT: bold;
}

.enumber {
    COLOR: indigo;
    FONT-WEIGHT: bold;
}

.etag {
    COLOR: sienna;
}

.efeature {
    COLOR: darkgreen;
    FONT-STYLE: italic;
}

.nefeature {
    COLOR: black;
    FONT-STYLE: italic;
}

.ecomment {
    COLOR: red;
    FONT: 80% "Courier New", serif;
}

.elocal, .equoted {
    COLOR: darkred;
    FONT-STYLE: italic;
}

.ereserved {
    COLOR: darkgreen;
    FONT-STYLE: italic;
    FONT-WEIGHT: bold;
}

.egeneric {
    FONT-STYLE: italic;
	COLOR: dodgerblue;
}

.ecluster {
    COLOR: maroon;
    FONT-STYLE: italic;
    FONT-WEIGHT: bold;
}

.necluster {
    COLOR: black;
    FONT-STYLE: italic;
    FONT-WEIGHT: bold;
}

.link1 {
	BACKGROUND-COLOR: #006633;
	COLOR: white;
}

.link2 {
	BACKGROUND-COLOR: #330066;
	COLOR: white;
}

.nolink1, .nolink2 {
	BACKGROUND-COLOR: #FFCC00;
	COLOR: #330066;
}
]"
			-- Content of css file

end
