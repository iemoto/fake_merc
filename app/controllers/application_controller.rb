class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?

def index
end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '61_mercari_wc' && password == '61wc'
    end
  end
end
