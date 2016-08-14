# in my machine, the output for `date +'%a'` is in Portuguese

import sys


weekday = int(sys.argv[1]) - 1
mode = sys.argv[2]

weekdays = [
    {
        'longname' : 'Monday',
        'shortname' : 'Mon'
    },
    {
        'longname' : 'Tuesday',
        'shortname' : 'Tue'
    },
    {
        'longname' : 'Wednesday',
        'shortname' : 'Wed'
    },
    {
        'longname' : 'Thursday',
        'shortname' : 'Thu'
    },
    {
        'longname' : 'Friday',
        'shortname' : 'Fri'
    },
    {
        'longname' : 'Saturday',
        'shortname' : 'Sat'
    },
    {
        'longname' : 'Sunday',
        'shortname' : 'Sun'
    }
]

print(weekdays[weekday][mode])