class Node
	attr_accessor :left, :right
	attr_reader :desti
	def initialize (desti, left = 0, right = 0)
		@desti = desti
		@left = left
		@right = right
		@left_goal = desti[0]
		@right_goal = desti[1]
		moves(@left, @left_goal, @right, @right_goal)
	end

	def moves(left, left_goal, right, right_goal)
		until left == left_goal && right == right_goal
			return (p "RIGHT ERROR") if (right < 0 || right > 7)
			return (p"LEFT ERROR") if (left < 0 || left > 7)
			queue = Array.new
			queue << begin ([left + 1, right + 2]; [left + 1, right - 2]; [left + 2, right + 1]; [left + 2, right - 1]; [left - 2, right + 1]; [left - 2, right - 1]; [left -1, right + 2]; [left - 1, right - 2]) end
			p queue
			left = left_goal
			right = right_goal
		end
		p left,left_goal,right,right_goal
	end
end


	def possible_arrays(array)
	possible_changes = [[2,1],[2,-1],[1,2],[1,-2],[-2,1],[-2,-1],[-1,2],[-1,-2]]
	possible_changes.map! { |c| [c,array].transpose.map { |t| t.reduce(:+) } }
	return p possible_changes.select { |x| x.none? { |y| y > 7 || y < 0 } }.sort
	end
	possible_arrays([2,2])

#array = [(0..7).to_a.sample, (0..7).to_a.sample]
#x = Node.new(array)