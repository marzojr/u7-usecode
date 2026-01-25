// Simplified syntax for Usecode C (*.uc) files.

%define parse.lac full
%define parse.error detailed

%union {
	class Uc_symbol *sym;
	class Uc_var_symbol *var;
	class Uc_class *cls;
	class Uc_struct_symbol *struc;
	class Uc_expression *expr;
	class Uc_call_expression *funcall;
	class Uc_function_symbol *funsym;
	class Uc_statement *stmt;
	class std::vector<Uc_var_symbol *> *varvec;
	class Uc_block_statement *block;
	class Uc_array_expression *exprlist;
	class Uc_label_statement *label;
	class std::vector<int> *intlist;
	class std::vector<Uc_statement *> *stmtlist;
	struct Fun_id_info *funid;
	struct Member_selector *membersel;
	struct Loop_Init *loopinit;
	struct Loop_Vars *loopvars;
	int intval;
	char *strval;
}

%token IF "'if'"
%token ELSE "'else'"
%token RETURN "'return'"
%token DO "'do'"
%token WHILE "'while'"
%token FOR "'for'"
%token WITH "'with'"
%token TO "'to'"
%token EXTERN "'extern'"
%token DECLARE_ "'declare'"
%token BREAK "'break'"
%token GOTO "'goto'"
%token CASE "'case'"
%token VAR "'var'"
%token VOID "'void'"
%token ALIAS "'alias'"
%token STRUCT "'struct'"
%token UCC_CHAR "'char'"
%token UCC_BYTE "'byte'"
%token UCC_INT "'int'"
%token UCC_LONG "'long'"
%token UCC_CONST "'const'"
%token STRING "'string'"
%token ENUM "'enum'"
%token CONVERSE "'converse'"
%token NESTED "'nested'"
%token SAY "'say'"
%token MESSAGE "'message'"
%token RESPONSE "'response'"
%token EVENT "'event'"
%token FLAG "'gflags'"
%token ITEM "'item'"
%token UCTRUE "'true'"
%token UCFALSE "'false'"
%token REMOVE "'remove'"
%token ADD "'add'"
%token HIDE "'hide'"
%token SCRIPT "'script'"
%token AFTER "'after'"
%token TICKS "'ticks'"
%token STATIC_ "'static'"
%token ORIGINAL "'original'"
%token SHAPENUM "'shape#'"
%token OBJECTNUM "'object#'"
%token IDNUM "'id#'"
%token CLASS "'class'"
%token RUNSCRIPT "'runscript'"
%token SWITCH "'switch'"
%token DEFAULT "'default'"
%token FALLTHROUGH "'fallthrough'"
%token ALWAYS "'always'"
%token CHOICE "'user_choice'"
%token TRY "'try'"
%token CATCH "'catch'"
%token ABORT "'abort'"
%token THROW "'throw'"
%token ATTEND "'attend'"
%token ENDCONV "'endconv'"

