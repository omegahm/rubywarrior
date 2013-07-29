class Player
  def play_turn(warrior)
    stairs_direction = warrior.direction_of_stairs
    
    # feel all around
    spaces = {
      :forward  => warrior.feel(:forward),
      :left     => warrior.feel(:left),
      :right    => warrior.feel(:right),
      :backward => warrior.feel(:backward)
    } 

    enemies = spaces.select {|k, v| v.enemy? }

    if enemies.empty?
      if warrior.health < 20
        warrior.rest!
      else
        warrior.walk! stairs_direction
      end
    else
      warrior.attack! enemies.first.first # first gets the first enemy, first get the direction
    end
  end
end
