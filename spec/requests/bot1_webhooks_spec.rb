require 'telegram/bot/updates_controller/rspec_helpers'

RSpec.describe Bot1WebhooksController, :robo1bot do
  include_context 'telegram/bot/integration'
  include_context 'telegram/bot/updates_controller'


  describe '#start' do
    subject { -> { dispatch_command :start } }
    it { should respond_with_message "Hello, #{from['first_name']}" }
  end


=begin
  describe '#message' do
    subject { -> { dispatch_message text } }
    let(:text) { 'some plain text' }
    it { should respond_with_message "You wrote: #{text}" }
  end
=end

end
