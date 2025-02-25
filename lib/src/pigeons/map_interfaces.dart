part of mapbox_maps_flutter;

/// Describes glyphs rasterization modes.
enum GlyphsRasterizationMode {
  /// No glyphs are rasterized locally. All glyphs are loaded from the server.
  NO_GLYPHS_RASTERIZED_LOCALLY,

  /// Ideographs are rasterized locally, and they are not loaded from the server.
  IDEOGRAPHS_RASTERIZED_LOCALLY,

  /// All glyphs are rasterized locally. No glyphs are loaded from the server.
  ALL_GLYPHS_RASTERIZED_LOCALLY,
}

/// Describes the map context mode.
/// We can make some optimizations if we know that the drawing context is not shared with other code.
enum ContextMode {
  /// Unique context mode: in OpenGL, the GL context is not shared, thus we can retain knowledge about the GL state
  /// from a previous render pass. It also enables clearing the screen using glClear for the bottommost background
  /// layer when no pattern is applied to that layer.
  UNIQUE,

  /// Shared context mode: in OpenGL, the GL context is shared with other renderers, thus we cannot rely on the GL
  /// state set from a previous render pass.
  SHARED,
}

/// Describes whether to constrain the map in both axes or only vertically e.g. while panning.
enum ConstrainMode {
  /// No constrains.
  NONE,

  /// Constrain to height only
  HEIGHT_ONLY,

  /// Constrain both width and height axes.
  WIDTH_AND_HEIGHT,
}

/// Satisfies embedding platforms that requires the viewport coordinate systems to be set according to its standards.
enum ViewportMode {
  /// Default viewport
  DEFAULT,

  /// Viewport flipped on the y-axis.
  FLIPPED_Y,
}

/// Describes the map orientation.
enum NorthOrientation {
  /// Default, map oriented upwards
  UPWARDS,

  /// Map oriented righwards
  RIGHTWARDS,

  /// Map oriented downwards
  DOWNWARDS,

  /// Map oriented leftwards
  LEFTWARDS,
}

/// Options for enabling debugging features in a map.
enum MapDebugOptionsData {
  /// Edges of tile boundaries are shown as thick, red lines to help diagnose
  /// tile clipping issues.
  TILE_BORDERS,

  /// Each tile shows its tile coordinate (x/y/z) in the upper-left corner.
  PARSE_STATUS,

  /// Each tile shows a timestamp indicating when it was loaded.
  TIMESTAMPS,

  /// Edges of glyphs and symbols are shown as faint, green lines to help
  /// diagnose collision and label placement issues.
  COLLISION,

  /// Each drawing operation is replaced by a translucent fill. Overlapping
  /// drawing operations appear more prominent to help diagnose overdrawing.
  OVERDRAW,

  /// The stencil buffer is shown instead of the color buffer.
  STENCIL_CLIP,

  /// The depth buffer is shown instead of the color buffer.
  DEPTH_BUFFER,

  /// Visualize residency of tiles in the render cache. Tile boundaries of cached tiles
  /// are rendered with green, tiles waiting for an update with yellow and tiles not in the cache
  /// with red.
  RENDER_CACHE,

  /// Show 3D model bounding boxes.
  MODEL_BOUNDS,

  /// Show a wireframe for terrain.
  TERRAIN_WIREFRAME,
}

/// Enum describing how to place view annotation relatively to geometry.
enum ViewAnnotationAnchor {
  /// The top of the view annotation is placed closest to the geometry.
  TOP,

  /// The left side of the view annotation is placed closest to the geometry.
  LEFT,

  /// The bottom of the view annotation is placed closest to the geometry.
  BOTTOM,

  /// The right side of the view annotation is placed closest to the geometry.
  RIGHT,

  /// The top-left corner of the view annotation is placed closest to the geometry.
  TOP_LEFT,

  /// The bottom-right corner of the view annotation is placed closest to the geometry.
  BOTTOM_RIGHT,

  /// The top-right corner of the view annotation is placed closest to the geometry.
  TOP_RIGHT,

  /// The bottom-left corner of the view annotation is placed closest to the geometry.
  BOTTOM_LEFT,

  /// The center of the view annotation is placed closest to the geometry.
  CENTER,
}

/// Type information of the variant's content
enum Type {
  SCREEN_BOX,
  SCREEN_COORDINATE,
  LIST,
}

/// Describes the reason for a style package download request failure.
enum StylePackErrorType {
  /// The operation was canceled.
  CANCELED,

  /// The style package does not exist.
  DOES_NOT_EXIST,

  /// There is no available space to store the resources.
  DISK_FULL,

  /// Other reason.
  OTHER,
}

/// Describes the reason for an offline request response error.
enum ResponseErrorReason {
  /// No error occurred during the resource request.
  SUCCESS,

  /// The resource is not found.
  NOT_FOUND,

  /// The server error.
  SERVER,

  /// The connection error.
  CONNECTION,

  /// The error happened because of a rate limit.
  RATE_LIMIT,

  /// The resource cannot be loaded because the device is in offline mode.
  IN_OFFLINE_MODE,

  /// Other reason.
  OTHER,
}

/// Describes the download state of a region.
enum OfflineRegionDownloadState {
  /// Indicates downloading is inactive.
  INACTIVE,

  /// Indicates downloading is active.
  ACTIVE,
}

/// Describes tile store usage modes.
enum TileStoreUsageMode {
  /// Tile store usage is disabled.
  ///
  /// The implementation skips checking tile store when requesting a tile.
  DISABLED,

  /// Tile store enabled for accessing loaded tile packs.
  ///
  /// The implementation first checks tile store when requesting a tile.
  /// If a tile pack is already loaded, the tile will be extracted and returned. Otherwise, the implementation
  /// falls back to requesting the individual tile and storing it in the disk cache.
  READ_ONLY,

  /// Tile store enabled for accessing local tile packs and for loading new tile packs from server.
  ///
  /// All tile requests are converted to tile pack requests, i.e.
  /// the tile pack that includes the request tile will be loaded, and the tile extracted
  /// from it. In this mode, no individual tile requests will be made.
  ///
  /// This mode can be useful if the map trajectory is predefined and the user cannot pan
  /// freely (e.g. navigation use cases), so that there is a good chance tile packs are already loaded
  /// in the vicinity of the user.
  ///
  /// If users can pan freely, this mode is not recommended. Otherwise, panning
  /// will download tile packs instead of using individual tiles. Note that this means that we could first
  /// download an individual tile, and then a tile pack that also includes this tile. The individual tile in
  /// the disk cache won’t be used as long as the up-to-date tile pack exists in the cache.
  READ_AND_UPDATE,
}

/// Describes the kind of a style property value.
enum StylePropertyValueKind {
  /// The property value is not defined.
  UNDEFINED,

  /// The property value is a constant.
  CONSTANT,

  /// The property value is a style [expression](https://docs.mapbox.com/mapbox-gl-js/style-spec/#expressions).
  EXPRESSION,

  /// Property value is a style [transition](https://docs.mapbox.com/mapbox-gl-js/style-spec/#transition).
  TRANSITION,
}

enum StyleProjectionName {
  mercator,
  globe,
}

/// Whether extruded geometries are lit relative to the map or viewport.
enum Anchor {
  /// The position of the light source is aligned to the rotation of the map.
  MAP,

  /// The position of the light source is aligned to the rotation of the viewport.
  VIEWPORT,
}

/// HTTP defines a set of request methods to indicate the desired action to be performed for a given resource.
enum HttpMethod {
  /// The GET method requests a representation of the specified resource. Requests using GET should only retrieve data.
  GET,

  /// The HEAD method asks for a response identical to that of a GET request, but without the response body.
  HEAD,

  /// The POST method sends data (stored in the request body) to a server to create or update a given resource.
  POST,
}

/// Classify network types based on cost.
enum NetworkRestriction {
  /// Allow access to all network types.
  NONE,

  /// Forbid network access to expensive networks, such as cellular.
  DISALLOW_EXPENSIVE,

  /// Forbid access to all network types.
  DISALLOW_ALL,
}

/// Enum which describes possible error types which could happen during HTTP request/download calls.
enum HttpRequestErrorType {
  /// Establishing connection related error.
  CONNECTION_ERROR,

  /// SSL related error.
  SSLERROR,

  /// Request was cancelled by the user.
  REQUEST_CANCELLED,

  /// Timeout error.
  REQUEST_TIMED_OUT,

  /// Range request failed.
  RANGE_ERROR,

  /// Other than above error.
  OTHER_ERROR,
}

/// Enum which represents different error cases which could happen during download session.
enum DownloadErrorCode {
  /// General filesystem related error code. For cases like: write error, no such file or directory, not enough space and etc.
  FILE_SYSTEM_ERROR,

  /// General network related error. Should be probably representation of HttpRequestError.
  NETWORK_ERROR,
}

/// Enum representing state of download session.
enum DownloadState {
  /// Download session initiated but not started yet.
  PENDING,

  /// Download session is in progress.
  DOWNLOADING,

  /// Download session failed.
  FAILED,

  /// Download session successfully finished.
  FINISHED,
}

/// Describes the tiles data domain.
enum TileDataDomain {
  /// Data for Maps.
  MAPS,

  /// Data for Navigation.
  NAVIGATION,

  /// Data for Search.
  SEARCH,

  /// Data for ADAS
  ADAS,
}

/// Describes the reason for a tile region download request failure.
enum TileRegionErrorType {
  /// The operation was canceled.
  CANCELED,

  /// tile region does not exist.
  DOES_NOT_EXIST,

  /// Tileset descriptors resolving failed.
  TILESET_DESCRIPTOR,

  /// There is no available space to store the resources
  DISK_FULL,

  /// Other reason.
  OTHER,

  /// The region contains more tiles than allowed.
  TILE_COUNT_EXCEEDED,
}

enum _MapEvent {
  mapLoaded,
  mapLoadingError,
  styleLoaded,
  styleDataLoaded,
  cameraChanged,
  mapIdle,
  sourceAdded,
  sourceRemoved,
  sourceDataLoaded,
  styleImageMissing,
  styleImageRemoveUnused,
  renderFrameStarted,
  renderFrameFinished,
  resourceRequest,
}

/// The distance on each side between rectangles, when one is contained into other.
///
/// All fields' values are in `logical pixel` units.
class MbxEdgeInsets {
  MbxEdgeInsets({
    required this.top,
    required this.left,
    required this.bottom,
    required this.right,
  });

  /// Padding from the top.
  double top;

  /// Padding from the left.
  double left;

  /// Padding from the bottom.
  double bottom;

  /// Padding from the right.
  double right;

  Object encode() {
    return <Object?>[
      top,
      left,
      bottom,
      right,
    ];
  }

  static MbxEdgeInsets decode(Object result) {
    result as List<Object?>;
    return MbxEdgeInsets(
      top: result[0]! as double,
      left: result[1]! as double,
      bottom: result[2]! as double,
      right: result[3]! as double,
    );
  }
}

/// Various options for describing the viewpoint of a camera. All fields are
/// optional.
///
/// Anchor and center points are mutually exclusive, with preference for the
/// center point when both are set.
class CameraOptions {
  CameraOptions({
    this.center,
    this.padding,
    this.anchor,
    this.zoom,
    this.bearing,
    this.pitch,
  });

  /// Coordinate at the center of the camera.
  Map<String?, Object?>? center;

  /// Padding around the interior of the view that affects the frame of
  /// reference for `center`.
  MbxEdgeInsets? padding;

  /// Point of reference for `zoom` and `angle`, assuming an origin at the
  /// top-left corner of the view.
  ScreenCoordinate? anchor;

  /// Zero-based zoom level. Constrained to the minimum and maximum zoom
  /// levels.
  double? zoom;

  /// Bearing, measured in degrees from true north. Wrapped to [0, 360).
  double? bearing;

  /// Pitch toward the horizon measured in degrees.
  double? pitch;

  Object encode() {
    return <Object?>[
      center,
      padding?.encode(),
      anchor?.encode(),
      zoom,
      bearing,
      pitch,
    ];
  }

  static CameraOptions decode(Object result) {
    result as List<Object?>;
    return CameraOptions(
      center: (result[0] as Map<Object?, Object?>?)?.cast<String?, Object?>(),
      padding: result[1] != null
          ? MbxEdgeInsets.decode(result[1]! as List<Object?>)
          : null,
      anchor: result[2] != null
          ? ScreenCoordinate.decode(result[2]! as List<Object?>)
          : null,
      zoom: result[3] as double?,
      bearing: result[4] as double?,
      pitch: result[5] as double?,
    );
  }
}

/// Describes the viewpoint of a camera.
class CameraState {
  CameraState({
    required this.center,
    required this.padding,
    required this.zoom,
    required this.bearing,
    required this.pitch,
  });

  /// Coordinate at the center of the camera.
  Map<String?, Object?> center;

  /// Padding around the interior of the view that affects the frame of
  /// reference for `center`.
  MbxEdgeInsets padding;

  /// Zero-based zoom level. Constrained to the minimum and maximum zoom
  /// levels.
  double zoom;

  /// Bearing, measured in degrees from true north. Wrapped to [0, 360).
  double bearing;

  /// Pitch toward the horizon measured in degrees.
  double pitch;

  Object encode() {
    return <Object?>[
      center,
      padding.encode(),
      zoom,
      bearing,
      pitch,
    ];
  }

  static CameraState decode(Object result) {
    result as List<Object?>;
    return CameraState(
      center: (result[0] as Map<Object?, Object?>?)!.cast<String?, Object?>(),
      padding: MbxEdgeInsets.decode(result[1]! as List<Object?>),
      zoom: result[2]! as double,
      bearing: result[3]! as double,
      pitch: result[4]! as double,
    );
  }
}

/// Holds options to be used for setting `camera bounds`.
class CameraBoundsOptions {
  CameraBoundsOptions({
    this.bounds,
    this.maxZoom,
    this.minZoom,
    this.maxPitch,
    this.minPitch,
  });

  /// The latitude and longitude bounds to which the camera center are constrained.
  CoordinateBounds? bounds;

  /// The maximum zoom level, in Mapbox zoom levels 0-25.5. At low zoom levels, a small set of map tiles covers a large geographical area. At higher zoom levels, a larger number of tiles cover a smaller geographical area.
  double? maxZoom;

  /// The minimum zoom level, in Mapbox zoom levels 0-25.5.
  double? minZoom;

  /// The maximum allowed pitch value in degrees.
  double? maxPitch;

  /// The minimum allowed pitch value in degrees.
  double? minPitch;

  Object encode() {
    return <Object?>[
      bounds?.encode(),
      maxZoom,
      minZoom,
      maxPitch,
      minPitch,
    ];
  }

  static CameraBoundsOptions decode(Object result) {
    result as List<Object?>;
    return CameraBoundsOptions(
      bounds: result[0] != null
          ? CoordinateBounds.decode(result[0]! as List<Object?>)
          : null,
      maxZoom: result[1] as double?,
      minZoom: result[2] as double?,
      maxPitch: result[3] as double?,
      minPitch: result[4] as double?,
    );
  }
}

/// Holds information about `camera bounds`.
class CameraBounds {
  CameraBounds({
    required this.bounds,
    required this.maxZoom,
    required this.minZoom,
    required this.maxPitch,
    required this.minPitch,
  });

  /// The latitude and longitude bounds to which the camera center are constrained.
  CoordinateBounds bounds;

  /// The maximum zoom level, in Mapbox zoom levels 0-25.5. At low zoom levels, a small set of map tiles covers a large geographical area. At higher zoom levels, a larger number of tiles cover a smaller geographical area.
  double maxZoom;

  /// The minimum zoom level, in Mapbox zoom levels 0-25.5.
  double minZoom;

  /// The maximum allowed pitch value in degrees.
  double maxPitch;

  /// The minimum allowed pitch value in degrees.
  double minPitch;

  Object encode() {
    return <Object?>[
      bounds.encode(),
      maxZoom,
      minZoom,
      maxPitch,
      minPitch,
    ];
  }

  static CameraBounds decode(Object result) {
    result as List<Object?>;
    return CameraBounds(
      bounds: CoordinateBounds.decode(result[0]! as List<Object?>),
      maxZoom: result[1]! as double,
      minZoom: result[2]! as double,
      maxPitch: result[3]! as double,
      minPitch: result[4]! as double,
    );
  }
}

class MapAnimationOptions {
  MapAnimationOptions({
    this.duration,
    this.startDelay,
  });

  /// The duration of the animation in milliseconds.
  /// If not set explicitly default duration will be taken 300ms
  int? duration;

  /// The amount of time, in milliseconds, to delay starting the animation after animation start.
  /// If not set explicitly default startDelay will be taken 0ms. This only works for Android.
  int? startDelay;

  Object encode() {
    return <Object?>[
      duration,
      startDelay,
    ];
  }

  static MapAnimationOptions decode(Object result) {
    result as List<Object?>;
    return MapAnimationOptions(
      duration: result[0] as int?,
      startDelay: result[1] as int?,
    );
  }
}

/// A rectangular area as measured on a two-dimensional map projection.
class CoordinateBounds {
  CoordinateBounds({
    required this.southwest,
    required this.northeast,
    required this.infiniteBounds,
  });

