# frozen_string_literal: true

module V1
  class PostsController < V1::ApiController
    def create_post
      @post = PostService.new(twitter_params).call
      render json: 'Tweet feito com sucesso', status: 204
    end

    private

    def twitter_params
      params.require(:twitter).permit(:user, :token, :city)
    end
  end
end
