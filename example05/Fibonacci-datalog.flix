/// Declare predicate symbols.
rel Fibonacci(x: Int, y: Int)
rel Previous(x: Int, y: Int)

/// Returns a collection of facts.
def getFacts(): #{ Fibonacci, Previous } = #{
    Fibonacci(0, 1).
    Fibonacci(1, 1).
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
}

/// Returns a collection of rules.
def getRules(): #{ Fibonacci, Previous } = #{
    Fibonacci(x, y1 + y2) :- Previous(x, x1), Previous(x1, x2), Fibonacci(x1, y1), Fibonacci(x2, y2).
}

/// Composes the facts and rules, and computes the result.
def main(_args: Array[String]): Int32 & Impure =
    query getFacts(), getRules()
        select (y) from Fibonacci(0, y) |> println;
    0 // exit code
