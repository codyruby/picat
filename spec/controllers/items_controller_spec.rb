# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET index" do
    login_user
    it "has a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).not_to eq(nil)
    end

    it "gets index" do
      # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
      # the valid_session overrides the devise login. Remove the valid_session from your specs
      get 'index'
      response.should be_success
    end

    it "assigns @items" do
      # création d'une instance
      item = FactoryBot.create(:item)

      # on va sur index
      get :index

      # @items doit être une array qui contient item
      expect(assigns(:items)).to eq([item])
    end

    it "renders the index template" do
      # va sur index
      get :index

      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    subject { get :show, params: { id: resource.id } }

    let(:resource){ FactoryBot.create(:item) }

    it "assigns @items" do
      # on va sur show
      subject
      expect(assigns(:item)).to eq(resource)
    end

    it "renders the show template" do
      # va sur show

      # on doit rediriger vers show
      expect(subject).to render_template("show")
    end
  end
end
