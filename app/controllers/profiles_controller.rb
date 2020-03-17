class ProfilesController < ApplicationController
  add_breadcrumb 'ファイクメルク', :root

  def edit
    add_breadcrumb 'マイページ', mypage_path
    add_breadcrumb 'プロフィール'
  end

  def update
  end
end
