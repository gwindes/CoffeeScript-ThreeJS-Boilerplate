class ShadowedLight extends THREE.DirectionalLight
  # constructor: ({ color=0xffffff, intensity=1.0, distance=100, position={x:0, y:0, z:0} }) ->
  constructor: ({ color, intensity, distance, position } = {}) ->
    color ?= 0xffffff
    intensity ?= 1.0
    distance ?= 100
    position ?= {x:0, y:0, z:0}
    # console.log "color = #{color} \t intensity = #{intensity} \t position = [#{position.x}, #{position.y}, #{position.z}]"
    THREE.DirectionalLight.call(@, color, intensity, 2)
    
    scale = 2
    @.position.set(position.x*scale, position.y*scale, position.z*scale)

    scale = 2
    @.castShadow = true
    @.shadowCameraVisible = true
    d = 1
    @.shadowCameraLeft = -d
    @.shadowCameraRight = d
    @.shadowCameraTop = d
    @.shadowCameraBottom = -d

    @.shadowCameraNear = 1
    @.shadowCameraFar = 4

    return @

window.ShadowedLight = ShadowedLight
