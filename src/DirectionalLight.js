// Generated by CoffeeScript 1.6.3
(function() {
  var DirectionalLight,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  DirectionalLight = (function(_super) {
    __extends(DirectionalLight, _super);

    function DirectionalLight(_arg) {
      var color, distance, intensity, position, _ref;
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
      this.position.set(position.x, position.y, position.z);
      return this;
    }

    return DirectionalLight;

  })(THREE.DirectionalLight);

  window.DirectionalLight = DirectionalLight;

}).call(this);

/*
//@ sourceMappingURL=DirectionalLight.map
*/
