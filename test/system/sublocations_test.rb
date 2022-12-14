require "application_system_test_case"

class SublocationsTest < ApplicationSystemTestCase
  setup do
    @sublocation = sublocations(:one)
  end

  test "visiting the index" do
    visit sublocations_url
    assert_selector "h1", text: "Sublocations"
  end

  test "should create sublocation" do
    visit sublocations_url
    click_on "New sublocation"

    fill_in "Description", with: @sublocation.description
    fill_in "Img quadrata url", with: @sublocation.img_quadrata_url
    fill_in "Img ret orizzontale", with: @sublocation.img_ret_orizzontale
    fill_in "Img ret verticale", with: @sublocation.img_ret_verticale
    fill_in "Name", with: @sublocation.name
    fill_in "Note", with: @sublocation.note_id
    fill_in "Num location", with: @sublocation.num_location
    fill_in "Num posti max", with: @sublocation.num_posti_max
    click_on "Create Sublocation"

    assert_text "Sublocation was successfully created"
    click_on "Back"
  end

  test "should update Sublocation" do
    visit sublocation_url(@sublocation)
    click_on "Edit this sublocation", match: :first

    fill_in "Description", with: @sublocation.description
    fill_in "Img quadrata url", with: @sublocation.img_quadrata_url
    fill_in "Img ret orizzontale", with: @sublocation.img_ret_orizzontale
    fill_in "Img ret verticale", with: @sublocation.img_ret_verticale
    fill_in "Name", with: @sublocation.name
    fill_in "Note", with: @sublocation.note_id
    fill_in "Num location", with: @sublocation.num_location
    fill_in "Num posti max", with: @sublocation.num_posti_max
    click_on "Update Sublocation"

    assert_text "Sublocation was successfully updated"
    click_on "Back"
  end

  test "should destroy Sublocation" do
    visit sublocation_url(@sublocation)
    click_on "Destroy this sublocation", match: :first

    assert_text "Sublocation was successfully destroyed"
  end
end