%token NOBREAK "'nobreak'"
%token CONTINUE "'continue'"
%token REPEAT "'repeat'"
%token NOP "'nop'"
%token NOHALT "'nohalt'"
%token WAIT "'wait'"
%token RISE "'rise'"
%token DESCEND "'descend'"
%token FRAME "'frame'"
%token HATCH "'hatch'"
%token NEXT "'next'"
%token PREVIOUS "'previous'"
%token CYCLE "'cycle'"
%token STEP "'step'"
%token MUSIC "'music'"
%token CALL "'call'"
%token SPEECH "'speech'"
%token SFX "'sfx'"
%token FACE "'face'"
%token HIT "'hit'"
%token HOURS "'hours'"
%token ACTOR "'actor'"
%token ATTACK "'attack'"
%token FINISH "'finish'"
%token RESURRECT "'resurrect'"
%token SETEGG "'setegg'"
%token MINUTES "'minutes'"
%token RESET "'reset'"
%token WEATHER "'weather'"
%token NEAR "'near'"
%token FAR "'far'"
%token NORTH "'north'"
%token SOUTH "'south'"
%token EAST "'east'"
%token WEST "'west'"
%token NE "'ne'"
%token NW "'nw'"
%token SE "'se'"
%token SW "'sw'"
%token NOP2 "'nop2'"
%token RAW "'raw'"
%token STANDING "'standing'"
%token STEP_RIGHT "'step_right'"
%token STEP_LEFT "'step_left'"
%token READY "'ready'"
%token RAISE_1H "'raise_1h'"
%token REACH_1H "'reach_1h'"
%token STRIKE_1H "'strike_1h'"
%token RAISE_2H "'raise_2h'"
%token REACH_2H "'reach_2h'"
%token STRIKE_2H "'strike_2h'"
%token SITTING "'sitting'"
%token BOWING "'bowing'"
%token KNEELING "'kneeling'"
%token SLEEPING "'sleeping'"
%token CAST_UP "'cast_up'"
%token CAST_OUT "'cast_out'"
%token CACHED_IN "'cached_in'"
%token PARTY_NEAR "'party_near'"
%token AVATAR_NEAR "'avatar_near'"
%token AVATAR_FAR "'avatar_far'"
%token AVATAR_FOOTPAD "'avatar_footpad'"
%token PARTY_FOOTPAD "'party_footpad'"
%token SOMETHING_ON "'something_on'"
%token EXTERNAL_CRITERIA "'external_criteria'"
%token NORMAL_DAMAGE "'normal_damage'"
%token FIRE_DAMAGE "'fire_damage'"
%token MAGIC_DAMAGE "'magic_damage'"
%token LIGHTNING_DAMAGE "'lightning_damage'"
%token POISON_DAMAGE "'poison_damage'"
%token STARVATION_DAMAGE "'starvation_damage'"
%token FREEZING_DAMAGE "'freezing_damage'"
%token ETHEREAL_DAMAGE "'ethereal_damage'"
%token SONIC_DAMAGE "'sonic_damage'"
%token FOREVER "'forever'"
%token BREAKABLE "'breakable'"

%token UCC_INSERT "'<<'"
%token ADD_EQ "'+='"
%token SUB_EQ "'-='"
%token MUL_EQ "'*='"
%token DIV_EQ "'/='"
%token MOD_EQ "'%='"
%token AND_EQ "'&='"
%token AND "'&&'"
%token OR "'||'"
%token EQUALS "'=='"
%token NEQUALS "'!='"
%token LTEQUALS "'<='"
%token GTEQUALS "'>='"
%token UCC_IN "'in'"
%token NOT "'!'"
%token ADDRESSOF "'&'"
%token UMINUS "'-'"
%token UPLUS "'+'"
%token NEW "'new'"
%token DELETE "'delete'"
%token UCC_POINTS "'->'"
%token UCC_SCOPE "'::'"

%token <strval> STRING_LITERAL "string literal"
%token <strval> STRING_PREFIX "string prefix"
%token <strval> IDENTIFIER "identifier"
%token <intval> INT_LITERAL "integer"

%precedence IF
%precedence ELSE

%precedence LOOP
%precedence NOBREAK

%left UCC_INSERT ADD_EQ SUB_EQ MUL_EQ DIV_EQ MOD_EQ AND_EQ '='
%left AND OR
%left EQUALS NEQUALS
%left LTEQUALS GTEQUALS '<' '>' UCC_IN
%left '-' '+' '&'
%left '*' '/' '%'
%right NOT ADDRESSOF UMINUS UPLUS NEW DELETE UCC_CAST
%left UCC_SYM
%left UCC_POINTS '.' '(' ')' '[' ']'
%left UCC_SCOPE

%type <expr> expression primary declared_var_value opt_script_delay item
%type <expr> script_command start_call new_expr class_expr
%type <expr> nonclass_expr opt_delay appended_element int_literal
%type <expr> opt_primary_expression conv_expression repeat_count
%type <intval> direction converse_options actor_frames egg_criteria
%type <intval> opt_original assignment_operator const_int_val opt_const_int_val
%type <intval> const_int_type int_cast dam_type opt_nest opt_int_value
%type <intval> sign_int_literal const_int_expr opt_const_int_expr addressof
%type <funid> opt_funid
%type <membersel> member_selector
%type <intlist> string_list response_expression
%type <sym> declared_sym
%type <var> declared_var param
%type <cls> opt_inheritance defined_class
%type <struc> defined_struct
%type <funsym> function_proto function_decl
%type <varvec> param_list opt_param_list
%type <stmt> statement assignment_statement if_statement while_statement
%type <stmt> statement_block return_statement function_call_statement
%type <stmt> special_method_call_statement trycatch_statement trystart_statement
%type <stmt> try_statement simple_statement noncase_statement simple_or_if_statement
%type <stmt> array_loop_statement var_decl var_decl_list stmt_declaration
%type <stmt> class_decl class_decl_list struct_decl_list struct_decl
%type <stmt> break_statement converse_statement opt_nobreak opt_nobreak_do
%type <stmt> converse_case switch_case script_statement switch_statement
%type <stmt> goto_statement answer_statement delete_statement opt_nobreak_conv
%type <stmt> continue_statement response_case fallthrough_statement
%type <stmt> scoped_statement converse_case_attend
%type <stmt> array_enum_statement opt_trailing_label
%type <block> statement_list noncase_statement_list
%type <label> label_statement
%type <loopvars> start_array_variables
%type <loopinit> start_array_loop
%type <exprlist> opt_expression_list expression_list script_command_list
%type <exprlist> opt_nonclass_expr_list nonclass_expr_list appended_element_list
%type <stmtlist> switch_case_list converse_case_list response_case_list
%type <funcall> function_call script_expr run_script_expression
%type <strval> string_literal string_prefix