  /// Coordinate at the southwest corner.
  /// Note: setting this field with invalid values (infinite, NaN) will crash the application.
  Map<String?, Object?> southwest;

  /// Coordinate at the northeast corner.
  /// Note: setting this field with invalid values (infinite, NaN) will crash the application.
  Map<String?, Object?> northeast;

  /// If set to `true`, an infinite (unconstrained) bounds covering the world coordinates would be used.
  /// Coordinates provided in `southwest` and `northeast` fields would be omitted and have no effect.
  bool infiniteBounds;

  Object encode() {
    return <Object?>[
      southwest,
      northeast,
      infiniteBounds,
    ];
  }

  static CoordinateBounds decode(Object result) {
    result as List<Object?>;
    return CoordinateBounds(
      southwest:
          (result[0] as Map<Object?, Object?>?)!.cast<String?, Object?>(),
      northeast:
          (result[1] as Map<Object?, Object?>?)!.cast<String?, Object?>(),
      infiniteBounds: result[2]! as bool,
    );
  }
}

/// Options for enabling debugging features in a map.
class MapDebugOptions {
  MapDebugOptions({
    required this.data,
  });

  MapDebugOptionsData data;

  Object encode() {
    return <Object?>[
      data.index,
    ];
  }

  static MapDebugOptions decode(Object result) {
    result as List<Object?>;
    return MapDebugOptions(
      data: MapDebugOptionsData.values[result[0]! as int],
    );
  }
}

/// Describes the glyphs rasterization option values.
class GlyphsRasterizationOptions {
  GlyphsRasterizationOptions({
    required this.rasterizationMode,
    this.fontFamily,
  });

  /// Glyphs rasterization mode for client-side text rendering.
  GlyphsRasterizationMode rasterizationMode;

  /// Font family to use as font fallback for client-side text renderings.
  ///
  /// Note: `GlyphsRasterizationMode` has precedence over font family. If `AllGlyphsRasterizedLocally`
  /// or `IdeographsRasterizedLocally` is set, local glyphs will be generated based on the provided font family. If no
  /// font family is provided, the map will fall back to use the system default font. The mechanisms of choosing the
  /// default font are varied in platforms:
  /// - For darwin(iOS/macOS) platform, the default font family is created from the <a href="https://developer.apple.com/documentation/uikit/uifont/1619027-systemfontofsize?language=objc">systemFont</a>.
  ///   If provided fonts are not supported on darwin platform, the map will fall back to use the first available font from the global fallback list.
  /// - For Android platform: the default font <a href="https://developer.android.com/reference/android/graphics/Typeface#DEFAULT">Typeface.DEFAULT</a> will be used.
  ///
  /// Besides, the font family will be discarded if it is provided along with `NoGlyphsRasterizedLocally` mode.
  ///
  String? fontFamily;

  Object encode() {
    return <Object?>[
      rasterizationMode.index,
      fontFamily,
    ];
  }

  static GlyphsRasterizationOptions decode(Object result) {
    result as List<Object?>;
    return GlyphsRasterizationOptions(
      rasterizationMode: GlyphsRasterizationMode.values[result[0]! as int],
      fontFamily: result[1] as String?,
    );
  }
}

/// Map memory budget in megabytes.
class TileCacheBudgetInMegabytes {
  TileCacheBudgetInMegabytes({
    required this.size,
  });

  int size;

  Object encode() {
    return <Object?>[
      size,
    ];
  }

  static TileCacheBudgetInMegabytes decode(Object result) {
    result as List<Object?>;
    return TileCacheBudgetInMegabytes(
      size: result[0]! as int,
    );
  }
}

/// Map memory budget in tiles.
class TileCacheBudgetInTiles {
  TileCacheBudgetInTiles({
    required this.size,
  });

  int size;

  Object encode() {
    return <Object?>[
      size,
    ];
  }

  static TileCacheBudgetInTiles decode(Object result) {
    result as List<Object?>;
    return TileCacheBudgetInTiles(
      size: result[0]! as int,
    );
  }
}

/// Describes the map option values.
class MapOptions {
  MapOptions({
    this.contextMode,
    this.constrainMode,
    this.viewportMode,
    this.orientation,
    this.crossSourceCollisions,
    this.size,
    required this.pixelRatio,
    this.glyphsRasterizationOptions,
  });

  /// The map context mode. This can be used to optimizations
  /// if we know that the drawing context is not shared with other code.
  ContextMode? contextMode;

  /// The map constrain mode. This can be used to limit the map
  /// to wrap around the globe horizontally. By default, it is set to
  /// `HeightOnly`.
  ConstrainMode? constrainMode;

  /// The viewport mode. This can be used to flip the vertical
  /// orientation of the map as some devices may use inverted orientation.
  ViewportMode? viewportMode;

  /// The orientation of the Map. By default, it is set to
  /// `Upwards`.
  NorthOrientation? orientation;

  /// Specify whether to enable cross-source symbol collision detection
  /// or not. By default, it is set to `true`.
  bool? crossSourceCollisions;

  /// The size to resize the map object and renderer backend.
  /// The size is given in `logical pixel` units. macOS and iOS platforms use
  /// device-independent pixel units, while other platforms, such as Android,
  /// use screen pixel units.
  Size? size;

  /// The custom pixel ratio. By default, it is set to 1.0
  double pixelRatio;

  /// Glyphs rasterization options to use for client-side text rendering.
  GlyphsRasterizationOptions? glyphsRasterizationOptions;

  Object encode() {
    return <Object?>[
      contextMode?.index,
      constrainMode?.index,
      viewportMode?.index,
      orientation?.index,
      crossSourceCollisions,
      size?.encode(),
      pixelRatio,
      glyphsRasterizationOptions?.encode(),
    ];
  }

  static MapOptions decode(Object result) {
    result as List<Object?>;
    return MapOptions(
      contextMode:
          result[0] != null ? ContextMode.values[result[0]! as int] : null,
      constrainMode:
          result[1] != null ? ConstrainMode.values[result[1]! as int] : null,
      viewportMode:
          result[2] != null ? ViewportMode.values[result[2]! as int] : null,
      orientation:
          result[3] != null ? NorthOrientation.values[result[3]! as int] : null,
      crossSourceCollisions: result[4] as bool?,
      size: result[5] != null ? Size.decode(result[5]! as List<Object?>) : null,
      pixelRatio: result[6]! as double,
      glyphsRasterizationOptions: result[7] != null
          ? GlyphsRasterizationOptions.decode(result[7]! as List<Object?>)
          : null,
    );
  }
}

/// Describes the coordinate on the screen, measured from top to bottom and from left to right.
/// Note: the `map` uses screen coordinate units measured in `logical pixels`.
class ScreenCoordinate {
  ScreenCoordinate({
    required this.x,
    required this.y,
  });

  /// A value representing the x position of this coordinate.
  double x;

  /// A value representing the y position of this coordinate.
  double y;

  Object encode() {
    return <Object?>[
      x,
      y,
    ];
  }

  static ScreenCoordinate decode(Object result) {
    result as List<Object?>;
    return ScreenCoordinate(
      x: result[0]! as double,
      y: result[1]! as double,
    );
  }
}

/// Describes the coordinate box on the screen, measured in `logical pixels`
/// from top to bottom and from left to right.
class ScreenBox {
  ScreenBox({
    required this.min,
    required this.max,
  });

  /// The screen coordinate close to the top left corner of the screen.
  ScreenCoordinate min;

  /// The screen coordinate close to the bottom right corner of the screen.
  ScreenCoordinate max;

  Object encode() {
    return <Object?>[
      min.encode(),
      max.encode(),
    ];
  }

  static ScreenBox decode(Object result) {
    result as List<Object?>;
    return ScreenBox(
      min: ScreenCoordinate.decode(result[0]! as List<Object?>),
      max: ScreenCoordinate.decode(result[1]! as List<Object?>),
    );
  }
}

/// A coordinate bounds and zoom.
class CoordinateBoundsZoom {
  CoordinateBoundsZoom({
    required this.bounds,
    required this.zoom,
  });

  /// The latitude and longitude bounds.
  CoordinateBounds bounds;

  /// Zoom.
  double zoom;

  Object encode() {
    return <Object?>[
      bounds.encode(),
      zoom,
    ];
  }

  static CoordinateBoundsZoom decode(Object result) {
    result as List<Object?>;
    return CoordinateBoundsZoom(
      bounds: CoordinateBounds.decode(result[0]! as List<Object?>),
      zoom: result[1]! as double,
    );
  }
}

/// Size type.
class Size {
  Size({
    required this.width,
    required this.height,
  });

  /// Width of the size.
  double width;

  /// Height of the size.
  double height;

  Object encode() {
    return <Object?>[
      width,
      height,
    ];
  }

  static Size decode(Object result) {
    result as List<Object?>;
    return Size(
      width: result[0]! as double,
      height: result[1]! as double,
    );
  }
}

/// Options for querying rendered features.
class RenderedQueryOptions {
  RenderedQueryOptions({
    this.layerIds,
    this.filter,
  });

  /// Layer IDs to include in the query.
  List<String?>? layerIds;

  /// Filters the returned features with an expression
  String? filter;

  Object encode() {
    return <Object?>[
      layerIds,
      filter,
    ];
  }

  static RenderedQueryOptions decode(Object result) {
    result as List<Object?>;
    return RenderedQueryOptions(
      layerIds: (result[0] as List<Object?>?)?.cast<String?>(),
      filter: result[1] as String?,
    );
  }
}

/// Options for querying source features.
class SourceQueryOptions {
  SourceQueryOptions({
    this.sourceLayerIds,
    required this.filter,
  });

  /// Source layer IDs to include in the query.
  List<String?>? sourceLayerIds;

  /// Filters the returned features with an expression
  String filter;

  Object encode() {
    return <Object?>[
      sourceLayerIds,
      filter,
    ];
  }

  static SourceQueryOptions decode(Object result) {
    result as List<Object?>;
    return SourceQueryOptions(
      sourceLayerIds: (result[0] as List<Object?>?)?.cast<String?>(),
      filter: result[1]! as String,
    );
  }
}

/// A value or a collection of a feature extension.
class FeatureExtensionValue {
  FeatureExtensionValue({
    this.value,
    this.featureCollection,
  });

  /// An optional value of a feature extension
  String? value;

  /// An optional array of features from a feature extension.
  List<Map<String?, Object?>?>? featureCollection;

  Object encode() {
    return <Object?>[
      value,
      featureCollection,
    ];
  }

  static FeatureExtensionValue decode(Object result) {
    result as List<Object?>;
    return FeatureExtensionValue(
      value: result[0] as String?,
      featureCollection: (result[1] as List<Object?>?)?.map((e) {
        return Map<Object?, Object?>.from(e as Map<dynamic, dynamic>)
            .cast<String?, Object?>();
      }).toList(),
    );
  }
}

/// Specifies position of a layer that is added via addStyleLayer method.
class LayerPosition {
  LayerPosition({
    this.above,
    this.below,
    this.at,
  });

  /// Layer should be positioned above specified layer id.
  String? above;

  /// Layer should be positioned below specified layer id.
  String? below;

  /// Layer should be positioned at specified index in a layers stack.
  int? at;

  Object encode() {
    return <Object?>[
      above,
      below,
      at,
    ];
  }

  static LayerPosition decode(Object result) {
    result as List<Object?>;
    return LayerPosition(
      above: result[0] as String?,
      below: result[1] as String?,
      at: result[2] as int?,
    );
  }
}

/// Represents query result that is returned in QueryRenderedFeaturesCallback.
/// @see `queryRenderedFeatures`
class QueriedRenderedFeature {
  QueriedRenderedFeature({
    required this.queriedFeature,
    required this.layers,
  });

  /// Feature returned by the query.
  QueriedFeature queriedFeature;

  /// An array of layer Ids for the queried feature.
  /// If the feature has been rendered in multiple layers, multiple Ids will be provided.
  /// If the feature is only rendered in one layer, a single Id will be provided.
  List<String?> layers;

  Object encode() {
    return <Object?>[
      queriedFeature.encode(),
      layers,
    ];
  }

  static QueriedRenderedFeature decode(Object result) {
    result as List<Object?>;
    return QueriedRenderedFeature(
      queriedFeature: QueriedFeature.decode(result[0]! as List<Object?>),
      layers: (result[1] as List<Object?>?)!.cast<String?>(),
    );
  }
}

/// Represents query result that is returned in QuerySourceFeaturesCallback.
/// @see `querySourceFeatures`
class QueriedSourceFeature {
  QueriedSourceFeature({
    required this.queriedFeature,
  });

  /// Feature returned by the query.
  QueriedFeature queriedFeature;

  Object encode() {
    return <Object?>[
      queriedFeature.encode(),
    ];
  }

  static QueriedSourceFeature decode(Object result) {
    result as List<Object?>;
    return QueriedSourceFeature(
      queriedFeature: QueriedFeature.decode(result[0]! as List<Object?>),
    );
  }
}

/// Represents query result that is returned in QueryFeaturesCallback.
/// @see `queryRenderedFeatures` or `querySourceFeatures`
class QueriedFeature {
  QueriedFeature({
    required this.feature,
    required this.source,
    this.sourceLayer,
    required this.state,
  });

  /// Feature returned by the query.
  Map<String?, Object?> feature;

  /// Source id for a queried feature.
  String source;

  /// Source layer id for a queried feature. May be null if source does not support layers, e.g., 'geojson' source,
  /// or when data provided by the source is not layered.
  String? sourceLayer;

  /// Feature state for a queried feature. Type of the value is an Object.
  /// @see `setFeatureState` and `getFeatureState`
  String state;

  Object encode() {
    return <Object?>[
      feature,
      source,
      sourceLayer,
      state,
    ];
  }

  static QueriedFeature decode(Object result) {
    result as List<Object?>;
    return QueriedFeature(
      feature: (result[0] as Map<Object?, Object?>?)!.cast<String?, Object?>(),
      source: result[1]! as String,
      sourceLayer: result[2] as String?,
      state: result[3]! as String,
    );
  }
}

/// Geometry for querying rendered features.
class RenderedQueryGeometry {
  RenderedQueryGeometry({
    required this.value,
    required this.type,
  });

  /// ScreenCoordinate/List<ScreenCoordinate>/ScreenBox in Json mode.
  String value;

  Type type;

  Object encode() {
    return <Object?>[
      value,
      type.index,
    ];
  }

  static RenderedQueryGeometry decode(Object result) {
    result as List<Object?>;
    return RenderedQueryGeometry(
      value: result[0]! as String,
      type: Type.values[result[1]! as int],
    );
  }
}

/// An offline region definition is a geographic region defined by a style URL,
/// a geometry, zoom range, and device pixel ratio. Both `minZoom` and `maxZoom` must be ≥ 0,
/// and `maxZoom` must be ≥ `minZoom`. The `maxZoom` may be ∞, in which case for each tile source,
/// the region will include tiles from `minZoom` up to the maximum zoom level provided by that source.
/// The `pixelRatio` must be ≥ 0 and should typically be 1.0 or 2.0.
class OfflineRegionGeometryDefinition {
  OfflineRegionGeometryDefinition({
    required this.styleURL,
    required this.geometry,
    required this.minZoom,
    required this.maxZoom,
    required this.pixelRatio,
    required this.glyphsRasterizationMode,
  });

  /// The style associated with the offline region
  String styleURL;

  /// The geometry that defines the boundary of the offline region
  Map<String?, Object?> geometry;

  /// Minimum zoom level for the offline region
  double minZoom;

  /// Maximum zoom level for the offline region
  double maxZoom;

  /// Pixel ratio to be accounted for when downloading assets
  double pixelRatio;

  /// Specifies glyphs rasterization mode. It defines which glyphs will be loaded from the server
  GlyphsRasterizationMode glyphsRasterizationMode;

  Object encode() {
    return <Object?>[
      styleURL,
      geometry,
      minZoom,
      maxZoom,
      pixelRatio,
      glyphsRasterizationMode.index,
    ];
  }

  static OfflineRegionGeometryDefinition decode(Object result) {
    result as List<Object?>;
    return OfflineRegionGeometryDefinition(
      styleURL: result[0]! as String,
      geometry: (result[1] as Map<Object?, Object?>?)!.cast<String?, Object?>(),
      minZoom: result[2]! as double,
      maxZoom: result[3]! as double,
      pixelRatio: result[4]! as double,
      glyphsRasterizationMode:
          GlyphsRasterizationMode.values[result[5]! as int],
    );
  }
}

/// An offline region definition is a geographic region defined by a style URL,
/// geographic bounding box, zoom range, and device pixel ratio. Both `minZoom` and `maxZoom` must be ≥ 0,
/// and `maxZoom` must be ≥ `minZoom`. The `maxZoom` may be ∞, in which case for each tile source,
/// the region will include tiles from `minZoom` up to the maximum zoom level provided by that source.
/// The `pixelRatio` must be ≥ 0 and should typically be 1.0 or 2.0.
class OfflineRegionTilePyramidDefinition {
  OfflineRegionTilePyramidDefinition({
    required this.styleURL,
    required this.bounds,
    required this.minZoom,
    required this.maxZoom,
    required this.pixelRatio,
    required this.glyphsRasterizationMode,
  });

  /// The style associated with the offline region.
  String styleURL;

  /// The bounds covering the region.
  CoordinateBounds bounds;

