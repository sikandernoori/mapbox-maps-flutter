part of mapbox_maps_flutter;

enum OrnamentPosition {
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_RIGHT,
  BOTTOM_LEFT,
}

/// Configures the directions in which the map is allowed to move during a scroll gesture.
enum ScrollMode {
  /// The map may only move horizontally.
  HORIZONTAL,

  /// The map may only move vertically.
  VERTICAL,

  /// The map may move both horizontally and vertically.
  HORIZONTAL_AND_VERTICAL,
}

/// The enum controls how the puck is oriented
enum PuckBearing {
  /// Orients the puck to match the direction in which the device is facing.
  HEADING,

  /// Orients the puck to match the direction in which the device is moving.
  COURSE,
}

/// Defines scaling mode. Only applies to location-indicator type layers.
enum ModelScaleMode {
  /// Model is scaled so that it's always the same size relative to other map features. The property model-scale specifies how many meters each unit in the model file should cover.
  MAP,

  /// Model is scaled so that it's always the same size on the screen. The property model-scale specifies how many pixels each unit in model file should cover.
  VIEWPORT,
}

/// Gesture configuration allows to control the user touch interaction.
class GesturesSettings {
  GesturesSettings({
    this.rotateEnabled,
    this.pinchToZoomEnabled,
    this.scrollEnabled,
    this.simultaneousRotateAndPinchToZoomEnabled,
    this.pitchEnabled,
    this.scrollMode,
    this.doubleTapToZoomInEnabled,
    this.doubleTouchToZoomOutEnabled,
    this.quickZoomEnabled,
    this.focalPoint,
    this.pinchToZoomDecelerationEnabled,
    this.rotateDecelerationEnabled,
    this.scrollDecelerationEnabled,
    this.increaseRotateThresholdWhenPinchingToZoom,
    this.increasePinchToZoomThresholdWhenRotating,
    this.zoomAnimationAmount,
    this.pinchPanEnabled,
  });

  /// Whether the rotate gesture is enabled.
  bool? rotateEnabled;

  /// Whether the pinch to zoom gesture is enabled.
  bool? pinchToZoomEnabled;

  /// Whether the single-touch scroll gesture is enabled.
  bool? scrollEnabled;

  /// Whether rotation is enabled for the pinch to zoom gesture.
  bool? simultaneousRotateAndPinchToZoomEnabled;

  /// Whether the pitch gesture is enabled.
  bool? pitchEnabled;

  /// Configures the directions in which the map is allowed to move during a scroll gesture.
  ScrollMode? scrollMode;

  /// Whether double tapping the map with one touch results in a zoom-in animation.
  bool? doubleTapToZoomInEnabled;

  /// Whether single tapping the map with two touches results in a zoom-out animation.
  bool? doubleTouchToZoomOutEnabled;

  /// Whether the quick zoom gesture is enabled.
  bool? quickZoomEnabled;

  /// By default, gestures rotate and zoom around the center of the gesture. Set this property to rotate and zoom around a fixed point instead.
  ScreenCoordinate? focalPoint;

  /// Whether a deceleration animation following a pinch-to-zoom gesture is enabled. True by default.
  bool? pinchToZoomDecelerationEnabled;

  /// Whether a deceleration animation following a rotate gesture is enabled. True by default.
  bool? rotateDecelerationEnabled;

  /// Whether a deceleration animation following a scroll gesture is enabled. True by default.
  bool? scrollDecelerationEnabled;

  /// Whether rotate threshold increases when pinching to zoom. true by default.
  bool? increaseRotateThresholdWhenPinchingToZoom;

  /// Whether pinch to zoom threshold increases when rotating. true by default.
  bool? increasePinchToZoomThresholdWhenRotating;

  /// The amount by which the zoom level increases or decreases during a double-tap-to-zoom-in or double-touch-to-zoom-out gesture. 1.0 by default. Must be positive.
  double? zoomAnimationAmount;

  /// Whether pan is enabled for the pinch gesture.
  bool? pinchPanEnabled;

  Object encode() {
    return <Object?>[
      rotateEnabled,
      pinchToZoomEnabled,
      scrollEnabled,
      simultaneousRotateAndPinchToZoomEnabled,
      pitchEnabled,
      scrollMode?.index,
      doubleTapToZoomInEnabled,
      doubleTouchToZoomOutEnabled,
      quickZoomEnabled,
      focalPoint?.encode(),
      pinchToZoomDecelerationEnabled,
      rotateDecelerationEnabled,
      scrollDecelerationEnabled,
      increaseRotateThresholdWhenPinchingToZoom,
      increasePinchToZoomThresholdWhenRotating,
      zoomAnimationAmount,
      pinchPanEnabled,
    ];
  }

