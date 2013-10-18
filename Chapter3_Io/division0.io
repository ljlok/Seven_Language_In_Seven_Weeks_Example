Number setSlot(
    "originDivision",
    Number getSlot("/")
    )

Number setSlot(
    "/",
    method(
        denominator,
        if ( 
            denominator == 0,
            return 0, 
            return self originDivision(denominator)
        ) 
    )
)

(4/0) println
(6/2) println
(4/2) println
(4/ -2) println
