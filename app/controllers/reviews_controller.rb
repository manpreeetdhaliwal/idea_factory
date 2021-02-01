class ReviewsController < ApplicationController
    before_action :authenticate_user!
    def create
        @idea = Idea.find params[:idea_id]
        @review=Review.new review_params
        @review.idea =@idea 
        @review.user=current_user
    
        
        if @review.save
            redirect_to idea_path(@idea), notice: 'review created!'
        else
            @reviews=@idea.reviews.order(created_at: :desc)
            
            render '/ideas/show'
            
        end
    end
    def destroy
    @idea =Idea.find params[:idea_id]
    # questions/:question_id/answers/:id
    # questions/8/anaswers/1
    @review=Review.find params[:id]
    if can?(:crud, @review)
    @review.destroy
    redirect_to idea_path(@idea), notice: "Review deleted"
    else
        redirect_to root_path, alert: 'Not Authorized'
    end
end
    

private
def review_params
    params.require(:review).permit(:body)
end
end

