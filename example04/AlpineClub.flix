/// Declare predicate symbols.
rel Member(x: String)
rel Like(x: String, y: String)
rel Dislike(x: String, y: String)
rel Climber(x: String)
rel Skier(x: String)

/// Returns a collection of facts.
def getFacts(): #{ Member, Like, Dislike, Climber, Skier } = #{
    Member("Tony").
    Member("Mike").
    Member("John").
    Like("Tony","Rain").
    Like("Tony","Snow").
}

/// Returns a collection of rules.
def getRules(): #{ Member, Like, Dislike, Climber, Skier } = #{
    Climber(x) :- Member(x), Dislike(x, "Rain").
    Skier(x) :- Member(x), Like(x, "Snow").
    Like("Mike", x) :- Dislike("Tony", x).
    Dislike("Mike", x) :- Like("Tony", x).
}

/// Composes the facts and rules, and computes the result.
def main(_args: Array[String]): Int32 & Impure =
    query getFacts(), getRules()
        select (x) from Climber(x) |> println;
    0 // exit code
