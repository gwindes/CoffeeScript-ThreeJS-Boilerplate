class DirectionalLight extends THREE.DirectionalLight
  # constructor: ({ color=0xffffff, intensity=1.0, distance=100, position={x:0, y:0, z:0} }) ->
  constructor: ({ color, intensity, distance, position } = {}) ->
    color ?= 0xffffff
    intensity ?= 1.0
    distance ?= 100
    position ?= {x:0, y:0, z:0}
    # console.log "color = #{color} \t intensity = #{intensity} \t position = #{position}"
    THREE.DirectionalLight.call(@, color, intensity, 2)
    @.position.set(position.x, position.y, position.z)
    return @

window.DirectionalLight = DirectionalLight
