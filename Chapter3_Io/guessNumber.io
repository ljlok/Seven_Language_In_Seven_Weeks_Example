
guess_number := method(
    right_num := (Random value(100) floor)
    standardIO := File standardInput()
    10 repeat(
        "Guess number (1-100): \n" println 
        guess_number := standardIO readLine() asNumber()
        if( guess_number == right_num ,
            "right num!" println break,
            if( (guess_number - right_num) >0,
                "bigger than right_num" println,
                "smaller than right_num" println
            ) 
        ) 
    )        
)


guess_number() println
