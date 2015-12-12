#create a chess board with a horizontal array and vertical area of possible moves
class Board
	attr_accessor :knight, :valid_moves
	def initialize(knight, valid_moves=[])
		@knight = knight
		@valid_moves = valid_moves
		validate_moves
	end

		# Put all instance variables of a board in an easily read string
	def to_s
		str = ""
		str += "@knight: #{@knight} "
		str += "@valid_moves: #{@valid_moves} "
	end

	def possible_moves(knight_position)
		possible_knight_moves = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
		possible_knight_moves.map! { |c| [c,knight_position].transpose.map { |t| t.reduce(:+) } }
	end

	def validate_moves
		possible_moves(knight).each do |move|
			if move.none? { |m| m > 7 || m < 0 }
				@valid_moves << move
			end
		end
	end
end

def build_tree(current_knight_position)
	current_knight_position = Board.new(current_knight_position)
	p current_knight_position.to_s
	new_knight_position = 
end

def bfs(knight_start, knight_end)
	bst = build_tree(knight_start)
	queue = [bst.first]
	until queue.empty?
		current = queue.shift
		return current if current.value == value
		queue << current.left_child unless current.left_child.nil?
		queue << current.right_child unless current.right_child.nil?
	end
	nil
end

def dfs(array,value)
	bst = build_tree(array)
	stack = [bst.first]
	until stack.empty?
		current = stack.shift
		return current if current.value == value
		stack << current.left_child unless current.left_child.nil?
		stack << current.right_child unless current.right_child.nil?
	end
	nil
end
#vertical and horizontal arrays act as children, root is knight location
#create a bst to find this location
# use dfs OR bfs to find the fastest way to get knight to specified location
#create a knight and place in a random location

build_tree([3,7])