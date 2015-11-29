require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: => :controller do

  let (:my_post) { Advertisement.create!(title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_number) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([my_post])
    end
  end

#  describe "GET show" do
#    it "returns http success" do
#      get :show
#      expect(response).to have_http_status(:success)
#    end
#  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :newexpect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :newexpect(assigns(:post)).not_to be_nil
    end
  end

  describe "ADVERTISEMENT create" do
   it "increases the number of Advertisement by 1" do
     expect{advertisement :create, advertisement: {title: RandomData.random_sentence, copy: Randomdata.random_paragraph, price: RandomData.random_number}}.to chance(Advertisement,:count).by(1)
   end
   it "assigns the new advertisement to @advertisement" do
     post :create, post: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_number}
     expect(assigns(:post)).to eq Advertisement.last
   end
   it "redirects to the new post" do
     post :create, post: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: RandomData.random_number}
     expect(response).to redirect_to Advertisement.last
  end

end
