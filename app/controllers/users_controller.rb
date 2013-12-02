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
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users 
  # POST /users.json
	def create
		@user = User.find(params[:id])
		raise @user.email
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
		workflow = Workflows::UserWorkflow.new(@form, params[:user])
		workflow.processUpdate @form do |user|
			return respond_with user
		end
		render :edit
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@surfer= @user.surfer
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
      params.require(:user).permit(:myname, :surname, :birth_date, :location, :gender, :email, :password)
    end
end