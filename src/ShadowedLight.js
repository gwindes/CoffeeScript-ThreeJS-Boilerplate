// Generated by CoffeeScript 1.6.3
(function() {
  var ShadowedLight,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ShadowedLight = (function(_super) {
    __extends(ShadowedLight, _super);

    function ShadowedLight(_arg) {
      var color, d, distance, intensity, position, scale, _ref;
      _ref = _arg != null ? _arg : {}, color = _ref.color, intensity = _ref.intensity, distance = _ref.distance, position = _ref.position;
      if (color == null) {
        color = 0xffffff;
      }
      if (intensity == null) {
        intensity = 1.0;
      }
      if (distance == null) {
        distance = 100;
      }
      if (position == null) {
        position = {
          x: 0,
          y: 0,
          z: 0
        };
      }
      THREE.DirectionalLight.call(this, color, intensity, 2);
      scale = 2;
      this.position.set(position.x * scale, position.y * scale, position.z * scale);
      scale = 2;
      this.castShadow = true;
      this.shadowCameraVisible = true;
      d = 1;
      this.shadowCameraLeft = -d;
      this.shadowCameraRight = d;
      this.shadowCameraTop = d;
      this.shadowCameraBottom = -d;
      this.shadowCameraNear = 1;
      this.shadowCameraFar = 4;
      return this;
    }

    return ShadowedLight;

  })(THREE.DirectionalLight);

  window.ShadowedLight = ShadowedLight;

}).call(this);

/*
//@ sourceMappingURL=ShadowedLight.map
*/
