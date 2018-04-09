require 'telegram/bot/updates_controller/rspec_helpers'
require 'rails_helper'
require "action_cable/testing/rspec"

RSpec.describe Bot1WebhooksController, :robo1bot do
  include_context 'telegram/bot/integration'
  include_context 'telegram/bot/updates_controller'

  describe '#start' do
    subject { -> { dispatch_command :start } }
    it { should respond_with_message "Hello, #{from['first_name']}" }
  end


  describe '#message' do
    subject { -> { dispatch_message text } }
    let(:text) { 'some plain text' }
    it "matches with broadcast message" do
      expect {
        ActionCable.server.broadcast('telegram', message: text, chat_id: from['id'])
      }.to have_broadcasted_to('telegram').from_channel(ChatChannel).with(message: text, chat_id: nil)
    end
  end

end
