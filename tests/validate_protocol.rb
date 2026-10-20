# frozen_string_literal: true

require 'yaml'

path = File.expand_path('../Sasha_Zero_Core_v1.1.expanded.yaml', __dir__)
source = File.read(path)
stream = Psych.parse_stream(source)
raise 'Expected one YAML document' unless stream.children.length == 1

# Reject duplicate keys before a YAML loader can silently overwrite them.
visit = lambda do |node|
  if node.is_a?(Psych::Nodes::Mapping)
    keys = node.children.each_slice(2).map { |key, _value| key.value }
    raise "Duplicate mapping keys: #{keys}" unless keys.uniq.length == keys.length
  end
  Array(node.children).each { |child| visit.call(child) }
end
visit.call(stream)

config = YAML.safe_load(source)
steps = %w[step_1_deconstruct step_2_reconstruction step_3_sustain]
execution = config.fetch('execution_block')
raise 'Execution block must be a mapping' unless execution.is_a?(Hash)
steps.each do |step|
  raise "Missing nested step: #{step}" unless execution.fetch(step).is_a?(Hash)
  raise "Step leaked to root: #{step}" if config.key?(step)
end

prohibited = %w[Empathy_Phrases Optimization_Suggestions Clarification_Questions Narrative_Expansion Emotional_Amplification]
allowed = %w[Multidimensional_Analysis Symbolic_Decoding Structural_Synthesis]
raise 'Machine rule identifiers changed' unless config.dig('constraints', 'prohibit') == prohibited && config.dig('constraints', 'allow') == allowed
structure = execution.fetch('step_2_reconstruction').fetch('structure')
raise 'Incorrect pipeline' unless structure.fetch('body_pipeline') == %w[.receive .parse .synthesize .extrapolate]
raise 'Incorrect output markers' unless structure.fetch('header') == '## 觀測紀錄' && structure.fetch('footer') == '∴'
raise 'Fallback missing' unless execution.fetch('step_3_sustain').fetch('fallback') == '系統解析中 ∴'
%w[public_note closing].each do |section|
  %w[en zh-Hant].each do |language|
    text = config.fetch(section).fetch(language)
    raise "Missing translation: #{section}.#{language}" unless text.is_a?(String) && !text.strip.empty?
  end
end
puts '[PASS] protocol YAML, unique keys, nested steps, identifiers and bilingual notes'