  /// Minimum zoom level for the offline region.
  double minZoom;

  /// Maximum zoom level for the offline region.
  double maxZoom;

  /// Pixel ratio to be accounted for when downloading assets.
  double pixelRatio;

  /// Specifies glyphs download mode.
  GlyphsRasterizationMode glyphsRasterizationMode;

  Object encode() {
    return <Object?>[
      styleURL,
      bounds.encode(),
      minZoom,
      maxZoom,
      pixelRatio,
      glyphsRasterizationMode.index,
    ];
  }

  static OfflineRegionTilePyramidDefinition decode(Object result) {
    result as List<Object?>;
    return OfflineRegionTilePyramidDefinition(
      styleURL: result[0]! as String,
      bounds: CoordinateBounds.decode(result[1]! as List<Object?>),
      minZoom: result[2]! as double,
      maxZoom: result[3]! as double,
      pixelRatio: result[4]! as double,
      glyphsRasterizationMode:
          GlyphsRasterizationMode.values[result[5]! as int],
    );
  }
}

/// ProjectedMeters is a coordinate in a specific
/// [Spherical Mercator](http://docs.openlayers.org/library/spherical_mercator.html) projection.
///
/// This specific Spherical Mercator projection assumes the Earth is a sphere with a radius
/// of 6,378,137 meters. Coordinates are determined as distances, in meters, on the surface
/// of that sphere.
class ProjectedMeters {
  ProjectedMeters({
    required this.northing,
    required this.easting,
  });

  /// Projected meters in north direction.
  double northing;

  /// Projected meters in east direction.
  double easting;

  Object encode() {
    return <Object?>[
      northing,
      easting,
    ];
  }

  static ProjectedMeters decode(Object result) {
    result as List<Object?>;
    return ProjectedMeters(
      northing: result[0]! as double,
      easting: result[1]! as double,
    );
  }
}

/// Describes a point on the map in Mercator projection.
class MercatorCoordinate {
  MercatorCoordinate({
    required this.x,
    required this.y,
  });

  /// A value representing the x position of this coordinate.
  double x;

  /// A value representing the y position of this coordinate.
  double y;

  Object encode() {
    return <Object?>[
      x,
      y,
    ];
  }

  static MercatorCoordinate decode(Object result) {
    result as List<Object?>;
    return MercatorCoordinate(
      x: result[0]! as double,
      y: result[1]! as double,
    );
  }
}

/// The information about style object (source or layer).
class StyleObjectInfo {
  StyleObjectInfo({
    required this.id,
    required this.type,
  });

  /// The object's identifier.
  String id;

  /// The object's type.
  String type;

  Object encode() {
    return <Object?>[
      id,
      type,
    ];
  }

  static StyleObjectInfo decode(Object result) {
    result as List<Object?>;
    return StyleObjectInfo(
      id: result[0]! as String,
      type: result[1]! as String,
    );
  }
}

class StyleProjection {
  StyleProjection({
    required this.name,
  });

  StyleProjectionName name;

  Object encode() {
    return <Object?>[
      name.index,
    ];
  }

  static StyleProjection decode(Object result) {
    result as List<Object?>;
    return StyleProjection(
      name: StyleProjectionName.values[result[0]! as int],
    );
  }
}

/// A global directional light source which is only applied on 3D layers and hillshade layers. Using this type disables other light sources.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
class FlatLight {
  FlatLight({
    required this.id,
    this.anchor,
    this.color,
    this.colorTransition,
    this.intensity,
    this.intensityTransition,
    this.position,
    this.positionTransition,
  });

  /// Unique light name
  String id;

  /// Whether extruded geometries are lit relative to the map or viewport.
  Anchor? anchor;

  /// Color tint for lighting extruded geometries.
  int? color;

  /// Transition property for `color`
  TransitionOptions? colorTransition;

  /// Intensity of lighting (on a scale from 0 to 1). Higher numbers will present as more extreme contrast.
  double? intensity;

  /// Transition property for `intensity`
  TransitionOptions? intensityTransition;

  /// Position of the light source relative to lit (extruded) geometries, in [r radial coordinate, a azimuthal angle, p polar angle] where r indicates the distance from the center of the base of an object to its light, a indicates the position of the light relative to 0 degree (0 degree when `light.anchor` is set to `viewport` corresponds to the top of the viewport, or 0 degree when `light.anchor` is set to `map` corresponds to due north, and degrees proceed clockwise), and p indicates the height of the light (from 0 degree, directly above, to 180 degree, directly below).
  List<double?>? position;

  /// Transition property for `position`
  TransitionOptions? positionTransition;

  Object encode() {
    return <Object?>[
      id,
      anchor?.index,
      color,
      colorTransition?.encode(),
      intensity,
      intensityTransition?.encode(),
      position,
      positionTransition?.encode(),
    ];
  }

  static FlatLight decode(Object result) {
    result as List<Object?>;
    return FlatLight(
      id: result[0]! as String,
      anchor: result[1] != null ? Anchor.values[result[1]! as int] : null,
      color: result[2] as int?,
      colorTransition: result[3] != null
          ? TransitionOptions.decode(result[3]! as List<Object?>)
          : null,
      intensity: result[4] as double?,
      intensityTransition: result[5] != null
          ? TransitionOptions.decode(result[5]! as List<Object?>)
          : null,
      position: (result[6] as List<Object?>?)?.cast<double?>(),
      positionTransition: result[7] != null
          ? TransitionOptions.decode(result[7]! as List<Object?>)
          : null,
    );
  }
}

/// A light that has a direction and is located at infinite, so its rays are parallel. Simulates the sun light and it can cast shadows
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
class DirectionalLight {
  DirectionalLight({
    required this.id,
    this.castShadows,
    this.color,
    this.colorTransition,
    this.direction,
    this.directionTransition,
    this.intensity,
    this.intensityTransition,
    this.shadowIntensity,
    this.shadowIntensityTransition,
  });

  /// Unique light name
  String id;

  /// Enable/Disable shadow casting for this light
  bool? castShadows;

  /// Color of the directional light.
  int? color;

  /// Transition property for `color`
  TransitionOptions? colorTransition;

  /// Direction of the light source specified as [a azimuthal angle, p polar angle] where a indicates the azimuthal angle of the light relative to north (in degrees and proceeding clockwise), and p indicates polar angle of the light (from 0 degree, directly above, to 180 degree, directly below).
  List<double?>? direction;

  /// Transition property for `direction`
  TransitionOptions? directionTransition;

  /// A multiplier for the color of the directional light.
  double? intensity;

  /// Transition property for `intensity`
  TransitionOptions? intensityTransition;

  /// Determines the shadow strength, affecting the shadow receiver surfaces final color. Values near 0.0 reduce the shadow contribution to the final color. Values near to 1.0 make occluded surfaces receive almost no directional light. Designed to be used mostly for transitioning between values 0 and 1.
  double? shadowIntensity;

  /// Transition property for `shadowIntensity`
  TransitionOptions? shadowIntensityTransition;

  Object encode() {
    return <Object?>[
      id,
      castShadows,
      color,
      colorTransition?.encode(),
      direction,
      directionTransition?.encode(),
      intensity,
      intensityTransition?.encode(),
      shadowIntensity,
      shadowIntensityTransition?.encode(),
    ];
  }

  static DirectionalLight decode(Object result) {
    result as List<Object?>;
    return DirectionalLight(
      id: result[0]! as String,
      castShadows: result[1] as bool?,
      color: result[2] as int?,
      colorTransition: result[3] != null
          ? TransitionOptions.decode(result[3]! as List<Object?>)
          : null,
      direction: (result[4] as List<Object?>?)?.cast<double?>(),
      directionTransition: result[5] != null
          ? TransitionOptions.decode(result[5]! as List<Object?>)
          : null,
      intensity: result[6] as double?,
      intensityTransition: result[7] != null
          ? TransitionOptions.decode(result[7]! as List<Object?>)
          : null,
      shadowIntensity: result[8] as double?,
      shadowIntensityTransition: result[9] != null
          ? TransitionOptions.decode(result[9]! as List<Object?>)
          : null,
    );
  }
}

/// An indirect light affecting all objects in the map adding a constant amount of light on them. It has no explicit direction and cannot cast shadows.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#light)
class AmbientLight {
  AmbientLight({
    required this.id,
    this.color,
    this.colorTransition,
    this.intensity,
    this.intensityTransition,
  });

  /// Unique light name
  String id;

  /// Color of the ambient light.
  int? color;

  /// Transition property for `color`
  TransitionOptions? colorTransition;

  /// A multiplier for the color of the ambient light.
  double? intensity;

  /// Transition property for `intensity`
  TransitionOptions? intensityTransition;

  Object encode() {
    return <Object?>[
      id,
      color,
      colorTransition?.encode(),
      intensity,
      intensityTransition?.encode(),
    ];
  }

  static AmbientLight decode(Object result) {
    result as List<Object?>;
    return AmbientLight(
      id: result[0]! as String,
      color: result[1] as int?,
      colorTransition: result[2] != null
          ? TransitionOptions.decode(result[2]! as List<Object?>)
          : null,
      intensity: result[3] as double?,
      intensityTransition: result[4] != null
          ? TransitionOptions.decode(result[4]! as List<Object?>)
          : null,
    );
  }
}

/// Image type.
class MbxImage {
  MbxImage({
    required this.width,
    required this.height,
    required this.data,
  });

  /// The width of the image, in screen pixels.
  int width;

  /// The height of the image, in screen pixels.
  int height;

  /// 32-bit premultiplied RGBA image data.
  ///
  /// An uncompressed image data encoded in 32-bit RGBA format with premultiplied
  /// alpha channel. This field should contain exactly `4 * width * height` bytes. It
  /// should consist of a sequence of scanlines.
  Uint8List data;

  Object encode() {
    return <Object?>[
      width,
      height,
      data,
    ];
  }

  static MbxImage decode(Object result) {
    result as List<Object?>;
    return MbxImage(
      width: result[0]! as int,
      height: result[1]! as int,
      data: result[2]! as Uint8List,
    );
  }
}

/// Describes the image stretch areas.
class ImageStretches {
  ImageStretches({
    required this.first,
    required this.second,
  });

  /// The first stretchable part in screen pixel units.
  double first;

  /// The second stretchable part in screen pixel units.
  double second;

  Object encode() {
    return <Object?>[
      first,
      second,
    ];
  }

  static ImageStretches decode(Object result) {
    result as List<Object?>;
    return ImageStretches(
      first: result[0]! as double,
      second: result[1]! as double,
    );
  }
}

