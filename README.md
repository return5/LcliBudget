lua command line budget (LcliBudget)  
simple command line utility for doing simple budgeting. 

## setup  
this program requires a sqlite database containing a table with columns: amount (real) date (text) note (test)  
you need to place the location to this db and the name of your table into the 'Config.lua' table located under the 'config' directory.

## requirements  
requires [lsqlite3complete](https://lua.sqlite.org/home/home)  

## License
this program is licensed under the AGPL-3.0 only license. no versions of the AGPL beyond 3.0 are compatible with this program. 

## notice
when entering a date, it must be in [ISO-8601 format](https://www.iso.org/iso-8601-date-and-time-format.html) (YYYY-MM-DD)

## flags
        -i      print monthly income
        -E      print year to date expenses
        -n      print monthly net total
        -r      print net total for range
        -p      print income for range
        -y      print year to date net total
        -h      print help page
        -e      print monthly expenses
        -I      print year to date income


