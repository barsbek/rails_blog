require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @article = articles(:valid)
  end

  def nilify_param(param)
    @article.send("#{param}=", nil)
    @article.save
  end

  test "validity of article" do
    assert @article.valid?
  end

  test "invalidity without title" do 
    nilify_param(:title)
    refute_empty @article.errors[:title]
  end

  test "invalidity without text" do
    nilify_param(:text)
    refute_empty @article.errors[:text]
  end
end
