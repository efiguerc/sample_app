require 'rails_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

    describe "filled with" do

      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      let(:submit) { "Create my account" }

      describe "blank Name" do
        before do
          fill_in "Name",         with: ""
          click_button submit
        end

        it{ should have_content("Name can't be blank") }
      end

      describe "blank Email" do
        before do
          fill_in "Email",        with: ""
          click_button submit
        end

        it{ should have_content("Email can't be blank") }
      end

      describe "blank Password" do
        before do
          fill_in "Password",     with: ""
          fill_in "Confirmation", with: ""
          click_button submit
        end

        it{ should have_content("Password can't be blank") }
      end

      describe "short Password" do
        before do
          fill_in "Password",     with: "aaa"
          fill_in "Confirmation", with: "aaa"
          click_button submit
        end

        it{ should have_content("Password is too short") }
      end

      describe "invalid Email" do
        it "display an error" do
          fill_in "Email", with: 'user@foo,com'
          click_button submit
          should have_content("Email is invalid")
        end

        it "display an error" do
          fill_in "Email", with: 'user_at_foo.org'
          click_button submit
          should have_content("Email is invalid")
        end

        it "display an error" do
          fill_in "Email", with: 'example.user@foo.'
          click_button submit
          should have_content("Email is invalid")
        end

        it "display an error" do
          fill_in "Email", with: 'foo@bar_baz.com'
          click_button submit
          should have_content("Email is invalid")
        end

        it "display an error" do
          fill_in "Email", with: 'foo@bar+baz.com'
          click_button submit
          should have_content("Email is invalid")
        end

        it "display an error" do
          fill_in "Email", with: 'foo@bar..com'
          click_button submit
          should have_content("Email is invalid")
        end
      end
    end
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign up') }
        it { should have_content('error') }
      end  
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
end
