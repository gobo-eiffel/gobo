note

	description: "ISE html stylesheet constants"


	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2025, Eric Bezault and others"
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
body {
	font-family: "PT Sans", sans-serif;
}

pre {
	tab-size: 3;
	-moz-tab-size: 3;
	-ms-tab-size: 3;
	-o-tab-size: 3;
	font-family: Tahoma, sans-serif;
	line-height: 1.35;
	font-size: 13.6px;
	clear: both;
}


a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.eclass {
	color: blue;
}

.neclass {
	color: black;
}

.ekeyword {
	color: navy;
	font-weight: bold;
	font-size: 90%;
}

.esymbol {
	color: navy;
}

.eitag {
	color: sienna;
	font-weight: 95%;
}

.estring {
	color: indigo;
	font-weight: 95%;
}

.echar {
	color: indigo;
}

.enumber {
	color: MediumOrchid;
}

.etag {
	color: Teal; /*DarkOliveGreen;*/
}

.efeature {
	color: darkgreen;
}

.nefeature {
	color: black;
}

.ecomment {
	color: brown;
	font-weight: 80%;
}

.elocal, .equoted {
	color: RoyalBlue;
}

.ereserved {
	color: darkgreen;
	font-weight: bold;
}

.egeneric {
	color: dodgerblue;
}

.ecluster {
	color: maroon;
	font-variant: small-caps;
	font-weight: bold;
}

.necluster {
	color: black;
	font-variant: small-caps;
	font-weight: bold;
}

div.nav {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-evenly;
}

a.nav,
label.nav,
span.nav
{
	flex-grow: 1;
	display: block;
	padding: 1ex 0.5em;
	text-decoration: none;
	text-align: center;
}

.nav.goto
{
	flex-grow: 10000;
	text-align: right;
}

input
{
	padding-top: 0px;
	padding-bottom: 0px;
	padding-left: 0.2em;
	margin: 0;
	border: none;
}

.nav
{
	color: black;
}

.nav.selected
{
	color: white;
}

.nav.hierarchy
{
	background-color: rgb(209,230,220);
}

.nav.hierarchy:hover {
	background-color: rgb(163,204,186);
}

.nav.hierarchy.selected
{
	background-color: rgb(85,155,123);
}

.nav.class
{
	background-color: rgb(178,209,240);
}

.nav.class:hover {
	background-color: rgb(157,196,236);
}

.nav.class.selected
{
	background-color: rgb(68,143,218);
}

.nav + pre {
	padding: 1ex 0.3em;
}

form + pre + form.nav + pre {
	padding: 0px;
}
]"
			-- Content of css file

end
