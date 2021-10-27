alias Theme01.Repo

alias Theme01.API.WorkingTime



Repo.insert! %WorkingTime{

start: %NaiveDateTime{
    year: 2000,
    month: 2,
    day: 29,
    hour: 23,
    minute: 0,
    second: 7,
    microsecond: {0, 0},
},

end: %NaiveDateTime{
    year: 2000,
    month: 2,
    day: 29,
    hour: 23,
    minute: 0,
    second: 7,
    microsecond: {0, 0},
},

user: 1
}



Repo.insert! %WorkingTime{

    start: %NaiveDateTime{
        year: 2000,
        month: 2,
        day: 29,
        hour: 23,
        minute: 0,
        second: 7,
        microsecond: {0, 0},
    },
    
    end: %NaiveDateTime{
        year: 2000,
        month: 2,
        day: 29,
        hour: 23,
        minute: 0,
        second: 7,
        microsecond: {0, 0},
    },
    
    user: 2
}