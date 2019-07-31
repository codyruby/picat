# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET index" do
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
