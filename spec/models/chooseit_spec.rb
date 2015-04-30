require 'rails_helper'

RSpec.describe Chooseit, type: :model do

  describe '#valid?' do
    it 'should be invalid without a name entered' do
      chooseit = Chooseit.new

      expect(chooseit).to_not be_valid
    end

    it 'should have a name that is a string' do
      chooseit = Chooseit.create(:title => "Need help!")

      expect(chooseit.title).to eq("Need help!")
    end
  end

  describe '#set_chooseit_link' do
    context 'upon saving a chooseit' do

      it 'should create a link with params being a short name' do
        chooseit = Chooseit.create(:title => "Help!")

        expect(chooseit.short_name).to be_truthy
      end
    end
  end

    # context 'when first created' do
    #   it 'title is expected to be nil'
    #     expect(chooseit.class).to_be(Chooseit)
    #   end
    # end
end

