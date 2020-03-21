class Api::EnvController < ApplicationController
  def index
    @Payjp_public = ENV['PAYJP_PUBLIC_KEY']
  end
end
