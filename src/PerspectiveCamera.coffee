class PerspectiveCamera extends THREE.PerspectiveCamera
  constructor: ({ width, height, pos } = {}) ->
    @pos = pos
    fov = 45
    aspect = width / height
    near = 0.1
    far = 10000

    THREE.PerspectiveCamera.call(@, fov, aspect, near, far)
    @.position.set(pos.x, pos.y, pos.z)
    return @

  reset: () ->
      @.position.set(@pos.x, @pos.y, @pos.z)

window.PerspectiveCamera = PerspectiveCamera