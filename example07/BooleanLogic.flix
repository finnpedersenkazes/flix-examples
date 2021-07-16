/// Declare predicate symbols.
rel Domain(x: String)
rel Equal(x: String, y: String)
rel Different(x: String, y: String)
rel And(x: String, y: String, z: String)
rel Or(x: String, y: String, z: String)
rel Xor(x: String, y: String, z: String)

/// Returns a collection of facts.
def getFacts(): #{ Domain, Equal, Different, And, Or, Xor } = #{
    Domain("true").
    Domain("false").
    Different("true","false").
    Different("false","true").
}

/// Returns a collection of rules.
def getRules(): #{ Domain, Equal, Different, And, Or, Xor } = #{
    Equal(x, x)                 :- Domain(x).
    And("true", x, x)           :- Domain(x).
    And("false", x, "false")    :- Domain(x).
    Or("true", x, "true")       :- Domain(x).
    Or("false", x, x)           :- Domain(x).
    Xor(x, x, "false")          :- Domain(x).
    Xor(x, y, "true")           :- Different(x, y).
}

/// Composes the facts and rules, and computes the result.
def main(_args: Array[String]): Int32 & Impure =
    query getFacts(), getRules()
        select (x, y, z) from And(x, y, z), Different(x, y) |> println;
    0 // exit code