/// Describes the image content, e.g. where text can be fit into an image.
///
/// When sizing icons with `icon-text-fit`, the icon size will be adjusted so that the this content box fits exactly around the text.
class ImageContent {
  ImageContent({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  /// Distance to the left, in screen pixels.
  double left;

  /// Distance to the top, in screen pixels.
  double top;

  /// Distance to the right, in screen pixels.
  double right;

  /// Distance to the bottom, in screen pixels.
  double bottom;

  Object encode() {
    return <Object?>[
      left,
      top,
      right,
      bottom,
    ];
  }

  static ImageContent decode(Object result) {
    result as List<Object?>;
    return ImageContent(
      left: result[0]! as double,
      top: result[1]! as double,
      right: result[2]! as double,
      bottom: result[3]! as double,
    );
  }
}

/// The `transition options` controls timing for the interpolation between a transitionable style
/// property's previous value and new value. These can be used to define the style default property
/// transition behavior. Also, any transitionable style property may also have its own `-transition`
/// property that defines specific transition timing for that specific layer property, overriding
/// the global transition values.
class TransitionOptions {
  TransitionOptions({
    this.duration,
    this.delay,
    this.enablePlacementTransitions,
  });

  /// Time allotted for transitions to complete. Units in milliseconds. Defaults to `300.0`.
  int? duration;

  /// Length of time before a transition begins. Units in milliseconds. Defaults to `0.0`.
  int? delay;

  /// Whether the fade in/out symbol placement transition is enabled. Defaults to `true`.
  bool? enablePlacementTransitions;

  Object encode() {
    return <Object?>[
      duration,
      delay,
      enablePlacementTransitions,
    ];
  }

  static TransitionOptions decode(Object result) {
    result as List<Object?>;
    return TransitionOptions(
      duration: result[0] as int?,
      delay: result[1] as int?,
      enablePlacementTransitions: result[2] as bool?,
    );
  }
}

/// Represents a tile coordinate.
class CanonicalTileID {
  CanonicalTileID({
    required this.z,
    required this.x,
    required this.y,
  });

  /// The z value of the coordinate (zoom-level).
  int z;

  /// The x value of the coordinate.
  int x;

  /// The y value of the coordinate.
  int y;

  Object encode() {
    return <Object?>[
      z,
      x,
      y,
    ];
  }

  static CanonicalTileID decode(Object result) {
    result as List<Object?>;
    return CanonicalTileID(
      z: result[0]! as int,
      x: result[1]! as int,
      y: result[2]! as int,
    );
  }
}

/// Holds a style property value with meta data.
class StylePropertyValue {
  StylePropertyValue({
    this.value,
    required this.kind,
  });

  /// The property value.
  Object? value;

  /// The kind of the property value.
  StylePropertyValueKind kind;

  Object encode() {
    return <Object?>[
      value,
      kind.index,
    ];
  }

  static StylePropertyValue decode(Object result) {
    result as List<Object?>;
    return StylePropertyValue(
      value: result[0],
      kind: StylePropertyValueKind.values[result[1]! as int],
    );
  }
}

class __AnimationManagerCodec extends StandardMessageCodec {
  const __AnimationManagerCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CameraOptions) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return CameraOptions.decode(readValue(buffer)!);
      case 129:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 130:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 131:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 132:
        return ScreenCoordinate.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Interface for managing animation.
class _AnimationManager {
  /// Constructor for [_AnimationManager].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  _AnimationManager({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = __AnimationManagerCodec();

  Future<void> easeTo(CameraOptions arg_cameraOptions,
      MapAnimationOptions? arg_mapAnimationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.easeTo',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_cameraOptions, arg_mapAnimationOptions])
        as List<Object?>?;
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

  Future<void> flyTo(CameraOptions arg_cameraOptions,
      MapAnimationOptions? arg_mapAnimationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.flyTo', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_cameraOptions, arg_mapAnimationOptions])
        as List<Object?>?;
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

  Future<void> pitchBy(
      double arg_pitch, MapAnimationOptions? arg_mapAnimationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.pitchBy',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_pitch, arg_mapAnimationOptions]) as List<Object?>?;
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

  Future<void> scaleBy(
      double arg_amount,
      ScreenCoordinate? arg_screenCoordinate,
      MapAnimationOptions? arg_mapAnimationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.scaleBy',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_amount,
      arg_screenCoordinate,
      arg_mapAnimationOptions
    ]) as List<Object?>?;
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

  Future<void> moveBy(ScreenCoordinate arg_screenCoordinate,
      MapAnimationOptions? arg_mapAnimationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.moveBy',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_screenCoordinate, arg_mapAnimationOptions])
        as List<Object?>?;
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

  Future<void> rotateBy(ScreenCoordinate arg_first, ScreenCoordinate arg_second,
      MapAnimationOptions? arg_mapAnimationOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.rotateBy',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_first, arg_second, arg_mapAnimationOptions])
        as List<Object?>?;
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

  Future<void> cancelCameraAnimation() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._AnimationManager.cancelCameraAnimation',
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
    } else {
      return;
    }
  }
}

class __CameraManagerCodec extends StandardMessageCodec {
  const __CameraManagerCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AmbientLight) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is CameraBounds) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is CameraBoundsOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CameraOptions) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is CameraState) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CanonicalTileID) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBounds) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBoundsZoom) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is DirectionalLight) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FeatureExtensionValue) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is FlatLight) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is GlyphsRasterizationOptions) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is ImageContent) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is ImageStretches) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is LayerPosition) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is MapDebugOptions) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is MapOptions) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else if (value is MbxImage) {
      buffer.putUint8(147);
      writeValue(buffer, value.encode());
    } else if (value is MercatorCoordinate) {
      buffer.putUint8(148);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(149);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(150);
      writeValue(buffer, value.encode());
    } else if (value is ProjectedMeters) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is QueriedFeature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is QueriedRenderedFeature) {
      buffer.putUint8(153);
      writeValue(buffer, value.encode());
    } else if (value is QueriedSourceFeature) {
      buffer.putUint8(154);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryGeometry) {
      buffer.putUint8(155);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryOptions) {
      buffer.putUint8(156);
      writeValue(buffer, value.encode());
    } else if (value is ScreenBox) {
      buffer.putUint8(157);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(158);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(159);
      writeValue(buffer, value.encode());
    } else if (value is SourceQueryOptions) {
      buffer.putUint8(160);
      writeValue(buffer, value.encode());
    } else if (value is StyleObjectInfo) {
      buffer.putUint8(161);
      writeValue(buffer, value.encode());
    } else if (value is StyleProjection) {
      buffer.putUint8(162);
      writeValue(buffer, value.encode());
    } else if (value is StylePropertyValue) {
      buffer.putUint8(163);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInMegabytes) {
      buffer.putUint8(164);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInTiles) {
      buffer.putUint8(165);
      writeValue(buffer, value.encode());
    } else if (value is TransitionOptions) {
      buffer.putUint8(166);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AmbientLight.decode(readValue(buffer)!);
      case 129:
        return CameraBounds.decode(readValue(buffer)!);
      case 130:
        return CameraBoundsOptions.decode(readValue(buffer)!);
      case 131:
        return CameraOptions.decode(readValue(buffer)!);
      case 132:
        return CameraState.decode(readValue(buffer)!);
      case 133:
        return CanonicalTileID.decode(readValue(buffer)!);
      case 134:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 135:
        return CoordinateBoundsZoom.decode(readValue(buffer)!);
      case 136:
        return DirectionalLight.decode(readValue(buffer)!);
      case 137:
        return FeatureExtensionValue.decode(readValue(buffer)!);
      case 138:
        return FlatLight.decode(readValue(buffer)!);
      case 139:
        return GlyphsRasterizationOptions.decode(readValue(buffer)!);
      case 140:
        return ImageContent.decode(readValue(buffer)!);
      case 141:
        return ImageStretches.decode(readValue(buffer)!);
      case 142:
        return LayerPosition.decode(readValue(buffer)!);
      case 143:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 144:
        return MapDebugOptions.decode(readValue(buffer)!);
      case 145:
        return MapOptions.decode(readValue(buffer)!);
      case 146:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 147:
        return MbxImage.decode(readValue(buffer)!);
      case 148:
        return MercatorCoordinate.decode(readValue(buffer)!);
      case 149:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 150:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      case 151:
        return ProjectedMeters.decode(readValue(buffer)!);
      case 152:
        return QueriedFeature.decode(readValue(buffer)!);
      case 153:
        return QueriedRenderedFeature.decode(readValue(buffer)!);
      case 154:
        return QueriedSourceFeature.decode(readValue(buffer)!);
      case 155:
        return RenderedQueryGeometry.decode(readValue(buffer)!);
      case 156:
        return RenderedQueryOptions.decode(readValue(buffer)!);
      case 157:
        return ScreenBox.decode(readValue(buffer)!);
      case 158:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 159:
        return Size.decode(readValue(buffer)!);
      case 160:
        return SourceQueryOptions.decode(readValue(buffer)!);
      case 161:
        return StyleObjectInfo.decode(readValue(buffer)!);
      case 162:
        return StyleProjection.decode(readValue(buffer)!);
      case 163:
        return StylePropertyValue.decode(readValue(buffer)!);
      case 164:
        return TileCacheBudgetInMegabytes.decode(readValue(buffer)!);
      case 165:
        return TileCacheBudgetInTiles.decode(readValue(buffer)!);
      case 166:
        return TransitionOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Interface for managing camera.
class _CameraManager {
  /// Constructor for [_CameraManager].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  _CameraManager({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = __CameraManagerCodec();

  /// Convenience method that returns a `camera options` object for the given parameters.
  ///
  /// @param coordinates The `coordinates` representing the bounds of the camera.
  /// @param camera The `camera options` which will be applied before calculating the camera for the coordinates.
  /// If any of the fields in camera options is not provided then the current value from the map for that field will be used.
  /// @param coordinatesPadding The amount of padding in screen points to add to the given `coordinates`.
  /// This padding is not applied to the map but to the coordinates provided. If you want to apply padding to the map use `camera` parameter.
  /// @param maxZoom The maximum zoom level allowed in the returned camera options.
  /// @param offset The center of the given bounds relative to map center in screen points.
  /// @return The `camera options` object representing the provided parameters.
  Future<CameraOptions> cameraForCoordinatesPadding(
      List<Map<String?, Object?>?> arg_coordinates,
      CameraOptions arg_camera,
      MbxEdgeInsets? arg_coordinatesPadding,
      double? arg_maxZoom,
      ScreenCoordinate? arg_offset) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.cameraForCoordinatesPadding',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_coordinates,
      arg_camera,
      arg_coordinatesPadding,
      arg_maxZoom,
      arg_offset
    ]) as List<Object?>?;
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
      return (replyList[0] as CameraOptions?)!;
    }
  }

  /// Convenience method that returns the `camera options` object for given parameters.
  ///
  /// @param bounds The `coordinate bounds` of the camera.
  /// @param padding The `edge insets` of the camera.
  /// @param bearing The bearing of the camera.
  /// @param pitch The pitch of the camera.
  /// @param maxZoom The maximum zoom level allowed in the returned camera options.
  /// @param offset The center of the given bounds relative to map center in screen points.
  /// @return The `camera options` object representing the provided parameters.
  Future<CameraOptions> cameraForCoordinateBounds(
      CoordinateBounds arg_bounds,
      MbxEdgeInsets arg_padding,
      double? arg_bearing,
      double? arg_pitch,
      double? arg_maxZoom,
      ScreenCoordinate? arg_offset) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.cameraForCoordinateBounds',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_bounds,
      arg_padding,
      arg_bearing,
      arg_pitch,
      arg_maxZoom,
      arg_offset
    ]) as List<Object?>?;
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
      return (replyList[0] as CameraOptions?)!;
    }
  }

  /// Convenience method that returns the `camera options` object for given parameters.
  ///
  /// @param coordinates The `coordinates` representing the bounds of the camera.
  /// @param padding The `edge insets` of the camera.
  /// @param bearing The bearing of the camera.
  /// @param pitch The pitch of the camera.
  ///
  /// @return The `camera options` object representing the provided parameters.
  Future<CameraOptions> cameraForCoordinates(
      List<Map<String?, Object?>?> arg_coordinates,
      MbxEdgeInsets arg_padding,
      double? arg_bearing,
      double? arg_pitch) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.cameraForCoordinates',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(
            <Object?>[arg_coordinates, arg_padding, arg_bearing, arg_pitch])
        as List<Object?>?;
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
      return (replyList[0] as CameraOptions?)!;
    }
  }

  /// Convenience method that adjusts the provided `camera options` object for given parameters.
  ///
  /// Returns the provided `camera` options with zoom adjusted to fit `coordinates` into the `box`, so that `coordinates` on the left,
  /// top and right of the effective `camera` center at the principal point of the projection (defined by `padding`) fit into the `box`.
  /// Returns the provided `camera` options object unchanged upon an error.
  /// Note that this method may fail if the principal point of the projection is not inside the `box` or
  /// if there is no sufficient screen space, defined by principal point and the `box`, to fit the geometry.
  ///
  /// @param coordinates The `coordinates` representing the bounds of the camera.
  /// @param camera The `camera options` for which zoom should be adjusted. Note that the `camera.center` is required.
  /// @param box The `screen box` into which `coordinates` should fit.
  ///
  /// @return The `camera options` object with the zoom level adjusted to fit `coordinates` into the `box`.
  Future<CameraOptions> cameraForCoordinatesCameraOptions(
      List<Map<String?, Object?>?> arg_coordinates,
      CameraOptions arg_camera,
      ScreenBox arg_box) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.cameraForCoordinatesCameraOptions',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinates, arg_camera, arg_box])
            as List<Object?>?;
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
      return (replyList[0] as CameraOptions?)!;
    }
  }

  /// Convenience method that returns the `camera options` object for given parameters.
  ///
  /// @param geometry The `geometry` representing the bounds of the camera.
  /// @param padding The `edge insets` of the camera.
  /// @param bearing The bearing of the camera.
  /// @param pitch The pitch of the camera.
  ///
  /// @return The `camera options` object representing the provided parameters.
  Future<CameraOptions> cameraForGeometry(Map<String?, Object?> arg_geometry,
      MbxEdgeInsets arg_padding, double? arg_bearing, double? arg_pitch) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.cameraForGeometry',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_geometry, arg_padding, arg_bearing, arg_pitch])
        as List<Object?>?;
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
      return (replyList[0] as CameraOptions?)!;
    }
  }

  /// Returns the `coordinate bounds` for a given camera.
  ///
  /// Note that if the given `camera` shows the antimeridian, the returned wrapped `coordinate bounds`
  /// might not represent the minimum bounding box.
  ///
  /// @param camera The `camera options` to use for calculating `coordinate bounds`.
  ///
  /// @return The `coordinate bounds` object representing a given `camera`.
  ///
  Future<CoordinateBounds> coordinateBoundsForCamera(
      CameraOptions arg_camera) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.coordinateBoundsForCamera',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_camera]) as List<Object?>?;
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
      return (replyList[0] as CoordinateBounds?)!;
    }
  }

  /// Returns the `coordinate bounds` for a given camera.
  ///
  /// This method is useful if the `camera` shows the antimeridian.
  ///
  /// @param camera The `camera options` to use for calculating `coordinate bounds`.
  ///
  /// @return The `coordinate bounds` object representing a given `camera`.
  ///
  Future<CoordinateBounds> coordinateBoundsForCameraUnwrapped(
      CameraOptions arg_camera) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.coordinateBoundsForCameraUnwrapped',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_camera]) as List<Object?>?;
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
      return (replyList[0] as CoordinateBounds?)!;
    }
  }

  /// Returns the `coordinate bounds` and the `zoom` for a given `camera`.
  ///
  /// Note that if the given `camera` shows the antimeridian, the returned wrapped `coordinate bounds`
  /// might not represent the minimum bounding box.
  ///
  /// @param camera The `camera options` to use for calculating `coordinate bounds` and `zoom`.
  ///
  /// @return The object representing `coordinate bounds` and `zoom` for a given `camera`.
  ///
  Future<CoordinateBoundsZoom> coordinateBoundsZoomForCamera(
      CameraOptions arg_camera) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.coordinateBoundsZoomForCamera',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_camera]) as List<Object?>?;
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
      return (replyList[0] as CoordinateBoundsZoom?)!;
    }
  }

  /// Returns the unwrapped `coordinate bounds` and `zoom` for a given `camera`.
  ///
  /// This method is useful if the `camera` shows the antimeridian.
  ///
  /// @param camera The `camera options` to use for calculating `coordinate bounds` and `zoom`.
  ///
  /// @return The object representing `coordinate bounds` and `zoom` for a given `camera`.
  ///
  Future<CoordinateBoundsZoom> coordinateBoundsZoomForCameraUnwrapped(
      CameraOptions arg_camera) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.coordinateBoundsZoomForCameraUnwrapped',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_camera]) as List<Object?>?;
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
      return (replyList[0] as CoordinateBoundsZoom?)!;
    }
  }

  /// Calculates a `screen coordinate` that corresponds to a geographical coordinate
  /// (i.e., longitude-latitude pair).
  ///
  /// The `screen coordinate` is in `logical pixels` relative to the top left corner
  /// of the map (not of the whole screen).
  ///
  /// @param coordinate A geographical `coordinate` on the map to convert to a `screen coordinate`.
  ///
  /// @return A `screen coordinate` on the screen in `logical pixels`.
  Future<ScreenCoordinate> pixelForCoordinate(
      Map<String?, Object?> arg_coordinate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.pixelForCoordinate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinate]) as List<Object?>?;
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
      return (replyList[0] as ScreenCoordinate?)!;
    }
  }

  /// Calculates a geographical `coordinate` (i.e., longitude-latitude pair) that corresponds
  /// to a `screen coordinate`.
  ///
  /// The screen coordinate is in `logical pixels`relative to the top left corner
  /// of the map (not of the whole screen).
  ///
  /// @param pixel A `screen coordinate` on the screen in `logical pixels`.
  ///
  /// @return A geographical `coordinate` corresponding to a given `screen coordinate`.
  Future<Map<String?, Object?>> coordinateForPixel(
      ScreenCoordinate arg_pixel) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.coordinateForPixel',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_pixel]) as List<Object?>?;
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
      return (replyList[0] as Map<Object?, Object?>?)!.cast<String?, Object?>();
    }
  }

  /// Calculates `screen coordinates` that correspond to geographical `coordinates`
  /// (i.e., longitude-latitude pairs).
  ///
  /// The `screen coordinates` are in `logical pixels` relative to the top left corner
  /// of the map (not of the whole screen).
  ///
  /// @param coordinates A geographical `coordinates` on the map to convert to `screen coordinates`.
  ///
  /// @return A `screen coordinates` in `logical pixels` for a given geographical `coordinates`.
  Future<List<ScreenCoordinate?>> pixelsForCoordinates(
      List<Map<String?, Object?>?> arg_coordinates) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.pixelsForCoordinates',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinates]) as List<Object?>?;
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
      return (replyList[0] as List<Object?>?)!.cast<ScreenCoordinate?>();
    }
  }

  /// Calculates geographical `coordinates` (i.e., longitude-latitude pairs) that correspond
  /// to `screen coordinates`.
  ///
  /// The screen coordinates are in `logical pixels` relative to the top left corner
  /// of the map (not of the whole screen).
  ///
  /// @param pixels A `screen coordinates` in `logical pixels`.
  ///
  /// @return A `geographical coordinates` that correspond to a given `screen coordinates`.
  Future<List<Map<String?, Object?>?>> coordinatesForPixels(
      List<ScreenCoordinate?> arg_pixels) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.coordinatesForPixels',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_pixels]) as List<Object?>?;
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
      return (replyList[0] as List<Object?>?)!.map((e) {
        return Map<Object?, Object?>.from(e as Map<dynamic, dynamic>)
            .cast<String?, Object?>();
      }).toList();
    }
  }

  /// Changes the map view by any combination of center, zoom, bearing, and pitch, without an animated transition.
  /// The map will retain its current values for any details not passed via the camera options argument.
  /// It is not guaranteed that the provided `camera options` will be set, the map may apply constraints resulting in a
  /// different `camera state`.
  ///
  /// @param cameraOptions The new `camera options` to be set.
  Future<void> setCamera(CameraOptions arg_cameraOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.setCamera',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_cameraOptions]) as List<Object?>?;
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

  /// Returns the current `camera state`.
  ///
  /// @return The current `camera state`.
  Future<CameraState> getCameraState() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.getCameraState',
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
      return (replyList[0] as CameraState?)!;
    }
  }

  /// Sets the `camera bounds options` of the map. The map will retain its current values for any
  /// details not passed via the camera bounds options arguments.
  /// When camera bounds options are set, the camera center is constrained by these bounds, as well as the minimum
  /// zoom level of the camera, to prevent out of bounds areas to be visible.
  /// Note that tilting or rotating the map, or setting stricter minimum and maximum zoom within `options` may still cause some out of bounds areas to become visible.
  ///
  /// @param options The `camera bounds options` to set.
  /// @return A string describing an error if the operation was not successful, expected with `void` value otherwise.
  Future<void> setBounds(CameraBoundsOptions arg_options) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.setBounds',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_options]) as List<Object?>?;
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

  /// Returns the `camera bounds` of the map.
  /// @return A `camera bounds` of the map.
  Future<CameraBounds> getBounds() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._CameraManager.getBounds',
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
      return (replyList[0] as CameraBounds?)!;
    }
  }
}

