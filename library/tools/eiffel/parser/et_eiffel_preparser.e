indexing

	description:

		"Eiffel preparsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2002, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_EIFFEL_PREPARSER

inherit

	ET_EIFFEL_PREPARSER_SKELETON

creation

	make, make_with_factory

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= VS3)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
			yy_acclist ?= yy_acclist_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 134 then
if yy_act <= 67 then
if yy_act <= 34 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 32
-- Ignore spaces.
else
yy_set_line (0)
--|#line 33
-- Ignore new-lines.
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 38
-- Ignore comments.
end
else
if yy_act = 4 then
	yy_column := yy_column + 1
--|#line 43

			
else
	yy_column := yy_column + 1
--|#line 45

			
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
	yy_column := yy_column + 1
--|#line 47

			
else
	yy_column := yy_column + 1
--|#line 49

			
end
else
if yy_act = 8 then
	yy_column := yy_column + 1
--|#line 51

			
else
	yy_column := yy_column + 1
--|#line 53

			
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
	yy_column := yy_column + 1
--|#line 55

			
else
	yy_column := yy_column + 1
--|#line 57

			
end
else
if yy_act = 12 then
	yy_column := yy_column + 1
--|#line 59

			
else
	yy_column := yy_column + 1
--|#line 61

			
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
	yy_column := yy_column + 1
--|#line 63

			
else
	yy_column := yy_column + 1
--|#line 65

			
end
else
if yy_act = 16 then
	yy_column := yy_column + 1
--|#line 67

			
else
	yy_column := yy_column + 1
--|#line 69

			
end
end
end
end
else
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
if yy_act <= 19 then
if yy_act = 18 then
	yy_column := yy_column + 1
--|#line 71

			
else
	yy_column := yy_column + 1
--|#line 73

			
end
else
	yy_column := yy_column + 1
--|#line 75

			
end
else
if yy_act = 21 then
	yy_column := yy_column + 1
--|#line 77

			
else
	yy_column := yy_column + 1
--|#line 79

			
end
end
else
if yy_act <= 24 then
if yy_act = 23 then
	yy_column := yy_column + 1
--|#line 81

			
else
	yy_column := yy_column + 2
--|#line 83

			
end
else
if yy_act = 25 then
	yy_column := yy_column + 2
--|#line 85

			
else
	yy_column := yy_column + 2
--|#line 87

			
end
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
	yy_column := yy_column + 2
--|#line 89

			
else
	yy_column := yy_column + 2
--|#line 91

			
end
else
if yy_act = 29 then
	yy_column := yy_column + 2
--|#line 93

			
else
	yy_column := yy_column + 2
--|#line 95

			
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
	yy_column := yy_column + 2
--|#line 97

			
else
	yy_column := yy_column + 2
--|#line 99

			
end
else
if yy_act = 33 then
	yy_column := yy_column + 2
--|#line 101

			
else
	yy_column := yy_column + 2
--|#line 103

			
end
end
end
end
end
else
if yy_act <= 51 then
if yy_act <= 43 then
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
	yy_column := yy_column + 2
--|#line 105

			
else
	yy_column := yy_column + 5
--|#line 111

			
end
else
	yy_column := yy_column + 5
--|#line 113

			
end
else
if yy_act = 38 then
	yy_column := yy_column + 3
--|#line 115

			
else
	yy_column := yy_column + 3
--|#line 117

			
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
	yy_column := yy_column + 3
--|#line 119

			
else
	yy_column := yy_column + 3
--|#line 121

			
end
else
if yy_act = 42 then
	yy_column := yy_column + 2
--|#line 123

			
else
	yy_column := yy_column + 2
--|#line 125

			
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
	yy_column := yy_column + 5
--|#line 127

			
else
	yy_column := yy_column + 5
--|#line 129

			
end
else
if yy_act = 46 then
	yy_column := yy_column + 5
--|#line 131

				class_keyword_found := True
			
else
	yy_column := yy_column + 5
--|#line 134

				class_keyword_found := True
			
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
	yy_column := yy_column + 6
--|#line 137

				if use_create_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			
else
	yy_column := yy_column + 6
--|#line 145

				if use_create_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			
end
else
if yy_act = 50 then
	yy_column := yy_column + 8
--|#line 153

			
else
	yy_column := yy_column + 8
--|#line 155

			
end
end
end
end
else
if yy_act <= 59 then
if yy_act <= 55 then
if yy_act <= 53 then
if yy_act = 52 then
	yy_column := yy_column + 7
--|#line 157

			
else
	yy_column := yy_column + 7
--|#line 159

			
end
else
if yy_act = 54 then
	yy_column := yy_column + 7
--|#line 161

			
else
	yy_column := yy_column + 5
--|#line 163

			
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
	yy_column := yy_column + 5
--|#line 165

			
else
	yy_column := yy_column + 8
--|#line 167

			
end
else
if yy_act = 58 then
	yy_column := yy_column + 8
--|#line 169

			
else
	yy_column := yy_column + 2
--|#line 171

			
end
end
end
else
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act = 60 then
	yy_column := yy_column + 2
--|#line 173

			
else
	yy_column := yy_column + 4
--|#line 175

			
end
else
if yy_act = 62 then
	yy_column := yy_column + 4
--|#line 177

			
else
	yy_column := yy_column + 6
--|#line 179

			
end
end
else
if yy_act <= 65 then
if yy_act = 64 then
	yy_column := yy_column + 6
--|#line 181

			
else
	yy_column := yy_column + 3
--|#line 183

			
end
else
if yy_act = 66 then
	yy_column := yy_column + 3
--|#line 185

			
else
	yy_column := yy_column + 6
--|#line 187

			
end
end
end
end
end
end
else
if yy_act <= 101 then
if yy_act <= 84 then
if yy_act <= 76 then
if yy_act <= 72 then
if yy_act <= 70 then
if yy_act <= 69 then
if yy_act = 68 then
	yy_column := yy_column + 6
--|#line 189

			
else
	yy_column := yy_column + 8
--|#line 191

			
end
else
	yy_column := yy_column + 8
--|#line 193

			
end
else
if yy_act = 71 then
	yy_column := yy_column + 6
--|#line 195

			
else
	yy_column := yy_column + 6
--|#line 197

			
end
end
else
if yy_act <= 74 then
if yy_act = 73 then
	yy_column := yy_column + 8
--|#line 199

			
else
	yy_column := yy_column + 8
--|#line 201

			
end
else
if yy_act = 75 then
	yy_column := yy_column + 5
--|#line 203

			
else
	yy_column := yy_column + 5
--|#line 205

			
end
end
end
else
if yy_act <= 80 then
if yy_act <= 78 then
if yy_act = 77 then
	yy_column := yy_column + 5
--|#line 207

			
else
	yy_column := yy_column + 7
--|#line 209

			
end
else
if yy_act = 79 then
	yy_column := yy_column + 7
--|#line 211

			
else
	yy_column := yy_column + 4
--|#line 213

			
end
end
else
if yy_act <= 82 then
if yy_act = 81 then
	yy_column := yy_column + 4
--|#line 215

			
else
	yy_column := yy_column + 6
--|#line 217

			
end
else
if yy_act = 83 then
	yy_column := yy_column + 6
--|#line 219

			
else
	yy_column := yy_column + 2
--|#line 221

			
end
end
end
end
else
if yy_act <= 93 then
if yy_act <= 89 then
if yy_act <= 87 then
if yy_act <= 86 then
if yy_act = 85 then
	yy_column := yy_column + 2
--|#line 223

			
else
	yy_column := yy_column + 7
--|#line 225

			
end
else
	yy_column := yy_column + 7
--|#line 227

			
end
else
if yy_act = 88 then
	yy_column := yy_column + 8
--|#line 229

			
else
	yy_column := yy_column + 8
--|#line 231

			
end
end
else
if yy_act <= 91 then
if yy_act = 90 then
	yy_column := yy_column + 5
--|#line 233

			
else
	yy_column := yy_column + 5
--|#line 235

			
end
else
if yy_act = 92 then
	yy_column := yy_column + 7
--|#line 237

			
else
	yy_column := yy_column + 7
--|#line 239

			
end
end
end
else
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
	yy_column := yy_column + 7
--|#line 241

			
else
	yy_column := yy_column + 7
--|#line 243

			
end
else
if yy_act = 96 then
	yy_column := yy_column + 9
--|#line 245

			
else
	yy_column := yy_column + 9
--|#line 247

			
end
end
else
if yy_act <= 99 then
if yy_act = 98 then
	yy_column := yy_column + 2
--|#line 249

			
else
	yy_column := yy_column + 2
--|#line 251

			
end
else
if yy_act = 100 then
	yy_column := yy_column + 4
--|#line 253

			
else
	yy_column := yy_column + 4
--|#line 255

			
end
end
end
end
end
else
if yy_act <= 118 then
if yy_act <= 110 then
if yy_act <= 106 then
if yy_act <= 104 then
if yy_act <= 103 then
if yy_act = 102 then
	yy_column := yy_column + 5
--|#line 257

			
else
	yy_column := yy_column + 5
--|#line 259

			
end
else
	yy_column := yy_column + 4
--|#line 261

			
end
else
if yy_act = 105 then
	yy_column := yy_column + 4
--|#line 263

			
else
	yy_column := yy_column + 3
--|#line 265

			
end
end
else
if yy_act <= 108 then
if yy_act = 107 then
	yy_column := yy_column + 3
--|#line 267

			
else
	yy_column := yy_column + 8
--|#line 269

			
end
else
if yy_act = 109 then
	yy_column := yy_column + 8
--|#line 271

			
else
	yy_column := yy_column + 3
--|#line 273

			
end
end
end
else
if yy_act <= 114 then
if yy_act <= 112 then
if yy_act = 111 then
	yy_column := yy_column + 3
--|#line 275

			
else
	yy_column := yy_column + 4
--|#line 277

			
end
else
if yy_act = 113 then
	yy_column := yy_column + 4
--|#line 279

			
else
	yy_column := yy_column + 2
--|#line 281

			
end
end
else
if yy_act <= 116 then
if yy_act = 115 then
	yy_column := yy_column + 2
--|#line 283

			
else
	yy_column := yy_column + 9
--|#line 285

			
end
else
if yy_act = 117 then
	yy_column := yy_column + 9
--|#line 287

			
else
	yy_column := yy_column + 9
--|#line 289

			
end
end
end
end
else
if yy_act <= 126 then
if yy_act <= 122 then
if yy_act <= 120 then
if yy_act = 119 then
	yy_column := yy_column + 6
--|#line 291

			
else
	yy_column := yy_column + 6
--|#line 293

			
end
else
if yy_act = 121 then
	yy_column := yy_column + 8
--|#line 295

			
else
	yy_column := yy_column + 8
--|#line 297

			
end
end
else
if yy_act <= 124 then
if yy_act = 123 then
	yy_column := yy_column + 9
