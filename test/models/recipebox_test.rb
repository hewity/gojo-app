require 'test_helper'

class RecipeboxTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "lelu", email: "lelu@example.com")
    @recipebox = @user.recipeboxes.build(name: "Mexican Grilled Corn", summary: "The best home made grilled corn recipe ever.", description: "Remove the husks of the corn but leave the core attached at the end so you have something to hold onto. Grill the corn on a hot grill or cast iron griddle pan until slightly charred. Turn it so it gets cooked evenly all over. Mix the mayonnaise, sour cream and cilantro together. Grate the Parmesan in another bowl. While the corn is still warm slather with mayonnaise mix. Squeeze lime juice over the corn and shower with Parmesan. Season with chili powder and serve with extra lime wedges.")
  end

  test "recipebox should be valid" do
    assert @recipebox.valid?
  end

  test "user_id should be present" do
    @recipebox.user_id = nil
    assert_not @recipebox.valid?
  end

  test "name should be present" do
    @recipebox.name = ""
    assert_not @recipebox.valid?
  end

  test "name length should not be to long" do
    @recipebox.name = "a" * 101
    assert_not @recipebox.valid?
  end

  test "name length should not be to short" do
    @recipebox.name = "aaaa"
    assert_not @recipebox.valid?
  end

  test "summary should be present" do
    @recipebox.summary = ""
    assert_not @recipebox.valid?
  end

  test "summary should not be too long" do
    @recipebox.summary = "a" * 151
    assert_not @recipebox.valid?
  end

  test "summary length should not be to short" do
    @recipebox.summary = "a" * 9
    assert_not @recipebox.valid?
  end

  test "description must be present" do
    @recipebox.description = " "
    assert_not @recipebox.valid?
  end

  test "description should not be to long" do
    @recipebox.description = "a" * 501
    assert_not @recipebox.valid?
  end

  test "description should not be to short" do
    @recipebox.description = "a" * 19
    assert_not @recipebox.valid?
  end
end
