require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe "validates" do
    describe "title" do

      it "requires a title" do
        #given
        idea = FactoryBot.build(:idea , title: nil)
        #when 
        idea.valid?
  
        #then
        expect(idea .errors.messages).to(have_key(:title))
  
      end

      it 'title is unique' do
        persisted_idea= FactoryBot.create(:idea)
        idea=FactoryBot.build(:idea, title: persisted_idea.title)
        idea.valid?
  
        expect(idea.errors.messages).to(have_key(:title))
      end

      describe 'description' do  
        it 'requires a description' do
          idea=FactoryBot.build(:idea, description: nil)
          idea.valid?
          expect( idea.errors.messages).to(have_key(:description))
        end
        it 'must be larger than 100 characters' do
          idea = FactoryBot.build(:idea, description: 'less than 100')
          idea.valid?
    
          expect( idea.errors.messages).to( have_key(:description))
        end
      end




    end
  end

end
