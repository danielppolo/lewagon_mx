require 'test_helper'

class PlantLabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get plant_labels_new_url
    assert_response :success
  end

  test "should get create" do
    get plant_labels_create_url
    assert_response :success
  end

end
