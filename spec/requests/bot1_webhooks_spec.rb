RSpec.describe Bot1WebhooksController, :telegram_bot do
=begin
  def reply
    bot.requests[:sendMessage].last
  end
=end

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