--|#line 299

				if use_reference_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			
else
	yy_column := yy_column + 9
--|#line 307

				if use_reference_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			
end
else
if yy_act = 125 then
	yy_column := yy_column + 6
--|#line 315

			
else
	yy_column := yy_column + 6
--|#line 317

			
end
end
end
else
if yy_act <= 130 then
if yy_act <= 128 then
if yy_act = 127 then
	yy_column := yy_column + 7
--|#line 319

			
else
	yy_column := yy_column + 7
--|#line 321

			
end
else
if yy_act = 129 then
	yy_column := yy_column + 6
--|#line 323

			
else
	yy_column := yy_column + 6
--|#line 325

			
end
end
else
if yy_act <= 132 then
if yy_act = 131 then
	yy_column := yy_column + 6
--|#line 327

			
else
	yy_column := yy_column + 6
--|#line 329

			
end
else
if yy_act = 133 then
	yy_column := yy_column + 6
--|#line 331

			
else
	yy_column := yy_column + 5
--|#line 333

			
end
end
end
end
end
end
end
else
if yy_act <= 201 then
if yy_act <= 168 then
if yy_act <= 151 then
if yy_act <= 143 then
if yy_act <= 139 then
if yy_act <= 137 then
if yy_act <= 136 then
if yy_act = 135 then
	yy_column := yy_column + 5
--|#line 335

			
else
	yy_column := yy_column + 6
--|#line 337

			
end
else
	yy_column := yy_column + 6
--|#line 339

			
end
else
if yy_act = 138 then
	yy_column := yy_column + 8
--|#line 341

			
else
	yy_column := yy_column + 8
--|#line 343

			
end
end
else
if yy_act <= 141 then
if yy_act = 140 then
	yy_column := yy_column + 5
--|#line 345

			
else
	yy_column := yy_column + 5
--|#line 347

			
end
else
if yy_act = 142 then
	yy_column := yy_column + 4
--|#line 349

			
else
	yy_column := yy_column + 4
--|#line 351

			
end
end
end
else
if yy_act <= 147 then
if yy_act <= 145 then
if yy_act = 144 then
	yy_column := yy_column + 4
--|#line 353

			
else
	yy_column := yy_column + 4
--|#line 355

			
end
else
if yy_act = 146 then
	yy_column := yy_column + 4
--|#line 357

			
else
	yy_column := yy_column + 8
--|#line 359

			
end
end
else
if yy_act <= 149 then
if yy_act = 148 then
	yy_column := yy_column + 8
--|#line 361

			
else
	yy_column := yy_column + 6
--|#line 363

			
end
else
if yy_act = 150 then
	yy_column := yy_column + 6
--|#line 365

			
else
	yy_column := yy_column + 5
--|#line 367

			
end
end
end
end
else
if yy_act <= 160 then
if yy_act <= 156 then
if yy_act <= 154 then
if yy_act <= 153 then
if yy_act = 152 then
	yy_column := yy_column + 5
--|#line 369

			
else
	yy_column := yy_column + 7
--|#line 371

			
end
else
	yy_column := yy_column + 7
--|#line 373

			
end
else
if yy_act = 155 then
	yy_column := yy_column + 4
--|#line 375

			
else
	yy_column := yy_column + 4
--|#line 377

			
end
end
else
if yy_act <= 158 then
if yy_act = 157 then
	yy_column := yy_column + 3
--|#line 379

			
else
	yy_column := yy_column + 3
--|#line 381

			
end
else
if yy_act = 159 then
	yy_column := yy_column + 3
--|#line 387

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 389

				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_classname := new_identifier (text)
				end
			
end
end
end
else
if yy_act <= 164 then
if yy_act <= 162 then
if yy_act = 161 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 399

			
else
	yy_column := yy_column + 3
--|#line 408

			
end
else
if yy_act = 163 then
	yy_column := yy_column + 3
--|#line 410

					-- Syntax error: character quote should be declared
					-- as '%'' and not as ''' in character constant.
--				column := column + 1
--				error_handler.report_SCTQ_error (current_position)
--				column := column - 1
			
else
	yy_column := yy_column + 4
--|#line 418

			
end
end
else
if yy_act <= 166 then
if yy_act = 165 then
	yy_column := yy_column + 4
--|#line 420

			
else
	yy_column := yy_column + 4
--|#line 422

			
end
else
if yy_act = 167 then
	yy_column := yy_column + 4
--|#line 424

			
else
	yy_column := yy_column + 4
--|#line 426

			
end
end
end
end
end
else
if yy_act <= 185 then
if yy_act <= 177 then
if yy_act <= 173 then
if yy_act <= 171 then
if yy_act <= 170 then
if yy_act = 169 then
	yy_column := yy_column + 4
--|#line 428

			
else
	yy_column := yy_column + 4
--|#line 430

			
end
else
	yy_column := yy_column + 4
--|#line 432

			
end
else
if yy_act = 172 then
	yy_column := yy_column + 4
--|#line 434

			
else
	yy_column := yy_column + 4
--|#line 436

			
end
end
else
if yy_act <= 175 then
if yy_act = 174 then
	yy_column := yy_column + 4
--|#line 438

			
else
	yy_column := yy_column + 4
--|#line 440

			
end
else
if yy_act = 176 then
	yy_column := yy_column + 4
--|#line 442

			
else
	yy_column := yy_column + 4
--|#line 444

			
end
end
end
else
if yy_act <= 181 then
if yy_act <= 179 then
if yy_act = 178 then
	yy_column := yy_column + 4
--|#line 446

			
else
	yy_column := yy_column + 4
--|#line 448

			
end
else
if yy_act = 180 then
	yy_column := yy_column + 4
--|#line 450

			
else
	yy_column := yy_column + 4
--|#line 452

			
end
end
else
if yy_act <= 183 then
if yy_act = 182 then
	yy_column := yy_column + 4
--|#line 454

			
else
	yy_column := yy_column + 4
--|#line 456

			
end
else
if yy_act = 184 then
	yy_column := yy_column + 4
--|#line 458

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 461

			
end
end
end
end
else
if yy_act <= 193 then
if yy_act <= 189 then
if yy_act <= 187 then
if yy_act = 186 then
	yy_column := yy_column + 1
--|#line 463

else
	yy_column := yy_column + 4
--|#line 464

			
end
else
if yy_act = 188 then
	yy_column := yy_column + 4
--|#line 466

			
else
	yy_column := yy_column + 4
--|#line 468

			
end
end
else
if yy_act <= 191 then
if yy_act = 190 then
	yy_column := yy_column + 4
--|#line 470

			
else
	yy_column := yy_column + 4
--|#line 472

			
end
else
if yy_act = 192 then
	yy_column := yy_column + 4
--|#line 474

			
else
	yy_column := yy_column + 4
--|#line 476

			
end
end
end
else
if yy_act <= 197 then
if yy_act <= 195 then
if yy_act = 194 then
	yy_column := yy_column + 4
--|#line 478

			
else
	yy_column := yy_column + 4
--|#line 480

			
end
else
if yy_act = 196 then
	yy_column := yy_column + 4
--|#line 482

			
else
	yy_column := yy_column + 4
--|#line 484

			
end
end
else
if yy_act <= 199 then
if yy_act = 198 then
	yy_column := yy_column + 4
--|#line 486

			
else
	yy_column := yy_column + 4
--|#line 488

			
end
else
if yy_act = 200 then
	yy_column := yy_column + 4
--|#line 490

			
else
	yy_column := yy_column + 4
--|#line 493

					-- Syntax error: invalid special character
					-- %l in character constant.
--				column := column + 2
--				error_handler.report_SCSC_error (current_position)
--				column := column - 2
			
end
end
end
end
end
end
else
if yy_act <= 234 then
if yy_act <= 218 then
if yy_act <= 210 then
if yy_act <= 206 then
if yy_act <= 204 then
if yy_act <= 203 then
if yy_act = 202 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 501

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				error_handler.report_SCAS_error (current_position)
				column := column - text_count

				last_token := E_CHARERR
			
else
	yy_column := yy_column + 3
--|#line 510

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				error_handler.report_SCAC_error (current_position)
				column := column - 3

				last_token := E_CHARERR
			
end
else
	yy_column := yy_column + 2
--|#line 519

					-- Syntax error: missing character between quotes.
				column := column + 1
				error_handler.report_SCQQ_error (current_position)
				column := column - 1

				last_token := E_CHARERR
			
end
else
if yy_act = 205 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 527

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				error_handler.report_SCEQ_error (current_position)
				column := column - text_count

				last_token := E_CHARERR
			
else
	yy_column := yy_column + 3
--|#line 540

			
end
end
else
if yy_act <= 208 then
if yy_act = 207 then
	yy_column := yy_column + 3
--|#line 542

			
else
	yy_column := yy_column + 3
--|#line 544

			
end
else
if yy_act = 209 then
	yy_column := yy_column + 3
--|#line 546

			
else
	yy_column := yy_column + 4
--|#line 548

			
end
end
end
else
if yy_act <= 214 then
if yy_act <= 212 then
if yy_act = 211 then
	yy_column := yy_column + 4
--|#line 550

			
else
	yy_column := yy_column + 3
--|#line 552

			
end
else
if yy_act = 213 then
	yy_column := yy_column + 3
--|#line 554

			
else
	yy_column := yy_column + 4
--|#line 556

			
end
end
else
if yy_act <= 216 then
if yy_act = 215 then
	yy_column := yy_column + 3
--|#line 558

			
else
	yy_column := yy_column + 4
--|#line 560

			
end
else
if yy_act = 217 then
	yy_column := yy_column + 5
--|#line 562

			
else
	yy_column := yy_column + 5
--|#line 564

			
end
end
end
end
else
if yy_act <= 226 then
if yy_act <= 222 then
if yy_act <= 220 then
if yy_act = 219 then
	yy_column := yy_column + 4
--|#line 566

			
else
	yy_column := yy_column + 5
--|#line 568

			
end
else
if yy_act = 221 then
	yy_column := yy_column + 10
--|#line 570

			
else
	yy_column := yy_column + 9
--|#line 572

			
end
end
else
if yy_act <= 224 then
if yy_act = 223 then
	yy_column := yy_column + 9
--|#line 574

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 576

			
end
else
if yy_act = 225 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 579

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 582

					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			
end
end
end
else
if yy_act <= 230 then
if yy_act <= 228 then
if yy_act = 227 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 590

				vs_count := 0
				set_start_condition (VS2)
			
else
	yy_column := yy_column + 1
--|#line 594

					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
