functor AbtSimpleOperator (O : ABT_SIMPLE_OPERATOR) : ABT_OPERATOR =
struct
  structure Ar = O.Ar and P = AbtIdParam

  type 'i t = O.t
  val arity = O.arity
  fun support _ = []
  fun eq _ = O.eq
  fun toString _ = O.toString
  fun map f x = x
end

functor AbtSimpleCubicalOperator (O : ABT_SIMPLE_OPERATOR) : ABT_OPERATOR =
struct
  local
    structure O' = AbtSimpleOperator (O)
  in
    open O'
    structure P = AbtCubicalParam
  end
end

functor AbtEmptyOperator (Ar : ABT_ARITY) : ABT_OPERATOR =
struct
  structure Ar = Ar and P = AbtIdParam

  datatype 'i t = WELP of 'i t
  type 'i param = 'i

  fun arity (WELP x) = arity x
  fun support (WELP x) = support x
  fun eq f (WELP x, WELP y) = eq f (x, y)
  fun toString f (WELP x) = toString f x
  fun map f (WELP x) = map f x
end
