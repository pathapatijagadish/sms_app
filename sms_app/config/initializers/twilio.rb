path = File.join(Rails.root, "config/twilio.yml")
TWILIO_CONFIG = YAML.load(File.read(path))[Rails.env] || {'sid' => 'AC0dd12d458bb0de56e8af4e4692175b52', 'from' => '+12015618808', 'token' => '0185effde7f4b360fc3a8792b4754d10'}