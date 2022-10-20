require_relative "./artist"

class ArtistRepository
    def all
        artists = []
        sql = 'SELECT id, name, genre FROM artists;'
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.each do |record|
           artists <<artist_object(record)
        end

        return artists
    end

    def find(id)
        sql = 'SELECT * FROM artists WHERE id = $1;'
        params = [id]
        result =DatabaseConnection.exec_params(sql, params)[0]
        artist_object(result)
    end

    def create(artist)
        sql = 'INSERT INTO  artists (name, genre ) VALUES ($1, $2)'
        params = [artist.name, artist.genre]
        DatabaseConnection.exec_params(sql, params)

        return nil
    end

    private

    def artist_object(hash)
        artist =Artist.new
        artist.id = hash['id']
        artist.name = hash['name']
        artist.genre = hash['genre']
        return artist
    end
end