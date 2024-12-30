
class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end

  def next_node
    @next_node
  end

  def set_value(new_value)
    @value = new_value
  end

  def set_next_node(new_node)
    @next_node = new_node
  end

end

class LinkedList

  @head = nil
  @tail = nil

  def append(value)
    node = Node.new(value)
    unless @tail == nil
      @tail.set_next_node(node)
    end
    @tail = node
    @head = node if @head == nil
  end

  def prepend(value)
    node = Node.new(value)
    node.set_next_node(@head)
    @head = node
    @tail = node if @tail == nil
  end

  def size
    count = 0
    current = @head
    while current != nil
      current = current.next_node
      count += 1
    end
    count
  end
  
  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    current = @head
    for i in (1..index)
      current = current.next_node
      return nil if current == nil
    end
    current.value
  end


  def pop
    current = @head
    if @head == @tail
      @head = nil
      @tail = nil
      return @tail
    end

    until current.next_node == @tail
      current = current.next_node
    end

    current.set_next_node(nil)
    @tail = current
  end

  def contains?(value)
    current = @head
    until current == nil
      return true if current.value === value
      current = current.next_node
    end 

    false
  end

  def find(value)
    current = @head
    index = 0
    until current.value == value
      return nil if current == nil
      current = current.next_node
      index += 1
    end

    index
  end

  def to_s
    current = @head
    str = ""
    until current == nil
      str += "( #{current.value} ) -> "
      current = current.next_node
    end

    str += "nil"
    str
  end

end

# Testing Linked List
list = LinkedList.new

list.append('dog')
list.append('cat')
list.append('parrot')
list.append('hamster')
list.append('snake')
list.append('turtle')

puts list