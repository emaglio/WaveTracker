class UsersController < ApplicationController
  respond_to :js, :html
  # before_action :create_new_form, only: [:new, :create]
  # before_action :create_edit_form, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
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
		@form = Forms::UserForm.new(user: User.new, surfer: Surfer.new)
		workflow = Workflows::UserWorkflow.new(@form, params[:user])
		workflow.processCreate do |user|
			redirect_to edit_user_path(user)
			# create_remember_token
		end
		render :new
	end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
	def update
		@user = User.find(params[:id])
		@form = Forms::UserForm.new(user: @user, surfer: @user.surfer)
		workflow = Workflows::UserWorkflow.new(@form, params[:user])
		workflow.processUpdate @form do |user|
			return respond_with user
		end
	end

	# DELETE /users/1
	# DELETE /users/1.json
	def destroy
		@user.delete
	end
	
	# Used to remember the data in login
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end
		
	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
		
	def create_remember_token
		@user = User.last
		@user.remember_token = User.encrypt(User.new_remember_token)
		@user.save
	end
	# end
	
	private
	def user
		@user ||= User.find(params[:id])
	end
	helper_method :user
	
	def surfer
		user.surfer
	end	
	helper_method :surfer
	
	def create_new_form
		@form = Forms::UserForm.new(user: User.new, surfer: Surfer.new)
	end
	
	def create_edit_form
		@form = Forms::UserForm.new(user: user, surfer: user.surfer)
	end
	
	
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:myname, :surname, :birth_date, :location, :gender, :email, :password)
    end
end
