FactoryGirl.define do
  factory :user do
    name		"Michael Hartl"
    email		"taco@fourdesire.com"
    password "foobar"
    password_confirmation "foobar"
  end
end