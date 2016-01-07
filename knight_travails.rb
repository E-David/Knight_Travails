#create a chess board with a horizontal array and vertical area of possible moves
class Board
	attr_accessor :knight, :valid_moves, :parent
	def initialize(knight, parent=nil, valid_moves=[])
		@knight = knight
		@parent = parent
		@valid_moves = valid_moves
		validate_moves
	end

		# Put all instance variables of a board in an easily read string
	def to_s
		str = ""
		str += "@knight: #{@knight} "
		str += "@parent: #{@parent} " if @parent != nil
		str += "@valid_moves: #{@valid_moves.sort} "
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

class Knight_Travails
	attr_accessor :squares_visited, :move_count, :movement_tracking, :move_list
	def initialize
		@movement_tracking = Array.new
		@move_count = 0
		@squares_visited = Array.new
		@move_list = Array.new
	end

	def build_tree(current_knight_position, parent)
		root = Board.new(current_knight_position, parent)
		root
	end

	def bfs(knight_start, knight_end)
		bst = build_tree(knight_start, nil)
		queue = []
		movement_tracking << bst
		x = []
		return p "You are already on the #{knight_start} square!" if knight_start == knight_end
		catch(:result) do
			until movement_tracking.size == 100
				movement_tracking.each { |q| queue << q }
				until queue.empty?
					current = queue.shift
					if current.knight == knight_end
						x << current
						throw :result 
					end
					current.valid_moves.each do |move| 
						movement_tracking << build_tree(move, current.knight) unless @squares_visited.include?(move)
						@squares_visited << move
					end
				end
				@move_count += 1
			end
		end
		until x.last.knight == knight_start
			movement_tracking.each { |y| x << y if y.knight == x.last.parent }
		end
		x.each { |y| move_list << y.knight}
		shortest_path(knight_start, knight_end)
	end

	def shortest_path(knight_start, knight_end)
		p "You can get to the #{knight_end} square from the #{knight_start} square in #{move_count} moves! Here's how:" 
		move_list.reverse.each { |move| p move }
	end
end
all_moves = []
(0..7).each { |x| (0..7).each { |y| all_moves << [x,y] } }
x = Knight_Travails.new
#x.bfs(all_moves.sample, all_moves.sample)
x.bfs(all_moves.sample,all_moves.sample)

