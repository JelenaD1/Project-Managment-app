require "rails_helper"

RSpec.describe UsersController, type: :controller do
  it { should use_before_action(:authenticate_user!) }
  it { should_not use_before_action(:prevent_ssl) }



end
