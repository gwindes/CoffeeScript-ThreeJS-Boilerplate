class MouseListener
  constructor: (@renderer) ->
    @renderer.domElement.addEventListener "mousedown", @onMouseDown, (false)
    @renderer.domElement.addEventListener "mouseup", @onMouseUp, (false)
    return @

  onMouseDown: (event) =>
    @renderer.domElement.addEventListener "mousemove", @onMouseMove, (false)
    console.log "Mouse Down: x = #{event.layerX} \t y = #{event.layerY}"

  onMouseUp: (event) =>
    @renderer.domElement.removeEventListener "mousemove", @onMouseMove, (false)
    console.log "Mouse Up: x = #{event.layerX} \t y = #{event.layerY}"

  onMouseMove: (event) =>
    console.log "Mouse Moved: x = #{event.layerX} \t y = #{event.layerY}"

window.MouseListener = MouseListener
