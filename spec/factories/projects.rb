FactoryGirl.define do
  factory :project do

    factory :foo do
      name "foo"
      author "ndelrossi"
      description "A fake website for testing"
      categories "Web"
      languages "Ruby"
      size 400
      open_issues 0
      beginner "Yes"
    end

    factory :rails do
      name "rails"
      author "rails"
      description "Ruby on Rails"
      categories "Web"
      languages "Ruby"
      size 367155
      open_issues 767
      beginner ""
    end

    factory :glide do
      name "glide"
      author "bumptech"
      description "An image loading and caching library for Android focused on smooth scrolling"
      categories "Android"
      languages "Java"
      size 21655
      open_issues 50
      beginner "Yes"
    end
  end
end
