Rails.application.routes.draw do
  # get("/", { :controller => "movies", :action => "index" }) 

  # remove curly brackets
  # get("/", :controller => "movies", :action => "index" )

  # remove hash rockets and move colons
  # get("/", controller: "movies", action: "index" )

  # remove parenthesis
  # get "/", controller: "movies", action: "index"

  # shorthand syntax
  # get({"/" => "movies#index"})

  # super shorthhand syntax
  # get "/" => "movies#index"

  # root path or home can be represented like this
  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies # movies_url and movies_path
  get "/movies/new" => "movies#new", as: :new_movie # new_movie_url and new_movie_path
          
  # READ
  get "/movies" => "movies#index"

  # get "/movies/:id" => "movies#show"

  # this helper method will change the route name without compromising the rest of your app
  # get "/movies/:id" => "movies#show", as: :details
  get "/movies/:id" => "movies#show", as: :movie # movie_path() (expects an argument to populate :id segment)


  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit". as: :edit_movie # edit_movie_path() (expects an argument to populate :id segment)
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"

  #------------------------------
end