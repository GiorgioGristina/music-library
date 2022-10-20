require "album_repository"

RSpec.describe AlbumRepository do

    def reset_albums_table
        seed_sql = File.read('spec/seeds_albums.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
        connection.exec(seed_sql)
    end


    before(:each) do 
        reset_albums_table
    end


    it "return two albums" do
        repo = AlbumRepository.new
        albums = repo.all

        expect(albums.length).to eq(2) #=> 2
        expect(albums.first.title).to eq('Beautiful Trauma')#=> 'Beautiful Trauma'
        expect(albums.first.release_year).to eq('2017') #=> '2017'
        expect(albums.first.artist_id).to eq('1') #=> '1'

    end

    it "return one album" do
        repo = AlbumRepository.new
        albums = repo.find(1)

       
        expect(albums.title).to eq('Beautiful Trauma')#=> 'Beautiful Trauma'
        expect(albums.release_year).to eq('2017') #=> '2017'
        expect(albums.artist_id).to eq('1') #=> '1'

    end

    it "add one record to the DB" do
        repository = AlbumRepository.new

        album = Album.new
        album.title = 'Trompe le Monde'
        album.release_year = 1991
        album.artist_id = 1
        
        repository.create(album)
        
        all_albums = repository.all
        
        expect(all_albums.last.title).to eq('Trompe le Monde') 
        expect(all_albums.last.release_year).to eq("1991") 
        expect(all_albums.last.artist_id).to eq("1") 

    end


end