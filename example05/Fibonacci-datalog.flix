/// Declare predicate symbols.
rel Domain(x: Int)
rel Previous(x: Int, y: Int)
rel Addition(x: Int, y: Int, z: Int)
rel Fibonacci(x: Int, y: Int)

/// Returns a collection of facts.
def getFacts(): #{ Domain, Previous, Addition, Fibonacci } = #{
    Domain(0).
    Domain(1).
    Domain(2).
    Domain(3).
    Domain(4).
    Domain(5).
    Domain(6).
    Domain(7).
    Domain(8).
    Domain(9).
    Domain(10).
    Domain(11).
    Domain(12).
    Domain(13).
    Domain(14).
    Previous(1, 0).
    Previous(2, 1).
    Previous(3, 2).
    Previous(4, 3).
    Previous(5, 4).
    Previous(6, 5).
    Previous(7, 6).
    Previous(8, 7).
    Previous(9, 8).
    Previous(10, 9).
    Previous(11, 10).
    Previous(12, 11).
    Previous(13, 12).
    Addition(0, x, x) :- Domain(x).
    Addition(x, 0, x) :- Domain(x).
    Fibonacci(0, 1).
    Fibonacci(1, 1).
}

/// Returns a collection of rules.
def getRules(): #{ Domain, Previous, Addition, Fibonacci } = #{
    Fibonacci(x, y) :- Previous(x, x1), Previous(x1, x2), Addition(y1, y2, y), Fibonacci(x1, y1), Fibonacci(x2, y2).
    Addition(x, y, z) :- Previous(x, x1), Previous(y1, y), Addition(x1, y1, z).
}

/// Composes the facts and rules, and computes the result.
def main(_args: Array[String]): Int32 & Impure =
    query getFacts(), getRules()
        select (x, y) from Fibonacci(x, y) |> println;
    0 // exit code

/// Expect
/// [(0, 1), (1, 1), (2, 2), (3, 3), (4, 5), (5, 8), (6, 13)]