class __MapInterfaceCodec extends StandardMessageCodec {
  const __MapInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AmbientLight) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is CameraBounds) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is CameraBoundsOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CameraOptions) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is CameraState) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CanonicalTileID) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBounds) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBoundsZoom) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is DirectionalLight) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FeatureExtensionValue) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is FlatLight) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is GlyphsRasterizationOptions) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is ImageContent) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is ImageStretches) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is LayerPosition) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is MapDebugOptions) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is MapOptions) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else if (value is MbxImage) {
      buffer.putUint8(147);
      writeValue(buffer, value.encode());
    } else if (value is MercatorCoordinate) {
      buffer.putUint8(148);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(149);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(150);
      writeValue(buffer, value.encode());
    } else if (value is ProjectedMeters) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is QueriedFeature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is QueriedRenderedFeature) {
      buffer.putUint8(153);
      writeValue(buffer, value.encode());
    } else if (value is QueriedSourceFeature) {
      buffer.putUint8(154);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryGeometry) {
      buffer.putUint8(155);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryOptions) {
      buffer.putUint8(156);
      writeValue(buffer, value.encode());
    } else if (value is ScreenBox) {
      buffer.putUint8(157);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(158);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(159);
      writeValue(buffer, value.encode());
    } else if (value is SourceQueryOptions) {
      buffer.putUint8(160);
      writeValue(buffer, value.encode());
    } else if (value is StyleObjectInfo) {
      buffer.putUint8(161);
      writeValue(buffer, value.encode());
    } else if (value is StyleProjection) {
      buffer.putUint8(162);
      writeValue(buffer, value.encode());
    } else if (value is StylePropertyValue) {
      buffer.putUint8(163);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInMegabytes) {
      buffer.putUint8(164);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInTiles) {
      buffer.putUint8(165);
      writeValue(buffer, value.encode());
    } else if (value is TransitionOptions) {
      buffer.putUint8(166);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AmbientLight.decode(readValue(buffer)!);
      case 129:
        return CameraBounds.decode(readValue(buffer)!);
      case 130:
        return CameraBoundsOptions.decode(readValue(buffer)!);
      case 131:
        return CameraOptions.decode(readValue(buffer)!);
      case 132:
        return CameraState.decode(readValue(buffer)!);
      case 133:
        return CanonicalTileID.decode(readValue(buffer)!);
      case 134:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 135:
        return CoordinateBoundsZoom.decode(readValue(buffer)!);
      case 136:
        return DirectionalLight.decode(readValue(buffer)!);
      case 137:
        return FeatureExtensionValue.decode(readValue(buffer)!);
      case 138:
        return FlatLight.decode(readValue(buffer)!);
      case 139:
        return GlyphsRasterizationOptions.decode(readValue(buffer)!);
      case 140:
        return ImageContent.decode(readValue(buffer)!);
      case 141:
        return ImageStretches.decode(readValue(buffer)!);
      case 142:
        return LayerPosition.decode(readValue(buffer)!);
      case 143:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 144:
        return MapDebugOptions.decode(readValue(buffer)!);
      case 145:
        return MapOptions.decode(readValue(buffer)!);
      case 146:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 147:
        return MbxImage.decode(readValue(buffer)!);
      case 148:
        return MercatorCoordinate.decode(readValue(buffer)!);
      case 149:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 150:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      case 151:
        return ProjectedMeters.decode(readValue(buffer)!);
      case 152:
        return QueriedFeature.decode(readValue(buffer)!);
      case 153:
        return QueriedRenderedFeature.decode(readValue(buffer)!);
      case 154:
        return QueriedSourceFeature.decode(readValue(buffer)!);
      case 155:
        return RenderedQueryGeometry.decode(readValue(buffer)!);
      case 156:
        return RenderedQueryOptions.decode(readValue(buffer)!);
      case 157:
        return ScreenBox.decode(readValue(buffer)!);
      case 158:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 159:
        return Size.decode(readValue(buffer)!);
      case 160:
        return SourceQueryOptions.decode(readValue(buffer)!);
      case 161:
        return StyleObjectInfo.decode(readValue(buffer)!);
      case 162:
        return StyleProjection.decode(readValue(buffer)!);
      case 163:
        return StylePropertyValue.decode(readValue(buffer)!);
      case 164:
        return TileCacheBudgetInMegabytes.decode(readValue(buffer)!);
      case 165:
        return TileCacheBudgetInTiles.decode(readValue(buffer)!);
      case 166:
        return TransitionOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Map class provides map rendering functionality.
///
class _MapInterface {
  /// Constructor for [_MapInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  _MapInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = __MapInterfaceCodec();

  Future<void> loadStyleURI(String arg_styleURI) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.loadStyleURI',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_styleURI]) as List<Object?>?;
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

  Future<void> loadStyleJson(String arg_styleJson) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.loadStyleJson',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_styleJson]) as List<Object?>?;
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

  Future<void> clearData() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.clearData', codec,
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
    } else {
      return;
    }
  }

  Future<void> setTileCacheBudget(
      TileCacheBudgetInMegabytes? arg_tileCacheBudgetInMegabytes,
      TileCacheBudgetInTiles? arg_tileCacheBudgetInTiles) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setTileCacheBudget',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_tileCacheBudgetInMegabytes,
      arg_tileCacheBudgetInTiles
    ]) as List<Object?>?;
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

  /// Gets the size of the map.
  ///
  /// @return The `size` of the map in `logical pixels`.
  Future<Size> getSize() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getSize', codec,
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
      return (replyList[0] as Size?)!;
    }
  }

  /// Triggers a repaint of the map.
  Future<void> triggerRepaint() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.triggerRepaint',
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
    } else {
      return;
    }
  }

  /// Tells the map rendering engine that there is currently a gesture in progress. This
  /// affects how the map renders labels, as it will use different texture filters if a gesture
  /// is ongoing.
  ///
  /// @param inProgress The `boolean` value representing if a gesture is in progress.
  Future<void> setGestureInProgress(bool arg_inProgress) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setGestureInProgress',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_inProgress]) as List<Object?>?;
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

  /// Returns `true` if a gesture is currently in progress.
  ///
  /// @return `true` if a gesture is currently in progress, `false` otherwise.
  Future<bool> isGestureInProgress() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.isGestureInProgress',
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Tells the map rendering engine that the animation is currently performed by the
  /// user (e.g. with a `setCamera` calls series). It adjusts the engine for the animation use case.
  /// In particular, it brings more stability to symbol placement and rendering.
  ///
  /// @param inProgress The `boolean` value representing if user animation is in progress
  Future<void> setUserAnimationInProgress(bool arg_inProgress) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setUserAnimationInProgress',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_inProgress]) as List<Object?>?;
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

  /// Returns `true` if user animation is currently in progress.
  ///
  /// @return `true` if a user animation is currently in progress, `false` otherwise.
  Future<bool> isUserAnimationInProgress() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.isUserAnimationInProgress',
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
      return (replyList[0] as bool?)!;
    }
  }

  /// When loading a map, if prefetch zoom `delta` is set to any number greater than 0,
  /// the map will first request a tile at zoom level lower than `zoom - delta`, with requested
  /// zoom level a multiple of `delta`, in an attempt to display a full map at lower resolution as quick as possible.
  ///
  /// @param delta The new prefetch zoom delta.
  Future<void> setPrefetchZoomDelta(int arg_delta) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setPrefetchZoomDelta',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_delta]) as List<Object?>?;
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

  /// Returns the map's prefetch zoom delta.
  ///
  /// @return The map's prefetch zoom `delta`.
  Future<int> getPrefetchZoomDelta() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getPrefetchZoomDelta',
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
      return (replyList[0] as int?)!;
    }
  }

  /// Sets the north `orientation mode`.
  Future<void> setNorthOrientation(NorthOrientation arg_orientation) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setNorthOrientation',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_orientation.index]) as List<Object?>?;
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

  /// Sets the map `constrain mode`.
  Future<void> setConstrainMode(ConstrainMode arg_mode) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setConstrainMode',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_mode.index]) as List<Object?>?;
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

  /// Sets the `viewport mode`.
  Future<void> setViewportMode(ViewportMode arg_mode) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setViewportMode',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_mode.index]) as List<Object?>?;
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

  /// Returns the `map options`.
  ///
  /// @return The map's `map options`.
  Future<MapOptions> getMapOptions() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getMapOptions',
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
      return (replyList[0] as MapOptions?)!;
    }
  }

  /// Returns the `map debug options`.
  ///
  /// @return An array of `map debug options` flags currently set to the map.
  Future<List<MapDebugOptions?>> getDebug() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getDebug', codec,
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
      return (replyList[0] as List<Object?>?)!.cast<MapDebugOptions?>();
    }
  }

  /// Sets the `map debug options` and enables debug mode based on the passed value.
  ///
  /// @param debugOptions An array of `map debug options` to be set.
  /// @param value A `boolean` value representing the state for a given `map debug options`.
  ///
  Future<void> setDebug(
      List<MapDebugOptions?> arg_debugOptions, bool arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setDebug', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_debugOptions, arg_value]) as List<Object?>?;
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

  /// Queries the map for rendered features.
  ///
  /// @param geometry The `screen pixel coordinates` (point, line string or box) to query for rendered features.
  /// @param options The `render query options` for querying rendered features.
  /// @param completion The `query features completion` called when the query completes.
  /// @return A `cancelable` object that could be used to cancel the pending query.
  Future<List<QueriedRenderedFeature?>> queryRenderedFeatures(
      RenderedQueryGeometry arg_geometry,
      RenderedQueryOptions arg_options) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.queryRenderedFeatures',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_geometry, arg_options]) as List<Object?>?;
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
      return (replyList[0] as List<Object?>?)!.cast<QueriedRenderedFeature?>();
    }
  }

  /// Queries the map for source features.
  ///
  /// @param sourceId The style source identifier used to query for source features.
  /// @param options The `source query options` for querying source features.
  /// @param completion The `query features completion` called when the query completes.
  Future<List<QueriedSourceFeature?>> querySourceFeatures(
      String arg_sourceId, SourceQueryOptions arg_options) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.querySourceFeatures',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_options]) as List<Object?>?;
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
      return (replyList[0] as List<Object?>?)!.cast<QueriedSourceFeature?>();
    }
  }

  /// Returns all the leaves (original points) of a cluster (given its cluster_id) from a GeoJsonSource, with pagination support: limit is the number of leaves
  /// to return (set to Infinity for all points), and offset is the amount of points to skip (for pagination).
  ///
  /// Requires configuring the source as a cluster by calling [GeoJsonSource.Builder#cluster(boolean)].
  ///
  /// @param sourceIdentifier GeoJsonSource identifier.
  /// @param cluster Cluster from which to retrieve leaves from
  /// @param limit The number of points to return from the query (must use type [Long], set to maximum for all points). Defaults to 10.
  /// @param offset The amount of points to skip (for pagination, must use type [Long]). Defaults to 0.
  /// @param completion The result will be returned through the completion block.
  ///         The result is a feature collection or a string describing an error if the operation was not successful.
  Future<FeatureExtensionValue> getGeoJsonClusterLeaves(
      String arg_sourceIdentifier,
      Map<String?, Object?> arg_cluster,
      int? arg_limit,
      int? arg_offset) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getGeoJsonClusterLeaves',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(
            <Object?>[arg_sourceIdentifier, arg_cluster, arg_limit, arg_offset])
        as List<Object?>?;
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
      return (replyList[0] as FeatureExtensionValue?)!;
    }
  }

  /// Returns the children (original points or clusters) of a cluster (on the next zoom level)
  /// given its id (cluster_id value from feature properties) from a GeoJsonSource.
  ///
  /// Requires configuring the source as a cluster by calling [GeoJsonSource.Builder#cluster(boolean)].
  ///
  /// @param sourceIdentifier GeoJsonSource identifier.
  /// @param cluster cluster from which to retrieve children from
  /// @param completion The result will be returned through the completion block.
  ///         The result is a feature collection or a string describing an error if the operation was not successful.
  Future<FeatureExtensionValue> getGeoJsonClusterChildren(
      String arg_sourceIdentifier, Map<String?, Object?> arg_cluster) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getGeoJsonClusterChildren',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceIdentifier, arg_cluster]) as List<Object?>?;
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
      return (replyList[0] as FeatureExtensionValue?)!;
    }
  }

  /// Returns the zoom on which the cluster expands into several children (useful for "click to zoom" feature)
  /// given the cluster's cluster_id (cluster_id value from feature properties) from a GeoJsonSource.
  ///
  /// Requires configuring the source as a cluster by calling [GeoJsonSource.Builder#cluster(boolean)].
  ///
  /// @param sourceIdentifier GeoJsonSource identifier.
  /// @param cluster cluster from which to retrieve the expansion zoom from
  /// @param completion The result will be returned through the completion block.
  ///         The result is a feature extension value containing a value or a string describing an error if the operation was not successful.
  Future<FeatureExtensionValue> getGeoJsonClusterExpansionZoom(
      String arg_sourceIdentifier, Map<String?, Object?> arg_cluster) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getGeoJsonClusterExpansionZoom',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceIdentifier, arg_cluster]) as List<Object?>?;
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
      return (replyList[0] as FeatureExtensionValue?)!;
    }
  }

  /// Updates the state object of a feature within a style source.
  ///
  /// Update entries in the `state` object of a given feature within a style source. Only properties of the
  /// `state` object will be updated. A property in the feature `state` object that is not listed in `state` will
  /// retain its previous value.
  ///
  /// Note that updates to feature `state` are asynchronous, so changes made by this method migth not be
  /// immediately visible using `getStateFeature`.
  ///
  /// @param sourceId The style source identifier.
  /// @param sourceLayerId The style source layer identifier (for multi-layer sources such as vector sources).
  /// @param featureId The feature identifier of the feature whose state should be updated.
  /// @param state The `state` object with properties to update with their respective new values.
  Future<void> setFeatureState(String arg_sourceId, String? arg_sourceLayerId,
      String arg_featureId, String arg_state) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.setFeatureState',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_sourceId,
      arg_sourceLayerId,
      arg_featureId,
      arg_state
    ]) as List<Object?>?;
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

  /// Gets the state map of a feature within a style source.
  ///
  /// Note that updates to feature state are asynchronous, so changes made by other methods might not be
  /// immediately visible.
  ///
  /// @param sourceId The style source identifier.
  /// @param sourceLayerId The style source layer identifier (for multi-layer sources such as vector sources).
  /// @param featureId The feature identifier of the feature whose state should be queried.
  /// @param completion The `query feature state completion` called when the query completes.
  Future<String> getFeatureState(String arg_sourceId, String? arg_sourceLayerId,
      String arg_featureId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getFeatureState',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_sourceId, arg_sourceLayerId, arg_featureId])
        as List<Object?>?;
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
      return (replyList[0] as String?)!;
    }
  }

  /// Removes entries from a feature state object.
  ///
  /// Remove a specified property or all property from a feature's state object, depending on the value of
  /// `stateKey`.
  ///
  /// Note that updates to feature state are asynchronous, so changes made by this method migth not be
  /// immediately visible using `getStateFeature`.
  ///
  /// @param sourceId The style source identifier.
  /// @param sourceLayerId The style source layer identifier (for multi-layer sources such as vector sources).
  /// @param featureId The feature identifier of the feature whose state should be removed.
  /// @param stateKey The key of the property to remove. If `null`, all feature's state object properties are removed.
  Future<void> removeFeatureState(
      String arg_sourceId,
      String? arg_sourceLayerId,
      String arg_featureId,
      String? arg_stateKey) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.removeFeatureState',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_sourceId,
      arg_sourceLayerId,
      arg_featureId,
      arg_stateKey
    ]) as List<Object?>?;
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

  /// Reduces memory use. Useful to call when the application gets paused or sent to background.
  Future<void> reduceMemoryUse() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.reduceMemoryUse',
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
    } else {
      return;
    }
  }

  /// Gets elevation for the given coordinate.
  /// Note: Elevation is only available for the visible region on the screen.
  ///
  /// @param coordinate The `coordinate` defined as longitude-latitude pair.
  /// @return The elevation (in meters) multiplied by current terrain exaggeration, or empty if elevation for the coordinate is not available.
  Future<double?> getElevation(Map<String?, Object?> arg_coordinate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapInterface.getElevation',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinate]) as List<Object?>?;
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
      return (replyList[0] as double?);
    }
  }
}

class _OfflineRegionCodec extends StandardMessageCodec {
  const _OfflineRegionCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is CoordinateBounds) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 129:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 130:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// An offline region represents an identifiable geographic region with optional metadata.
class OfflineRegion {
  /// Constructor for [OfflineRegion].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  OfflineRegion({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _OfflineRegionCodec();

  /// The regions identifier
  Future<int> getIdentifier() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.getIdentifier',
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
      return (replyList[0] as int?)!;
    }
  }

  /// The tile pyramid defining the region. Tile pyramid and geometry definitions are
  /// mutually exclusive.
  ///
  /// @return A definition describing the tile pyramid including attributes, otherwise empty.
  Future<OfflineRegionTilePyramidDefinition?> getTilePyramidDefinition() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.getTilePyramidDefinition',
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
    } else {
      return (replyList[0] as OfflineRegionTilePyramidDefinition?);
    }
  }

  /// The geometry defining the region. Geometry and tile pyramid definitions are
  /// mutually exclusive.
  ///
  /// @return A definition describing the geometry including attributes, otherwise empty.
  Future<OfflineRegionGeometryDefinition?> getGeometryDefinition() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.getGeometryDefinition',
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
    } else {
      return (replyList[0] as OfflineRegionGeometryDefinition?);
    }
  }

  /// Arbitrary binary region metadata.
  ///
  /// @return The metadata associated with the region.
  Future<Uint8List> getMetadata() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.getMetadata',
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
      return (replyList[0] as Uint8List?)!;
    }
  }

  /// Sets arbitrary binary region metadata for the region.
  ///
  /// Note that this setter is asynchronous and the given metadata is applied only
  /// after the resulting callback is invoked with no error.
  ///
  /// @param metadata The metadata associated with the region.
  /// @param callback Called once the request is complete or an error occurred.
  Future<void> setMetadata(Uint8List arg_metadata) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.setMetadata',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_metadata]) as List<Object?>?;
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

  /// Sets the download state of an offline region
  /// A region is either inactive (not downloading, but previously-downloaded
  /// resources are available for use), or active (resources are being downloaded
  /// or will be downloaded, if necessary, when network access is available).
  ///
  /// If the region is already in the given state, this call is ignored.
  ///
  /// @param state The new state to set.
  Future<void> setOfflineRegionDownloadState(
      OfflineRegionDownloadState arg_state) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.setOfflineRegionDownloadState',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_state.index]) as List<Object?>?;
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

  /// Invalidate all the tiles for the region forcing to revalidate
  /// the tiles with the server before using. This is more efficient than deleting the
  /// offline region and downloading it again because if the data on the cache matches
  /// the server, no new data gets transmitted.
  ///
  /// @param callback Called once the request is complete or an error occurred.
  Future<void> invalidate() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.invalidate',
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
    } else {
      return;
    }
  }

  /// Remove an offline region from the database and perform any resources
  /// evictions necessary as a result.
  ///
  /// @param callback Called once the request is complete or an error occurred.
  Future<void> purge() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegion.purge', codec,
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
    } else {
      return;
    }
  }
}

