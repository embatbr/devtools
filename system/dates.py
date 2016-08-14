# in my machine, the output for `date +'%a'` is in Portuguese

import sys


datename = sys.argv[1]
index = int(sys.argv[2]) - 1
mode = sys.argv[3]

dates = {
    'weekdays' : [
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
    ],
    'months' : [
        {
            'longname' : 'January',
            'shortname' : 'Jan'
        },
        {
            'longname' : 'February',
            'shortname' : 'Feb'
        },
        {
            'longname' : 'March',
            'shortname' : 'Mar'
        },
        {
            'longname' : 'April',
            'shortname' : 'Apr'
        },
        {
            'longname' : 'May',
            'shortname' : 'May'
        },
        {
            'longname' : 'June',
            'shortname' : 'Jun'
        },
        {
            'longname' : 'July',
            'shortname' : 'Jul'
        },
        {
            'longname' : 'August',
            'shortname' : 'Aug'
        },
        {
            'longname' : 'September',
            'shortname' : 'Sep'
        },
        {
            'longname' : 'October',
            'shortname' : 'Oct'
        },
        {
            'longname' : 'November',
            'shortname' : 'Nov'
        },
        {
            'longname' : 'December',
            'shortname' : 'Dec'
        }
    ]
}

print(dates[datename][index][mode])