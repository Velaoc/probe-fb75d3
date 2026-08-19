require "test_helper"

class GuestbookTest < ActionDispatch::IntegrationTest
  test "root renders the form and an empty wall" do
    get root_path

    assert_response :success
    assert_select "h1", text: "Leave a note."
    assert_select "form[action='#{root_path}']"
    assert_select "textarea[name='message[body]']"
    assert_select "input[name='message[name]']"
    assert_select ".md-guestbook__entry", count: 0
    assert_select "a.md-skip-link[href='#main-content']", text: "Skip to main content"
    assert_select "footer a[href='#{legal_terms_path}']", minimum: 1
  end

  test "posting a message adds it to the wall" do
    post root_path, params: { message: { name: "Ada", body: "Hello from the wall." } }

    assert_redirected_to root_path
    follow_redirect!

    assert_response :success
    assert_select ".md-guestbook__body", text: "Hello from the wall."
    assert_select ".md-guestbook__meta", /Ada/
  end

  test "wall is newest first" do
    older = Message.create!(name: "Older", body: "First in.")
    newer = Message.create!(name: "Newer", body: "Second in.")

    get root_path

    assert_response :success
    assert_select ".md-guestbook__entry", count: 2
    assert_equal [ newer.id, older.id ], css_select(".md-guestbook__entry").map { |entry| entry["data-message-id"].to_i }
  end

  test "blank body is rejected" do
    post root_path, params: { message: { name: "Ada", body: "" } }

    assert_response :unprocessable_entity
    assert_select ".md-field__support", text: /can't be blank/
  end

  test "overlong body is rejected" do
    post root_path, params: { message: { name: "Ada", body: "x" * 501 } }

    assert_response :unprocessable_entity
    assert_select ".md-field__support", text: /too long/
  end
end