%%

design:
	design global_decl
	| global_decl
	;

global_decl:
	function
	| function_decl
	| const_int_decl
	| enum_decl
	| static_decl
	| class_definition
	| struct_definition
	;

class_definition:
	CLASS IDENTIFIER opt_inheritance '{' class_item_list '}'
	;

opt_inheritance:
	':' defined_class
	| %empty
	;

class_item_list:
	class_item_list class_item
	| %empty
	;

class_item:
	VAR class_var_def
	| VAR alias_tok IDENTIFIER '=' declared_var ';'
	| STRUCT '<' defined_struct '>' class_struct_def
	| STRUCT '<' defined_struct '>' alias_tok IDENTIFIER '=' declared_var ';'
	| CLASS '<' defined_class '>' method
	| opt_void method
	;

class_var_def:
	var_decl_list ';'
	| method
	;

class_struct_def:
	struct_decl_list ';'
	| method
	;

method:
	IDENTIFIER '(' opt_param_list ')'
	function_body
	;

struct_definition:
	STRUCT IDENTIFIER '{' struct_item_list '}'
	;

struct_item_list:
	struct_item_list struct_item
	| %empty
	;

struct_item:
	VAR IDENTIFIER ';'
	| STRUCT '<' defined_struct '>' ';'
	| STRUCT '<' defined_struct '>' IDENTIFIER ';'
	;

function:
	function_proto function_body
	;

opt_trailing_label:
	label_statement
	| %empty
	;

function_body:
	'{' statement_list opt_trailing_label '}'
	;

function_proto:
	ret_type IDENTIFIER opt_funid '(' opt_param_list ')'
	| CLASS '<' defined_class '>' IDENTIFIER opt_const_int_val '(' opt_param_list ')'
	;

opt_funid:
	SHAPENUM '(' const_int_expr ')'
	| OBJECTNUM '(' opt_const_int_expr ')'
	| opt_const_int_val
	| IDNUM '(' const_int_expr ')'
	;

opt_const_int_expr:
	const_int_expr
	| %empty
	;

const_int_expr:
	const_int_val
	| const_int_expr '+' const_int_expr
	| const_int_expr '-' const_int_expr
	| const_int_expr '*' const_int_expr
	| const_int_expr '/' const_int_expr
	| const_int_expr '%' const_int_expr
	| const_int_expr EQUALS const_int_expr
	| const_int_expr NEQUALS const_int_expr
	| const_int_expr '<' const_int_expr
	| const_int_expr LTEQUALS const_int_expr
	| const_int_expr '>' const_int_expr
	| const_int_expr GTEQUALS const_int_expr
	| const_int_expr AND const_int_expr
	| const_int_expr OR const_int_expr
	| NOT const_int_expr
	| '(' const_int_expr ')'
	| addressof
	;

opt_const_int_val:
	const_int_val
	| %empty
	;

const_int_val:
	sign_int_literal
	| IDENTIFIER
	;

statement_block:
	statement_block_start statement_list opt_trailing_label '}'
	| label_statement statement
	;

statement_block_start:
	'{'
	;

statement_list:
	statement_list statement
	| %empty
	;

noncase_statement_list:
	noncase_statement_list noncase_statement
	| %empty
	;

simple_or_if_statement:
	simple_statement
	| if_statement
	;

