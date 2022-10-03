require "test_helper"

class Admins::ExamManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_exam_managers_create_url
    assert_response :success
  end
end