  static GesturesSettings decode(Object result) {
    result as List<Object?>;
    return GesturesSettings(
      rotateEnabled: result[0] as bool?,
      pinchToZoomEnabled: result[1] as bool?,
      scrollEnabled: result[2] as bool?,
      simultaneousRotateAndPinchToZoomEnabled: result[3] as bool?,
      pitchEnabled: result[4] as bool?,
      scrollMode:
          result[5] != null ? ScrollMode.values[result[5]! as int] : null,
      doubleTapToZoomInEnabled: result[6] as bool?,
      doubleTouchToZoomOutEnabled: result[7] as bool?,
      quickZoomEnabled: result[8] as bool?,
      focalPoint: result[9] != null
          ? ScreenCoordinate.decode(result[9]! as List<Object?>)
          : null,
      pinchToZoomDecelerationEnabled: result[10] as bool?,
      rotateDecelerationEnabled: result[11] as bool?,
      scrollDecelerationEnabled: result[12] as bool?,
      increaseRotateThresholdWhenPinchingToZoom: result[13] as bool?,
      increasePinchToZoomThresholdWhenRotating: result[14] as bool?,
      zoomAnimationAmount: result[15] as double?,
      pinchPanEnabled: result[16] as bool?,
    );
  }
}

class LocationPuck2D {
  LocationPuck2D({
    this.topImage,
    this.bearingImage,
    this.shadowImage,
    this.scaleExpression,
    this.opacity,
  });

  /// Name of image in sprite to use as the top of the location indicator.
  Uint8List? topImage;

  /// Name of image in sprite to use as the middle of the location indicator.
  Uint8List? bearingImage;

  /// Name of image in sprite to use as the background of the location indicator.
  Uint8List? shadowImage;

  /// The scale expression of the images. If defined, it will be applied to all the three images.
  String? scaleExpression;

  /// The opacity of the entire location puck
  double? opacity;

  Object encode() {
    return <Object?>[
      topImage,
      bearingImage,
      shadowImage,
      scaleExpression,
      opacity,
    ];
  }

  static LocationPuck2D decode(Object result) {
    result as List<Object?>;
    return LocationPuck2D(
      topImage: result[0] as Uint8List?,
      bearingImage: result[1] as Uint8List?,
      shadowImage: result[2] as Uint8List?,
      scaleExpression: result[3] as String?,
      opacity: result[4] as double?,
    );
  }
}

class LocationPuck3D {
  LocationPuck3D({
    this.modelUri,
    this.position,
    this.modelOpacity,
    this.modelScale,
    this.modelScaleExpression,
    this.modelTranslation,
    this.modelRotation,
    this.modelCastShadows,
    this.modelReceiveShadows,
    this.modelScaleMode,
    this.modelEmissiveStrength,
    this.modelEmissiveStrengthExpression,
  });

  /// An URL for the model file in gltf format.
  String? modelUri;

  /// The position of the model.
  List<double?>? position;

  /// The opacity of the model.
  double? modelOpacity;

  /// The scale of the model.
  List<double?>? modelScale;

  /// The scale expression of the model, which will overwrite the default scale expression that keeps the model size constant during zoom.
  String? modelScaleExpression;

  /// The translation of the model [lon, lat, z]
  List<double?>? modelTranslation;

  /// The rotation of the model.
  List<double?>? modelRotation;

  /// Enable/Disable shadow casting for the 3D location puck.
  bool? modelCastShadows;

  /// Enable/Disable shadow receiving for the 3D location puck.
  bool? modelReceiveShadows;

  /// Defines scaling mode. Only applies to location-indicator type layers.
  ModelScaleMode? modelScaleMode;

  /// Strength of the emission. There is no emission for value 0. For value 1.0, only emissive component (no shading) is displayed and values above 1.0 produce light contribution to surrounding area, for some of the parts (e.g. doors).
  double? modelEmissiveStrength;

  /// Strength of the emission as Expression string, note that when [modelEmissiveStrengthExpression] is specified, it will overwrite the [modelEmissiveStrength] property. There is no emission for value 0. For value 1.0, only emissive component (no shading) is displayed and values above 1.0 produce light contribution to surrounding area, for some of the parts (e.g. doors).
  String? modelEmissiveStrengthExpression;

