class UsersController < ApplicationController
  respond_to :js, :html
  before_action :set_user, only: [:show, :edit, :update, :destroy, :create_remember_toke]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  	@user = User.find(params[:id])
	@surfer = Surfer.find_by(user_id: @user.id)
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  	@user = User.find(params[:id])
	@surfer = Surfer.find_by(user_id: @user.id)
  end

  # POST /users 
  # POST /users.json
	def create
		@user = User.new
		@user.email = params[:signup][:email]
		@user.password = params[:signup][:password]
		@user.password_confirm = params[:signup][:password_confirm]
		@user.agree = params[:signup][:agree]

		@form =  Forms::UserForm.new(user: @user, surfer: Surfer.new)
		workflow = Workflows::UserWorkflow.new(@form, params[:user])
		workflow.processCreate do |user|
			#create_remember_token
			return redirect_to edit_user_path(user)
		end

		render :new
	end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
	def update
		@user = User.find(params[:id])
		@surfer = Surfer.find_by(user_id: @user.id)
		@form =  Forms::UserForm.new(user: @user, surfer: @surfer)
		@form.save

		#workflow = Workflows::UserWorkflow.new(@form, params[:user])
		#workflow.processUpdate do |user|
		#	return respond_with user
		#end

		render :show
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user = User.find(params[:id])
		@surfer = Surfer.find_by(user_id: @user.id)
		service = ::Service::ManageUser.new(map[:user], map[:surfer])
		service.destroy(@user.id, @surfer.id)
		redirect_to welcomes_path
	end
	
	# Used to remember the data in login
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
		
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
		
	def create_remember_token
		@user.remember_token = User.encrypt(User.new_remember_token)
		@user.save
	end
	# end
	
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:myname, :location, :surname, :gender, :birth_date, :email, :password, :password_confirm, :agree, :remember)
    end

    #def surfer_params
     # params.require(:surfer).permit(:nickname, :home_spot, :goofy_regular, :style, :best_trick)
    #end
end