simple_statement:
	stmt_declaration
	| assignment_statement
	| trycatch_statement
	| while_statement
	| array_loop_statement
	| array_enum_statement
	| function_call_statement
	| special_method_call_statement
	| return_statement
	| converse_statement
	| switch_statement
	| script_statement
	| break_statement
	| continue_statement
	| fallthrough_statement
	| goto_statement
	| delete_statement
	| SAY  '(' opt_nonclass_expr_list ')' ';'
	| MESSAGE '(' opt_nonclass_expr_list ')' ';'
	| answer_statement
	| ENDCONV ';'
	| throwabort_statement ';'
	| throwabort_statement expression ';'
	| ';'
	;

statement:
	simple_or_if_statement
	| statement_block
	| converse_case_attend
	;

noncase_statement:
	simple_or_if_statement
	| statement_block
	;

throwabort_statement:
	ABORT
	| THROW
	;

alias_tok:
	ALIAS
	| '&'
	;

stmt_declaration:
	DECLARE_ VAR IDENTIFIER ';'
	| DECLARE_ STRUCT '<' defined_struct '>' IDENTIFIER ';'
	| DECLARE_ CLASS '<' defined_class '>' IDENTIFIER ';'
	| VAR var_decl_list ';'
	| VAR alias_tok IDENTIFIER '=' declared_var ';'
	| STRUCT '<' defined_struct '>' struct_decl_list ';'
	| STRUCT '<' defined_struct '>' alias_tok IDENTIFIER '=' declared_var ';'
	| CLASS '<' defined_class '>' class_decl_list ';'
	| CLASS '<' defined_class '>' alias_tok IDENTIFIER '=' declared_var ';'
	| STRING string_decl_list opt_comma ';'
	| const_int_decl
	| enum_decl
	| function_decl
	| static_decl
	;

var_decl_list:
	var_decl_list ',' var_decl
	| var_decl
	;

opt_comma:
	','
	| %empty
	;

enum_decl:
	ENUM IDENTIFIER opt_enum_type '{' enum_item_list opt_comma '}' ';'
	;

const_int_type:
	UCC_INT
	| UCC_CHAR
	| UCC_BYTE
	| UCC_LONG
	| UCC_LONG UCC_INT
	;

opt_enum_type:
	':' const_int_type
	| %empty
	;

enum_item_list:
	enum_item_list ',' enum_item
	| enum_item
	;

enum_item:
	const_int
	| IDENTIFIER
	;

const_int_decl:
	UCC_CONST const_int_type const_int_decl_list opt_comma ';'
	;

const_int_decl_list:
	const_int_decl_list ',' const_int
	| const_int
	;

const_int:
	IDENTIFIER '=' const_int_expr
	| IDENTIFIER '=' int_cast const_int_expr
	;

var_decl:
	IDENTIFIER
	| IDENTIFIER '=' nonclass_expr
	| IDENTIFIER '=' script_expr
	;

class_decl_list:
	class_decl_list ',' class_decl
	| class_decl
	;

class_decl:
	IDENTIFIER
	| IDENTIFIER '=' class_expr
	;

struct_decl_list:
	struct_decl_list ',' struct_decl
	| struct_decl
	;

struct_decl:
	IDENTIFIER
	| IDENTIFIER '=' nonclass_expr
	;


class_expr:
	new_expr
	| IDENTIFIER
	| function_call
	;

static_decl:
	STATIC_ VAR static_var_decl_list ';'
	| STATIC_ STRUCT '<' defined_struct '>'
		static_struct_var_decl_list ';'
	| STATIC_ CLASS '<' defined_class '>'
		static_cls_decl_list ';'
	;

static_var_decl_list:
	static_var
	| static_var_decl_list ',' static_var
	;

static_var:
	IDENTIFIER
	;

static_struct_var_decl_list:
	static_struct_var
	| static_struct_var_decl_list ',' static_struct_var
	;

static_struct_var:
	IDENTIFIER
	;

static_cls_decl_list:
	static_cls
	| static_cls_decl_list ',' static_cls
	;

static_cls:
	IDENTIFIER
	;

string_literal:
	string_literal STRING_LITERAL
	| STRING_LITERAL
	;

string_prefix:
	string_literal STRING_PREFIX
	| STRING_PREFIX
	;

string_decl_list:
	string_decl_list ',' string_decl
	| string_decl
	;

string_decl:
	IDENTIFIER '=' string_literal
	;

function_decl:
	EXTERN function_proto ';'
	;