  Object encode() {
    return <Object?>[
      modelUri,
      position,
      modelOpacity,
      modelScale,
      modelScaleExpression,
      modelTranslation,
      modelRotation,
      modelCastShadows,
      modelReceiveShadows,
      modelScaleMode?.index,
      modelEmissiveStrength,
      modelEmissiveStrengthExpression,
    ];
  }

  static LocationPuck3D decode(Object result) {
    result as List<Object?>;
    return LocationPuck3D(
      modelUri: result[0] as String?,
      position: (result[1] as List<Object?>?)?.cast<double?>(),
      modelOpacity: result[2] as double?,
      modelScale: (result[3] as List<Object?>?)?.cast<double?>(),
      modelScaleExpression: result[4] as String?,
      modelTranslation: (result[5] as List<Object?>?)?.cast<double?>(),
      modelRotation: (result[6] as List<Object?>?)?.cast<double?>(),
      modelCastShadows: result[7] as bool?,
      modelReceiveShadows: result[8] as bool?,
      modelScaleMode:
          result[9] != null ? ModelScaleMode.values[result[9]! as int] : null,
      modelEmissiveStrength: result[10] as double?,
      modelEmissiveStrengthExpression: result[11] as String?,
    );
  }
}

/// Defines what the customised look of the location puck. Note that direct changes to the puck variables won't have any effect, a new puck needs to be set every time.
class LocationPuck {
  LocationPuck({
    this.locationPuck2D,
    this.locationPuck3D,
  });

  LocationPuck2D? locationPuck2D;

  LocationPuck3D? locationPuck3D;

  Object encode() {
    return <Object?>[
      locationPuck2D?.encode(),
      locationPuck3D?.encode(),
    ];
  }

  static LocationPuck decode(Object result) {
    result as List<Object?>;
    return LocationPuck(
      locationPuck2D: result[0] != null
          ? LocationPuck2D.decode(result[0]! as List<Object?>)
          : null,
      locationPuck3D: result[1] != null
          ? LocationPuck3D.decode(result[1]! as List<Object?>)
          : null,
    );
  }
}

/// Shows a location puck on the map.
class LocationComponentSettings {
  LocationComponentSettings({
    this.enabled,
    this.pulsingEnabled,
    this.pulsingColor,
    this.pulsingMaxRadius,
    this.showAccuracyRing,
    this.accuracyRingColor,
    this.accuracyRingBorderColor,
    this.layerAbove,
    this.layerBelow,
    this.puckBearingEnabled,
    this.puckBearing,
    this.locationPuck,
  });

  /// Whether the user location is visible on the map.
  bool? enabled;

  /// Whether the location puck is pulsing on the map. Works for 2D location puck only.
  bool? pulsingEnabled;

  /// The color of the pulsing circle. Works for 2D location puck only.
  int? pulsingColor;

  /// The maximum radius of the pulsing circle. Works for 2D location puck only. Note: Setting [pulsingMaxRadius] to LocationComponentConstants.PULSING_MAX_RADIUS_FOLLOW_ACCURACY will set the pulsing circle's maximum radius to follow location accuracy circle. This property is specified in pixels.
  double? pulsingMaxRadius;

  /// Whether show accuracy ring with location puck. Works for 2D location puck only.
  bool? showAccuracyRing;

  /// The color of the accuracy ring. Works for 2D location puck only.
  int? accuracyRingColor;

  /// The color of the accuracy ring border. Works for 2D location puck only.
  int? accuracyRingBorderColor;

  /// Sets the id of the layer that's added above to when placing the component on the map.
  String? layerAbove;

  /// Sets the id of the layer that's added below to when placing the component on the map.
  String? layerBelow;

  /// Whether the puck rotates to track the bearing source.
  bool? puckBearingEnabled;

  /// The enum controls how the puck is oriented
  PuckBearing? puckBearing;

  /// Defines what the customised look of the location puck. Note that direct changes to the puck variables won't have any effect, a new puck needs to be set every time.
  LocationPuck? locationPuck;

  Object encode() {
    return <Object?>[
      enabled,
      pulsingEnabled,
      pulsingColor,
      pulsingMaxRadius,
      showAccuracyRing,
      accuracyRingColor,
      accuracyRingBorderColor,
      layerAbove,
      layerBelow,
      puckBearingEnabled,
      puckBearing?.index,
      locationPuck?.encode(),
    ];
  }