/// The `offline region manager` that manages offline packs. All of the class’s instance methods are asynchronous
/// reflecting the fact that offline resources are stored in a database. The offline manager maintains a canonical
/// collection of offline packs.
class OfflineRegionManager {
  /// Constructor for [OfflineRegionManager].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  OfflineRegionManager({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  /// Sets the maximum number of Mapbox-hosted tiles that may be downloaded and stored on the current device.
  ///
  /// By default, the limit is set to 6,000.
  /// Once this limit is reached, `OfflineRegionObserver.mapboxTileCountLimitExceeded()`
  /// fires every additional attempt to download additional tiles until already downloaded tiles are removed
  /// by calling `OfflineRegion.purge()` API.
  ///
  /// @param limit the maximum number of tiles allowed to be downloaded
  Future<void> setOfflineMapboxTileCountLimit(int arg_limit) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineRegionManager.setOfflineMapboxTileCountLimit',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_limit]) as List<Object?>?;
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

class _ProjectionCodec extends StandardMessageCodec {
  const _ProjectionCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AmbientLight) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is CameraBounds) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is CameraBoundsOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CameraOptions) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is CameraState) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CanonicalTileID) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBounds) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBoundsZoom) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is DirectionalLight) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FeatureExtensionValue) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is FlatLight) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is GlyphsRasterizationOptions) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is ImageContent) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is ImageStretches) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is LayerPosition) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is MapDebugOptions) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is MapOptions) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else if (value is MbxImage) {
      buffer.putUint8(147);
      writeValue(buffer, value.encode());
    } else if (value is MercatorCoordinate) {
      buffer.putUint8(148);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(149);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(150);
      writeValue(buffer, value.encode());
    } else if (value is ProjectedMeters) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is QueriedFeature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is QueriedRenderedFeature) {
      buffer.putUint8(153);
      writeValue(buffer, value.encode());
    } else if (value is QueriedSourceFeature) {
      buffer.putUint8(154);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryGeometry) {
      buffer.putUint8(155);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryOptions) {
      buffer.putUint8(156);
      writeValue(buffer, value.encode());
    } else if (value is ScreenBox) {
      buffer.putUint8(157);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(158);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(159);
      writeValue(buffer, value.encode());
    } else if (value is SourceQueryOptions) {
      buffer.putUint8(160);
      writeValue(buffer, value.encode());
    } else if (value is StyleObjectInfo) {
      buffer.putUint8(161);
      writeValue(buffer, value.encode());
    } else if (value is StyleProjection) {
      buffer.putUint8(162);
      writeValue(buffer, value.encode());
    } else if (value is StylePropertyValue) {
      buffer.putUint8(163);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInMegabytes) {
      buffer.putUint8(164);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInTiles) {
      buffer.putUint8(165);
      writeValue(buffer, value.encode());
    } else if (value is TransitionOptions) {
      buffer.putUint8(166);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AmbientLight.decode(readValue(buffer)!);
      case 129:
        return CameraBounds.decode(readValue(buffer)!);
      case 130:
        return CameraBoundsOptions.decode(readValue(buffer)!);
      case 131:
        return CameraOptions.decode(readValue(buffer)!);
      case 132:
        return CameraState.decode(readValue(buffer)!);
      case 133:
        return CanonicalTileID.decode(readValue(buffer)!);
      case 134:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 135:
        return CoordinateBoundsZoom.decode(readValue(buffer)!);
      case 136:
        return DirectionalLight.decode(readValue(buffer)!);
      case 137:
        return FeatureExtensionValue.decode(readValue(buffer)!);
      case 138:
        return FlatLight.decode(readValue(buffer)!);
      case 139:
        return GlyphsRasterizationOptions.decode(readValue(buffer)!);
      case 140:
        return ImageContent.decode(readValue(buffer)!);
      case 141:
        return ImageStretches.decode(readValue(buffer)!);
      case 142:
        return LayerPosition.decode(readValue(buffer)!);
      case 143:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 144:
        return MapDebugOptions.decode(readValue(buffer)!);
      case 145:
        return MapOptions.decode(readValue(buffer)!);
      case 146:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 147:
        return MbxImage.decode(readValue(buffer)!);
      case 148:
        return MercatorCoordinate.decode(readValue(buffer)!);
      case 149:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 150:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      case 151:
        return ProjectedMeters.decode(readValue(buffer)!);
      case 152:
        return QueriedFeature.decode(readValue(buffer)!);
      case 153:
        return QueriedRenderedFeature.decode(readValue(buffer)!);
      case 154:
        return QueriedSourceFeature.decode(readValue(buffer)!);
      case 155:
        return RenderedQueryGeometry.decode(readValue(buffer)!);
      case 156:
        return RenderedQueryOptions.decode(readValue(buffer)!);
      case 157:
        return ScreenBox.decode(readValue(buffer)!);
      case 158:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 159:
        return Size.decode(readValue(buffer)!);
      case 160:
        return SourceQueryOptions.decode(readValue(buffer)!);
      case 161:
        return StyleObjectInfo.decode(readValue(buffer)!);
      case 162:
        return StyleProjection.decode(readValue(buffer)!);
      case 163:
        return StylePropertyValue.decode(readValue(buffer)!);
      case 164:
        return TileCacheBudgetInMegabytes.decode(readValue(buffer)!);
      case 165:
        return TileCacheBudgetInTiles.decode(readValue(buffer)!);
      case 166:
        return TransitionOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Collection of [Spherical Mercator](http://docs.openlayers.org/library/spherical_mercator.html) projection methods.
class Projection {
  /// Constructor for [Projection].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  Projection({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _ProjectionCodec();

  /// Calculate distance spanned by one pixel at the specified latitude
  /// and zoom level.
  ///
  /// @param latitude The latitude for which to return the value.
  /// @param zoom The zoom level.
  ///
  /// @return Returns the distance measured in meters.
  Future<double> getMetersPerPixelAtLatitude(
      double arg_latitude, double arg_zoom) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Projection.getMetersPerPixelAtLatitude',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_latitude, arg_zoom]) as List<Object?>?;
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
      return (replyList[0] as double?)!;
    }
  }

  /// Calculate Spherical Mercator ProjectedMeters coordinates.
  ///
  /// @param coordinate A longitude-latitude pair for which to calculate
  /// `projected meters` coordinates.
  ///
  /// @return Returns Spherical Mercator ProjectedMeters coordinates.
  Future<ProjectedMeters> projectedMetersForCoordinate(
      Map<String?, Object?> arg_coordinate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Projection.projectedMetersForCoordinate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinate]) as List<Object?>?;
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
      return (replyList[0] as ProjectedMeters?)!;
    }
  }

  /// Calculate a longitude-latitude pair for a Spherical Mercator projected
  /// meters.
  ///
  /// @param projectedMeters Spherical Mercator ProjectedMeters coordinates for
  /// which to calculate a longitude-latitude pair.
  ///
  /// @return Returns a longitude-latitude pair.
  Future<Map<String?, Object?>> coordinateForProjectedMeters(
      ProjectedMeters arg_projectedMeters) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Projection.coordinateForProjectedMeters',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_projectedMeters]) as List<Object?>?;
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
      return (replyList[0] as Map<Object?, Object?>?)!.cast<String?, Object?>();
    }
  }

  /// Calculate a point on the map in Mercator Projection for a given
  /// coordinate at the specified zoom scale.
  ///
  /// @param coordinate The longitude-latitude pair for which to return the value.
  /// @param zoomScale The current zoom factor (2 ^ Zoom level) applied on the map, is used to
  /// calculate the world size as tileSize * zoomScale (i.e., 512 * 2 ^ Zoom level)
  /// where tileSize is the width of a tile in pixels.
  ///
  /// @return Returns a point on the map in Mercator projection.
  Future<MercatorCoordinate> project(
      Map<String?, Object?> arg_coordinate, double arg_zoomScale) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Projection.project', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_coordinate, arg_zoomScale]) as List<Object?>?;
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
      return (replyList[0] as MercatorCoordinate?)!;
    }
  }

  /// Calculate a coordinate for a given point on the map in Mercator Projection.
  ///
  /// @param coordinate Point on the map in Mercator projection.
  /// @param zoomScale The current zoom factor applied on the map, is used to
  /// calculate the world size as tileSize * zoomScale (i.e., 512 * 2 ^ Zoom level)
  /// where tileSize is the width of a tile in pixels.
  ///
  /// @return Returns a coordinate.
  Future<Map<String?, Object?>> unproject(
      MercatorCoordinate arg_coordinate, double arg_zoomScale) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Projection.unproject', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_coordinate, arg_zoomScale]) as List<Object?>?;
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
      return (replyList[0] as Map<Object?, Object?>?)!.cast<String?, Object?>();
    }
  }
}

class _MapboxOptions {
  /// Constructor for [_MapboxOptions].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  _MapboxOptions({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  Future<String> getAccessToken() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxOptions.getAccessToken',
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
      return (replyList[0] as String?)!;
    }
  }

  Future<void> setAccessToken(String arg_token) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxOptions.setAccessToken',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_token]) as List<Object?>?;
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

class _MapboxMapsOptions {
  /// Constructor for [_MapboxMapsOptions].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  _MapboxMapsOptions({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  Future<String> getBaseUrl() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.getBaseUrl',
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
      return (replyList[0] as String?)!;
    }
  }

  Future<void> setBaseUrl(String arg_url) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.setBaseUrl',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_url]) as List<Object?>?;
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

  Future<String> getDataPath() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.getDataPath',
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
      return (replyList[0] as String?)!;
    }
  }

  Future<void> setDataPath(String arg_path) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.setDataPath',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_path]) as List<Object?>?;
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

  Future<String> getAssetPath() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.getAssetPath',
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
      return (replyList[0] as String?)!;
    }
  }

  Future<void> setAssetPath(String arg_path) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.setAssetPath',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_path]) as List<Object?>?;
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

  Future<TileStoreUsageMode> getTileStoreUsageMode() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.getTileStoreUsageMode',
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
      return TileStoreUsageMode.values[replyList[0]! as int];
    }
  }

  Future<void> setTileStoreUsageMode(TileStoreUsageMode arg_mode) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter._MapboxMapsOptions.setTileStoreUsageMode',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_mode.index]) as List<Object?>?;
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

/// Settings class provides non-persistent, in-process key-value storage.
class Settings {
  /// Constructor for [Settings].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  Settings({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  /// Sets setting value for a specified key.
  ///
  /// @param key A name of the key.
  /// @param value The `value` for the key.
  Future<void> set(String arg_key, String arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Settings.set', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_key, arg_value]) as List<Object?>?;
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

  /// Return value for a key.
  ///
  /// @param key A name of the key.
  ///
  /// @return `value` if a key exists in settings otherwise a `null value` will be returned.
  Future<String> get(String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Settings.get', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_key]) as List<Object?>?;
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
      return (replyList[0] as String?)!;
    }
  }
}

class _MapSnapshotCodec extends StandardMessageCodec {
  const _MapSnapshotCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AmbientLight) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is CameraBounds) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is CameraBoundsOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CameraOptions) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is CameraState) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CanonicalTileID) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBounds) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBoundsZoom) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is DirectionalLight) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FeatureExtensionValue) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is FlatLight) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is GlyphsRasterizationOptions) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is ImageContent) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is ImageStretches) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is LayerPosition) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is MapDebugOptions) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is MapOptions) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else if (value is MbxImage) {
      buffer.putUint8(147);
      writeValue(buffer, value.encode());
    } else if (value is MercatorCoordinate) {
      buffer.putUint8(148);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(149);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(150);
      writeValue(buffer, value.encode());
    } else if (value is ProjectedMeters) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is QueriedFeature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is QueriedRenderedFeature) {
      buffer.putUint8(153);
      writeValue(buffer, value.encode());
    } else if (value is QueriedSourceFeature) {
      buffer.putUint8(154);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryGeometry) {
      buffer.putUint8(155);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryOptions) {
      buffer.putUint8(156);
      writeValue(buffer, value.encode());
    } else if (value is ScreenBox) {
      buffer.putUint8(157);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(158);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(159);
      writeValue(buffer, value.encode());
    } else if (value is SourceQueryOptions) {
      buffer.putUint8(160);
      writeValue(buffer, value.encode());
    } else if (value is StyleObjectInfo) {
      buffer.putUint8(161);
      writeValue(buffer, value.encode());
    } else if (value is StyleProjection) {
      buffer.putUint8(162);
      writeValue(buffer, value.encode());
    } else if (value is StylePropertyValue) {
      buffer.putUint8(163);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInMegabytes) {
      buffer.putUint8(164);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInTiles) {
      buffer.putUint8(165);
      writeValue(buffer, value.encode());
    } else if (value is TransitionOptions) {
      buffer.putUint8(166);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AmbientLight.decode(readValue(buffer)!);
      case 129:
        return CameraBounds.decode(readValue(buffer)!);
      case 130:
        return CameraBoundsOptions.decode(readValue(buffer)!);
      case 131:
        return CameraOptions.decode(readValue(buffer)!);
      case 132:
        return CameraState.decode(readValue(buffer)!);
      case 133:
        return CanonicalTileID.decode(readValue(buffer)!);
      case 134:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 135:
        return CoordinateBoundsZoom.decode(readValue(buffer)!);
      case 136:
        return DirectionalLight.decode(readValue(buffer)!);
      case 137:
        return FeatureExtensionValue.decode(readValue(buffer)!);
      case 138:
        return FlatLight.decode(readValue(buffer)!);
      case 139:
        return GlyphsRasterizationOptions.decode(readValue(buffer)!);
      case 140:
        return ImageContent.decode(readValue(buffer)!);
      case 141:
        return ImageStretches.decode(readValue(buffer)!);
      case 142:
        return LayerPosition.decode(readValue(buffer)!);
      case 143:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 144:
        return MapDebugOptions.decode(readValue(buffer)!);
      case 145:
        return MapOptions.decode(readValue(buffer)!);
      case 146:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 147:
        return MbxImage.decode(readValue(buffer)!);
      case 148:
        return MercatorCoordinate.decode(readValue(buffer)!);
      case 149:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 150:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      case 151:
        return ProjectedMeters.decode(readValue(buffer)!);
      case 152:
        return QueriedFeature.decode(readValue(buffer)!);
      case 153:
        return QueriedRenderedFeature.decode(readValue(buffer)!);
      case 154:
        return QueriedSourceFeature.decode(readValue(buffer)!);
      case 155:
        return RenderedQueryGeometry.decode(readValue(buffer)!);
      case 156:
        return RenderedQueryOptions.decode(readValue(buffer)!);
      case 157:
        return ScreenBox.decode(readValue(buffer)!);
      case 158:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 159:
        return Size.decode(readValue(buffer)!);
      case 160:
        return SourceQueryOptions.decode(readValue(buffer)!);
      case 161:
        return StyleObjectInfo.decode(readValue(buffer)!);
      case 162:
        return StyleProjection.decode(readValue(buffer)!);
      case 163:
        return StylePropertyValue.decode(readValue(buffer)!);
      case 164:
        return TileCacheBudgetInMegabytes.decode(readValue(buffer)!);
      case 165:
        return TileCacheBudgetInTiles.decode(readValue(buffer)!);
      case 166:
        return TransitionOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// An image snapshot of a map rendered by `map snapshotter`.
class MapSnapshot {
  /// Constructor for [MapSnapshot].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MapSnapshot({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _MapSnapshotCodec();

  /// Calculate screen coordinate on the snapshot from geographical `coordinate`.
  ///
  /// @param coordinate A geographical `coordinate`.
  /// @return A `screen coordinate` measured in `logical pixels` on the snapshot for geographical `coordinate`.
  Future<ScreenCoordinate> screenCoordinate(
      Map<String?, Object?> arg_coordinate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshot.screenCoordinate',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinate]) as List<Object?>?;
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
      return (replyList[0] as ScreenCoordinate?)!;
    }
  }

  /// Calculate geographical coordinates from a point on the snapshot.
  ///
  /// @param screenCoordinate A `screen coordinate` on the snapshot in `logical pixels`.
  /// @return A geographical `coordinate` for a `screen coordinate` on the snapshot.
  Future<Map<String?, Object?>> coordinate(
      ScreenCoordinate arg_screenCoordinate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshot.coordinate', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_screenCoordinate]) as List<Object?>?;
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
      return (replyList[0] as Map<Object?, Object?>?)!.cast<String?, Object?>();
    }
  }

  /// Get list of attributions for the sources in this snapshot.
  ///
  /// @return A list of attributions for the sources in this snapshot.
  Future<List<String?>> attributions() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshot.attributions',
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
      return (replyList[0] as List<Object?>?)!.cast<String?>();
    }
  }

  /// Get the rendered snapshot `image`.
  ///
  /// @return A rendered snapshot `image`.
  Future<MbxImage> image() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshot.image', codec,
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
      return (replyList[0] as MbxImage?)!;
    }
  }
}

