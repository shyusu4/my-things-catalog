require_relative '../book-label/book'

describe Book do
  before :all do
    @book = Book.new('2022-02-20', 'bloomsbury', 'good')
  end

  context 'when creating a new book' do
    it 'should be an instance of book class' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'should have a cover state' do
      expect(@book.cover_state).to eq('good')
    end

    it 'should have a publisher' do
      expect(@book.publisher).to eq('bloomsbury')
    end

    it 'should have a published date' do
      expect(@book.published_date).to eq('2022-02-20')
    end

    it 'has can_be_archived? method' do
      expect(@book).to respond_to(:can_be_archived?)
    end
  end
end