  static LocationComponentSettings decode(Object result) {
    result as List<Object?>;
    return LocationComponentSettings(
      enabled: result[0] as bool?,
      pulsingEnabled: result[1] as bool?,
      pulsingColor: result[2] as int?,
      pulsingMaxRadius: result[3] as double?,
      showAccuracyRing: result[4] as bool?,
      accuracyRingColor: result[5] as int?,
      accuracyRingBorderColor: result[6] as int?,
      layerAbove: result[7] as String?,
      layerBelow: result[8] as String?,
      puckBearingEnabled: result[9] as bool?,
      puckBearing:
          result[10] != null ? PuckBearing.values[result[10]! as int] : null,
      locationPuck: result[11] != null
          ? LocationPuck.decode(result[11]! as List<Object?>)
          : null,
    );
  }
}

/// Shows the scale bar on the map.
class ScaleBarSettings {
  ScaleBarSettings({
    this.enabled,
    this.position,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.textColor,
    this.primaryColor,
    this.secondaryColor,
    this.borderWidth,
    this.height,
    this.textBarMargin,
    this.textBorderWidth,
    this.textSize,
    this.isMetricUnits,
    this.refreshInterval,
    this.showTextBorder,
    this.ratio,
    this.useContinuousRendering,
  });

  /// Whether the scale is visible on the map.
  bool? enabled;

  /// Defines where the scale bar is positioned on the map
  OrnamentPosition? position;

  /// Defines the margin to the left that the scale bar honors. This property is specified in pixels.
  double? marginLeft;

  /// Defines the margin to the top that the scale bar honors. This property is specified in pixels.
  double? marginTop;

  /// Defines the margin to the right that the scale bar honors. This property is specified in pixels.
  double? marginRight;

  /// Defines the margin to the bottom that the scale bar honors. This property is specified in pixels.
  double? marginBottom;

  /// Defines text color of the scale bar.
  int? textColor;

  /// Defines primary color of the scale bar.
  int? primaryColor;

  /// Defines secondary color of the scale bar.
  int? secondaryColor;

  /// Defines width of the border for the scale bar. This property is specified in pixels.
  double? borderWidth;

  /// Defines height of the scale bar. This property is specified in pixels.
  double? height;

  /// Defines margin of the text bar of the scale bar. This property is specified in pixels.
  double? textBarMargin;

  /// Defines text border width of the scale bar. This property is specified in pixels.
  double? textBorderWidth;

  /// Defines text size of the scale bar. This property is specified in pixels.
  double? textSize;

  /// Whether the scale bar is using metric unit. True if the scale bar is using metric system, false if the scale bar is using imperial units.
  bool? isMetricUnits;

  /// Configures minimum refresh interval, in millisecond, default is 15.
  int? refreshInterval;

  /// Configures whether to show the text border or not, default is true.
  bool? showTextBorder;

  /// configures ratio of scale bar max width compared with MapView width, default is 0.5.
  double? ratio;

  /// If set to True scale bar will be triggering onDraw depending on [ScaleBarSettings.refreshInterval] even if actual data did not change. If set to False scale bar will redraw only on demand. Defaults to False and should not be changed explicitly in most cases. Could be set to True to produce correct GPU frame metrics when running gfxinfo command.
  bool? useContinuousRendering;

  Object encode() {
    return <Object?>[
      enabled,
      position?.index,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      textColor,
      primaryColor,
      secondaryColor,
      borderWidth,
      height,
      textBarMargin,
      textBorderWidth,
      textSize,
      isMetricUnits,
      refreshInterval,
      showTextBorder,
      ratio,
      useContinuousRendering,
    ];
  }

  static ScaleBarSettings decode(Object result) {
    result as List<Object?>;
    return ScaleBarSettings(
      enabled: result[0] as bool?,
      position:
          result[1] != null ? OrnamentPosition.values[result[1]! as int] : null,
      marginLeft: result[2] as double?,
      marginTop: result[3] as double?,
      marginRight: result[4] as double?,
      marginBottom: result[5] as double?,
      textColor: result[6] as int?,
      primaryColor: result[7] as int?,
      secondaryColor: result[8] as int?,
      borderWidth: result[9] as double?,
      height: result[10] as double?,
      textBarMargin: result[11] as double?,
      textBorderWidth: result[12] as double?,
      textSize: result[13] as double?,
      isMetricUnits: result[14] as bool?,
      refreshInterval: result[15] as int?,
      showTextBorder: result[16] as bool?,
      ratio: result[17] as double?,
      useContinuousRendering: result[18] as bool?,
    );
  }
}

