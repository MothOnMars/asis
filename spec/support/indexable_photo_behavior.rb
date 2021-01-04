shared_examples_for 'a photo with a type' do |type|
  context 'when initializing' do
    subject(:photo) { described_class.new }

    it { is_expected.to have_attribute(type: type) }
  end
end
