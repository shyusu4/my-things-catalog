require_relative './item'
class Movie < Item
    def initialize(silet:true, published_date, archived)
        @silet = silet
        super(published_date, archived)
    end
    def can_be_archived?
        if can_be_archived? || @silet == true
            true
        else
            false
        end
    end
end