class SkyBox
  constructor: (imgUrl) ->
    skyBoxGeometry = new THREE.CubeGeometry(5, 5, 5)
    skyBoxMaterial = new THREE.MeshBasicMaterial( {map: THREE.ImageUtils.loadTexture('#{imgUrl}'), side:THREE.DoubleSide} )
    skyBox = new THREE.Mesh(skyBoxGeometry, skyBoxMaterial)
    return skyBox

window.SkyBox = SkyBox