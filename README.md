# unit tests using 2 ways of fake_data
first we built a class to check wheter a given table name is a database table or not (DD02L-TABCLASS = 'TRANSP').
Then we created unit tests and used real data base acccess for "testing".

## Unit test using IF_OSQL_TEST_ENVIRONMENT 
to get rid of the the database access we used the Open SQL Test Environment feature (Available from Release 7.52).
https://sapcodes.com/2018/09/29/unit-test-with-sql-inject-sql-fake/

## unit test using Dependency Injection
To also show how dependency injection works, we created a new Data Access Object (DAO) to read the repository data.
Afterwards we created another class that provided fake data.
Finally we built a GET_INSTANCE method to get the right instance.

