class Player
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    space = warrior.feel

    if space.captive?
      warrior.rescue!
    elsif space.enemy?
      warrior.attack!
    elsif space.stairs?
      warrior.walk!
    elsif warrior.health < 20 and @health <= warrior.health
      warrior.rest!
    else
      warrior.walk!
    end

    @health = warrior.health
  end
end
