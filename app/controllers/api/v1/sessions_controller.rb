class Api::V1::SessionsController < AuthController
  def create
    puts("* login *" * 100)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      user.regenerate_auth_token
      render json: {
        token: user.auth_token,
        current_user: {
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email
        } }
    else
      render json: { login: "Incorrect e-mail or password" }, status: 400
    end
  end

  def destroy
    logout
  end

  private
  def logout
    current_user.update(auth_token: nil)
  end
end
