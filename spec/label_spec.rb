require_relative '../book-label/label'

describe Label do
  before :all do
    @label = Label.new('Harry Potter', 'blue')
  end

  context 'when creating a new label' do
    it 'should be an instance of label class' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'should have a title' do
      expect(@label.title).to eq('Harry Potter')
    end

    it 'should have a color' do
      expect(@label.color).to eq('blue')
    end

    it 'has add_item method' do
      expect(@label).to respond_to(:add_item)
    end
  end
end
