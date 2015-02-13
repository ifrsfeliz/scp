require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase

  setup do
    @document = documents(:one)
    @request.env['HTTP_REFERER'] = 'text_to_not_get_error_:D'
  end

  test "should get destroy" do
    assert_difference('Document.count', -1) do
      delete :destroy, id: @document
    end
  end

end
