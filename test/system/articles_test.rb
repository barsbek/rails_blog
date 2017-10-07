require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  def setup
    @article = articles(:valid)
  end

  test "visiting the index" do
    visit articles_url
  
    assert_selector "h1", text: "Articles"
  end

  test "creation of article" do
    visit articles_url

    click_on "New article"
    fill_in "Title", with: @article.title
    fill_in "Text", with: @article.text

    click_on "Create Article"

    assert_selector "h1", @article.title
  end
end
