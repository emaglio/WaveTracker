require 'spec_helper'

describe "AuthenticationPages" do
	
	subject { page }
	
	describe "login page" do
		before { visit login_path }
		
		it { should have_content('Sign in') }
	end
end