else
if yy_act = 229 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 608

				if is_verbatim_string_closer (vs_count + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 617

				more
				set_start_condition (VS3)
			
end
end
else
if yy_act <= 232 then
if yy_act = 231 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 621

				more
				vs_count := text_count - 2
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 625

				more
				vs_count := text_count - 1
			
end
else
if yy_act = 233 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 629

					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 643

				more
				vs_count := text_count - 2
				set_start_condition (VS2)
			
end
end
end
end
end
else
if yy_act <= 251 then
if yy_act <= 243 then
if yy_act <= 239 then
if yy_act <= 237 then
if yy_act <= 236 then
if yy_act = 235 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 648

				more
				vs_count := text_count - 1
				set_start_condition (VS2)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 653

					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 665

					-- Manifest string with special characters.
			
end
else
if yy_act = 238 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 668

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 679

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
end
end
else
if yy_act <= 241 then
if yy_act = 240 then
	yy_end := yy_start + yy_more_len + 2
	yy_column := yy_column + 2
--|#line 684

					-- Multi-line manifest string.

					-- Syntax error: no space allowed after character
					-- % at end of line in multi-line manifest strings.
				column := yy_column - 1
				line := yy_line
--				error_handler.report_SSNS_error (current_position)
				column := ms_column
				line := ms_line

				more
				set_start_condition (MSN1)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 698

				more
			
end
else
if yy_act = 242 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 701

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				error_handler.report_SSAS_error (current_position)
				column := ms_column
				line := ms_line

				more
			
else
	yy_column := yy_column + 2
--|#line 712

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				error_handler.report_SSAC_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
end
end
else
if yy_act <= 247 then
if yy_act <= 245 then
if yy_act = 244 then
	yy_column := yy_column + 2
--|#line 723

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column - 1
				line := yy_line
--				error_handler.report_SSCU_error (current_position)
				column := ms_column
				line := ms_line

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 735

				more
			
end
else
if yy_act = 246 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 738

				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + 2
--|#line 741

					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
--				error_handler.report_SSSC_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
end
else
if yy_act <= 249 then
if yy_act = 248 then
	yy_column := yy_column + 1
--|#line 752

					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				error_handler.report_SSSC_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 764

					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				error_handler.report_SSNL_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
else
if yy_act = 250 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 790

				more
				set_start_condition (MSN)
			
else
	yy_column := yy_column + 1
--|#line 794

					-- Should never happen.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
end
end
end
else
if yy_act <= 259 then
if yy_act <= 255 then
if yy_act <= 253 then
if yy_act = 252 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 807

				more
				set_start_condition (MS)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 811

					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				column := 1
				line := yy_line - 1
--				error_handler.report_SSEL_error (current_position)
				column := ms_column
				line := ms_line

				more
			
end
else
if yy_act = 254 then
	yy_column := yy_column + 1
--|#line 822

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				error_handler.report_SSNP_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 851

			
end
end
else
if yy_act <= 257 then
if yy_act = 256 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 857

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 859

			
end
else
if yy_act = 258 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 861

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				error_handler.report_SIFU_error (current_position)

				last_token := E_INTERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 868

					-- Syntax error: an underscore must be followed
					-- by three digits and there must not be any
					-- consecutive group of four digits.
				error_handler.report_SITD_error (current_position)

				last_token := E_INTERR
			
end
end
end
else
if yy_act <= 263 then
if yy_act <= 261 then
if yy_act = 260 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 880

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 881

			
end
else
if yy_act = 262 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 882

			
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 884

			
end
end
else
if yy_act <= 265 then
if yy_act = 264 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 885

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 886

			
end
else
if yy_act = 266 then
	yy_column := yy_column + 1
--|#line 896

				last_token := E_UNKNOWN
			
else
yy_set_line_column
--|#line 0
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0
terminate
when 1 then
--|#line 0

					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSEQ_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 2 then
--|#line 0

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				error_handler.report_SSNP_error (current_position)
				column := ms_column
				line := ms_line

				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 3 then
--|#line 0

					-- Should never happen.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 4 then
--|#line 0

					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 5 then
--|#line 0

					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 6 then
--|#line 0

					-- No final bracket-double-quote.
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   16,   17,   18,   17,   17,   19,   20,   21,   22,
			   16,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   46,   47,   46,   46,   48,
			   46,   49,   50,   51,   46,   52,   53,   54,   55,   56,
			   57,   58,   46,   46,   59,   60,   61,   62,   63,   64,
			   65,   41,   66,   67,   68,   69,   46,   46,   70,   46,
			   71,   46,   72,   73,   74,   46,   75,   76,   77,   78,
			   79,   80,   81,   46,   46,   82,   83,   85,   85,  105,
			  106,   86,   86,  711,   87,   87,   89,   90,   89,   89,

			   89,   90,   89,   89,   91,  105,  106,  616,   91,   93,
			   94,   93,   93,   93,   94,   93,   93,   96,   97,   96,
			   96,   96,   97,   96,   96,   99,  100,  101,   99,  609,
			  102,   99,  100,  101,   99,  107,  102,  107,  107,  130,
			  131,  132,  134,  136,  135,  135,  144,  145,  153,  137,
			  133,  704,  138,  174,  139,  140,  488,  138,  181,  140,
			  140,  146,  147,  141,  232,  259,  260,  233,  150,  161,
			  151,  162,  487,  179,  486,  152,  485,  172,  154,  103,
			  153,  163,  155,  173,  174,  103,  111,  112,  156,  113,
			  182,  157,  142,  114,  115,  141,  116,  142,  117,  150,

			  161,  151,  162,  118,  180,  119,  152,  120,  159,  172,
			  154,  484,  163,  155,  173,  121,  261,  260,  160,  156,
			  122,  123,  158,  188,  164,  189,  190,  483,  165,  232,
			  124,  191,  233,  125,  126,  168,  127,  193,  193,  120,
			  159,  166,  169,  170,  183,  185,  482,  121,  171,  160,
			  174,  122,  123,  175,  188,  186,  167,  189,  190,  184,
			  165,  124,  191,  176,  150,  177,  151,  168,  161,  178,
			  162,  152,  166,  169,  170,  194,  183,  185,  154,  171,
			  163,  216,  155,  159,  181,  175,  187,  481,  156,  480,
			  184,  157,  179,  160,  176,  195,  177,  196,  189,  204,

			  178,  205,  197,  164,  479,  190,  172,  165,  478,  188,
			  198,  206,  173,  199,  191,  202,  222,  175,  168,  200,
			  166,  183,  201,  221,  203,  169,  170,  176,  336,  177,
			  228,  171,  340,  178,  185,  207,  184,  229,  214,  208,
			  227,  335,  337,  215,  186,  230,  439,  439,  477,  217,
			  210,  209,  107,  223,  107,  107,  211,  212,  218,  336,
			  219,  476,  213,  340,  220,  475,  225,  224,  244,  245,
			  244,  244,  474,  335,  337,  226,  234,  235,  236,  237,
			  235,  234,  238,  234,  234,  238,  238,  238,  238,  234,
			  234,  234,  234,  234,  239,  234,  234,  234,  234,  238,

			  234,  238,  234,  238,  238,  238,  238,  234,  238,  234,
			  238,  234,  234,  234,  238,  234,  238,  234,  234,  238,
			  238,  238,  238,  238,  238,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  240,  240,  240,  240,  234,
			  240,  234,  240,  234,  234,  240,  234,  240,  234,  234,
			  240,  240,  240,  240,  240,  240,  234,  234,  234,  234,
			  234,  234,  241,  242,  241,  241,  246,  247,  246,  246,
			  243,  249,  250,  259,  260,  251,  252,  249,  253,  252,
			  338,  251,  252,  255,  253,  252,  473,  251,  249,  256,
			  111,  472,  257,  113,  110,  248,  110,  110,  266,  262,

			  267,  113,  113,  113,  268,  269,  271,  113,  113,  113,
			  273,  111,  338,  113,  113,  111,  339,  270,  113,  111,
			  261,  260,  113,  111,  272,  471,  113,  470,  274,  111,
			  254,  111,  113,  469,  113,  232,  254,  125,  233,  468,
			  283,  340,  350,  113,  276,  125,  263,  125,  339,  275,
			  467,  125,  125,  125,  277,  323,  323,  125,  125,  327,
			  327,  278,  125,  344,  279,  349,  125,  324,  331,  331,
			  125,  328,  341,  342,  350,  276,  125,  343,  125,  282,
			  275,  280,  281,  280,  280,  277,  111,  125,  138,  113,
			  330,  330,  278,  325,  344,  279,  349,  333,  364,  324,

			  334,  351,  466,  328,  365,  342,  332,  465,  418,  343,
			  419,  436,  437,  436,  436,  249,  250,  420,  440,  251,
			  421,  113,  422,  423,  436,  438,  436,  436,  142,  333,
			  364,  334,  351,  125,  285,  285,  365,  285,  285,  285,
			  286,  285,  285,  287,  288,  289,  290,  285,  285,  285,
			  285,  285,  291,  285,  285,  285,  285,  292,  285,  293,
			  285,  294,  295,  296,  297,  285,  298,  285,  299,  285,
			  285,  285,  300,  285,  301,  285,  285,  302,  303,  304,
			  305,  306,  307,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  308,  309,  310,  311,  285,  312,  285,

			  313,  285,  285,  314,  285,  315,  285,  285,  316,  317,
			  318,  319,  320,  321,  285,  285,  285,  285,  285,  285,
			  138,  345,  329,  330,  347,  349,  353,  359,  348,  360,
			  354,  141,  355,  366,  356,  464,  346,  362,  363,  366,
			  463,  361,  462,  375,  461,  357,  377,  376,  358,  378,
			  460,  379,  385,  345,  379,  347,  352,  353,  359,  348,
			  142,  360,  354,  141,  355,  366,  356,  346,  362,  363,
			  384,  367,  361,  368,  375,  369,  357,  377,  376,  358,
			  386,  378,  379,  370,  385,  380,  371,  340,  372,  373,
			  381,  193,  193,  193,  193,  382,  333,  441,  441,  334,

			  335,  384,  337,  338,  339,  368,  383,  369,  342,  459,
			  344,  386,  343,  350,  370,  349,  351,  371,  393,  372,
			  373,  347,  381,  345,  457,  348,  353,  382,  387,  193,
			  388,  194,  389,  364,  390,  391,  392,  383,  346,  359,
			  394,  396,  362,  363,  395,  402,  401,  403,  360,  354,
			  365,  355,  399,  356,  366,  397,  400,  404,  375,  377,
			  361,  379,  376,  384,  357,  415,  386,  358,  378,  398,
			  410,  381,  385,  413,  414,  501,  382,  492,  492,  456,
			  411,  405,  416,  406,  455,  407,  417,  383,  454,  424,
			  426,  412,  428,  425,  432,  408,  442,  434,  409,  113,

			  427,  255,  250,  429,  433,  251,  453,  501,  430,  241,
			  242,  241,  241,  244,  245,  244,  244,  243,  431,  246,
			  247,  246,  246,  252,  249,  253,  252,  452,  251,  252,
			  255,  253,  252,  435,  251,  249,  256,  255,  256,  257,
			  502,  257,  248,  125,  248,  280,  281,  280,  280,  443,
			  262,  444,  113,  113,  113,  111,  111,  374,  113,  113,
			  111,  504,  451,  113,  448,  113,  449,  111,  503,  113,
			  113,  322,  502,  280,  281,  280,  280,  254,  111,  445,
			  452,  113,  490,  254,  490,  284,  508,  491,  491,  458,
			  458,  505,  446,  504,  489,  489,  125,  263,  125,  503,

			  447,  265,  125,  125,  505,  450,  324,  125,  108,  125,
			  192,  445,  507,  125,  125,  493,  493,  138,  508,  498,
			  499,  510,  505,  446,  496,  125,  496,  494,  141,  497,
			  497,  447,  325,  500,  500,  506,  450,  138,  324,  499,
			  499,  332,  332,  507,  509,  148,  513,  143,  511,  109,
			  514,  515,  510,  495,  516,  514,  519,  142,  520,  494,
			  141,  523,  512,  521,  522,  524,  108,  517,  525,  526,
			  529,  332,  527,  528,  533,  534,  509,  142,  513,  332,
			  511,  514,  515,  535,  541,  516,  518,  519,  530,  542,
			  520,  531,  523,  512,  536,  521,  522,  524,  517,  537,

			  525,  526,  529,  527,  528,  530,  533,  534,  531,  893,
			  539,  537,  543,  893,  544,  535,  541,  538,  545,  545,
			  530,  542,  547,  531,  548,  536,  549,  550,  893,  538,
			  551,  537,  501,  502,  893,  503,  504,  532,  505,  507,
			  531,  539,  508,  537,  543,  544,  509,  513,  538,  510,
			  545,  546,  514,  511,  547,  548,  515,  519,  549,  550,
			  540,  551,  516,  520,  552,  553,  554,  512,  555,  556,
			  557,  521,  522,  524,  558,  517,  523,  525,  559,  563,
			  560,  526,  529,  564,  527,  561,  528,  565,  568,  530,
			  533,  534,  531,  566,  535,  569,  536,  539,  562,  541,

			  537,  542,  543,  570,  571,  573,  567,  572,  544,  574,
			  545,  547,  549,  575,  578,  576,  548,  577,  538,  550,
			  893,  579,  581,  582,  580,  551,  583,  584,  587,  598,
			  598,  588,  585,  589,  590,  436,  437,  436,  436,  591,
			  491,  491,  592,  593,  595,  111,  893,  594,  113,  586,
			  893,  596,  599,  439,  439,  619,  597,  264,  441,  441,
			  600,  623,  601,  603,  111,  113,  113,  113,  605,  607,
			  607,  113,  606,  458,  458,  610,  610,  602,  608,  608,
			  893,  324,  611,  611,  893,  612,  619,  612,  620,  604,
			  613,  613,  125,  623,  494,  614,  614,  497,  497,  615,

			  615,  617,  621,  498,  499,  618,  618,  325,  602,  125,
			  125,  125,  141,  324,  622,  125,  609,  623,  625,  620,
			  495,  604,  617,  626,  499,  499,  494,  627,  232,  628,
			  629,  233,  630,  621,  631,  632,  634,  616,  633,  632,
			  636,  332,  637,  332,  141,  622,  638,  639,  640,  624,
			  625,  641,  642,  643,  626,  644,  645,  893,  644,  627,
			  628,  629,  332,  630,  647,  631,  648,  632,  634,  633,
			  649,  635,  636,  637,  650,  893,  651,  638,  639,  652,
			  640,  653,  641,  642,  643,  652,  644,  655,  645,  646,
			  656,  657,  658,  893,  659,  660,  647,  648,  661,  893,

			  619,  649,  620,  621,  622,  623,  650,  651,  625,  627,
			  652,  626,  653,  628,  629,  630,  654,  631,  632,  655,
			  633,  656,  657,  634,  658,  659,  660,  636,  893,  637,
			  661,  662,  638,  663,  664,  665,  639,  666,  640,  645,
			  667,  669,  668,  641,  670,  671,  672,  642,  673,  643,
			  674,  675,  644,  647,  650,  676,  648,  649,  651,  677,
			  678,  652,  653,  679,  655,  893,  656,  680,  657,  658,
			  681,  686,  659,  660,  682,  661,  111,  893,  683,  113,
			  684,  111,  893,  685,  113,  687,  690,  688,  689,  691,
			  893,  111,  692,  693,  113,  893,  694,  695,  893,  696,

			  893,  697,  893,  698,  699,  607,  607,  700,  231,  598,
			  598,  707,  707,  703,  708,  708,  701,  705,  706,  706,
			  702,  709,  709,  125,  613,  613,  710,  710,  125,  712,
			  712,  713,  713,  494,  714,  714,  709,  709,  125,  716,
			  719,  332,  332,  719,  703,  721,  717,  701,  715,  705,
			  718,  722,  702,  723,  724,  729,  609,  725,  726,  495,
			  727,  728,  730,  731,  711,  494,  732,  733,  734,  616,
			  735,  719,  736,  735,  720,  738,  721,  739,  717,  142,
			  715,  740,  718,  722,  741,  723,  724,  729,  725,  726,
			  742,  727,  728,  743,  730,  731,  743,  745,  732,  733,

			  734,  735,  746,  736,  737,  747,  748,  738,  749,  739,
			  717,  893,  719,  740,  718,  741,  721,  722,  723,  724,
			  893,  725,  742,  726,  743,  727,  728,  744,  745,  729,
			  730,  731,  732,  733,  746,  734,  738,  747,  748,  749,
			  735,  736,  750,  752,  739,  740,  751,  753,  741,  754,
			  755,  756,  757,  742,  758,  743,  759,  760,  745,  746,
			  747,  761,  762,  763,  764,  765,  748,  766,  769,  749,
			  111,  767,  768,  113,  893,  111,  770,  771,  113,  772,
			  786,  111,  785,  785,  113,  773,  774,  893,  783,  775,
			  783,  776,  777,  784,  784,  781,  784,  784,  778,  893,

			  779,  709,  709,  780,  788,  788,  325,  789,  789,  790,
			  790,  893,  786,  787,  791,  791,  797,  125,  792,  792,
			  782,  800,  125,  798,  793,  798,  793,  781,  125,  791,
			  791,  795,  795,  801,  609,  780,  802,  803,  893,  804,
			  805,  806,  711,  796,  808,  787,  807,  797,  809,  810,
			  810,  782,  616,  800,  798,  812,  799,  813,  814,  893,
			  815,  816,  817,  797,  798,  801,  800,  801,  802,  803,
			  804,  805,  806,  802,  803,  796,  808,  807,  804,  809,
			  810,  811,  805,  806,  807,  808,  812,  809,  813,  810,
			  814,  815,  816,  817,  818,  819,  812,  813,  820,  821,

			  814,  893,  815,  816,  817,  822,  823,  111,  893,  824,
			  113,  784,  784,  825,  826,  827,  111,  828,  829,  113,
			  830,  852,  111,  784,  784,  113,  893,  831,  832,  840,
			  840,  893,  833,  834,  835,  836,  846,  841,  893,  841,
			  851,  837,  842,  842,  844,  844,  838,  839,  845,  845,
			  843,  853,  843,  852,  125,  844,  844,  791,  791,  847,
			  847,  854,  495,  125,  791,  791,  848,  848,  846,  125,
			  849,  851,  849,  837,  855,  850,  850,  838,  846,  839,
			  856,  857,  711,  853,  858,  858,  860,  861,  862,  863,
			  893,  851,  854,  852,  853,  877,  854,  855,  113,  856,

			  857,  893,  858,  860,  495,  861,  855,  862,  863,  111,
			  846,  856,  113,  857,  878,  858,  859,  113,  860,  861,
			  862,  863,  864,  842,  842,  865,  866,  867,  891,  868,
			  869,  113,  870,  871,  887,  872,  884,  873,  885,  874,
			  875,  885,  125,  876,  879,  879,  844,  844,  844,  844,
			  880,  880,  881,  884,  881,  885,  125,  882,  882,  790,
			  790,  125,  850,  850,  883,  883,  887,  884,  887,  885,
			  893,  846,  886,  893,  876,  125,  840,  840,  882,  882,
			  892,  892,  609,  893,  888,  893,  889,  847,  847,  880,
			  880,  893,  893,  893,  893,  893,  893,  495,  893,  893,

			  890,  893,  616,  846,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  609,  893,  893,  893,  711,  893,
			  893,  893,  893,  893,  893,  616,  893,  711,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   95,   95,   95,

			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  110,  110,  893,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  128,
			  893,  893,  893,  893,  893,  128,  128,  128,  128,  128,

			  128,  128,  128,  128,  128,  128,  128,  128,  128,  128,
			  128,  128,  129,  129,  893,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  129,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  129,  149,  149,  893,  893,  149,
			  149,  149,  149,  149,  149,  149,  149,  149,  149,  231,
			  231,  893,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  254,  254,  254,  254,  254,

			  254,  254,  254,  254,  254,  254,  254,  254,  254,  254,
			  254,  254,  254,  254,  254,  254,  254,  254,  258,  258,
			  258,  258,  258,  258,  258,  258,  258,  258,  258,  258,
			  258,  258,  258,  258,  258,  258,  258,  258,  258,  258,
			  258,  112,  112,  893,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  264,  264,  264,  264,  893,  893,
			  893,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  132,  132,  893,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,

			  132,  132,  132,  326,  326,  326,  326,  326,  326,  326,
			  326,  893,  326,  326,  326,  326,  326,  326,  326,  326,
			  326,  326,  326,  326,  326,  326,  231,  231,  231,  231,
			  893,  893,  893,  231,  231,  231,  231,  231,  231,  231,
			  231,  231,  264,  264,  893,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  264,  264,  264,  264,  264,
			  264,  264,  264,  264,  264,  794,  794,  794,  794,  794,
			  794,  794,  794,  893,  794,  794,  794,  794,  794,  794,
			  794,  794,  794,  794,  794,  794,  794,  794,   15,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,    4,   13,
			   13,    3,    4,  880,    3,    4,    5,    5,    5,    5,

			    6,    6,    6,    6,    5,   14,   14,  847,    6,    7,
			    7,    7,    7,    8,    8,    8,    8,    9,    9,    9,
			    9,   10,   10,   10,   10,   11,   11,   11,   11,  840,
			   11,   12,   12,   12,   12,   17,   12,   17,   17,   23,
			   23,   29,   30,   31,   30,   30,   36,   36,   41,   31,
			   29,  606,   32,   49,   32,   32,  321,   33,   52,   33,
			   33,   38,   38,   32,   84,  104,  104,   84,   40,   44,
			   40,   44,  320,   51,  319,   40,  318,   48,   42,   11,
			   41,   44,   42,   48,   49,   12,   20,   20,   42,   20,
			   52,   42,   32,   20,   20,   32,   20,   33,   20,   40,

			   44,   40,   44,   20,   51,   20,   40,   20,   43,   48,
			   42,  317,   44,   42,   48,   20,  106,  106,   43,   42,
			   20,   20,   42,   55,   45,   56,   57,  316,   45,  231,
			   20,   58,  231,   20,   20,   47,   20,   63,   63,   20,
			   43,   45,   47,   47,   53,   54,  315,   20,   47,   43,
			   72,   20,   20,   50,   55,   54,   45,   56,   57,   53,
			   45,   20,   58,   50,   65,   50,   65,   47,   68,   50,
			   68,   65,   45,   47,   47,   63,   53,   54,   66,   47,
			   68,   72,   66,   67,   75,   50,   54,  314,   66,  313,
			   53,   66,   74,   67,   50,   65,   50,   65,   79,   68,

			   50,   68,   65,   69,  312,   80,   71,   69,  311,   78,
			   66,   68,   71,   66,   81,   67,   75,   73,   70,   66,
			   69,   76,   66,   74,   67,   70,   70,   73,  153,   73,
			   79,   70,  157,   73,   77,   69,   76,   80,   71,   69,
			   78,  151,  154,   71,   77,   81,  239,  239,  310,   73,
			   70,   69,  107,   76,  107,  107,   70,   70,   73,  153,
			   73,  309,   70,  157,   73,  308,   77,   76,   93,   93,
			   93,   93,  307,  151,  154,   77,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   89,   89,   89,   89,   96,   96,   96,   96,
			   89,   98,   98,  258,  258,   98,   99,   99,   99,   99,
			  155,   99,  101,  101,  101,  101,  306,  101,  103,  103,
			  110,  305,  103,  110,  112,  103,  112,  112,  114,  112,

			  115,  114,  112,  115,  116,  117,  118,  116,  117,  118,
			  119,  121,  155,  119,  121,  120,  156,  117,  120,  122,
			  260,  260,  122,  123,  118,  304,  123,  303,  119,  124,
			   99,  126,  124,  302,  126,  238,  101,  110,  238,  301,
			  127,  158,  165,  127,  121,  114,  112,  115,  156,  120,
			  300,  116,  117,  118,  122,  135,  135,  119,  121,  138,
			  138,  123,  120,  161,  124,  164,  122,  135,  142,  142,
			  123,  138,  158,  159,  165,  121,  124,  159,  126,  126,
			  120,  125,  125,  125,  125,  122,  125,  127,  140,  125,
			  140,  140,  123,  135,  161,  124,  164,  150,  176,  135,

			  150,  166,  299,  138,  177,  159,  142,  298,  222,  159,
			  222,  235,  235,  235,  235,  248,  248,  222,  264,  248,
			  222,  264,  222,  222,  237,  237,  237,  237,  140,  150,
			  176,  150,  166,  125,  130,  130,  177,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,

			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  139,  162,  139,  139,  163,  167,  169,  172,  163,  173,
			  170,  139,  170,  179,  170,  297,  162,  174,  175,  180,
			  296,  173,  295,  183,  294,  170,  184,  183,  170,  185,
			  293,  186,  190,  162,  187,  163,  167,  169,  172,  163,
			  139,  173,  170,  139,  170,  179,  170,  162,  174,  175,
			  189,  180,  173,  181,  183,  181,  170,  184,  183,  170,
			  191,  185,  186,  181,  190,  187,  181,  201,  181,  181,
			  188,  193,  193,  194,  194,  188,  195,  265,  265,  195,

			  196,  189,  198,  199,  200,  181,  188,  181,  202,  292,
			  204,  191,  202,  208,  181,  207,  209,  181,  201,  181,
			  181,  206,  188,  205,  290,  206,  211,  188,  195,  193,
			  195,  194,  196,  218,  198,  199,  200,  188,  205,  214,
			  202,  204,  216,  217,  202,  208,  207,  209,  215,  212,
			  219,  212,  206,  212,  221,  205,  206,  211,  223,  224,
			  215,  226,  223,  228,  212,  218,  230,  212,  225,  205,
			  214,  227,  229,  216,  217,  333,  227,  325,  325,  289,
			  215,  212,  219,  212,  288,  212,  221,  227,  287,  223,
			  224,  215,  226,  223,  228,  212,  270,  230,  212,  270,

			  225,  250,  250,  227,  229,  250,  286,  333,  227,  241,
			  241,  241,  241,  244,  244,  244,  244,  241,  227,  246,
			  246,  246,  246,  252,  252,  252,  252,  285,  252,  253,
			  253,  253,  253,  233,  253,  254,  254,  256,  256,  254,
			  337,  256,  254,  270,  256,  263,  263,  263,  263,  272,
			  263,  274,  272,  263,  274,  275,  276,  182,  275,  276,
			  277,  339,  282,  277,  278,  282,  278,  279,  338,  278,
			  279,  131,  337,  280,  280,  280,  280,  252,  280,  275,
			  291,  280,  324,  253,  324,  129,  343,  324,  324,  291,
			  291,  340,  276,  339,  323,  323,  272,  263,  274,  338,

			  277,  113,  275,  276,  341,  279,  323,  277,  108,  282,
			   60,  275,  342,  278,  279,  327,  327,  329,  343,  329,
			  329,  346,  340,  276,  328,  280,  328,  327,  329,  328,
			  328,  277,  323,  331,  331,  341,  279,  330,  323,  330,
			  330,  332,  332,  342,  344,   39,  348,   34,  347,   19,
			  349,  350,  346,  327,  351,  352,  353,  329,  354,  327,
			  329,  357,  347,  355,  356,  358,   18,  351,  359,  360,
			  365,  331,  361,  363,  368,  369,  344,  330,  348,  332,
			  347,  349,  350,  370,  375,  351,  352,  353,  366,  376,
			  354,  366,  357,  347,  371,  355,  356,  358,  351,  372,

			  359,  360,  365,  361,  363,  367,  368,  369,  367,   15,
			  373,  374,  377,    0,  378,  370,  375,  372,  379,  380,
			  366,  376,  381,  366,  382,  371,  383,  384,    0,  374,
			  385,  372,  387,  390,    0,  391,  392,  367,  393,  394,
			  367,  373,  395,  374,  377,  378,  396,  400,  372,  398,
			  379,  380,  401,  399,  381,  382,  402,  404,  383,  384,
			  374,  385,  403,  405,  387,  390,  391,  399,  392,  393,
			  394,  406,  407,  409,  395,  403,  408,  410,  396,  400,
			  398,  411,  416,  401,  412,  399,  414,  402,  404,  417,
			  418,  419,  417,  403,  420,  405,  421,  423,  399,  424,

			  422,  425,  426,  406,  407,  409,  403,  408,  427,  410,
			  428,  429,  431,  411,  416,  412,  430,  414,  422,  432,
			    0,  417,  418,  419,  417,  433,  420,  421,  423,  435,
			  435,  424,  422,  425,  426,  436,  436,  436,  436,  427,
			  490,  490,  428,  429,  431,  446,    0,  430,  446,  422,
			    0,  432,  439,  439,  439,  501,  433,  441,  441,  441,
			  445,  505,  445,  447,  448,  445,  447,  448,  450,  489,
			  489,  450,  458,  458,  458,  492,  492,  446,  491,  491,
			    0,  489,  493,  493,    0,  494,  501,  494,  502,  448,
			  494,  494,  446,  505,  493,  495,  495,  496,  496,  497,

			  497,  498,  503,  498,  498,  500,  500,  489,  446,  445,
			  447,  448,  498,  489,  504,  450,  491,  506,  507,  502,
			  493,  448,  499,  508,  499,  499,  493,  509,  599,  510,
			  511,  599,  512,  503,  513,  514,  517,  497,  515,  518,
			  519,  498,  520,  500,  498,  504,  521,  522,  523,  506,
			  507,  524,  526,  528,  508,  530,  531,    0,  532,  509,
			  510,  511,  499,  512,  533,  513,  534,  514,  517,  515,
			  535,  518,  519,  520,  536,    0,  537,  521,  522,  538,
			  523,  539,  524,  526,  528,  540,  530,  541,  531,  532,
			  542,  543,  547,    0,  548,  549,  533,  534,  550,    0,

			  552,  535,  553,  554,  555,  556,  536,  537,  557,  559,
			  538,  558,  539,  560,  561,  562,  540,  563,  564,  541,
			  565,  542,  543,  567,  547,  548,  549,  568,    0,  569,
			  550,  552,  570,  553,  554,  555,  571,  556,  572,  580,
			  557,  559,  558,  573,  560,  561,  562,  575,  563,  577,
			  564,  565,  579,  581,  584,  567,  582,  583,  585,  568,
			  569,  586,  587,  570,  588,    0,  589,  571,  590,  593,
			  572,  580,  594,  595,  573,  596,  600,    0,  575,  600,
			  577,  604,    0,  579,  604,  581,  584,  582,  583,  585,
			    0,  602,  586,  587,  602,    0,  588,  589,    0,  590,

			    0,  593,    0,  594,  595,  607,  607,  596,  598,  598,
			  598,  609,  609,  604,  610,  610,  600,  607,  608,  608,
			  602,  611,  611,  600,  612,  612,  613,  613,  604,  614,
			  614,  615,  615,  611,  616,  616,  617,  617,  602,  618,
			  623,  618,  618,  624,  604,  626,  622,  600,  617,  607,
			  622,  627,  602,  628,  629,  636,  608,  630,  631,  611,
			  633,  634,  637,  639,  613,  611,  640,  641,  643,  615,
			  644,  623,  645,  646,  624,  647,  626,  648,  622,  618,
			  617,  649,  622,  627,  650,  628,  629,  636,  630,  631,
			  651,  633,  634,  652,  637,  639,  654,  655,  640,  641,

			  643,  644,  656,  645,  646,  658,  659,  647,  661,  648,
			  665,    0,  666,  649,  665,  650,  668,  669,  670,  671,
			    0,  672,  651,  673,  652,  675,  676,  654,  655,  677,
			  678,  680,  681,  682,  656,  684,  687,  658,  659,  661,
			  685,  686,  665,  666,  688,  689,  665,  668,  690,  669,
			  670,  671,  672,  691,  673,  692,  675,  676,  694,  695,
			  697,  677,  678,  680,  681,  682,  698,  684,  687,  700,
			  702,  685,  686,  702,    0,  701,  688,  689,  701,  690,
			  708,  703,  707,  707,  703,  691,  692,    0,  705,  694,
			  705,  695,  697,  705,  705,  702,  706,  706,  698,    0,

			  700,  709,  709,  701,  710,  710,  708,  711,  711,  712,
			  712,    0,  708,  709,  713,  713,  718,  702,  714,  714,
			  703,  721,  701,  719,  715,  720,  715,  702,  703,  715,
			  715,  716,  716,  724,  706,  701,  726,  727,    0,  729,
			  730,  731,  710,  716,  733,  709,  732,  718,  734,  735,
			  737,  703,  713,  721,  719,  738,  720,  739,  741,    0,
			  746,  747,  749,  751,  752,  724,  753,  756,  726,  727,
			  729,  730,  731,  758,  759,  716,  733,  732,  761,  734,
			  735,  737,  762,  763,  764,  765,  738,  766,  739,  767,
			  741,  746,  747,  749,  751,  752,  769,  770,  753,  756,

			  772,    0,  776,  777,  779,  758,  759,  781,    0,  761,
			  781,  783,  783,  762,  763,  764,  780,  765,  766,  780,
			  767,  800,  782,  784,  784,  782,    0,  769,  770,  785,
			  785,    0,  772,  776,  777,  779,  790,  786,    0,  786,
			  797,  780,  786,  786,  788,  788,  781,  782,  789,  789,
			  787,  801,  787,  800,  781,  787,  787,  791,  791,  792,
			  792,  802,  790,  780,  793,  793,  795,  795,  790,  782,
			  796,  797,  796,  780,  805,  796,  796,  781,  795,  782,
			  808,  809,  788,  801,  810,  811,  812,  813,  815,  816,
			    0,  818,  802,  820,  821,  838,  822,  825,  838,  828,

			  829,    0,  830,  831,  795,  832,  805,  834,  835,  837,
			  795,  808,  837,  809,  839,  810,  811,  839,  812,  813,
			  815,  816,  818,  841,  841,  820,  821,  822,  876,  825,
			  828,  876,  829,  830,  861,  831,  856,  832,  858,  834,
			  835,  859,  838,  837,  842,  842,  843,  843,  844,  844,
			  845,  845,  846,  869,  846,  871,  837,  846,  846,  848,
			  848,  839,  849,  849,  850,  850,  861,  856,  873,  858,
			    0,  848,  859,    0,  837,  876,  879,  879,  881,  881,
			  882,  882,  842,    0,  869,    0,  871,  883,  883,  892,
			  892,    0,    0,    0,    0,    0,    0,  848,    0,    0,

			  873,    0,  850,  848,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  879,    0,    0,    0,  882,    0,
			    0,    0,    0,    0,    0,  883,    0,  892,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  894,  894,  894,  894,  894,  894,  894,  894,  894,
			  894,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  895,  895,  895,  895,  895,  895,
			  895,  895,  895,  895,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  896,  896,  896,
			  896,  896,  896,  896,  896,  896,  896,  897,  897,  897,

			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  897,  897,  897,  897,  897,  897,  897,  897,  897,  897,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  898,  898,  898,  898,  898,  898,  898,
			  898,  898,  898,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  899,  899,  899,  899,
			  899,  899,  899,  899,  899,  899,  900,  900,    0,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  900,  901,
			    0,    0,    0,    0,    0,  901,  901,  901,  901,  901,

			  901,  901,  901,  901,  901,  901,  901,  901,  901,  901,
			  901,  901,  902,  902,    0,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  902,  902,  902,  902,  902,
			  902,  902,  902,  902,  902,  903,  903,    0,    0,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  904,
			  904,    0,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  904,  904,  904,  904,  904,  904,  904,  904,
			  904,  904,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  905,  905,  905,  905,  905,
			  905,  905,  905,  905,  905,  906,  906,  906,  906,  906,

			  906,  906,  906,  906,  906,  906,  906,  906,  906,  906,
			  906,  906,  906,  906,  906,  906,  906,  906,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  907,  907,  907,  907,  907,  907,  907,  907,  907,
			  907,  908,  908,    0,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  908,  908,  908,  908,  908,  908,
			  908,  908,  908,  908,  909,  909,  909,  909,    0,    0,
			    0,  909,  909,  909,  909,  909,  909,  909,  909,  909,
			  910,  910,    0,  910,  910,  910,  910,  910,  910,  910,
			  910,  910,  910,  910,  910,  910,  910,  910,  910,  910,

			  910,  910,  910,  911,  911,  911,  911,  911,  911,  911,
			  911,    0,  911,  911,  911,  911,  911,  911,  911,  911,
			  911,  911,  911,  911,  911,  911,  912,  912,  912,  912,
			    0,    0,    0,  912,  912,  912,  912,  912,  912,  912,
			  912,  912,  913,  913,    0,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  913,  913,  913,  913,  913,
			  913,  913,  913,  913,  913,  914,  914,  914,  914,  914,
			  914,  914,  914,    0,  914,  914,  914,  914,  914,  914,
			  914,  914,  914,  914,  914,  914,  914,  914,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   84,   85,   94,   98,  107,  111,  115,
			  119,  123,  129,   86,  102, 1109, 2488,  133, 1063, 1043,
			  179,    0, 2488,  129, 2488, 2488, 2488, 2488, 2488,  124,
			  124,  124,  134,  139, 1022, 2488,  122, 2488,  136, 1020,
			  129,  112,  143,  176,  130,  196,    0,  202,  141,  111,
			  224,  128,  126,  212,  210,  182,  197,  191,  189, 2488,
			  955, 2488, 2488,  217, 2488,  225,  243,  251,  229,  275,
			  285,  270,  208,  288,  247,  252,  289,  299,  268,  270,
			  270,  272, 2488, 2488,  157, 2488, 2488,  375, 2488,  460,
			 2488, 2488, 2488,  366, 2488, 2488,  464, 2488,  468,  474,

			 2488,  480, 2488,  485,  162, 2488,  213,  350, 1005, 2488,
			  483, 2488,  492,  982,  491,  493,  497,  498,  499,  503,
			  508,  504,  512,  516,  522,  579,  524,  533,    0,  974,
			  633,  960,    0, 2488, 2488,  535, 2488, 2488,  539,  702,
			  570, 2488,  548, 2488, 2488, 2488, 2488, 2488, 2488,    0,
			  561,  310,    0,  281,  310,  452,  484,  287,  496,  544,
			    0,  517,  690,  681,  526,  514,  559,  686,    0,  683,
			  699,    0,  689,  699,  690,  692,  567,  574,    0,  701,
			  707,  742,  880,  704,  701,  717,  703,  706,  759,  725,
			  720,  735, 2488,  771,  773,  760,  769,    0,  770,  775,

			  772,  742,  779,    0,  764,  792,  778,  776,  785,  774,
			    0,  783,  818,    0,  801,  818,  795,  797,  802,  820,
			    0,  822,  545,  819,  814,  836,  813,  840,  818,  840,
			  821,  222, 2488,  914, 2488,  609, 2488,  622,  528,  326,
			 2488,  907, 2488, 2488,  911, 2488,  917, 2488,  612, 2488,
			  898, 2488,  921,  927,  932, 2488,  934, 2488,  470, 2488,
			  517, 2488, 2488,  943,  611,  777, 2488, 2488, 2488, 2488,
			  889, 2488,  942, 2488,  944,  948,  949,  953,  959,  960,
			  971, 2488,  955, 2488, 2488,  916,  895,  877,  873,  868,
			  813,  969,  798,  739,  733,  731,  729,  724,  596,  591,

			  539,  528,  522,  516,  514,  480,  475,  361,  354,  350,
			  337,  297,  293,  278,  276,  235,  216,  200,  165,  163,
			  161,  145, 2488,  974,  967,  857, 2488,  995, 1009,  999,
			 1019, 1013, 1021,  847,    0,    0,    0,  910,  922,  933,
			  946,  959,  964,  954, 1012,    0,  973, 1020, 1014, 1004,
			 1004, 1014, 1009, 1017, 1026, 1027, 1032, 1018, 1037, 1036,
			 1041, 1029,    0, 1031,    0, 1038, 1058, 1075, 1042, 1043,
			 1055, 1046, 1069, 1065, 1081, 1052, 1061, 1076, 1073, 1086,
			 1087, 1090, 1080, 1090, 1091, 1089,    0, 1104,    0,    0,
			 1103, 1089, 1108, 1093, 1091, 1110, 1114,    0, 1101, 1125,

			 1115, 1106, 1109, 1122, 1118, 1131, 1135, 1140, 1133, 1145,
			 1145, 1153, 1141,    0, 1144,    0, 1150, 1159, 1158, 1159,
			 1166, 1148, 1170, 1152, 1167, 1173, 1166, 1167, 1178, 1179,
			 1172, 1176, 1183, 1184,    0, 1209, 1233, 2488, 2488, 1233,
			 2488, 1238, 2488, 2488, 2488, 1255, 1238, 1256, 1257, 2488,
			 1261, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 1253, 2488,
			 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488,
			 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488,
			 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 2488, 1249,
			 1220, 1258, 1255, 1262, 1270, 1275, 1277, 1279, 1283, 1304,

			 1285, 1209, 1250, 1256, 1267, 1229, 1285, 1284, 1278, 1291,
			 1284, 1289, 1287, 1289, 1303, 1290,    0, 1304, 1307, 1304,
			 1291, 1295, 1302, 1316, 1306,    0, 1313,    0, 1314,    0,
			 1307, 1320, 1310, 1331, 1321, 1330, 1338, 1328, 1340, 1329,
			 1346, 1357, 1345, 1348,    0,    0,    0, 1359, 1346, 1356,
			 1370,    0, 1354, 1364, 1357, 1357, 1373, 1374, 1366, 1373,
			 1368, 1373, 1370, 1372, 1386, 1372,    0, 1391, 1391, 1378,
			 1381, 1391, 1406, 1398,    0, 1408,    0, 1410,    0, 1404,
			 1403, 1420, 1411, 1417, 1418, 1410, 1422, 1410, 1434, 1421,
			 1425,    0,    0, 1436, 1424, 1434, 1447,    0, 1489, 1321,

			 1469, 2488, 1484, 2488, 1474, 2488,  140, 1485, 1498, 1491,
			 1494, 1501, 1504, 1506, 1509, 1511, 1514, 1516, 1521,    0,
			    0,    0, 1514, 1499, 1502,    0, 1500, 1518, 1521, 1523,
			 1510, 1517,    0, 1515, 1520,    0, 1523, 1526,    0, 1527,
			 1536, 1531,    0, 1536, 1525, 1521, 1528, 1539, 1545, 1549,
			 1539, 1558, 1546,    0, 1549, 1550, 1574,    0, 1569, 1574,
			    0, 1567,    0,    0,    0, 1578, 1571,    0, 1571, 1584,
			 1586, 1588, 1574, 1582,    0, 1580, 1585, 1597, 1594,    0,
			 1595, 1602, 1597,    0, 1603, 1595, 1590, 1600, 1612, 1613,
			 1603, 1621, 1608,    0, 1611, 1631,    0, 1624, 1634,    0,

			 1628, 1668, 1663, 1674, 2488, 1673, 1676, 1662, 1648, 1681,
			 1684, 1687, 1689, 1694, 1698, 1709, 1711,    0, 1674, 1676,
			 1678, 1689,    0,    0, 1701,    0, 1708, 1705,    0, 1693,
			 1699, 1694, 1699, 1716, 1701, 1703,    0, 1704, 1714, 1716,
			    0, 1726,    0,    0,    0,    0, 1713, 1720,    0, 1715,
			    0, 1721, 1717, 1734,    0,    0, 1735,    0, 1745, 1742,
			    0, 1732, 1741, 1736, 1737, 1757, 1740, 1743,    0, 1755,
			 1756,    0, 1768,    0,    0,    0, 1755, 1762,    0, 1757,
			 1809, 1800, 1815, 1791, 1803, 1809, 1822, 1835, 1824, 1828,
			 1804, 1837, 1839, 1844, 2488, 1846, 1855, 1799,    0,    0,

			 1790, 1820, 1822,    0,    0, 1840,    0,    0, 1839, 1849,
			 1842, 1843, 1854, 1857,    0, 1856, 1857,    0, 1850,    0,
			 1862, 1863, 1857,    0,    0, 1863,    0,    0, 1858, 1868,
			 1860, 1871, 1875,    0, 1875, 1876,    0, 1902, 1888, 1907,
			   71, 1903, 1924, 1926, 1928, 1930, 1937,   49, 1939, 1942,
			 1944,    0,    0,    0,    0,    0, 1889,    0, 1893, 1896,
			    0, 1902,    0,    0,    0,    0,    0,    0,    0, 1906,
			    0, 1910,    0, 1936,    0,    0, 1921, 2488, 2488, 1956,
			   35, 1958, 1960, 1967,    0,    0,    0,    0,    0,    0,
			    0, 2488, 1969, 2488, 2027, 2050, 2073, 2096, 2119, 2142,

			 2165, 2188, 2211, 2225, 2248, 2271, 2294, 2317, 2340, 2359,
			 2379, 2402, 2421, 2441, 2464>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  893,    1,  894,  894,  895,  895,  896,  896,  897,
			  897,  898,  898,  899,  899,  893,  893,  893,  893,  893,
			  900,  901,  893,  902,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  893,
			  893,  893,  893,  893,  893,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  893,  893,  904,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  905,  905,

			  893,  905,  893,  906,  907,  893,  907,  893,  893,  893,
			  900,  893,  908,  909,  900,  900,  900,  900,  900,  900,
			  900,  900,  900,  900,  900,  900,  900,  900,  901,  893,
			  893,  893,  910,  893,  893,  893,  893,  893,  911,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  181,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  893,  893,  893,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  181,  903,  903,  903,  903,  903,  903,  903,
			  903,  904,  893,  912,  893,  893,  893,  893,  904,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  905,  893,
			  905,  893,  905,  905,  906,  893,  906,  893,  907,  893,
			  907,  893,  893,  908,  913,  893,  893,  893,  893,  893,
			  900,  893,  900,  893,  900,  900,  900,  900,  900,  900,
			  900,  893,  900,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  900,  900,  900,  900,  893,
			  900,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,

			  893,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  893,  904,

			  900,  893,  900,  893,  900,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  911,  893,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,

			  903,  900,  900,  900,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  914,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  900,  900,  900,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893,  893,  893,  903,  903,  903,

			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  900,  900,  900,
			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  903,  903,  903,  903,
			  903,  903,  903,  903,  903,  903,  900,  893,  893,  893,
			  893,  893,  893,  893,  903,  903,  903,  903,  903,  903,
			  903,  893,  893,    0,  893,  893,  893,  893,  893,  893,

			  893,  893,  893,  893,  893,  893,  893,  893,  893,  893,
			  893,  893,  893,  893,  893>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    8,    9,   10,    8,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,   20,
			   21,   21,   21,   21,   21,   21,   21,   21,   22,   23,
			   24,   25,   26,   27,    8,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,
			   43,   44,   45,   46,   47,   48,   49,   50,   51,   52,
			   53,   54,   55,   56,   57,   58,   59,   60,   61,   62,

			   63,   64,   65,   66,   67,   68,   37,   69,   70,   71,
			   72,   73,   74,   75,   76,   77,   78,   79,   80,   81,
			   82,   83,   84,   85,    8,   86,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    2,    4,    1,    5,    1,    1,
			    6,    7,    7,    8,    1,    1,    1,    1,    9,    7,
			   10,   11,    1,    1,   12,    1,   13,    1,   14,   14,
			   14,   15,   10,   16,   10,   17,   10,   10,   10,   18,
			   10,   19,   10,   10,   14,   14,   14,   14,   14,   20,
			   10,   10,   10,   21,    1,    1,    1,    1,   22,    1,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   23,    1,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    4,    5,    6,    8,   11,   13,
			   16,   19,   22,   25,   28,   31,   34,   37,   40,   43,
			   46,   49,   52,   56,   60,   63,   66,   69,   72,   75,
			   77,   80,   83,   86,   89,   92,   95,   98,  101,  104,
			  107,  110,  113,  116,  119,  122,  125,  128,  131,  134,
			  137,  139,  142,  145,  147,  150,  153,  156,  159,  162,
			  165,  168,  171,  174,  177,  180,  183,  186,  189,  192,
			  195,  198,  201,  204,  207,  209,  211,  213,  215,  217,
			  219,  221,  224,  226,  228,  230,  232,  234,  236,  238,

			  240,  242,  244,  246,  248,  250,  252,  254,  255,  256,
			  257,  258,  260,  261,  261,  262,  263,  264,  265,  266,
			  267,  268,  269,  270,  271,  272,  274,  275,  276,  277,
			  278,  279,  281,  282,  283,  284,  286,  287,  288,  288,
			  290,  292,  293,  294,  295,  296,  297,  298,  299,  300,
			  301,  302,  303,  305,  306,  307,  308,  309,  310,  311,
			  312,  314,  315,  316,  317,  318,  319,  320,  321,  323,
			  324,  325,  327,  328,  329,  330,  331,  332,  333,  335,
			  336,  337,  338,  339,  340,  341,  342,  343,  344,  345,
			  346,  347,  348,  349,  351,  352,  353,  354,  357,  358,

			  359,  360,  361,  362,  365,  366,  367,  368,  369,  370,
			  371,  374,  375,  376,  379,  380,  381,  382,  383,  384,
			  385,  388,  389,  390,  391,  392,  393,  394,  395,  396,
			  397,  398,  399,  400,  400,  401,  402,  403,  404,  406,
			  408,  410,  410,  411,  412,  412,  413,  413,  414,  415,
			  416,  417,  418,  419,  420,  421,  423,  424,  426,  427,
			  428,  429,  431,  434,  436,  437,  437,  440,  443,  446,
			  449,  450,  453,  454,  457,  458,  459,  460,  461,  462,
			  463,  464,  465,  466,  469,  470,  471,  472,  473,  474,
			  475,  476,  478,  479,  480,  481,  482,  483,  484,  485,

			  486,  487,  488,  489,  490,  491,  492,  493,  494,  495,
			  496,  497,  498,  499,  500,  501,  502,  503,  504,  505,
			  506,  507,  508,  509,  511,  511,  511,  512,  514,  515,
			  517,  519,  520,  521,  522,  524,  526,  528,  529,  530,
			  531,  532,  533,  534,  535,  536,  538,  539,  540,  541,
			  542,  543,  544,  545,  546,  547,  548,  549,  550,  551,
			  552,  553,  554,  556,  557,  559,  560,  561,  562,  563,
			  564,  565,  566,  567,  568,  569,  570,  571,  572,  573,
			  574,  575,  576,  577,  578,  579,  580,  582,  583,  586,
			  589,  590,  591,  592,  593,  594,  595,  596,  599,  600,

			  601,  602,  603,  604,  605,  606,  607,  608,  609,  610,
			  611,  612,  613,  614,  617,  618,  621,  622,  623,  624,
			  625,  626,  627,  628,  629,  630,  631,  632,  633,  634,
			  635,  636,  637,  638,  639,  642,  642,  642,  643,  645,
			  646,  647,  647,  650,  653,  656,  657,  658,  659,  660,
			  663,  664,  667,  668,  670,  672,  674,  676,  678,  679,
			  681,  683,  685,  687,  689,  691,  693,  695,  697,  699,
			  701,  703,  705,  707,  709,  711,  713,  715,  717,  719,
			  721,  723,  725,  727,  729,  731,  733,  735,  737,  739,
			  741,  741,  743,  743,  745,  745,  745,  745,  747,  749,

			  751,  752,  753,  754,  755,  756,  757,  758,  759,  760,
			  762,  763,  764,  765,  766,  767,  768,  770,  771,  772,
			  773,  774,  775,  776,  777,  778,  780,  781,  783,  784,
			  786,  787,  788,  789,  790,  791,  792,  793,  794,  795,
			  796,  797,  798,  799,  800,  802,  804,  807,  808,  809,
			  810,  811,  813,  814,  815,  816,  817,  818,  819,  820,
			  823,  824,  825,  826,  827,  828,  829,  832,  833,  834,
			  835,  836,  837,  838,  839,  842,  843,  846,  847,  850,
			  851,  852,  853,  854,  855,  856,  857,  858,  859,  860,
			  861,  862,  865,  868,  869,  870,  871,  872,  875,  875,

			  877,  878,  881,  882,  885,  886,  889,  890,  891,  893,
			  893,  893,  895,  895,  899,  899,  901,  901,  901,  903,
			  905,  907,  909,  910,  911,  912,  914,  915,  916,  917,
			  918,  919,  920,  922,  923,  924,  927,  928,  929,  931,
			  932,  933,  934,  936,  937,  938,  939,  940,  941,  942,
			  943,  944,  945,  946,  948,  949,  950,  951,  953,  954,
			  955,  957,  958,  961,  964,  967,  968,  969,  972,  973,
			  974,  975,  976,  977,  978,  981,  982,  983,  984,  985,
			  988,  989,  990,  991,  994,  995,  996,  997,  998,  999,
			 1000, 1001, 1002, 1003, 1006, 1007, 1008, 1011, 1012, 1013,

			 1016, 1017, 1018, 1019, 1020, 1021, 1021, 1023, 1023, 1024,
			 1025, 1029, 1029, 1029, 1031, 1031, 1032, 1032, 1034, 1035,
			 1036, 1037, 1038, 1040, 1042, 1043, 1045, 1046, 1047, 1049,
			 1050, 1051, 1052, 1053, 1054, 1055, 1056, 1058, 1059, 1060,
			 1061, 1063, 1064, 1066, 1068, 1071, 1073, 1074, 1075, 1077,
			 1078, 1081, 1082, 1083, 1084, 1087, 1090, 1091, 1094, 1095,
			 1096, 1099, 1100, 1101, 1102, 1103, 1104, 1105, 1106, 1109,
			 1110, 1111, 1114, 1115, 1118, 1121, 1124, 1125, 1126, 1129,
			 1130, 1131, 1132, 1133, 1133, 1134, 1134, 1134, 1134, 1138,
			 1138, 1139, 1140, 1140, 1140, 1141, 1142, 1143, 1144, 1146,

			 1149, 1150, 1151, 1152, 1154, 1156, 1157, 1159, 1161, 1162,
			 1163, 1164, 1165, 1166, 1167, 1169, 1170, 1171, 1173, 1174,
			 1177, 1178, 1179, 1180, 1183, 1186, 1187, 1190, 1193, 1194,
			 1195, 1196, 1197, 1198, 1201, 1202, 1203, 1206, 1207, 1208,
			 1209, 1210, 1210, 1211, 1211, 1213, 1213, 1213, 1214, 1215,
			 1215, 1216, 1218, 1220, 1222, 1224, 1226, 1227, 1229, 1230,
			 1231, 1233, 1234, 1236, 1238, 1241, 1244, 1247, 1250, 1253,
			 1254, 1257, 1258, 1261, 1262, 1265, 1268, 1269, 1272, 1275,
			 1276, 1278, 1278, 1280, 1281, 1283, 1285, 1288, 1290, 1293,
			 1296, 1299, 1302, 1304, 1304>>)
		end

	yy_acclist_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  233,  233,  236,  236,  268,  266,  267,    1,  266,
			  267,    2,  267,   16,  266,  267,  238,  266,  267,  161,
			  266,  267,   23,  266,  267,  205,  266,  267,   17,  266,
			  267,   18,  266,  267,    6,  266,  267,    5,  266,  267,
			   14,  266,  267,    4,  266,  267,   12,  266,  267,    7,
			  266,  267,  256,  259,  266,  267,  256,  259,  266,  267,
			   15,  266,  267,   13,  266,  267,   11,  266,  267,    9,
			  266,  267,   10,  266,  267,  266,  267,  160,  266,  267,
			  160,  266,  267,  160,  266,  267,  160,  266,  267,  160,
			  266,  267,  160,  266,  267,  160,  266,  267,  160,  266,

			  267,  160,  266,  267,  160,  266,  267,  160,  266,  267,
			  160,  266,  267,  160,  266,  267,  160,  266,  267,  160,
			  266,  267,  160,  266,  267,  160,  266,  267,  160,  266,
			  267,  160,  266,  267,   21,  266,  267,  266,  267,   22,
			  266,  267,    8,  266,  267,  266,  267,  186,  266,  267,
			  160,  266,  267,  160,  266,  267,  160,  266,  267,  160,
			  266,  267,  160,  266,  267,  160,  266,  267,  160,  266,
			  267,  160,  266,  267,  160,  266,  267,  160,  266,  267,
			  160,  266,  267,  160,  266,  267,  160,  266,  267,  160,
			  266,  267,  160,  266,  267,  160,  266,  267,  160,  266,

			  267,   19,  266,  267,   20,  266,  267,  245,  267,  249,
			  267,  246,  267,  248,  267,  254,  267,  254,  267,  253,
			  267,  252,  254,  267,  251,  267,  251,  267,  250,  267,
			  228,  267,  228,  267,  227,  267,  233,  267,  233,  267,
			  232,  267,  233,  267,  230,  267,  233,  267,  236,  267,
			  235,  267,  236,  267,    1,    2,   29,  238,  225,  237,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238, -493,  238,  238,  161,  205,  205,  204,
			  205,    3,   30,   31,  262,  265,   24,   26,  256,  259,
			  256,  259,  255,  259,   34,   32,   28,   27,   33,   35,

			  160,  160,  160,   43,  160,  160,  160,  160,  160,  160,
			  160,  160,   60,  160,  160,  160,  160,  160,  160,  160,
			  160,   85,  160,  160,  160,   99,  160,  160,  160,  160,
			  160,  160,  160,  115,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,   25,  258,
			  259,  258,  160,  160,   42,   43,  160,  160,  160,  160,
			  160,  160,   59,   60,  160,  160,  160,  160,  160,  160,
			  160,   84,   85,  160,  160,  160,   98,   99,  160,  160,
			  160,  160,  160,  160,  160,  114,  115,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  245,  246,

			  247,  247,  239,  247,  245,  247,  243,  247,  244,  247,
			  253,  252,  250,  227,  233,  232,  233,  230,  233,  233,
			  233,  231,  232,  233,  229,  230,  236,  235,  236,  234,
			  235,  224,  225,  237,  238, -493,  238,  208,  225,  237,
			  206,  225,  237,  207,  225,  237,  209,  225,  237,  238,
			  213,  225,  237,  238,  215,  225,  237,  238,  238,  238,
			  238,  238,  238,  238, -226,  238,  212,  225,  237,  162,
			  205,  205,  205,  205,  205,  205,  203,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,

			  205,  205,  205,  205,  205,  205,  205,  205,  163,  262,
			  265,  260,  262,  265,  260,  256,  259,  256,  259,  259,
			  259,  160,   39,  160,   41,  160,  159,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,   66,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  107,  160,  160,  111,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  158,  160,  160,   38,   39,  160,   40,   41,  160,  160,
			  160,  160,  160,  160,  160,  160,   65,   66,  160,  160,

			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  106,  107,  160,  160,  110,  111,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  157,
			  158,  160,  240,  239,  240,  242,  237,  210,  225,  237,
			  214,  225,  237,  216,  225,  237,  238,  238,  238,  238,
			  219,  225,  237,  238,  211,  225,  237,  201,  180,  201,
			  178,  201,  179,  201,  181,  201,  182,  201,  202,  183,
			  201,  184,  201,  164,  201,  165,  201,  166,  201,  167,
			  201,  168,  201,  169,  201,  170,  201,  171,  201,  172,

			  201,  173,  201,  174,  201,  175,  201,  176,  201,  177,
			  201,  187,  201,  188,  201,  189,  201,  190,  201,  191,
			  201,  192,  201,  193,  201,  194,  201,  195,  201,  196,
			  201,  197,  201,  198,  201,  199,  201,  200,  201,  262,
			  265,  262,  265,  262,  265,  261,  264,  256,  259,  256,
			  259,  259,  160,  160,  160,  160,  160,  160,  160,  160,
			   62,  160,  160,  160,  160,  160,  160,  160,   81,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  101,  160,
			  160,  105,  160,  160,  113,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,

			  143,  160,  146,  160,  145,  146,  160,  160,  160,  160,
			  160,  156,  160,  160,  160,  160,  160,  160,  160,  160,
			   61,   62,  160,  160,  160,  160,  160,  160,  160,   80,
			   81,  160,  160,  160,  160,  160,  160,  160,  160,  100,
			  101,  160,  160,  104,  105,  160,  160,  112,  113,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  142,  143,  160,  144,  146,  160,  160,  160,
			  160,  160,  155,  156,  160,  241,  245,  238,  218,  225,
			  237,  238,  217,  225,  237,  238,  220,  225,  237,  205,
			  262,  262,  265,  262,  265,  261,  262,  264,  265,  261,

			  264,  257,  259,   37,  160,   45,  160,   47,  160,  160,
			  160,  160,   56,  160,  160,  160,  160,  160,  160,  160,
			   77,  160,  160,  160,   76,   77,  160,  160,  160,   91,
			  160,  160,  160,  160,  103,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  135,  160,  160,  160,
			  160,  141,  160,  160,  160,  152,  160,  160,   36,   37,
			  160,   44,   45,  160,   46,   47,  160,  160,  160,   55,
			   56,  160,  160,  160,  160,  160,  160,  160,   75,   77,
			  160,  160,  160,  160,  160,   90,   91,  160,  160,  160,
			  160,  102,  103,  160,  160,  160,  160,  160,  160,  160,

			  160,  160,  160,  134,  135,  160,  160,  160,  140,  141,
			  160,  160,  160,  151,  152,  160,  160,  238,  238,  238,
			  185,  262,  265,  265,  262,  261,  262,  264,  265,  261,
			  264,  260,   49,  160,  160,  160,  160,  160,   64,  160,
			   68,  160,  160,   72,  160,  160,  160,   83,  160,  160,
			  160,  160,  160,  160,  160,  160,  120,  160,  160,  160,
			  160,  126,  160,  160,  130,  160,  133,  160,  132,  133,
			  160,  137,  160,  160,  160,  150,  160,  160,   48,   49,
			  160,  160,  160,  160,   63,   64,  160,   67,   68,  160,
			  160,   71,   72,  160,  160,  160,   82,   83,  160,  160,

			  160,  160,  160,  160,  160,  160,  119,  120,  160,  160,
			  160,  125,  126,  160,  160,  129,  130,  160,  131,  133,
			  160,  136,  137,  160,  160,  160,  149,  150,  160,  160,
			  238,  238,  238,  262,  261,  262,  264,  265,  265,  261,
			  263,  265,  263,  160,   54,  160,   53,   54,  160,  160,
			  160,  160,   79,  160,   87,  160,  160,   93,  160,   95,
			  160,  160,  160,  160,  160,  160,  160,  128,  160,  160,
			  160,  154,  160,  160,   52,   54,  160,  160,  160,  160,
			   78,   79,  160,   86,   87,  160,  160,   92,   93,  160,
			   94,   95,  160,  160,  160,  160,  160,  160,  127,  128,

			  160,  160,  160,  153,  154,  160,  238,  238,  238,  265,
			  265,  261,  262,  264,  265,  264,   51,  160,   58,  160,
			   70,  160,   74,  160,   89,  160,  160,  109,  160,  160,
			  160,  122,  160,  160,  139,  160,  148,  160,   50,   51,
			  160,   57,   58,  160,   69,   70,  160,   73,   74,  160,
			   88,   89,  160,  160,  108,  109,  160,  160,  121,  122,
			  160,  160,  138,  139,  160,  147,  148,  160,  238,  223,
			  225,  237,  222,  225,  237,  265,  264,  265,  264,  265,
			  264,   97,  160,  118,  160,  117,  118,  160,  124,  160,
			   96,   97,  160,  116,  118,  160,  123,  124,  160,  221,

			  225,  237,  264,  265>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 2488
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 893
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 894
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is true
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is true
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 267
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 268
			-- End of buffer rule code

	yyLine_used: BOOLEAN is true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	MS: INTEGER is 1
	MSN: INTEGER is 2
	MSN1: INTEGER is 3
	VS1: INTEGER is 4
	VS2: INTEGER is 5
	VS3: INTEGER is 6
			-- Start condition codes

feature -- User-defined features



end -- class ET_EIFFEL_PREPARSER
