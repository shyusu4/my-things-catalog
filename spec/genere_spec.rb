require_relative '../Genere/genere'

describe "Test the Genere class:" do
  let(:genere) {Genere.new("Classic")}

  it "Check the name property:" do
    expect(genere.name).to eql "Classic"
  end

  it "Check the add_item methode:" do
    expect(genere).to respond_to(:add_item)
  end
end