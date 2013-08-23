class Player extends Character
  constructor: ({ name } = {}) ->
    super(CharacterType.Player)

  
window.Player = Player