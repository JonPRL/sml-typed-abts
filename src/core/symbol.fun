functor AbtSymbol () :> ABT_SYMBOL =
struct
  type t = int * string option
  val counter = ref 0

  fun named a =
    let
      val i = !counter
      val _ = counter := i + 1
    in
      (i, SOME a)
    end

  fun new () =
    let
      val i = !counter
      val _ = counter := i + 1
    in
      (i, NONE)
    end

  fun fresh _ =
    named

  fun clone (_, SOME a) = named a
    | clone (_, NONE) = new ()

  fun toString (_, SOME a) = a
    | toString (i, NONE) = "@#$@"

  fun name (_, x) = x

  structure Ord =
  struct
    type t = t

    fun eq ((i : int, _), (j, _)) =
      i = j

    fun compare ((i, _), (j, _)) =
      Int.compare (i, j)
  end

  open Ord

  structure Ctx = SplayDict (structure Key = Ord)
  type 'a ctx = 'a Ctx.dict

  structure DebugShow =
  struct
    type t = t
    fun toString (i, SOME a) = a ^ "@" ^ Int.toString i
      | toString (i, NONE) = "$" ^ Int.toString i
  end
end
