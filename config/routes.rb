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
  get "/" => "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create"
  get "/movies/new" => "movies#new"
          
  # READ
  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"
  
  # UPDATE
  patch "/movies/:id" => "movies#update"
  get "/movies/:id/edit" => "movies#edit"
  
  # DELETE
  delete "/movies/:id" => "movies#destroy"

  #------------------------------
end