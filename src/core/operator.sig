signature ABT_OPERATOR =
sig
  structure P : ABT_PARAMETER_TERM
  structure Ar : ABT_ARITY
  sharing type P.Sig.Sort.t = Ar.Vl.PS.t

  type 'i t

  val arity : 'i t -> Ar.t
  val support : 'i t -> ('i * Ar.Vl.psort) list

  val eq : ('i * 'i -> bool) -> 'i t * 'i t -> bool
  val toString : ('i -> string) -> 'i t -> string
  val map : ('i -> 'j P.term) -> 'i t -> 'j t
  val mapWithSort : ('i * Ar.Vl.psort -> 'j P.term) -> 'i t -> 'j t
end

signature ABT_SIMPLE_OPERATOR =
sig
  structure Ar : ABT_ARITY

  type t
  val arity : t -> Ar.t
  val eq : t * t -> bool
  val toString : t -> string
end
