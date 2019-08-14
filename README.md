# Database setup

### User Stories

```As a User
So that I can go to my bookmarked websites
I would like to see a list of bookmarks with urls

As a User
So that I can have my urls in a bookmark
I would like to be able to add a new bookmark
```

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
5. Set up environment variable 'database' to 'bookmark_manager' for local running command:
    `export database='bookmark_manager'`
6. Set up environment variable 'database' to 'bookmark_manager_test' in spec_helper.rb