assignment_statement:
	expression '=' expression ';'
	| expression '=' script_expr ';'
	| nonclass_expr assignment_operator nonclass_expr ';'
	| nonclass_expr UCC_INSERT appended_element_list ';'
	;

assignment_operator:
	ADD_EQ
	| SUB_EQ
	| MUL_EQ
	| DIV_EQ
	| MOD_EQ
	| AND_EQ
	;

appended_element_list:
	appended_element_list UCC_INSERT appended_element
	| appended_element
	;

appended_element:
	nonclass_expr
	| '{' script_command_list '}'
	;

scoped_statement:
	statement_block_start statement_list opt_trailing_label '}'
	| simple_statement
	| if_statement
	;

if_statement:
	IF '(' expression ')' scoped_statement %prec IF
	| IF '(' expression ')' scoped_statement ELSE scoped_statement
	;

trycatch_statement:
	trystart_statement '{' statement_list opt_trailing_label '}'
	;

trystart_statement:
	try_statement statement_list opt_trailing_label '}' CATCH '(' ')'
	| try_statement statement_list opt_trailing_label '}' CATCH '(' IDENTIFIER ')'
	;

try_statement:
	TRY '{'
	;

opt_nobreak:
	NOBREAK statement_block
	| %empty %prec LOOP
	;

opt_nobreak_do:
	NOBREAK statement_block
	| ';' %prec LOOP
	;

opt_nobreak_conv:
	NOBREAK statement_block
	| %empty %prec LOOP
	;

while_statement:
	WHILE '(' nonclass_expr ')' scoped_statement opt_nobreak
	| FOREVER scoped_statement opt_nobreak
	| DO scoped_statement WHILE '(' nonclass_expr ')' opt_nobreak_do
	| BREAKABLE scoped_statement opt_nobreak
	;

array_enum_statement:
	ENUM '(' ')' ';'
	;

array_loop_statement:
	start_array_variables scoped_statement opt_nobreak
	| start_array_variables ATTEND IDENTIFIER ';'
	;

start_array_variables:
	start_array_loop ')'
	| start_array_loop WITH IDENTIFIER ')'
	| start_array_loop WITH IDENTIFIER TO IDENTIFIER ')'
	;

start_array_loop:
	start_for IDENTIFIER UCC_IN declared_var
	;

start_for:
	FOR '('
	;

function_call_statement:
	function_call ';'
	;

special_method_call_statement:
	primary hierarchy_tok SAY '(' opt_nonclass_expr_list ')' ';'
	| primary hierarchy_tok HIDE '(' ')' ';'
	| run_script_expression ';'
	;

run_script_expression:
	opt_primary_expression RUNSCRIPT '(' nonclass_expr opt_delay ')'
	;

opt_delay:
	',' nonclass_expr
	| %empty
	;

return_statement:
	RETURN expression ';'
	| RETURN ';'
	;

opt_nest:
	':' NESTED
	| %empty
	;

converse_statement:
	CONVERSE start_conv noncase_statement_list response_case_list '}' opt_nobreak_conv
	| CONVERSE opt_nest conv_expression start_conv noncase_statement_list converse_case_list '}' opt_nobreak_conv
	| CONVERSE ATTEND IDENTIFIER ';'
	;

start_conv:
	'{'
	;

conv_expression:
	'(' expression ')'
	;

converse_case_list:
	converse_case_list converse_case
	| %empty
	;

converse_case:
	CASE declared_var_value converse_options ':' noncase_statement_list
	| CASE string_list converse_options ':' noncase_statement_list
	| ALWAYS ':' noncase_statement_list
	| DEFAULT ':' noncase_statement_list
	;

opt_int_value:
	'(' int_literal ')'
	| %empty
	;

converse_case_attend:
	CASE declared_var_value converse_options ATTEND IDENTIFIER ':'
	| CASE string_list converse_options ATTEND IDENTIFIER ':'
	| DEFAULT opt_int_value ATTEND IDENTIFIER ':'
	;

response_case_list:
	response_case_list ELSE response_case
	| response_case %prec IF
	;

response_case:
	response_expression statement_list
	;

response_expression:
	IF '(' RESPONSE EQUALS string_literal ')'
	| IF '(' RESPONSE UCC_IN '[' string_list ']' ')'
	;

string_list:
	string_list ',' string_literal
	| string_literal
	;

converse_options:
	'(' REMOVE ')'
	| %empty
	;

