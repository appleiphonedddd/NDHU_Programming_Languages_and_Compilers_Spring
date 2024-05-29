datatype person = 
    Andy | Bob | Cecil | Dennis | Edward | Felix | Martin | Oscar | Quinn
  | Gigi | Helen | Iris | Jane | Kate | Liz | Nancy | Pattie | Rebecca;

datatype gender = Male | Female;

datatype family = 
    Parent of person * person
  | Married of person * person;

val males = [Andy, Bob, Cecil, Dennis, Edward, Felix, Martin, Oscar, Quinn];
val females = [Gigi, Helen, Iris, Jane, Kate, Liz, Nancy, Pattie, Rebecca];

val marriages = [Married(Bob, Helen), Married(Dennis, Pattie), Married(Gigi, Martin)];
val parentChild = [Parent(Andy, Bob), Parent(Bob, Cecil), Parent(Cecil, Dennis), Parent(Dennis, Edward), 
                   Parent(Edward, Felix), Parent(Gigi, Helen), Parent(Helen, Iris), Parent(Iris, Jane), 
                   Parent(Jane, Kate), Parent(Kate, Liz), Parent(Martin, Nancy), Parent(Nancy, Oscar), 
                   Parent(Oscar, Pattie), Parent(Pattie, Quinn), Parent(Quinn, Rebecca)];

fun isMale p = List.exists (fn x => x = p) males;
fun isFemale p = List.exists (fn x => x = p) females;

fun marriedTo p = 
    case List.find (fn Married(x, y) => x = p orelse y = p | _ => false) marriages of
         SOME(Married(x, y)) => if x = p then y else x
       | NONE => raise Fail("Not married");

fun parentOf p = List.filter (fn Parent(x, _) => x = p | _ => false) parentChild;
fun childrenOf p = List.map (fn Parent(_, y) => y) (parentOf p);

fun siblings p = 
    let
        fun findParent [] = []
          | findParent (Parent(x, y)::xs) = if y = p then x::findParent(xs) else findParent(xs)
        val parents = findParent parentChild
        fun findSiblings [] = []
          | findSiblings (Parent(x, y)::xs) = if List.exists (fn a => a = x) parents andalso y <> p 
                                              then y::findSiblings(xs) 
                                              else findSiblings(xs)
    in
        findSiblings parentChild
    end;

fun areSiblings x y = List.exists (fn s => s = y) (siblings x);

fun areCousins x y = 
    let
        val xSibs = siblings x
        val yParents = List.map (fn Parent(p, _) => p) (parentOf y)
    in
        List.exists (fn s => List.exists (fn p => areSiblings s p) yParents) xSibs
    end;

val _ = print("Are Liz and Rebecca cousins? " ^ Bool.toString(areCousins Liz Rebecca) ^ "\n");
