class Item
  @@list = []
  attr_reader :id
  attr_accessor :name, :rank

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def save()
    @@list.each do |item|
      if self.name == item.name
        self.rank = item.rank
        @@list.delete(item)
      elsif self.rank == item.rank
        self.name = item.name
        @@list.delete(item)
      end
    end
    @@list.push(self)
  end

  def self.clear()
    @@list = []
  end


  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item.id == item_id
        return item
      end
    end
  end

  def update
  end

  def self.sort()
    @@list.sort_by { |x| x.rank}
  end
end
