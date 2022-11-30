require_relative '../MusicAlbum/musicalbum'

describe "Test the MusicAlbum class:" do
  let(:album) {MusicAlbum.new(true, "20-02-2020")}

  it "Check the on_spotify property:" do
    expect(album.on_spotify).to be(true)
  end

  it "Check the publish_date property:" do
    expect(album.published_date).to eql "20-02-2020"
  end
end