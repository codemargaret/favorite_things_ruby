require('rspec')
require('pry')
require('favorite_things')

describe("Item") do
  before() do
    Item.clear()
  end
  describe('#name') do
    it('saves a value in name') do
      item = Item.new('ice cream', 1)
      name = "ice cream"
      expect(item.name).to(eq("ice cream"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Item.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an item to the list of items') do
      item = Item.new('ice cream', 1)
      item.save()
      expect(Item.all()).to(eq([item]))
    end

    it('will not push repeated item (rank or name) to list') do
      item = Item.new('ice cream', 1)
      item.save()
      item2= Item.new('ice cream', 9)
      expect(Item.all()).to(eq([item]))
    end
  end

  describe("#id") do
      it("increments an id by 1 each time a new item is added") do
        item = Item.new("tacos", 1)
        item.save()
        item2 = Item.new("pizza", 2)
        item2.save()
        expect(item.id()).to(eq(1))
        expect(item2.id()).to(eq(2))
      end
    end

  describe(".clear") do
    it("clears all items from the list") do
      item = Item.new("dogs", 1)
      item.save()
      Item.clear()
      expect(Item.all()).to(eq([]))
    end
  end


  describe(".find") do
    it("finds an item based on its id") do
      item = Item.new("tacos", 1)
      item.save()
      item2 = Item.new("pizza", 2)
      item2.save()
      expect(Item.find(1)).to(eq(item))
      expect(Item.find(2)).to(eq(item2))
    end
  end

  describe(".sort") do
    it("sorts all items by rank") do
      item = Item.new("dogs", 2)
      item.save()
      item2 = Item.new("cats", 1)
      item2.save()
      expect(Item.sort()).to(eq([item2,item]))
    end
  end
end
