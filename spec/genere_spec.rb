require_relative '../Genere/genere'

describe "Test the Genere class:" do
  let(:genere) {Genere.new("Classic")}

  it "Check the name property:" do
    expect(genere.name).to eql "Classic"
  end
end