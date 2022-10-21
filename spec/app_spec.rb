require_relative '../app'


RSpec.describe Application do
    it "return a list of albums" do
    io = double :io
    album = double :album
    artist = double :artist
    album1 = double :alb1, title: "Beautiful Trauma"
    album2 = double :alb2, title: "Try This"

    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:puts).with("Enter your choice:")
    expect(io).to receive(:gets).and_return("1")
    expect(album).to receive(:all).and_return([album1, album2])

    expect(io).to receive(:puts).with("Here is the list of albums:")
    expect(io).to receive(:puts).with("1 - Beautiful Trauma")
    expect(io).to receive(:puts).with("2 - Try This")
# pass the argument
    app = Application.new('music_library_test', io, album, artist)
    app.run

    end
end

# $ ruby app.rb

# Welcome to the music library manager!

# What would you like to do?
#  1 - List all albums
#  2 - List all artists

# Enter your choice: 1
# [ENTER]

# Here is the list of albums:
#  * 1 - Doolittle
#  * 2 - Surfer Rosa
#  * 3 - Waterloo
#  * 4 - Super Trouper
#  * 5 - Bossanova
#  * 6 - Lover
#  * 7 - Folklore
#  * 8 - I Put a Spell on You
#  * 9 - Baltimore
#  * 10 -	Here Comes the Sun
#  * 11 - Fodder on My Wings
#  * 12 -	Ring Ring