class _MapSnapshotterCodec extends StandardMessageCodec {
  const _MapSnapshotterCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AmbientLight) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is CameraBounds) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is CameraBoundsOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CameraOptions) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is CameraState) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CanonicalTileID) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBounds) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBoundsZoom) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is DirectionalLight) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FeatureExtensionValue) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is FlatLight) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is GlyphsRasterizationOptions) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is ImageContent) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is ImageStretches) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is LayerPosition) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is MapDebugOptions) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is MapOptions) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else if (value is MbxImage) {
      buffer.putUint8(147);
      writeValue(buffer, value.encode());
    } else if (value is MercatorCoordinate) {
      buffer.putUint8(148);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(149);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(150);
      writeValue(buffer, value.encode());
    } else if (value is ProjectedMeters) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is QueriedFeature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is QueriedRenderedFeature) {
      buffer.putUint8(153);
      writeValue(buffer, value.encode());
    } else if (value is QueriedSourceFeature) {
      buffer.putUint8(154);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryGeometry) {
      buffer.putUint8(155);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryOptions) {
      buffer.putUint8(156);
      writeValue(buffer, value.encode());
    } else if (value is ScreenBox) {
      buffer.putUint8(157);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(158);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(159);
      writeValue(buffer, value.encode());
    } else if (value is SourceQueryOptions) {
      buffer.putUint8(160);
      writeValue(buffer, value.encode());
    } else if (value is StyleObjectInfo) {
      buffer.putUint8(161);
      writeValue(buffer, value.encode());
    } else if (value is StyleProjection) {
      buffer.putUint8(162);
      writeValue(buffer, value.encode());
    } else if (value is StylePropertyValue) {
      buffer.putUint8(163);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInMegabytes) {
      buffer.putUint8(164);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInTiles) {
      buffer.putUint8(165);
      writeValue(buffer, value.encode());
    } else if (value is TransitionOptions) {
      buffer.putUint8(166);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AmbientLight.decode(readValue(buffer)!);
      case 129:
        return CameraBounds.decode(readValue(buffer)!);
      case 130:
        return CameraBoundsOptions.decode(readValue(buffer)!);
      case 131:
        return CameraOptions.decode(readValue(buffer)!);
      case 132:
        return CameraState.decode(readValue(buffer)!);
      case 133:
        return CanonicalTileID.decode(readValue(buffer)!);
      case 134:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 135:
        return CoordinateBoundsZoom.decode(readValue(buffer)!);
      case 136:
        return DirectionalLight.decode(readValue(buffer)!);
      case 137:
        return FeatureExtensionValue.decode(readValue(buffer)!);
      case 138:
        return FlatLight.decode(readValue(buffer)!);
      case 139:
        return GlyphsRasterizationOptions.decode(readValue(buffer)!);
      case 140:
        return ImageContent.decode(readValue(buffer)!);
      case 141:
        return ImageStretches.decode(readValue(buffer)!);
      case 142:
        return LayerPosition.decode(readValue(buffer)!);
      case 143:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 144:
        return MapDebugOptions.decode(readValue(buffer)!);
      case 145:
        return MapOptions.decode(readValue(buffer)!);
      case 146:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 147:
        return MbxImage.decode(readValue(buffer)!);
      case 148:
        return MercatorCoordinate.decode(readValue(buffer)!);
      case 149:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 150:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      case 151:
        return ProjectedMeters.decode(readValue(buffer)!);
      case 152:
        return QueriedFeature.decode(readValue(buffer)!);
      case 153:
        return QueriedRenderedFeature.decode(readValue(buffer)!);
      case 154:
        return QueriedSourceFeature.decode(readValue(buffer)!);
      case 155:
        return RenderedQueryGeometry.decode(readValue(buffer)!);
      case 156:
        return RenderedQueryOptions.decode(readValue(buffer)!);
      case 157:
        return ScreenBox.decode(readValue(buffer)!);
      case 158:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 159:
        return Size.decode(readValue(buffer)!);
      case 160:
        return SourceQueryOptions.decode(readValue(buffer)!);
      case 161:
        return StyleObjectInfo.decode(readValue(buffer)!);
      case 162:
        return StyleProjection.decode(readValue(buffer)!);
      case 163:
        return StylePropertyValue.decode(readValue(buffer)!);
      case 164:
        return TileCacheBudgetInMegabytes.decode(readValue(buffer)!);
      case 165:
        return TileCacheBudgetInTiles.decode(readValue(buffer)!);
      case 166:
        return TransitionOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// MapSnapshotter exposes functionality to capture static map images.
class MapSnapshotter {
  /// Constructor for [MapSnapshotter].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MapSnapshotter({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _MapSnapshotterCodec();

  /// Sets the `size` of the snapshot
  ///
  /// @param size The new `size` of the snapshot in `logical pixels`.
  Future<void> setSize(Size arg_size) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshotter.setSize', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_size]) as List<Object?>?;
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

  /// Gets the size of the snapshot
  ///
  /// @return Snapshot `size` in `logical pixels`.
  Future<Size> getSize() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshotter.getSize', codec,
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
      return (replyList[0] as Size?)!;
    }
  }

  /// Returns `true` if the snapshotter is in the tile mode.
  ///
  /// @return `true` if the snapshotter is in the tile mode, `false` otherwise.
  Future<bool> isInTileMode() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshotter.isInTileMode',
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Sets the snapshotter to the tile mode.
  ///
  /// In the tile mode, the snapshotter fetches the still image of a single tile.
  ///
  /// @param set A `boolean` value representing if the snapshotter is in the tile mode.
  Future<void> setTileMode(bool arg_set) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshotter.setTileMode',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_set]) as List<Object?>?;
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

  /// Cancel the current snapshot operation.
  ///
  /// Cancel the current snapshot operation, if any. The callback passed to the start method
  /// is called with error parameter set.
  Future<void> cancel() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshotter.cancel', codec,
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
    } else {
      return;
    }
  }

  /// Get elevation for the given coordinate.
  /// Note: Elevation is only available for the visible region on the screen.
  ///
  /// @param coordinate defined as longitude-latitude pair.
  ///
  /// @return Elevation (in meters) multiplied by current terrain exaggeration, or empty if elevation for the coordinate is not available.
  Future<double?> getElevation(Map<String?, Object?> arg_coordinate) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.MapSnapshotter.getElevation',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_coordinate]) as List<Object?>?;
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
      return (replyList[0] as double?);
    }
  }
}

