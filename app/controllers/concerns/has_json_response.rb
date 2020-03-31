module HasJsonResponse
  extend ActiveSupport::Concern

  private
  def create_success(model)
    model.create_success_to_json
  end

  def update_success(model)
    model.update_success_to_json
  end

  def messages_errors(model)
    model.errors.messages
  end
end