/// Shows the compass on the map.
class CompassSettings {
  CompassSettings({
    this.enabled,
    this.position,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.opacity,
    this.rotation,
    this.visibility,
    this.fadeWhenFacingNorth,
    this.clickable,
    this.image,
  });

  /// Whether the compass is visible on the map.
  bool? enabled;

  /// Defines where the compass is positioned on the map
  OrnamentPosition? position;

  /// Defines the margin to the left that the compass icon honors. This property is specified in pixels.
  double? marginLeft;

  /// Defines the margin to the top that the compass icon honors. This property is specified in pixels.
  double? marginTop;

  /// Defines the margin to the right that the compass icon honors. This property is specified in pixels.
  double? marginRight;

  /// Defines the margin to the bottom that the compass icon honors. This property is specified in pixels.
  double? marginBottom;

  /// The alpha channel value of the compass image
  double? opacity;

  /// The clockwise rotation value in degrees of the compass.
  double? rotation;

  /// Whether the compass is displayed.
  bool? visibility;

  /// Whether the compass fades out to invisible when facing north direction.
  bool? fadeWhenFacingNorth;

  /// Whether the compass can be clicked and click events can be registered.
  bool? clickable;

  /// The compass image, the visual representation of the compass.
  Uint8List? image;

  Object encode() {
    return <Object?>[
      enabled,
      position?.index,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      opacity,
      rotation,
      visibility,
      fadeWhenFacingNorth,
      clickable,
      image,
    ];
  }

  static CompassSettings decode(Object result) {
    result as List<Object?>;
    return CompassSettings(
      enabled: result[0] as bool?,
      position:
          result[1] != null ? OrnamentPosition.values[result[1]! as int] : null,
      marginLeft: result[2] as double?,
      marginTop: result[3] as double?,
      marginRight: result[4] as double?,
      marginBottom: result[5] as double?,
      opacity: result[6] as double?,
      rotation: result[7] as double?,
      visibility: result[8] as bool?,
      fadeWhenFacingNorth: result[9] as bool?,
      clickable: result[10] as bool?,
      image: result[11] as Uint8List?,
    );
  }
}

/// Shows the attribution icon on the map.
class AttributionSettings {
  AttributionSettings({
    this.iconColor,
    this.position,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.clickable,
  });

  /// Defines text color of the attribution icon.
  int? iconColor;

  /// Defines where the attribution icon is positioned on the map
  OrnamentPosition? position;

  /// Defines the margin to the left that the attribution icon honors. This property is specified in pixels.
  double? marginLeft;

  /// Defines the margin to the top that the attribution icon honors. This property is specified in pixels.
  double? marginTop;

  /// Defines the margin to the right that the attribution icon honors. This property is specified in pixels.
  double? marginRight;

  /// Defines the margin to the bottom that the attribution icon honors. This property is specified in pixels.
  double? marginBottom;

  /// Whether the attribution can be clicked and click events can be registered.
  bool? clickable;

  Object encode() {
    return <Object?>[
      iconColor,
      position?.index,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom,
      clickable,
    ];
  }

  static AttributionSettings decode(Object result) {
    result as List<Object?>;
    return AttributionSettings(
      iconColor: result[0] as int?,
      position:
          result[1] != null ? OrnamentPosition.values[result[1]! as int] : null,
      marginLeft: result[2] as double?,
      marginTop: result[3] as double?,
      marginRight: result[4] as double?,
      marginBottom: result[5] as double?,
      clickable: result[6] as bool?,
    );
  }
}

/// Shows the Mapbox logo on the map.
class LogoSettings {
  LogoSettings({
    this.position,
    this.marginLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
  });

  /// Defines where the logo is positioned on the map
  OrnamentPosition? position;

  /// Defines the margin to the left that the attribution icon honors. This property is specified in pixels.
  double? marginLeft;

  /// Defines the margin to the top that the attribution icon honors. This property is specified in pixels.
  double? marginTop;

  /// Defines the margin to the right that the attribution icon honors. This property is specified in pixels.
  double? marginRight;

  /// Defines the margin to the bottom that the attribution icon honors. This property is specified in pixels.
  double? marginBottom;

