class UsersController < Clearance::UsersController
	def new
    @user = user_from_params
    render template: "users/new"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private
	def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    username = user_params.delete(:username)
    full_name = user_params.delete(:full_name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.username = username
      user.full_name = full_name
    end
  end
end