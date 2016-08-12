signature AST =
sig
  type 'i operator
  type 'a spine

  structure P : ABT_PARAM

  type symbol = string
  type variable = string
  type param = symbol P.t
  type metavariable

  datatype ast =
      ` of variable
    | $ of param operator * abs spine
    | $# of metavariable * (param spine * ast spine)
  and abs = \ of (symbol spine * variable spine) * ast

  val toString : ast -> string
end

signature AST_ABT =
sig
  structure Abt : ABT
  structure Ast : AST

  sharing type Ast.operator = Abt.O.t
  sharing type Ast.metavariable = Abt.Metavar.t
  sharing type Ast.spine = Abt.O.Ar.Vl.Sp.t
  sharing type Ast.P.t = Abt.O.P.t
end

signature AST_TO_ABT =
sig
  include AST_ABT

  structure NameEnv : DICT where type key = string

  (* convert a closed ast to an abt *)
  val convert
    : Abt.metactx
    -> Ast.ast * Abt.sort
    -> Abt.abt

  (* convert an open ast to an abt *)
  val convertOpen
    : Abt.metactx
    -> Abt.symbol NameEnv.dict * Abt.variable NameEnv.dict
    -> Ast.ast * Abt.sort
    -> Abt.abt
end
