class CallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def discord
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.set_permissions(request.env["omniauth.auth"])
    remember_me(@user)
    sign_in_and_redirect @user
  end

end
