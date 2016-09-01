require 'open3'
# Acquire a fortune from a coo.kie.space/a.
class Cookie < Plugin
  def initialize
    super
    @needs_sanitization = true
    @commands = %w(cookie)
    @help_text = 'Get a randomly generated fortune'
    @min_args = 0
  end
  def go(source, _command, args, bot)
    result = nil
      Open3.popen3('curl', '--silent', 'http://coo.kie.space/a') do |_stdin, stdout, stderr|
      result = stdout.read.chomp
      bot.say(self, source, result)
    end
end
end
