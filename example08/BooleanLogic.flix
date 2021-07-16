/// Enumerated Type for Boolean
enum Boolean {
    case False,
    case True
}

/// Declare predicate symbols.
rel Domain(x: Boolean)
rel Equal(x: Boolean, y: Boolean)
rel Different(x: Boolean, y: Boolean)
rel And(x: Boolean, y: Boolean, z: Boolean)
rel Or(x: Boolean, y: Boolean, z: Boolean)
rel Xor(x: Boolean, y: Boolean, z: Boolean)
rel BooleanToString(x: Boolean, y: String)

/// Returns a collection of facts.
def getFacts(): #{ Domain, Equal, Different, And, Or, Xor, BooleanToString } = #{
    Domain(True).
    Domain(False).
    Different(True,False).
    Different(False,True).
    BooleanToString(False, "false").
    BooleanToString(True, "true").
}

/// Returns a collection of rules.
def getRules(): #{ Domain, Equal, Different, And, Or, Xor, BooleanToString } = #{
    Equal(x, x)               :- Domain(x).
    And(True, x, x)           :- Domain(x).
    And(False, x, False)      :- Domain(x).
    Or(True, x, True)         :- Domain(x).
    Or(False, x, x)           :- Domain(x).
    Xor(x, x, False)          :- Domain(x).
    Xor(x, y, True)           :- Different(x, y).
}

/// Composes the facts and rules, and computes the result.
def main(_args: Array[String]): Int32 & Impure =
    query getFacts(), getRules() 
             select (xt) from BooleanToString(True, xt) |> println;
    0 // exit code