switch_statement:
	SWITCH '(' expression ')' '{' switch_case_list '}'
	;

switch_case_list:
	switch_case_list switch_case
	| switch_case
	;

switch_case:
	CASE int_literal ':' noncase_statement_list
	| CASE string_literal ':' noncase_statement_list
	| DEFAULT ':' noncase_statement_list
	;

script_expr:
	SCRIPT item opt_script_delay script_command
	;

script_statement:
	script_expr
	;

item:
	nonclass_expr
	;

script_command_list:
	script_command_list script_command
	| script_command
	;

script_command:
	FINISH ';'
	| RESURRECT ';'
	| CONTINUE ';'
	| RESET ';'
	| REPEAT repeat_count script_command  ';'
	| REPEAT nonclass_expr ',' nonclass_expr script_command  ';'
	| RAW '(' int_literal ')' ';'
	| NOP  ';'
	| NOP2 ';'
	| NOHALT  ';'
	| WAIT nonclass_expr  ';'
	| WAIT nonclass_expr MINUTES  ';'
	| WAIT nonclass_expr HOURS  ';'
	| WAIT WHILE NEAR nonclass_expr ';'
	| WAIT WHILE FAR nonclass_expr ';'
	| REMOVE ';'
	| RISE ';'
	| DESCEND ';'
	| FRAME nonclass_expr ';'
	| ACTOR FRAME nonclass_expr ';'
	| ACTOR FRAME actor_frames ';'
	| HATCH ';'
	| SETEGG nonclass_expr ',' nonclass_expr ';'
	| SETEGG egg_criteria ',' nonclass_expr ';'
	| NEXT FRAME ';'
	| NEXT FRAME CYCLE ';'
	| PREVIOUS FRAME ';'
	| PREVIOUS FRAME CYCLE ';'
	| SAY nonclass_expr ';'
	| STEP nonclass_expr ';'
	| STEP nonclass_expr ',' nonclass_expr ';'
	| STEP direction ';'
	| MUSIC nonclass_expr ';'
	| MUSIC nonclass_expr ',' nonclass_expr ';'
	| start_call ';'
	| start_call ',' nonclass_expr ';'
	| SPEECH nonclass_expr ';'
	| SFX nonclass_expr ';'
	| FACE nonclass_expr ';'
	| FACE direction ';'
	| WEATHER nonclass_expr ';'
	| HIT nonclass_expr ',' nonclass_expr ';'
	| HIT nonclass_expr ',' dam_type ';'
	| ATTACK ';'
	| declared_var_value ';'
	| '{' script_command_list '}'
	;

start_call:
	CALL nonclass_expr
	;

repeat_count:
	nonclass_expr
	| FOREVER
	;

dam_type:
	NORMAL_DAMAGE
	| FIRE_DAMAGE
	| MAGIC_DAMAGE
	| LIGHTNING_DAMAGE
	| POISON_DAMAGE
	| STARVATION_DAMAGE
	| FREEZING_DAMAGE
	| ETHEREAL_DAMAGE
	| SONIC_DAMAGE
	;

direction:
	NORTH
	| NE
	| EAST
	| SE
	| SOUTH
	| SW
	| WEST
	| NW
	;

actor_frames:
	STANDING
	| STEP_RIGHT
	| STEP_LEFT
	| READY
	| RAISE_1H
	| REACH_1H
	| STRIKE_1H
	| RAISE_2H
	| REACH_2H
	| STRIKE_2H
	| SITTING
	| BOWING
	| KNEELING
	| SLEEPING
	| CAST_UP
	| CAST_OUT
	;

egg_criteria:
	CACHED_IN
	| PARTY_NEAR
	| AVATAR_NEAR
	| AVATAR_FAR
	| AVATAR_FOOTPAD
	| PARTY_FOOTPAD
	| SOMETHING_ON
	| EXTERNAL_CRITERIA
	;

opt_script_delay:
	AFTER nonclass_expr TICKS
	| %empty
	;

break_statement:
	BREAK ';'
	| BREAK IDENTIFIER ';'
	;

continue_statement:
	CONTINUE ';'
	| CONTINUE IDENTIFIER ';'
	;

fallthrough_statement:
	FALLTHROUGH ';'
	;

label_statement:
	IDENTIFIER ':'
	;

goto_statement:
	GOTO IDENTIFIER
	;

delete_statement:
	DELETE declared_var ';'
	;