class _StyleManagerCodec extends StandardMessageCodec {
  const _StyleManagerCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AmbientLight) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is CameraBounds) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is CameraBoundsOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is CameraOptions) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is CameraState) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else if (value is CanonicalTileID) {
      buffer.putUint8(133);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBounds) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    } else if (value is CoordinateBoundsZoom) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else if (value is DirectionalLight) {
      buffer.putUint8(136);
      writeValue(buffer, value.encode());
    } else if (value is FeatureExtensionValue) {
      buffer.putUint8(137);
      writeValue(buffer, value.encode());
    } else if (value is FlatLight) {
      buffer.putUint8(138);
      writeValue(buffer, value.encode());
    } else if (value is GlyphsRasterizationOptions) {
      buffer.putUint8(139);
      writeValue(buffer, value.encode());
    } else if (value is ImageContent) {
      buffer.putUint8(140);
      writeValue(buffer, value.encode());
    } else if (value is ImageStretches) {
      buffer.putUint8(141);
      writeValue(buffer, value.encode());
    } else if (value is LayerPosition) {
      buffer.putUint8(142);
      writeValue(buffer, value.encode());
    } else if (value is MapAnimationOptions) {
      buffer.putUint8(143);
      writeValue(buffer, value.encode());
    } else if (value is MapDebugOptions) {
      buffer.putUint8(144);
      writeValue(buffer, value.encode());
    } else if (value is MapOptions) {
      buffer.putUint8(145);
      writeValue(buffer, value.encode());
    } else if (value is MbxEdgeInsets) {
      buffer.putUint8(146);
      writeValue(buffer, value.encode());
    } else if (value is MbxImage) {
      buffer.putUint8(147);
      writeValue(buffer, value.encode());
    } else if (value is MercatorCoordinate) {
      buffer.putUint8(148);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionGeometryDefinition) {
      buffer.putUint8(149);
      writeValue(buffer, value.encode());
    } else if (value is OfflineRegionTilePyramidDefinition) {
      buffer.putUint8(150);
      writeValue(buffer, value.encode());
    } else if (value is ProjectedMeters) {
      buffer.putUint8(151);
      writeValue(buffer, value.encode());
    } else if (value is QueriedFeature) {
      buffer.putUint8(152);
      writeValue(buffer, value.encode());
    } else if (value is QueriedRenderedFeature) {
      buffer.putUint8(153);
      writeValue(buffer, value.encode());
    } else if (value is QueriedSourceFeature) {
      buffer.putUint8(154);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryGeometry) {
      buffer.putUint8(155);
      writeValue(buffer, value.encode());
    } else if (value is RenderedQueryOptions) {
      buffer.putUint8(156);
      writeValue(buffer, value.encode());
    } else if (value is ScreenBox) {
      buffer.putUint8(157);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(158);
      writeValue(buffer, value.encode());
    } else if (value is Size) {
      buffer.putUint8(159);
      writeValue(buffer, value.encode());
    } else if (value is SourceQueryOptions) {
      buffer.putUint8(160);
      writeValue(buffer, value.encode());
    } else if (value is StyleObjectInfo) {
      buffer.putUint8(161);
      writeValue(buffer, value.encode());
    } else if (value is StyleProjection) {
      buffer.putUint8(162);
      writeValue(buffer, value.encode());
    } else if (value is StylePropertyValue) {
      buffer.putUint8(163);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInMegabytes) {
      buffer.putUint8(164);
      writeValue(buffer, value.encode());
    } else if (value is TileCacheBudgetInTiles) {
      buffer.putUint8(165);
      writeValue(buffer, value.encode());
    } else if (value is TransitionOptions) {
      buffer.putUint8(166);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AmbientLight.decode(readValue(buffer)!);
      case 129:
        return CameraBounds.decode(readValue(buffer)!);
      case 130:
        return CameraBoundsOptions.decode(readValue(buffer)!);
      case 131:
        return CameraOptions.decode(readValue(buffer)!);
      case 132:
        return CameraState.decode(readValue(buffer)!);
      case 133:
        return CanonicalTileID.decode(readValue(buffer)!);
      case 134:
        return CoordinateBounds.decode(readValue(buffer)!);
      case 135:
        return CoordinateBoundsZoom.decode(readValue(buffer)!);
      case 136:
        return DirectionalLight.decode(readValue(buffer)!);
      case 137:
        return FeatureExtensionValue.decode(readValue(buffer)!);
      case 138:
        return FlatLight.decode(readValue(buffer)!);
      case 139:
        return GlyphsRasterizationOptions.decode(readValue(buffer)!);
      case 140:
        return ImageContent.decode(readValue(buffer)!);
      case 141:
        return ImageStretches.decode(readValue(buffer)!);
      case 142:
        return LayerPosition.decode(readValue(buffer)!);
      case 143:
        return MapAnimationOptions.decode(readValue(buffer)!);
      case 144:
        return MapDebugOptions.decode(readValue(buffer)!);
      case 145:
        return MapOptions.decode(readValue(buffer)!);
      case 146:
        return MbxEdgeInsets.decode(readValue(buffer)!);
      case 147:
        return MbxImage.decode(readValue(buffer)!);
      case 148:
        return MercatorCoordinate.decode(readValue(buffer)!);
      case 149:
        return OfflineRegionGeometryDefinition.decode(readValue(buffer)!);
      case 150:
        return OfflineRegionTilePyramidDefinition.decode(readValue(buffer)!);
      case 151:
        return ProjectedMeters.decode(readValue(buffer)!);
      case 152:
        return QueriedFeature.decode(readValue(buffer)!);
      case 153:
        return QueriedRenderedFeature.decode(readValue(buffer)!);
      case 154:
        return QueriedSourceFeature.decode(readValue(buffer)!);
      case 155:
        return RenderedQueryGeometry.decode(readValue(buffer)!);
      case 156:
        return RenderedQueryOptions.decode(readValue(buffer)!);
      case 157:
        return ScreenBox.decode(readValue(buffer)!);
      case 158:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 159:
        return Size.decode(readValue(buffer)!);
      case 160:
        return SourceQueryOptions.decode(readValue(buffer)!);
      case 161:
        return StyleObjectInfo.decode(readValue(buffer)!);
      case 162:
        return StyleProjection.decode(readValue(buffer)!);
      case 163:
        return StylePropertyValue.decode(readValue(buffer)!);
      case 164:
        return TileCacheBudgetInMegabytes.decode(readValue(buffer)!);
      case 165:
        return TileCacheBudgetInTiles.decode(readValue(buffer)!);
      case 166:
        return TransitionOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Interface for managing style of the `map`.
class StyleManager {
  /// Constructor for [StyleManager].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  StyleManager({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _StyleManagerCodec();

  /// Get the URI of the current style in use.
  ///
  /// @return A string containing a style URI.
  Future<String> getStyleURI() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleURI',
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
      return (replyList[0] as String?)!;
    }
  }

  /// Load style from provided URI.
  ///
  /// This is an asynchronous call. To check the result of this operation the user must register an observer observing
  /// `MapLoaded` or `MapLoadingError` events. In case of successful style load, `StyleLoaded` event will be also emitted.
  ///
  /// @param uri URI where the style should be loaded from.
  Future<void> setStyleURI(String arg_uri) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleURI',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_uri]) as List<Object?>?;
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

  /// Get the JSON serialization string of the current style in use.
  ///
  /// @return A JSON string containing a serialized style.
  Future<String> getStyleJSON() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleJSON',
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
      return (replyList[0] as String?)!;
    }
  }

  /// Load the style from a provided JSON string.
  ///
  /// @param json A JSON string containing a serialized style.
  Future<void> setStyleJSON(String arg_json) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleJSON',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_json]) as List<Object?>?;
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

  /// Returns the map style's default camera, if any, or a default camera otherwise.
  /// The map style's default camera is defined as follows:
  /// - [center](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-center)
  /// - [zoom](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-zoom)
  /// - [bearing](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-bearing)
  /// - [pitch](https://docs.mapbox.com/mapbox-gl-js/style-spec/#root-pitch)
  ///
  /// The style default camera is re-evaluated when a new style is loaded.
  ///
  /// @return The default `camera options` of the current style in use.
  Future<CameraOptions> getStyleDefaultCamera() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleDefaultCamera',
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
      return (replyList[0] as CameraOptions?)!;
    }
  }

  /// Returns the map style's transition options. By default, the style parser will attempt
  /// to read the style default transition options, if any, fallbacking to an immediate transition
  /// otherwise. Transition options can be overriden via `setStyleTransition`, but the options are
  /// reset once a new style has been loaded.
  ///
  /// The style transition is re-evaluated when a new style is loaded.
  ///
  /// @return The `transition options` of the current style in use.
  Future<TransitionOptions> getStyleTransition() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleTransition',
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
      return (replyList[0] as TransitionOptions?)!;
    }
  }

  /// Returns the list containing information about existing style import objects.
  Future<List<StyleObjectInfo?>> getStyleImports() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleImports',
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
      return (replyList[0] as List<Object?>?)!.cast<StyleObjectInfo?>();
    }
  }

  /// Removes an existing style import.
  ///
  /// @param importId Identifier of the style import to remove.
  Future<void> removeStyleImport(String arg_importId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.removeStyleImport',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_importId]) as List<Object?>?;
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

  /// Gets the style import schema.
  ///
  /// @param importId Identifier of the style import.
  ///
  /// Returns the style import schema, containing the default configurations for the style import.
  Future<Object> getStyleImportSchema(String arg_importId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleImportSchema',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_importId]) as List<Object?>?;
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
      return replyList[0]!;
    }
  }

  /// Gets style import config.
  ///
  /// @param importId Identifier of the style import.
  ///
  /// Returns the style import configuration or a string describing an error if the operation was not successful.
  Future<Map<String?, StylePropertyValue?>> getStyleImportConfigProperties(
      String arg_importId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleImportConfigProperties',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_importId]) as List<Object?>?;
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
      return (replyList[0] as Map<Object?, Object?>?)!
          .cast<String?, StylePropertyValue?>();
    }
  }

  /// Gets the value of style import config.
  ///
  /// @param importId Identifier of the style import.
  /// @param config The style import config name.
  ///
  /// Returns the style import configuration or a string describing an error if the operation was not successful.
  Future<StylePropertyValue> getStyleImportConfigProperty(
      String arg_importId, String arg_config) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleImportConfigProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_importId, arg_config]) as List<Object?>?;
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
      return (replyList[0] as StylePropertyValue?)!;
    }
  }

  /// Sets style import config.
  /// This method can be used to perform batch update for a style import configurations.
  ///
  /// @param importId Identifier of the style import.
  /// @param configs A map of style import configurations.
  Future<void> setStyleImportConfigProperties(
      String arg_importId, Map<String?, Object?> arg_configs) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleImportConfigProperties',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_importId, arg_configs]) as List<Object?>?;
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

  /// Sets a value to a style import config.
  ///
  /// @param importId Identifier of the style import.
  /// @param config The style import config name.
  /// @param value The style import config value.
  Future<void> setStyleImportConfigProperty(
      String arg_importId, String arg_config, Object arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleImportConfigProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_importId, arg_config, arg_value]) as List<Object?>?;
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

  /// Overrides the map style's transition options with user-provided options.
  ///
  /// The style transition is re-evaluated when a new style is loaded.
  ///
  /// @param transitionOptions The `transition options`.
  Future<void> setStyleTransition(
      TransitionOptions arg_transitionOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleTransition',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_transitionOptions]) as List<Object?>?;
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

  /// Adds a new [style layer](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layers).
  ///
  /// Runtime style layers are valid until they are either removed or a new style is loaded.
  ///
  /// @param properties A map of style layer properties.
  /// @param layerPosition If not empty, the new layer will be positioned according to `layer position` parameters.
  ///
  /// @return A string describing an error if the operation was not successful, or empty otherwise.
  Future<void> addStyleLayer(
      String arg_properties, LayerPosition? arg_layerPosition) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.addStyleLayer',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_properties, arg_layerPosition]) as List<Object?>?;
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

  /// Adds a new [style layer](https://docs.mapbox.com/mapbox-gl-js/style-spec/#layers).
  ///
  /// Whenever a new style is being parsed and currently used style has persistent layers,
  /// an engine will try to do following:
  ///   - keep the persistent layer at its relative position
  ///   - keep the source used by a persistent layer
  ///   - keep images added through `addStyleImage` method
  ///
  /// In cases when a new style has the same layer, source or image resource, style's resources would be
  /// used instead and `MapLoadingError` event will be emitted.
  ///
  /// @param properties A map of style layer properties.
  /// @param layerPosition If not empty, the new layer will be positioned according to `layer position` parameters.
  ///
  /// @return A string describing an error if the operation was not successful, or empty otherwise.
  Future<void> addPersistentStyleLayer(
      String arg_properties, LayerPosition? arg_layerPosition) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.addPersistentStyleLayer',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_properties, arg_layerPosition]) as List<Object?>?;
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

  /// Checks if a style layer is persistent.
  ///
  /// @param layerId A style layer identifier.
  /// @return A string describing an error if the operation was not successful, boolean representing state otherwise.
  Future<bool> isStyleLayerPersistent(String arg_layerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.isStyleLayerPersistent',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_layerId]) as List<Object?>?;
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Removes an existing style layer.
  ///
  /// @param layerId An identifier of the style layer to remove.
  ///
  /// @return A string describing an error if the operation was not successful, or empty otherwise.
  Future<void> removeStyleLayer(String arg_layerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.removeStyleLayer',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_layerId]) as List<Object?>?;
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

  /// Moves an existing style layer
  ///
  /// @param layerId Identifier of the style layer to move.
  /// @param layerPosition The layer will be positioned according to the LayerPosition parameters. If an empty LayerPosition
  ///                      is provided then the layer is moved to the top of the layerstack.
  ///
  /// @return A string describing an error if the operation was not successful, or empty otherwise.
  Future<void> moveStyleLayer(
      String arg_layerId, LayerPosition? arg_layerPosition) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.moveStyleLayer',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_layerId, arg_layerPosition]) as List<Object?>?;
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

  /// Checks whether a given style layer exists.
  ///
  /// @param layerId Style layer identifier.
  ///
  /// @return A `true` value if the given style layer exists, `false` otherwise.
  Future<bool> styleLayerExists(String arg_layerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.styleLayerExists',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_layerId]) as List<Object?>?;
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Returns the existing style layers.
  ///
  /// @return The list containing the information about existing style layer objects.
  Future<List<StyleObjectInfo?>> getStyleLayers() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleLayers',
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
      return (replyList[0] as List<Object?>?)!.cast<StyleObjectInfo?>();
    }
  }

  /// Gets the value of style layer property.
  ///
  /// @param layerId A style layer identifier.
  /// @param property The style layer property name.
  /// @return The `style property value`.
  Future<StylePropertyValue> getStyleLayerProperty(
      String arg_layerId, String arg_property) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleLayerProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_layerId, arg_property]) as List<Object?>?;
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
      return (replyList[0] as StylePropertyValue?)!;
    }
  }

  /// Sets a value to a style layer property.
  ///
  /// @param layerId A style layer identifier.
  /// @param property The style layer property name.
  /// @param value The style layer property value.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleLayerProperty(
      String arg_layerId, String arg_property, Object arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleLayerProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_layerId, arg_property, arg_value])
            as List<Object?>?;
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

  /// Gets style layer properties.
  ///
  /// @return The style layer properties or a string describing an error if the operation was not successful.
  Future<String> getStyleLayerProperties(String arg_layerId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleLayerProperties',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_layerId]) as List<Object?>?;
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
      return (replyList[0] as String?)!;
    }
  }

  /// Sets style layer properties.
  /// This method can be used to perform batch update for a style layer properties. The structure of a
  /// provided `properties` value must conform to a format for a corresponding [layer type](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/).
  /// Modification of a layer [id](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#id) and/or a [layer type] (https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#type) is not allowed.
  ///
  /// @param layerId A style layer identifier.
  /// @param properties A map of style layer properties.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleLayerProperties(
      String arg_layerId, String arg_properties) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleLayerProperties',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_layerId, arg_properties]) as List<Object?>?;
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

  /// Adds a new [style source](https://docs.mapbox.com/mapbox-gl-js/style-spec/#sources).
  ///
  /// @param sourceId An identifier for the style source.
  /// @param properties A map of style source properties.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> addStyleSource(
      String arg_sourceId, String arg_properties) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.addStyleSource',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_properties]) as List<Object?>?;
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

  /// Gets the value of style source property.
  ///
  /// @param sourceId A style source identifier.
  /// @param property The style source property name.
  /// @return The value of a `property` in the source with a `sourceId`.
  Future<StylePropertyValue> getStyleSourceProperty(
      String arg_sourceId, String arg_property) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleSourceProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_property]) as List<Object?>?;
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
      return (replyList[0] as StylePropertyValue?)!;
    }
  }

  /// Sets a value to a style source property.
  /// Note: When setting the `data` property of a `geojson` source, this method never returns an error.
  /// In case of success, a `map-loaded` event will be propagated. In case of errors, a `map-loading-error` event will be propagated instead.
  ///
  ///
  /// @param sourceId A style source identifier.
  /// @param property The style source property name.
  /// @param value The style source property value.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleSourceProperty(
      String arg_sourceId, String arg_property, Object arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleSourceProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_sourceId, arg_property, arg_value])
            as List<Object?>?;
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

  /// Gets style source properties.
  ///
  /// @param sourceId A style source identifier.
  ///
  /// @return The style source properties or a string describing an error if the operation was not successful.
  Future<String> getStyleSourceProperties(String arg_sourceId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleSourceProperties',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_sourceId]) as List<Object?>?;
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
      return (replyList[0] as String?)!;
    }
  }

  /// Sets style source properties.
  ///
  /// This method can be used to perform batch update for a style source properties. The structure of a
  /// provided `properties` value must conform to a format for a corresponding [source type](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/).
  /// Modification of a source [type](https://docs.mapbox.com/mapbox-gl-js/style-spec/sources/#type) is not allowed.
  ///
  /// @param sourceId A style source identifier.
  /// @param properties A map of Style source properties.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleSourceProperties(
      String arg_sourceId, String arg_properties) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleSourceProperties',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_properties]) as List<Object?>?;
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

  /// Updates the image of an [image style source](https://docs.mapbox.com/mapbox-gl-js/style-spec/#sources-image).
  ///
  /// @param sourceId A style source identifier.
  /// @param image An `image`.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> updateStyleImageSourceImage(
      String arg_sourceId, MbxImage arg_image) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.updateStyleImageSourceImage',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_image]) as List<Object?>?;
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

  /// Removes an existing style source.
  ///
  /// @param sourceId An identifier of the style source to remove.
  Future<void> removeStyleSource(String arg_sourceId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.removeStyleSource',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_sourceId]) as List<Object?>?;
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

  /// Checks whether a given style source exists.
  ///
  /// @param sourceId A style source identifier.
  ///
  /// @return `true` if the given source exists, `false` otherwise.
  Future<bool> styleSourceExists(String arg_sourceId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.styleSourceExists',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_sourceId]) as List<Object?>?;
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Returns the existing style sources.
  ///
  /// @return The list containing the information about existing style source objects.
  Future<List<StyleObjectInfo?>> getStyleSources() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleSources',
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
      return (replyList[0] as List<Object?>?)!.cast<StyleObjectInfo?>();
    }
  }

  /// Returns an ordered list of the current style lights.
  Future<List<StyleObjectInfo?>> getStyleLights() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleLights',
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
      return (replyList[0] as List<Object?>?)!.cast<StyleObjectInfo?>();
    }
  }

  /// Set global directional lightning.
  ///
  /// @param flatLight The flat light source.
  Future<void> setLight(FlatLight arg_flatLight) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setLight', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_flatLight]) as List<Object?>?;
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

  /// Set dynamic lightning.
  ///
  /// @param ambientLight The ambient light source.
  /// @param directionalLight The directional light source.
  Future<void> setLights(AmbientLight arg_ambientLight,
      DirectionalLight arg_directionalLight) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setLights', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_ambientLight, arg_directionalLight])
            as List<Object?>?;
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

  /// Gets the value of a style light property.
  ///
  /// @param property The style light property name.
  /// @param id The unique identifier of the style light in lights list.
  /// @return The style light property value.
  Future<StylePropertyValue> getStyleLightProperty(
      String arg_id, String arg_property) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleLightProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_id, arg_property]) as List<Object?>?;
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
      return (replyList[0] as StylePropertyValue?)!;
    }
  }

  /// Sets a value to the the style light property.
  ///
  /// @param property The style light property name.
  /// @param id The unique identifier of the style light in lights list.
  /// @param value The style light property value.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleLightProperty(
      String arg_id, String arg_property, Object arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleLightProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_id, arg_property, arg_value]) as List<Object?>?;
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

  /// Sets the style global [terrain](https://docs.mapbox.com/mapbox-gl-js/style-spec/#terrain) properties.
  ///
  /// @param properties A map of style terrain properties values, with their names as a key.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleTerrain(String arg_properties) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleTerrain',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_properties]) as List<Object?>?;
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

  /// Gets the value of a style terrain property.
  ///
  /// @param property The style terrain property name.
  /// @return The style terrain property value.
  Future<StylePropertyValue> getStyleTerrainProperty(
      String arg_property) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleTerrainProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_property]) as List<Object?>?;
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
      return (replyList[0] as StylePropertyValue?)!;
    }
  }

  /// Sets a value to the the style terrain property.
  ///
  /// @param property The style terrain property name.
  /// @param value The style terrain property value.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> setStyleTerrainProperty(
      String arg_property, Object arg_value) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setStyleTerrainProperty',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_property, arg_value]) as List<Object?>?;
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

  /// Get an `image` from the style.
  ///
  /// @param imageId The identifier of the `image`.
  ///
  /// @return The `image` for the given `imageId`, or empty if no image is associated with the `imageId`.
  Future<MbxImage?> getStyleImage(String arg_imageId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getStyleImage',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_imageId]) as List<Object?>?;
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
      return (replyList[0] as MbxImage?);
    }
  }

  /// Adds an image to be used in the style. This API can also be used for updating
  /// an image. If the image for a given `imageId` was already added, it gets replaced by the new image.
  ///
  /// The image can be used in [`icon-image`](https://www.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-icon-image),
  /// [`fill-pattern`](https://www.mapbox.com/mapbox-gl-js/style-spec/#paint-fill-fill-pattern),
  /// [`line-pattern`](https://www.mapbox.com/mapbox-gl-js/style-spec/#paint-line-line-pattern) and
  /// [`text-field`](https://www.mapbox.com/mapbox-gl-js/style-spec/#layout-symbol-text-field) properties.
  ///
  /// @param imageId An identifier of the image.
  /// @param scale A scale factor for the image.
  /// @param image A pixel data of the image.
  /// @param sdf An option to treat whether image is SDF(signed distance field) or not.
  /// @param stretchX An array of two-element arrays, consisting of two numbers that represent
  /// the from position and the to position of areas that can be stretched horizontally.
  /// @param stretchY An array of two-element arrays, consisting of two numbers that represent
  /// the from position and the to position of areas that can be stretched vertically.
  /// @param content An array of four numbers, with the first two specifying the left, top
  /// corner, and the last two specifying the right, bottom corner. If present, and if the
  /// icon uses icon-text-fit, the symbol's text will be fit inside the content box.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> addStyleImage(
      String arg_imageId,
      double arg_scale,
      MbxImage arg_image,
      bool arg_sdf,
      List<ImageStretches?> arg_stretchX,
      List<ImageStretches?> arg_stretchY,
      ImageContent? arg_content) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.addStyleImage',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(<Object?>[
      arg_imageId,
      arg_scale,
      arg_image,
      arg_sdf,
      arg_stretchX,
      arg_stretchY,
      arg_content
    ]) as List<Object?>?;
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

  /// Removes an image from the style.
  ///
  /// @param imageId The identifier of the image to remove.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> removeStyleImage(String arg_imageId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.removeStyleImage',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_imageId]) as List<Object?>?;
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

  /// Checks whether an image exists.
  ///
  /// @param imageId The identifier of the image.
  ///
  /// @return True if image exists, false otherwise.
  Future<bool> hasStyleImage(String arg_imageId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.hasStyleImage',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_imageId]) as List<Object?>?;
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Set tile data of a custom geometry.
  ///
  /// @param sourceId A style source identifier.
  /// @param tileId A `canonical tile id` of the tile.
  /// @param featureCollection An array with the features to add.
  /// Invalidate tile for provided custom geometry source.
  ///
  /// @param sourceId A style source identifier,.
  /// @param tileId A `canonical tile id` of the tile.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> invalidateStyleCustomGeometrySourceTile(
      String arg_sourceId, CanonicalTileID arg_tileId) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.invalidateStyleCustomGeometrySourceTile',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_tileId]) as List<Object?>?;
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

  /// Invalidate region for provided custom geometry source.
  ///
  /// @param sourceId A style source identifier
  /// @param bounds A `coordinate bounds` object.
  ///
  /// @return A string describing an error if the operation was not successful, empty otherwise.
  Future<void> invalidateStyleCustomGeometrySourceRegion(
      String arg_sourceId, CoordinateBounds arg_bounds) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.invalidateStyleCustomGeometrySourceRegion',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_sourceId, arg_bounds]) as List<Object?>?;
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

  /// Check if the style is completely loaded.
  ///
  /// Note: The style specified sprite would be marked as loaded even with sprite loading error (An error will be emitted via `MapLoadingError`).
  /// Sprite loading error is not fatal and we don't want it to block the map rendering, thus the function will still return `true` if style and sources are fully loaded.
  ///
  /// @return `true` iff the style JSON contents, the style specified sprite and sources are all loaded, otherwise returns `false`.
  ///
  Future<bool> isStyleLoaded() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.isStyleLoaded',
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Function to get the projection provided by the Style Extension.
  ///
  /// @return Projection that is currently applied to the map
  Future<StyleProjection?> getProjection() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.getProjection',
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
    } else {
      return (replyList[0] as StyleProjection?);
    }
  }

  /// Function to set the projection provided by the Style Extension.
  ///
  /// @param projection The projection to be set.
  Future<void> setProjection(StyleProjection arg_projection) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.setProjection',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_projection]) as List<Object?>?;
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

  /// Function to localize style labels.
  ///
  /// @param locale The locale to apply for localization
  /// @param layerIds The ids of layers that will localize on, default is null which means will localize all the feasible layers.
  Future<void> localizeLabels(
      String arg_locale, List<String?>? arg_layerIds) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.StyleManager.localizeLabels',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_locale, arg_layerIds]) as List<Object?>?;
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

/// Allows to cancel the associated asynchronous operation
///
/// The the associated asynchronous operation is not automatically canceled if this
/// object goes out of scope.
class Cancelable {
  /// Constructor for [Cancelable].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  Cancelable({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  /// Cancels the associated asynchronous operation
  ///
  /// If the associated asynchronous operation has already finished, this call is ignored.
  Future<void> cancel() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.Cancelable.cancel', codec,
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
    } else {
      return;
    }
  }
}

/// Instance that allows connecting or disconnecting the Mapbox stack to the network.
class OfflineSwitch {
  /// Constructor for [OfflineSwitch].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  OfflineSwitch({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();

  /// Connects or disconnects the Mapbox stack. If set to false, current and new HTTP requests will fail
  /// with HttpRequestErrorType#ConnectionError.
  ///
  /// @param connected Set false to disconnect the Mapbox stack
  Future<void> setMapboxStackConnected(bool arg_connected) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineSwitch.setMapboxStackConnected',
        codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_connected]) as List<Object?>?;
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

  /// Provides information if the Mapbox stack is connected or disconnected via OfflineSwitch.
  ///
  /// @return True if the Mapbox stack is disconnected via setMapboxStackConnected(), false otherwise.
  Future<bool> isMapboxStackConnected() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineSwitch.isMapboxStackConnected',
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
      return (replyList[0] as bool?)!;
    }
  }

  /// Releases the OfflineSwitch singleton instance.
  ///
  /// Users can call this method if they want to do manual cleanup of the resources allocated by Mapbox services.
  /// If the user calls getInstance() after reset, a new instance of the OfflineSwitch singleton will be allocated.
  Future<void> reset() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mapbox_maps_flutter.OfflineSwitch.reset', codec,
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
    } else {
      return;
    }
  }
}

/// A bundle that encapsulates tilesets creation for the tile store implementation.
///
/// Tileset descriptors describe the type of data that should be part of the Offline Region, like the routing profile for Navigation and the Tilesets of the Map style.
class TilesetDescriptor {
  /// Constructor for [TilesetDescriptor].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  TilesetDescriptor({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = StandardMessageCodec();
}
