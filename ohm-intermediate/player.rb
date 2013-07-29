class Player
  def play_turn(warrior)
    stairs_direction = warrior.direction_of_stairs
    
    # feel all around
    spaces = {
      :backward => warrior.feel(:backward),
      :left     => warrior.feel(:left),
      :right    => warrior.feel(:right),
      :forward  => warrior.feel(:forward)
    } 

    enemies = spaces.select {|k, v| v.enemy? }
    captives = spaces.select {|k, v| v.captive? }

    if enemies.count > 1
      warrior.bind! enemies.first.first
    elsif enemies.count == 1
      warrior.attack! enemies.first.first # first gets the first enemy, first get the direction
    elsif warrior.health < 20
      warrior.rest! 
    elsif captives.count > 0
      warrior.rescue! captives.first.first
    else
      warrior.walk! stairs_direction
    end
  end
end
