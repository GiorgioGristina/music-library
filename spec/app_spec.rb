require_relative '../app'


RSpec.describe Application do
    it "" do
    io = double :io
    album = double :album
    artist = double :artist
    expect(io).to receive(:puts).with("Welcome to the music library manager!")
    expect(io).to receive(:puts).with("What would you like to do?")
    expect(io).to receive(:puts).with("1 - List all albums")
    expect(io).to receive(:puts).with("2 - List all artists")
    expect(io).to receive(:puts).with("Enter your choice:")
    expect(io).to receive(:gets).and_return(1)
    expect(io).to receive(:puts).with("Here is the list of albums:")
    expect(io).to receive(:puts).with("Beautiful Trauma")
    expect(io).to receive(:puts).with("Try This")


    app = Application.new()
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