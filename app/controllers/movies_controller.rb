class MoviesController < ApplicationController
  def new
    @movie = Movie.new

    # render({ :template => "movies/new.html.erb" })  
    # render template: "movies/new.html.erb"
    # rails assumes your template extentions are ".html.erb"
    # render template: "movies/new"
  end

  def index
    # matching_movies = Movie.all

    # @list_of_movies = matching_movies.order({ :created_at => :desc })
    # get rid of curly brackets
    # @list_of_movies = matching_movies.order( :created_at => :desc )
    # new syntax
    # @list_of_movies = matching_movies.order( created_at: :desc )
    # better syntax
    @movies = Movie.order(created_at: :desc)



    respond_to do |format|
      format.json do
         # convert to jason to serve to an application as an API
        # render json: @list_of_movies
        render json: @movie
      end

      # format.html do
      format.html  
        # render({ :template => "movies/index.html.erb" })
        # render template: "movies/index.html.erb"
        # render template: "movies/index"
      # end
    end
  end

  def show
    # line gets replaced under matching_movies
    # the_id = params.fetch(:id)

    # matching_movies = Movie.where({ :id => the_id })
    # get rid of curly brackets
    # matching_movies = Movie.where(:id => the_id)
    # new syntaxt
    # matching_movies = Movie.where(id: the_id)
    # combines first line
    # matching_movies = Movie.where(id: params.fetch(:id))
    # combines all lines
    # @the_movie = Movie.where(id: params.fetch(:id)).first
    # helper method
    # @the_movie = Movie.find_by(id: params.fetch(:id))
    # shorthand
    @movie = Movie.find(params.fetch(:id))



    # @the_movie = matching_movies.first

    # render({ :template => "movies/show.html.erb" })
    # render template: "movies/show.html.erb"
    # render template: "movies/show"
  end

  def create
    # movie_attributes = params.fetch(:movie)
    # require columns in strong parameters list
    movie_attributes = params.require(:movie).permit(:title, :description)
    
    # mass assignment
    @movie = Movie.new(movie_attributes)
    # @movie = Movie.new
    # @movie.title = params.fetch("title")
    # @movie.description = params.fetch("description")
    # @movie.title = params.fetch(:title)
    # @movie.description = params.fetch(:description)
    # nested movie attributes in new form
    # @movie.title = params.fetch(:movie).(:title)
    # @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      # redirect_to("/movies", { :notice => "Movie created successfully." })
      # using helper method (use paths on the clients and urls on the server side)
      redirect_to movies_url, notice: "Movie created successfully."

    else
      # render({ :template => "movies/new.html.erb" })
      # render template: "movies/new.html.erb"
      # render template: "movies/new"
      render "new"
    end
  end

  def edit
    # the_id = params.fetch(:id)

    # matching_movies = Movie.where({ :id => the_id })
    # remove curly brackets
    # matching_movies = Movie.where( :id => the_id )
    # new syntaxt
    # matching_movies = Movie.where(id: the_id)

    # @the_movie = matching_movies.first
    # new syntaxt
    @movie = Movie.find(params.fetch(:id))


    # render({ :template => "movies/edit.html.erb" })
    # render template: "movies/edit.html.erb"
    # render template: "movies/edit"
  end

  def update
    # the_id = params.fetch(:id)
    
    # the_movie = Movie.where({ :id => the_id }).first
    # get rid of curly brackets
    # the_movie = Movie.where( :id => the_id ).first
    # new syntax
    @movie = Movie.find(params.fetch(:id))

    # the_movie.title = params.fetch("query_title")
    # the_movie.description = params.fetch("query_description")
    # @movie.title = params.fetch("title")
    # @movie.description = params.fetch("description")
    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    # if the_movie.valid?
    #   the_movie.save
    if @movie.valid?
      @movie.save
      # redirect_to("/movies/#{the_movie.id}", { :notice => "Movie updated successfully."} )
      # using helper method (.id is implicit)
      # redirect_to movie_url(the_movie), notice: "Movie updated successfully."
      redirect_to movie_url(@movie), notice: "Movie updated successfully."

    else
      # redirect_to("/movies/#{the_movie.id}", { :alert => "Movie failed to update successfully." })
      # redirect_to movie_url(the_movie),  alert: "Movie failed to update successfully."]
      redirect_to movie_url(@movie),  alert: "Movie failed to update successfully."
    end
  end

  def destroy
    # the_id = params.fetch(:id)

    # the_movie = Movie.where({ :id => the_id }).first
    # get rid of curly brackets
    # the_movie = Movie.where( :id => the_id ).first
    # new syntax
    # @the_movie = Movie.find(params.fetch(:id))
    @movie = Movie.find(params.fetch(:id))



    # the_movie.destroy
    @movie.destroy

    # redirect_to("/movies", { :notice => "Movie deleted successfully."} )
    # using helper method (use paths on the clients and urls on the server side)
    redirect_to movies_url, notice: "Movie deleted successfully."
    end
end
