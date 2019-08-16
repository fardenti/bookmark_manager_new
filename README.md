# Database setup

### User Stories

```As a User
So that I can go to my bookmarked websites
I would like to see a list of bookmarks with urls

As a User
So that I can have my urls in a bookmark
I would like to be able to add a new bookmark

As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark

As a user
So I can fix an incorrect bookmark from Bookmark Manager
I want to update a bookmark
```

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
