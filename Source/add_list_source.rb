method SourcesFunctions
    def add_source(sources)
        puts 'Enter the name of the source'
        name = gets.chomp.to_s
        source = Source.new(name)
        sources << source
        puts 'Source created successfully'
    end

end