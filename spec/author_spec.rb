require_relative '../Game/author'

describe Author do
  let(:author) { Author.new('Josh', 'Williams') }
  context 'when creating a new author' do
    it 'should have a first_name' do
      expect(author.first_name).to eq('Josh')
    end
    it 'should have a last_name' do
      expect(author.last_name).to eq('Williams')
    end
    it 'has add_item method' do
      expect(author).to respond_to(:add_item)
    end
  end
end