  Object encode() {
    return <Object?>[
      position?.index,
      marginLeft,
      marginTop,
      marginRight,
      marginBottom,
    ];
  }

  static LogoSettings decode(Object result) {
    result as List<Object?>;
    return LogoSettings(
      position:
          result[0] != null ? OrnamentPosition.values[result[0]! as int] : null,
      marginLeft: result[1] as double?,
      marginTop: result[2] as double?,
      marginRight: result[3] as double?,
      marginBottom: result[4] as double?,
    );
  }
}

class _GesturesSettingsInterfaceCodec extends StandardMessageCodec {
  const _GesturesSettingsInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is GesturesSettings) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return GesturesSettings.decode(readValue(buffer)!);
      case 129:
        return ScreenCoordinate.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Gesture configuration allows to control the user touch interaction.
class GesturesSettingsInterface {
  /// Constructor for [GesturesSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  GesturesSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _GesturesSettingsInterfaceCodec();

  Future<GesturesSettings> getSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.GesturesSettingsInterface.getSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as GesturesSettings?)!;
    }
  }

  Future<void> updateSettings(GesturesSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.GesturesSettingsInterface.updateSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_settings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _LocationComponentSettingsInterfaceCodec extends StandardMessageCodec {
  const _LocationComponentSettingsInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is LocationComponentSettings) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is LocationPuck) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is LocationPuck2D) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is LocationPuck3D) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return LocationComponentSettings.decode(readValue(buffer)!);
      case 129:
        return LocationPuck.decode(readValue(buffer)!);
      case 130:
        return LocationPuck2D.decode(readValue(buffer)!);
      case 131:
        return LocationPuck3D.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Shows a location puck on the map.
class LocationComponentSettingsInterface {
  /// Constructor for [LocationComponentSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  LocationComponentSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec =
      _LocationComponentSettingsInterfaceCodec();

  Future<LocationComponentSettings> getSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.LocationComponentSettingsInterface.getSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as LocationComponentSettings?)!;
    }
  }

  Future<void> updateSettings(LocationComponentSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.LocationComponentSettingsInterface.updateSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_settings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _ScaleBarSettingsInterfaceCodec extends StandardMessageCodec {
  const _ScaleBarSettingsInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is ScaleBarSettings) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return ScaleBarSettings.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Shows the scale bar on the map.
class ScaleBarSettingsInterface {
  /// Constructor for [ScaleBarSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  ScaleBarSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ScaleBarSettingsInterfaceCodec();

  Future<ScaleBarSettings> getSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.ScaleBarSettingsInterface.getSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as ScaleBarSettings?)!;
    }
  }

  Future<void> updateSettings(ScaleBarSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.ScaleBarSettingsInterface.updateSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_settings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _CompassSettingsInterfaceCodec extends StandardMessageCodec {
  const _CompassSettingsInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CompassSettings) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return CompassSettings.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Shows the compass on the map.
class CompassSettingsInterface {
  /// Constructor for [CompassSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  CompassSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _CompassSettingsInterfaceCodec();

  Future<CompassSettings> getSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.CompassSettingsInterface.getSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as CompassSettings?)!;
    }
  }

  Future<void> updateSettings(CompassSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.CompassSettingsInterface.updateSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_settings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _AttributionSettingsInterfaceCodec extends StandardMessageCodec {
  const _AttributionSettingsInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AttributionSettings) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AttributionSettings.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Shows the attribution icon on the map.
class AttributionSettingsInterface {
  /// Constructor for [AttributionSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AttributionSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec =
      _AttributionSettingsInterfaceCodec();

  Future<AttributionSettings> getSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.AttributionSettingsInterface.getSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as AttributionSettings?)!;
    }
  }

  Future<void> updateSettings(AttributionSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.AttributionSettingsInterface.updateSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_settings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _LogoSettingsInterfaceCodec extends StandardMessageCodec {
  const _LogoSettingsInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is LogoSettings) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return LogoSettings.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Shows the Mapbox logo on the map.
class LogoSettingsInterface {
  /// Constructor for [LogoSettingsInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  LogoSettingsInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _LogoSettingsInterfaceCodec();

  Future<LogoSettings> getSettings() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.LogoSettingsInterface.getSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as LogoSettings?)!;
    }
  }

  Future<void> updateSettings(LogoSettings arg_settings) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.LogoSettingsInterface.updateSettings',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_settings]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}
