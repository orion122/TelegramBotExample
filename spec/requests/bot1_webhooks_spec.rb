RSpec.describe Bot1WebhooksController, :robo1bot do
=begin
  def reply
    bot.requests[:sendMessage].last
  end
=end

  describe '#start' do
    subject { -> { dispatch_command :start } }
    it { should respond_with_message "Hello, " }
  end


=begin
  describe '#message' do
    subject { -> { dispatch_message text } }
    let(:text) { 'some plain text' }
    it { should respond_with_message "You wrote: #{text}" }
  end
=end

end
