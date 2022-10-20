require "artist_repository"

RSpec.describe ArtistRepository do

    def reset_artists_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end


    before(:each) do 
        reset_artists_table
    end


    it "return two artists" do
        repo = ArtistRepository.new
        artists = repo.all

        expect(artists.length).to eq(1) 
        expect(artists.first.name).to eq('Pink')
        expect(artists.first.genre).to eq('Rock') 
       

    end

    it "return one artist" do
        repo = ArtistRepository.new
        artists = repo.find(1)

       
        expect(artists.name).to eq('Pink')
        expect(artists.genre).to eq('Rock') 
      

    end

    it "add one record to the DB" do
        repository = ArtistRepository.new

        artist = Artist.new
        artist.name = 'Ray Charls'
        artist.genre = "blues"
   
        
        repository.create(artist)
        
        all_artists = repository.all
        
        expect(all_artists.last.name).to eq('Ray Charls') 
        expect(all_artists.last.genre).to eq("blues") 
       

    end


end