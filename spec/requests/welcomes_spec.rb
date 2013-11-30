require 'spec_helper'

describe "Welcomes" do

  	subject { page }

  	describe "Home page" do
  	visit root_path

  	it { should have_content('Home')}

  	
  end
end