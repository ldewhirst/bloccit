require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
  let(:my_user) { create(:user) }
  let(:my_topic) { create(:topic) }
  let(:my_post) { create(:post, topic: my_topic, user: my_user) }


  context "unauthenticated user" do
    describe "GET show" do
      it "returns http success" do
        get :show, topic_id: my_topic.id, , post_id: my_post.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, topic_id: my_topic.id, id: my_post.id
        expect(response).to render_template :show
      end

      it "assigns my_post to @post" do
        get :show, topic_id: my_topic.id, id: my_post.id
        expect(assigns(:post)).to eq(my_post)
      end

      it "PUT update returns http unauthenticated" do
        put :update, id: my_topic.id, post_id: my_post.id, {title: "Post Name", body: "Post Body" }
        expect(response).to have_http_status(401)
      end

      it "DELETE destroy returns http unauthenticated" do
        delete :destroy, id: my_topic.id, post_id: my_post.id
        expect(response).to have_http_status(401)
      end
    end

  context "unauthorized user" do
    before do
      controller.request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(my_user.auth_token)
    end

    it "GET index returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "GET show returns http success" do
      get :show, id: my_topic.idm post_id: my_post.id
      expect(response).to have_http_status(:success)
    end

    it "PUT update returns http forbidden" do
      put :update, id: my_topic.id, post_id: my_post.id, post: {name: "Post Name", body: "Post Body"}
      expect(response).to have_http_status(403)
    end

    it "DELETE destroy returns http forbidden" do
      delete :destroy, id: my_topic.id, post_id: my_post.id
      expect(response).to have_http_status(403)
    end
  end
end
