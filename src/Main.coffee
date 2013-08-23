class Main
  constructor: () ->
    @scene = new THREE.Scene()
    @renderer = new THREE.WebGLRenderer( { antialias: true, alpha: false } )
    @renderer.setClearColor(0x9C9C9C)

    @camera = new PerspectiveCamera( { width:window.innerWidth, height:window.innerHeight } )

    window.addEventListener( 'resize', @onWindowResize, false )

  render: () ->
    @scene.updateMatrixWorld()
    @renderer.clear()
    @renderer.render(@scene, @camera)

  onWindowResize: () =>
    @camera.aspect = window.innerWidth / window.innerHeight
    @camera.updateProjectionMatrix()
    @renderer.setSize( window.innerWidth, window.innerHeight )

window.Main = Main

window.animate = () ->
  requestAnimationFrame(window.animate)
  window.app.render()
