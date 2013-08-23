class MouseListener
  constructor: (@parent, @renderer) ->
    @addEventListener("mousedown")
    @addEventListener("mouseup")
    @addEventListener("touchstart")

    @onMouseDownPosition = new THREE.Vector2()
    @onMouseMovePosition = new THREE.Vector2()
    @onMouseUpPosition   = new THREE.Vector2()

    @projector = new THREE.Projector()
    @ray = new THREE.Raycaster();
    @offset = new THREE.Vector3();
    @selected = @parent.camera

    return @

  addEventListener: (type) ->
    obj = @renderer.domElement
    switch type
      when 'mousedown'
        obj.addEventListener "mousedown",  @onMouseDown, (false)
      when 'mouseup'
        obj.addEventListener "mouseup",    @onMouseUp,   (false)
      when 'mousemove'
        obj.addEventListener "mousemove",  @onMouseMove, (false)
      when 'touchstart'
        obj.addEventListener "touchstart", @onMouseDown, (false)
      when 'touchmove'
        obj.addEventListener "touchmove",  @onMouseMove, (false)
      when 'touchend'
        obj.addEventListener "touchend",   @onMouseUp,   (false)

  removeEventListener: (type) ->
    obj = @renderer.domElement
    switch type
      when 'mousedown'
        obj.removeEventListener "mousedown", @onMouseDown, (false)
      when 'mouseup'
        obj.removeEventListener "mouseup",   @onMouseUp,   (false)
      when 'mousemove'
        obj.removeEventListener "mousemove", @onMouseMove, (false)

  getIntersects: (event, object) ->
    vector = new THREE.Vector3(
         (event.layerX / @renderer.domElement.offsetWidth) * 2 - 1,
         - (event.layerY / @renderer.domElement.offsetHeight) * 2 + 1,
         0.5
      )
    # console.log "MouseClick intersects pos: (" + vector.x + ", " + vector.y + ", " + vector.z + ")"

    @projector.unprojectVector(vector, @parent.camera)
    @ray.set(@parent.camera.position, vector.sub(@parent.camera.position).normalize())

    if object instanceof Array
      intersects = @ray.intersectObjects(object, true)
      console.log "intersects.length = " + intersects.length
      if intersects.length > 0
        console.log "Picked object = " + intersects[0].object.name
        return @ray.intersectObjects(object, true)

    return @ray.intersectObjects(object, true)

  onMouseDown: (event) =>
    console.log "Mouse Down: x = #{event.layerX} \t y = #{event.layerY}"
    console.log "event = #{event} \t button = #{event.button}"
    event.preventDefault()
    # @addEventListener("mousemove")
    @addEventListener("mouseup")

    
    # if @parent != undefined then console.log "parent = #{@parent.getName()}" else console.log "@ = #{this}"
    # console.log "@ = #{@.getName()}"  

    @renderer.domElement.focus()
    @onMouseDownPosition.set(event.layerX, event.layerY)

    # if object != null
    #   intersects = @getIntersects(event, @parent.objects)
    #   if intersects.length > 0
    #     object = intersects[0].object

    #     if @selected == object
    #       @intersectionPlane.position.copy(@selected.position)
    #       @intersectionPlane.lookAt(@parent.camera.position)
    #       @intersectionPlane.updateMatrixWorld()

    #       intersects = ray.intersectObject(@intersectionPlane)
    #       offset.copy(intersects[0].point).sub(@intersectionPlane.position)

    #       @addEventListener("mousemove")

    #       @parent.disableCameraControls()
    #   else
    #     @parent.enableCameraControls()

    # @addEventListener("mouseup")

  onMouseUp: (event) =>
    removeEventListener("mousemove")
    @onMouseUpPosition.set(event.layerX, event.layerY)
    console.log "Mouse Up: x = #{event.layerX} \t y = #{event.layerY}"

    if @onMouseDownPosition.distanceTo(@onMouseUpPosition) < 1
      console.log "@ = #{@.getName()}"
      console.log "parent = #{@parent.getName()}"
      intersects = @getIntersects(event, @parent.objects)

      if intersects.length > 0
        selected = intersects[0].object
        signals.objectSelected.dispatch(selected)
        console.log "selected.name = " + selected.name
        console.log "selected.parent = " + selected.parent.name
      else
        @parent.enableCameraControls()
        selected = @parent.camera
        signals.objectSelected.dispatch(selected)
      @parent.render()

  onMouseMove: (event) =>
    console.log "Mouse Moved: x = #{event.layerX} \t y = #{event.layerY}"

window.MouseListener = MouseListener
