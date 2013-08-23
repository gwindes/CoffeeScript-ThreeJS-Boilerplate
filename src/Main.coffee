class Main
  constructor: () ->
    @scene = new THREE.Scene()
    @renderer = new THREE.WebGLRenderer( { antialias: true, alpha: false } )
    @renderer.setClearColor(0x9C9C9C)

    @camera = new Camera({width:window.innerWidth, height:window.innerHeight})

    window.addEventListener( 'resize', @onWindowResize, false )

  render: () ->
    @scene.updateMatrixWorld()
    @renderer.clear()
    @renderer.render(@scene, @camera)

  animate: () ->
    requestAnimationFrame(animate)
    # @stats.update() # if you are using the stats module uncomment
    render()

  onWindowResize: () =>
    @camera.aspect = window.innerWidth / window.innerHeight;
    @camera.updateProjectionMatrix();
    @renderer.setSize( window.innerWidth, window.innerHeight );

window.Main = Main