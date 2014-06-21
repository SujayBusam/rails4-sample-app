require 'spec_helper'

describe "StaticPages" do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	# Strings in describe could be anything. Rspec doesn't
  describe "Home page" do
    
    it "should have the h1 'Sample App'" do 
    	visit root_path
    	expect(page).to have_selector('h1', :text => 'Sample App')
    end

     it '"should have the title "Ruby on Rails Tutorial Sample App"' do
  		visit root_path
  		expect(page).to have_title("#{base_title}")
  	end

    it "should not have a custom page title" do
      visit root_path
      page.should_not have_title('| Home')
    end
  end


  describe "Help page" do

  	it "should have the h1 'Help'" do
  		visit help_path
  		expect(page).to have_selector('h1', :text => 'Help')
  	end

  	it 'should have the title "Ruby on Rails Tutorial Sample App | Help"' do
  		visit help_path
  		expect(page).to have_title("#{base_title} | Help")
  	end
  end

  describe "About page" do

  	it "should have the h1 'About Us'" do
  		visit about_path
  		expect(page).to have_selector('h1', :text => 'About Us')
  	end

  	it 'should have the title "Ruby on Rails Tutorial Sample App | About Us"'do
  		visit about_path
  		expect(page).to have_title("#{base_title} | About Us")
  	end
  end

  describe "Contact page" do

  	it "should have the h1 'Contact'" do
  		visit contact_path
  		expect(page).to have_selector('h1', :text => 'Contact')
  	end

  	it 'should have the title "Ruby on Rails Tutorial Sample App | Contact"' do
  		visit contact_path
  		expect(page).to have_title("#{base_title} | Contact")
  	end
  end

end
