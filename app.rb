require_relative "lib/database_connection"
require_relative "lib/album_repository"
DatabaseConnection.connect('music_library')

# result = DatabaseConnection.exec_params('SELECT * FROM ARTISTS;', [])

album_repo = AlbumRepository.new

album_repo.all.each do |record|
   p record
end