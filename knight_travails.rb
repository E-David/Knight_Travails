#create a chess board with a horizontal array and vertical area of possible moves
class Board
	attr_accessor :parent, :left_child, :right_child
	attr_reader :value
	def initialize(value, parent=nil, left_child=nil, right_child=nil)
		@value = value
		@parent = parent
		@left_child = left_child if @left_child != nil
		@right_child = right_child if @right_child != nil
	end

		# Put all instance variables of a board in an easily read string
	def to_s
		str = ""
		str += "<board: #{@value} "
		str += "@parent: #{@parent.value} " if !@parent.nil?
		str += "@left_child: #{@left_child.value} " if !@left_child.nil?
		str += "@right_child: #{@right_child.value}>" if !@right_child.nil?
		str
	end

end

def build_tree(array)
	root = Board.new(array[0])
	arr = Array.new
	array.each_with_index do |num, index| 
		index == 0 ?  arr << root : arr << link(root,num)
	end
	arr
end


def link(board, num)
	if num < board.value
		if board.left_child.nil?
			board.left_child = Board.new(num, board)
		else
			link(board.left_child, num)
		end
	elsif num > board.value
		if board.right_child.nil?
			board.right_child = Board.new(num, board)
		else
			link(board.right_child, num)
		end
	else
		return board
	end
end

def bfs(array, value)
	bst = build_tree(array)
	queue = [bst.first]
	until queue.empty?
		current = queue.shift
		return (p current.value) if current.value == value
		queue << current.left_child if !current.left_child.nil?
		queue << current.right_child if !current.right_child.nil?
	end
end
#create a knight and place in a random location
#vertical and horizontal arrays act as children, root is knight location
#create a bst to find this location
# use dfs OR bfs to find the fastest way to get knight to specified location

def knight_travails(array)
	knight = array.sample
	knight
end

array = Array.new
(0..8).each { |x| array << x }
value = knight_travails(array)
p array,value
bfs(array, value)
