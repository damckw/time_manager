alias Theme01.Repo

alias Theme01.API.WorkingTime



Repo.insert! %WorkingTime{

start: %NaiveDateTime{
    year: 2021,
    month: 11,
    day: 8,
    hour: 9,
    minute: 30,
    second: 7,
},

end: %NaiveDateTime{
    year: 2021,
    month: 11,
    day: 8,
    hour: 17,
    minute: 30,
    second: 40,
},

user: 1
}



Repo.insert! %WorkingTime{

    start: %NaiveDateTime{
        year: 2021,
        month: 11,
        day: 9,
        hour: 9,
        minute: 30,
        second: 7,
    },
    
    end: %NaiveDateTime{
        year: 2021,
        month: 11,
        day: 9,
        hour: 17,
        minute: 30,
        second: 7,
    },
    
    user: 1
}