Create myrecipe app

start Integration test--TDD Design the app based on test first approach
Write the test for the functionality
check for test pass

Refactored the code

Routes for Teams:-

teams       GET     /teams             teams#index
new_team    GET     /teams/new         teams#new
            POST    /teams             #submit the information from the form
edit_team   GET     /teams/:id/edit    #teams#edit
            PATCH   /teams/:id         #teams/update
            GET     /teams/:id         #teams/show
            DELETE  /teams/:id         #teams/destroy