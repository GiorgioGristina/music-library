# require_relative "lib/database_connection"
# require_relative "lib/album_repository"
# DatabaseConnection.connect('music_library')

# # result = DatabaseConnection.exec_params('SELECT * FROM ARTISTS;', [])

# album_repo = AlbumRepository.new

# album_repo.all.each do |record|
#    p record
# end


# p album_repo.find(3)

# file: app.rb
require_relative './lib/database_connection'
require_relative './lib/album_repository'
require_relative './lib/artist_repository'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    print("Welcome to the music library manager!")
    print("What would you like to do?")
    print_action()
    print("Enter your choice:")
    input = get_input
    p input
    action(input)


    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
  end

  private 

  def print(sentence)
    @io.puts sentence
  end

  def get_input
      @io.gets.chomp
  end
  
  def print_action
    print("1 - List all albums")
    print("2 - List all artists")
  
  end

  def action(choice)
    case choice
    when "1"
      print("Here is the list of albums:")
      display(@album_repository.all, "album")
    when "2"
      print("Here is the list of artist:")
      display(@artist_repository.all, "artist")
    else
      print("wrong command try againg!")
    end
  end

  def display(array_object, attribute)
   
    array_object.each_with_index do |record, i|
      print("#{i + 1} - #{attribute == "album" ? record.title : record.name}")
    end
  end
end



# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end