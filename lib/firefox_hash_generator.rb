require 'digest'

module FirefoxHashGenerator
  # @see https://blog.onee3.org/2018/04/manually-add-a-search-engine-to-firefox-quantum/
  # @see https://developer.mozilla.org/en-US/docs/Tools/Browser_Console
  # @see https://hg.mozilla.org/mozilla-central/rev/2ae760290f8c
  module_function def generate(app_name, profile_basename, search_engine_name)
    text = profile_basename + search_engine_name + TEMPLATE.gsub('$appName', app_name)
    Digest::SHA256.base64digest(text)
  end

  APP_NAMES = {
    firefox: 'Firefox',
    pale_moon: 'Pale Moon',
    waterfox: 'Waterfox',
  }.freeze

  private

  TEMPLATE = "By modifying this file, I agree that I am doing so " +
    "only within $appName itself, using official, user-driven search " +
    "engine selection processes, and in a way which does not circumvent " +
    "user consent. I acknowledge that any attempt to change this file " +
    "from outside of $appName is a malicious act, and will be responded " +
    "to accordingly.".freeze
end
