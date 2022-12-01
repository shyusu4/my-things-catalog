module SourcesFunctions
  def list_sources(sources)
    sources.each_with_index do |source, index|
      puts "#{index + 1} - Source: #{source.name}"
    end
  end
end