answer_statement:
	ADD '(' nonclass_expr_list ')' ';'
	| REMOVE '(' nonclass_expr_list ')' ';'
	;

opt_nonclass_expr_list:
	nonclass_expr_list
	| %empty
	;

nonclass_expr_list:
	nonclass_expr_list ',' nonclass_expr
	| nonclass_expr
	;

nonclass_expr:
	expression
	;

expression:
	primary
	| nonclass_expr '+' nonclass_expr
	| nonclass_expr '-' nonclass_expr
	| nonclass_expr '*' nonclass_expr
	| nonclass_expr '/' nonclass_expr
	| nonclass_expr '%' nonclass_expr
	| nonclass_expr EQUALS nonclass_expr
	| NEW SCRIPT script_command
	| CHOICE
	| nonclass_expr NEQUALS nonclass_expr
	| nonclass_expr '<' nonclass_expr
	| nonclass_expr LTEQUALS nonclass_expr
	| nonclass_expr '>' nonclass_expr
	| nonclass_expr GTEQUALS nonclass_expr
	| nonclass_expr AND nonclass_expr
	| nonclass_expr OR nonclass_expr
	| nonclass_expr UCC_IN nonclass_expr
	| nonclass_expr '&' nonclass_expr
	| '+' primary %prec UPLUS
	| '-' primary %prec UMINUS
	| addressof
	| NOT primary
	| '[' opt_expression_list ']'
	| string_literal
	| string_prefix
	| new_expr
	| run_script_expression
	;

addressof:
	'&' IDENTIFIER %prec ADDRESSOF
	| '&' STRUCT '<' defined_struct '>' UCC_SCOPE IDENTIFIER
	;

opt_expression_list:
	expression_list opt_comma
	| %empty
	;

expression_list:
	expression_list ',' expression
	| expression
	;

int_cast:
	'(' const_int_type ')'
	;

primary:
	INT_LITERAL
	| int_cast INT_LITERAL %prec UCC_CAST
	| member_selector
	| declared_var_value
	| declared_var '[' expression ']'
	| FLAG '[' nonclass_expr ']'
	| function_call
	| UCTRUE
	| UCFALSE
	| EVENT
	| ITEM
	| '(' expression ')'
	;

new_expr:
	NEW defined_class '(' opt_nonclass_expr_list ')'
	;

hierarchy_tok:
	UCC_POINTS
	| '.'
	;

member_selector:
	primary hierarchy_tok IDENTIFIER
	;

opt_primary_expression:
	primary hierarchy_tok
	| %empty
	;

function_call:
	member_selector opt_original '(' opt_expression_list ')'
	| IDENTIFIER opt_original '(' opt_expression_list ')'
	| primary hierarchy_tok defined_class UCC_SCOPE IDENTIFIER '(' opt_expression_list ')'
	| defined_class UCC_SCOPE IDENTIFIER '(' opt_expression_list ')'
	| primary hierarchy_tok '(' '*' primary ')' '(' opt_expression_list ')'
	| '(' '*' primary ')' '(' opt_expression_list ')'
	| primary hierarchy_tok '(' '@' int_literal ')' '(' opt_expression_list ')'
	| '(' '@' int_literal ')' '(' opt_expression_list ')'
	;

opt_original:
	ORIGINAL
	| %empty
	;

opt_param_list:
	param_list
	| %empty
	;

param_list:
	param_list ',' param
	| param
	;

param:
	IDENTIFIER
	| VAR IDENTIFIER
	| STRUCT '<' defined_struct '>' IDENTIFIER
	| CLASS '<' defined_class '>' IDENTIFIER
	;

sign_int_literal:
	INT_LITERAL
	| '-' INT_LITERAL %prec UMINUS
	| '+' INT_LITERAL %prec UPLUS
	;

int_literal:
	sign_int_literal
	| int_cast sign_int_literal %prec UCC_CAST
	| declared_sym
	| UCTRUE
	| UCFALSE
	;

opt_void:
	VOID
	| %empty
	;

ret_type:
	VAR
	| STRUCT '<' defined_struct '>'
	| opt_void
	;

declared_var_value:
	declared_sym %prec UCC_SYM
	;

declared_var:
	declared_sym %prec UCC_SYM
	;

declared_sym:
	IDENTIFIER
	;

defined_class:
	IDENTIFIER
	;

defined_struct:
	IDENTIFIER
	;
