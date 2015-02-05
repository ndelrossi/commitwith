FactoryGirl.define do
  factory :project do

    factory :foo do
      title "foo"
      author "ndelrossi"
      description "A fake website for testing"
      category "Web"
      languages "Ruby"
      size 400
      open_issues 0
      skill "Yes"
    end

    factory :rails do
      title "rails"
      author "rails"
      description "Ruby on Rails"
      category "Web"
      languages "Ruby"
      size 367155
      open_issues 767
      skill ""
    end

    factory :glide do
      title "glide"
      author "bumptech"
      description "An image loading and caching library for Android focused on smooth scrolling"
      category "Android"
      languages "Java"
      size 21655
      open_issues 50
      skill "Yes"
    end
  end
end
