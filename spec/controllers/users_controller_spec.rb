require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do

    it "トップページ(index)に遷移するか？" do
      get :index
      expect(response).to render_template :index
    end

  end
end
