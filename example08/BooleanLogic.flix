/// Enumerated Type for Boolean
enum Boolean {
    case False,
    case True
}

instance ToString[Boolean] {
    pub def toString(x: Boolean): String = match x {
        case False  => "False"
        case True   => "True"
    }
}

instance Eq[Boolean] {
    pub def eq(x: Boolean, y: Boolean): Bool = match (x, y) {
        case (False, False) => true
        case (True, True)   => true
        case _              => false
    }
}

instance Boxable[Boolean] {
    pub def box(x: Boolean): Boxed = {
        let value = x as ##java.lang.Object;
        let compare = (o1, o2) -> Order.compare(o1 as Boolean, o2 as Boolean);
        let toString = o -> ToString.toString(o as Boolean);
        BoxedObject(value, compare, toString)
    }
    pub def unbox(x: Boxed): Boolean = match x {
        case BoxedObject(v, _, _) => v as Boolean
        case _                    => ?bug
    }
}

instance Order[Boolean] {
    pub def compare(x: Boolean, y: Boolean): Comparison = match (x, y) {
        case (False, False)     => EqualTo
        case (True, True)       => EqualTo
        case (False, True)      => LessThan
        case _                  => GreaterThan
    }
}

/// Declare predicate symbols.
rel Domain(x: Boolean)
rel Equal(x: Boolean, y: Boolean)
rel Different(x: Boolean, y: Boolean)
rel And(x: Boolean, y: Boolean, z: Boolean)
rel Or(x: Boolean, y: Boolean, z: Boolean)
rel Xor(x: Boolean, y: Boolean, z: Boolean)

/// Returns a collection of facts.
def getFacts(): #{ Domain, Equal, Different, And, Or, Xor } = #{
    Domain(True).
    Domain(False).
    Different(True,False).
    Different(False,True).
}

/// Returns a collection of rules.
def getRules(): #{ Domain, Equal, Different, And, Or, Xor } = #{
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
        select (x, y, z) from And(x, y, z), Different(x, y) 
            |> println;
    0 // exit code
