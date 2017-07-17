signature LN_SCOPE =
sig
  type 'a scope

  type metavariable
  type variable
  type symbol

  type sort
  type psort
  type valence = (psort list * sort list) * sort

  exception Instantiate

  type ('m, 'p, 'a) binding_support = 
    {abstract: int * int * int -> symbol list * variable list * metavariable list -> 'a -> 'a,
     instantiate: int * int * int -> 'a -> 'p list * 'm list * 'm scope list -> 'a,
     freeVariable : variable * sort -> 'm,
     freeSymbol : symbol -> 'p}

  val scopeBindingSupport : ('m, 'p, 'a) binding_support -> ('m, 'p, 'a scope) binding_support

  datatype ('s, 'v, 'a) scope_view = \ of ('s list * 'v list) * 'a

  val eq : ('a * 'a -> bool) -> 'a scope * 'a scope -> bool

  val intoScope : ('m, 'p, 'a) binding_support -> (symbol, variable, 'a) scope_view -> 'a scope 
  val outScope : ('m, 'p, 'a) binding_support -> 'a scope -> valence -> (symbol, variable, 'a) scope_view

  (* O(1) *)
  val unsafeRead : 'a scope -> (string, string, 'a) scope_view
end