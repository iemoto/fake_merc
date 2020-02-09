require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
<<<<<<< HEAD

=======
>>>>>>> 7ea0c9ad46caf4495a425de43e6180c0ff593eeb
    it 'トップページ(index)に遷移するか？' do
      get :index
      expect(response).to render_template :index
    end
<<<<<<< HEAD

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end

  end

  describe 'GET #show' do
    
    before do
      @user = FactoryBot.create(:user)
    end

    it 'ログインしない状態でログアウト(show)に遷移せず、トップページ(index)に遷移するか？' do
      get :index
      expect(response).to render_template :index
    end

    it 'ログイン状態でログアウト(show)に遷移するか？' do

      sign_in @user
      get :show
      expect(response).to render_template :show

    end

    it 'returns a 200 response' do

      sign_in @user
      get :show
      expect(response).to have_http_status '200'

    end

=======
>>>>>>> 7ea0c9ad46caf4495a425de43e6180c0ff593eeb
  end

end
