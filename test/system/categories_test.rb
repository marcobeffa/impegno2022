require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h1", text: "Categories"
  end

  test "should create category" do
    visit categories_url
    click_on "New category"

    fill_in "Calendar", with: @category.calendar_id
    fill_in "Color", with: @category.color
    fill_in "Description", with: @category.description
    fill_in "Image card url", with: @category.image_card_url
    fill_in "Image icona url", with: @category.image_icona_url
    fill_in "Indirizzo", with: @category.indirizzo
    fill_in "Luogo", with: @category.luogo
    fill_in "Name", with: @category.name
    fill_in "Profile", with: @category.profile_id
    click_on "Create Category"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "should update Category" do
    visit category_url(@category)
    click_on "Edit this category", match: :first

    fill_in "Calendar", with: @category.calendar_id
    fill_in "Color", with: @category.color
    fill_in "Description", with: @category.description
    fill_in "Image card url", with: @category.image_card_url
    fill_in "Image icona url", with: @category.image_icona_url
    fill_in "Indirizzo", with: @category.indirizzo
    fill_in "Luogo", with: @category.luogo
    fill_in "Name", with: @category.name
    fill_in "Profile", with: @category.profile_id
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "should destroy Category" do
    visit category_url(@category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
end
