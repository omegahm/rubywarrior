class Player
  def initialize
    @health = 20
    @direction = :backward
    @attacking = false
    @resting = false
  end

  def play_turn(warrior)
    if warrior.feel.wall?
      warrior.pivot!
      @resting = false
    else

      space = warrior.feel @direction

      if space.wall?
        @direction = :forward
      end

      if space.captive?
        warrior.rescue! @direction
        @resting = false
      elsif space.enemy?
        warrior.attack! @direction
        @resting = false
        @attacking = true
      elsif space.stairs?
        warrior.walk! @direction
      else
        spaces = warrior.look :forward
        
        if spaces.any? {|s| s.enemy?} and !spaces.any? {|s| s.captive?} and @health <= warrior.health
          warrior.shoot!
          @direction = :forward
        elsif warrior.health < 20 and @health <= warrior.health
          warrior.rest!

          if @resting and @direction == :backward
            @direction = :forward
          end

          @resting = true
        else
          warrior.walk! @direction
          @resting = false
        end

        @direction = :backward if @attacking
        @attacking = false
      end

      @health = warrior.health
    end
  end
end
