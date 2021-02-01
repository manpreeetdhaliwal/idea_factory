require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    describe '#new' do # 👈🏻 describe 'new' starts here 
            it 'render the new template' do
            # Given

            # When
            get(:new)

            # Then
            expect(response).to(render_template(:new)) #👈🏻 We wverify that the response will render out the tempalte called 'new' using the matcher 'render_template'
            # response is an object that re-presents the HTTP- Response
            # Rspec makes this opbejct available within the specs
            end
            it 'sets an instance variable with new ideas' do
            # Given
            # When
            get(:new)
            # Then
            expect(assigns(:idea)).to(be_a_new(Idea))
            # assign(:job_past) is available from the 'rail-controller-testing'. this allows you to grab an instance varaibale, it takes symbol(:job_post)- the name of instance varaible
            # All models are available to controllers 
            end 
            
    end# 👈🏻 describe 'new' ends  here 
    describe '#create' do
        def valid_request
             post(:create, params:{idea: FactoryBot.attributes_for(:idea)})
        end
        context " with valid parameter " do # 👈🏻 Context Valid Parameters - Start
            it 'creates a idea in the database' do
            # Given
            count_before = Idea.count
            # When
            valid_request
            
            #Then
            count_after=Idea.count
            expect(count_after).to(eq(count_before + 1))
             end
            it 'redirects us to a show page of that idea' do
            # Given
            # When
            valid_request
            
            # Then 
            idea=Idea.last
            expect(response).to(redirect_to(idea_url(idea.id)))
            end
        end# 👈🏻 Context Valid Parameters - End
        context 'with invalid parameters' do
            def invalid_request
            post(:create, params:{idea: FactoryBot.attributes_for(:idea, title: nil)})
            end
            it 'doesnot save a record in the database'do
            count_before = Idea.count
            invalid_request
            count_after = Idea.count
            expect(count_after).to(eq(count_before))
            end
            it 'renders the new template' do
            # Given
            # when
            invalid_request
            #then
            expect(response).to render_template(:new)
            end
        end
    end


end
