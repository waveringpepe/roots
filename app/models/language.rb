class Language

LANGUAGES = [:English, :Italian, :French, :Russian, :Spanish, :Portuguese, :Chinese, :German]

def self.options

LANGUAGES.map { |language| [language.capitalize, language] }

end

end