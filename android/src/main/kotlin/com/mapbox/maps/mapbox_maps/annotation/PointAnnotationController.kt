// This file is generated.
package com.mapbox.maps.mapbox_maps.annotation

import android.graphics.BitmapFactory
import com.mapbox.maps.extension.style.layers.properties.generated.*
import com.mapbox.maps.mapbox_maps.toMap
import com.mapbox.maps.mapbox_maps.toPoint
import com.mapbox.maps.pigeons.FLTPointAnnotationMessager
import com.mapbox.maps.plugin.annotation.generated.PointAnnotation
import com.mapbox.maps.plugin.annotation.generated.PointAnnotationManager
import com.mapbox.maps.plugin.annotation.generated.PointAnnotationOptions
import toFLTIconAnchor
import toFLTIconPitchAlignment
import toFLTIconRotationAlignment
import toFLTIconTextFit
import toFLTIconTranslateAnchor
import toFLTSymbolPlacement
import toFLTSymbolZOrder
import toFLTTextAnchor
import toFLTTextJustify
import toFLTTextPitchAlignment
import toFLTTextRotationAlignment
import toFLTTextTransform
import toFLTTextTranslateAnchor
import toIconAnchor
import toIconPitchAlignment
import toIconRotationAlignment
import toIconTextFit
import toIconTranslateAnchor
import toSymbolPlacement
import toSymbolZOrder
import toTextAnchor
import toTextJustify
import toTextPitchAlignment
import toTextRotationAlignment
import toTextTransform
import toTextTranslateAnchor
import java.util.*

class PointAnnotationController(private val delegate: ControllerDelegate) :
  FLTPointAnnotationMessager._PointAnnotationMessager {
  private val annotationMap = mutableMapOf<String, PointAnnotation>()
  private val managerCreateAnnotationMap = mutableMapOf<String, MutableList<String>>()

  override fun create(
    managerId: String,
    annotationOption: FLTPointAnnotationMessager.PointAnnotationOptions,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.PointAnnotation>
  ) {
    try {
      val manager = delegate.getManager(managerId) as PointAnnotationManager
      val annotation = manager.create(annotationOption.toPointAnnotationOptions())
      annotationMap[annotation.id] = annotation
      if (managerCreateAnnotationMap[managerId].isNullOrEmpty()) {
        managerCreateAnnotationMap[managerId] = mutableListOf(annotation.id)
      } else {
        managerCreateAnnotationMap[managerId]!!.add(annotation.id)
      }
      result.success(annotation.toFLTPointAnnotation())
    } catch (e: Exception) {
      result.error(e)
    }
  }

  override fun createMulti(
    managerId: String,
    annotationOptions: MutableList<FLTPointAnnotationMessager.PointAnnotationOptions>,
    result: FLTPointAnnotationMessager.Result<MutableList<FLTPointAnnotationMessager.PointAnnotation>>
  ) {
    try {
      val manager = delegate.getManager(managerId) as PointAnnotationManager
      val annotations = manager.create(annotationOptions.map { it.toPointAnnotationOptions() })
      annotations.forEach {
        annotationMap[it.id] = it
      }
      if (managerCreateAnnotationMap[managerId].isNullOrEmpty()) {
        managerCreateAnnotationMap[managerId] = annotations.map { it.id }.toMutableList()
      } else {
        managerCreateAnnotationMap[managerId]!!.addAll(
          annotations.map { it.id }
            .toList()
        )
      }
      result.success(annotations.map { it.toFLTPointAnnotation() }.toMutableList())
    } catch (e: Exception) {
      result.error(e)
    }
  }

  override fun update(
    managerId: String,
    annotation: FLTPointAnnotationMessager.PointAnnotation,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    try {
      val manager = delegate.getManager(managerId) as PointAnnotationManager

      if (!annotationMap.containsKey(annotation.id)) {
        result?.error(Throwable("Annotation has not been added on the map: $annotation."))
        return
      }
      val originalAnnotation = updateAnnotation(annotation)

      manager.update(originalAnnotation)
      annotationMap[annotation.id] = originalAnnotation
      result.success(null)
    } catch (e: Exception) {
      result.error(e)
    }
  }

  override fun delete(
    managerId: String,
    annotation: FLTPointAnnotationMessager.PointAnnotation,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    try {
      val manager = delegate.getManager(managerId) as PointAnnotationManager

      if (!annotationMap.containsKey(annotation.id)) {
        result.error(Throwable("Annotation has not been added on the map: $annotation."))
        return
      }

      manager.delete(
        annotationMap[annotation.id]!!
      )
      annotationMap.remove(annotation.id)
      managerCreateAnnotationMap[managerId]?.remove(annotation.id)
      result.success(null)
    } catch (e: Exception) {
      result.error(e)
    }
  }

  override fun deleteAll(managerId: String, result: FLTPointAnnotationMessager.Result<Void>) {
    try {
      val manager = delegate.getManager(managerId) as PointAnnotationManager
      managerCreateAnnotationMap[managerId]?.apply {
        forEach { annotationMap.remove(it) }
        clear()
      }
      manager.deleteAll()
      result.success(null)
    } catch (e: Exception) {
      result.error(e)
    }
  }

  private fun updateAnnotation(annotation: FLTPointAnnotationMessager.PointAnnotation): PointAnnotation {
    val originalAnnotation = annotationMap[annotation.id]!!
    annotation.geometry?.let {
      originalAnnotation.geometry = it.toPoint()
    }
    annotation.image?.let {
      originalAnnotation.iconImageBitmap = (BitmapFactory.decodeByteArray(it, 0, it.size))
    }
    annotation.iconAnchor?.let {
      originalAnnotation.iconAnchor = it.toIconAnchor()
    }
    annotation.iconImage?.let {
      originalAnnotation.iconImage = it
    }
    annotation.iconOffset?.let {
      originalAnnotation.iconOffset = it
    }
    annotation.iconRotate?.let {
      originalAnnotation.iconRotate = it
    }
    annotation.iconSize?.let {
      originalAnnotation.iconSize = it
    }
    annotation.iconTextFit?.let {
      originalAnnotation.iconTextFit = it.toIconTextFit()
    }
    annotation.iconTextFitPadding?.let {
      originalAnnotation.iconTextFitPadding = it
    }
    annotation.symbolSortKey?.let {
      originalAnnotation.symbolSortKey = it
    }
    annotation.textAnchor?.let {
      originalAnnotation.textAnchor = it.toTextAnchor()
    }
    annotation.textField?.let {
      originalAnnotation.textField = it
    }
    annotation.textJustify?.let {
      originalAnnotation.textJustify = it.toTextJustify()
    }
    annotation.textLetterSpacing?.let {
      originalAnnotation.textLetterSpacing = it
    }
    annotation.textLineHeight?.let {
      originalAnnotation.textLineHeight = it
    }
    annotation.textMaxWidth?.let {
      originalAnnotation.textMaxWidth = it
    }
    annotation.textOffset?.let {
      originalAnnotation.textOffset = it
    }
    annotation.textRadialOffset?.let {
      originalAnnotation.textRadialOffset = it
    }
    annotation.textRotate?.let {
      originalAnnotation.textRotate = it
    }
    annotation.textSize?.let {
      originalAnnotation.textSize = it
    }
    annotation.textTransform?.let {
      originalAnnotation.textTransform = it.toTextTransform()
    }
    annotation.iconColor?.let {
      originalAnnotation.iconColorInt = it.toInt()
    }
    annotation.iconEmissiveStrength?.let {
      originalAnnotation.iconEmissiveStrength = it
    }
    annotation.iconHaloBlur?.let {
      originalAnnotation.iconHaloBlur = it
    }
    annotation.iconHaloColor?.let {
      originalAnnotation.iconHaloColorInt = it.toInt()
    }
    annotation.iconHaloWidth?.let {
      originalAnnotation.iconHaloWidth = it
    }
    annotation.iconImageCrossFade?.let {
      originalAnnotation.iconImageCrossFade = it
    }
    annotation.iconOpacity?.let {
      originalAnnotation.iconOpacity = it
    }
    annotation.textColor?.let {
      originalAnnotation.textColorInt = it.toInt()
    }
    annotation.textEmissiveStrength?.let {
      originalAnnotation.textEmissiveStrength = it
    }
    annotation.textHaloBlur?.let {
      originalAnnotation.textHaloBlur = it
    }
    annotation.textHaloColor?.let {
      originalAnnotation.textHaloColorInt = it.toInt()
    }
    annotation.textHaloWidth?.let {
      originalAnnotation.textHaloWidth = it
    }
    annotation.textOpacity?.let {
      originalAnnotation.textOpacity = it
    }
    return originalAnnotation
  }

  override fun setIconAllowOverlap(
    managerId: String,
    iconAllowOverlap: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconAllowOverlap = iconAllowOverlap
    result.success(null)
  }

  override fun getIconAllowOverlap(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconAllowOverlap != null) {
      result.success(manager.iconAllowOverlap!!)
    } else {
      result.success(null)
    }
  }

  override fun setIconIgnorePlacement(
    managerId: String,
    iconIgnorePlacement: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconIgnorePlacement = iconIgnorePlacement
    result.success(null)
  }

  override fun getIconIgnorePlacement(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconIgnorePlacement != null) {
      result.success(manager.iconIgnorePlacement!!)
    } else {
      result.success(null)
    }
  }

  override fun setIconKeepUpright(
    managerId: String,
    iconKeepUpright: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconKeepUpright = iconKeepUpright
    result.success(null)
  }

  override fun getIconKeepUpright(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconKeepUpright != null) {
      result.success(manager.iconKeepUpright!!)
    } else {
      result.success(null)
    }
  }

  override fun setIconOptional(
    managerId: String,
    iconOptional: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconOptional = iconOptional
    result.success(null)
  }

  override fun getIconOptional(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconOptional != null) {
      result.success(manager.iconOptional!!)
    } else {
      result.success(null)
    }
  }

  override fun setIconPadding(
    managerId: String,
    iconPadding: Double,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconPadding = iconPadding
    result.success(null)
  }

  override fun getIconPadding(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Double>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconPadding != null) {
      result.success(manager.iconPadding!!)
    } else {
      result.success(null)
    }
  }

  override fun setIconPitchAlignment(
    managerId: String,
    iconPitchAlignment: FLTPointAnnotationMessager.IconPitchAlignment,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconPitchAlignment = iconPitchAlignment.toIconPitchAlignment()
    result.success(null)
  }

  override fun getIconPitchAlignment(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.IconPitchAlignment>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconPitchAlignment != null) {
      result.success(manager.iconPitchAlignment!!.toFLTIconPitchAlignment())
    } else {
      result.success(null)
    }
  }

  override fun setIconRotationAlignment(
    managerId: String,
    iconRotationAlignment: FLTPointAnnotationMessager.IconRotationAlignment,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconRotationAlignment = iconRotationAlignment.toIconRotationAlignment()
    result.success(null)
  }

  override fun getIconRotationAlignment(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.IconRotationAlignment>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconRotationAlignment != null) {
      result.success(manager.iconRotationAlignment!!.toFLTIconRotationAlignment())
    } else {
      result.success(null)
    }
  }

  override fun setSymbolAvoidEdges(
    managerId: String,
    symbolAvoidEdges: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.symbolAvoidEdges = symbolAvoidEdges
    result.success(null)
  }

  override fun getSymbolAvoidEdges(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.symbolAvoidEdges != null) {
      result.success(manager.symbolAvoidEdges!!)
    } else {
      result.success(null)
    }
  }

  override fun setSymbolPlacement(
    managerId: String,
    symbolPlacement: FLTPointAnnotationMessager.SymbolPlacement,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.symbolPlacement = symbolPlacement.toSymbolPlacement()
    result.success(null)
  }

  override fun getSymbolPlacement(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.SymbolPlacement>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.symbolPlacement != null) {
      result.success(manager.symbolPlacement!!.toFLTSymbolPlacement())
    } else {
      result.success(null)
    }
  }

  override fun setSymbolSpacing(
    managerId: String,
    symbolSpacing: Double,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.symbolSpacing = symbolSpacing
    result.success(null)
  }

  override fun getSymbolSpacing(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Double>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.symbolSpacing != null) {
      result.success(manager.symbolSpacing!!)
    } else {
      result.success(null)
    }
  }

  override fun setSymbolZElevate(
    managerId: String,
    symbolZElevate: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.symbolZElevate = symbolZElevate
    result.success(null)
  }

  override fun getSymbolZElevate(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.symbolZElevate != null) {
      result.success(manager.symbolZElevate!!)
    } else {
      result.success(null)
    }
  }

  override fun setSymbolZOrder(
    managerId: String,
    symbolZOrder: FLTPointAnnotationMessager.SymbolZOrder,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.symbolZOrder = symbolZOrder.toSymbolZOrder()
    result.success(null)
  }

  override fun getSymbolZOrder(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.SymbolZOrder>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.symbolZOrder != null) {
      result.success(manager.symbolZOrder!!.toFLTSymbolZOrder())
    } else {
      result.success(null)
    }
  }

  override fun setTextAllowOverlap(
    managerId: String,
    textAllowOverlap: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textAllowOverlap = textAllowOverlap
    result.success(null)
  }

  override fun getTextAllowOverlap(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textAllowOverlap != null) {
      result.success(manager.textAllowOverlap!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextFont(
    managerId: String,
    textFont: List<String>,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textFont = textFont
    result.success(null)
  }

  override fun getTextFont(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<List<String>>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textFont != null) {
      result.success(manager.textFont!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextIgnorePlacement(
    managerId: String,
    textIgnorePlacement: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textIgnorePlacement = textIgnorePlacement
    result.success(null)
  }

  override fun getTextIgnorePlacement(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textIgnorePlacement != null) {
      result.success(manager.textIgnorePlacement!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextKeepUpright(
    managerId: String,
    textKeepUpright: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textKeepUpright = textKeepUpright
    result.success(null)
  }

  override fun getTextKeepUpright(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textKeepUpright != null) {
      result.success(manager.textKeepUpright!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextMaxAngle(
    managerId: String,
    textMaxAngle: Double,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textMaxAngle = textMaxAngle
    result.success(null)
  }

  override fun getTextMaxAngle(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Double>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textMaxAngle != null) {
      result.success(manager.textMaxAngle!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextOptional(
    managerId: String,
    textOptional: Boolean,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textOptional = textOptional
    result.success(null)
  }

  override fun getTextOptional(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Boolean>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textOptional != null) {
      result.success(manager.textOptional!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextPadding(
    managerId: String,
    textPadding: Double,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textPadding = textPadding
    result.success(null)
  }

  override fun getTextPadding(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<Double>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textPadding != null) {
      result.success(manager.textPadding!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextPitchAlignment(
    managerId: String,
    textPitchAlignment: FLTPointAnnotationMessager.TextPitchAlignment,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textPitchAlignment = textPitchAlignment.toTextPitchAlignment()
    result.success(null)
  }

  override fun getTextPitchAlignment(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.TextPitchAlignment>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textPitchAlignment != null) {
      result.success(manager.textPitchAlignment!!.toFLTTextPitchAlignment())
    } else {
      result.success(null)
    }
  }

  override fun setTextRotationAlignment(
    managerId: String,
    textRotationAlignment: FLTPointAnnotationMessager.TextRotationAlignment,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textRotationAlignment = textRotationAlignment.toTextRotationAlignment()
    result.success(null)
  }

  override fun getTextRotationAlignment(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.TextRotationAlignment>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textRotationAlignment != null) {
      result.success(manager.textRotationAlignment!!.toFLTTextRotationAlignment())
    } else {
      result.success(null)
    }
  }

  override fun setIconTranslate(
    managerId: String,
    iconTranslate: List<Double>,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconTranslate = iconTranslate
    result.success(null)
  }

  override fun getIconTranslate(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<List<Double>>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconTranslate != null) {
      result.success(manager.iconTranslate!!)
    } else {
      result.success(null)
    }
  }

  override fun setIconTranslateAnchor(
    managerId: String,
    iconTranslateAnchor: FLTPointAnnotationMessager.IconTranslateAnchor,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.iconTranslateAnchor = iconTranslateAnchor.toIconTranslateAnchor()
    result.success(null)
  }

  override fun getIconTranslateAnchor(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.IconTranslateAnchor>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.iconTranslateAnchor != null) {
      result.success(manager.iconTranslateAnchor!!.toFLTIconTranslateAnchor())
    } else {
      result.success(null)
    }
  }

  override fun setTextTranslate(
    managerId: String,
    textTranslate: List<Double>,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textTranslate = textTranslate
    result.success(null)
  }

  override fun getTextTranslate(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<List<Double>>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textTranslate != null) {
      result.success(manager.textTranslate!!)
    } else {
      result.success(null)
    }
  }

  override fun setTextTranslateAnchor(
    managerId: String,
    textTranslateAnchor: FLTPointAnnotationMessager.TextTranslateAnchor,
    result: FLTPointAnnotationMessager.Result<Void>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    manager.textTranslateAnchor = textTranslateAnchor.toTextTranslateAnchor()
    result.success(null)
  }

  override fun getTextTranslateAnchor(
    managerId: String,
    result: FLTPointAnnotationMessager.Result<FLTPointAnnotationMessager.TextTranslateAnchor>
  ) {
    val manager = delegate.getManager(managerId) as PointAnnotationManager
    if (manager.textTranslateAnchor != null) {
      result.success(manager.textTranslateAnchor!!.toFLTTextTranslateAnchor())
    } else {
      result.success(null)
    }
  }
}

fun PointAnnotation.toFLTPointAnnotation(): FLTPointAnnotationMessager.PointAnnotation {
  val builder = FLTPointAnnotationMessager.PointAnnotation.Builder()
  builder.setId(this.id.toString())

  this.geometry.let {
    builder.setGeometry(it.toMap())
  }
  this.iconAnchor?.let {
    builder.setIconAnchor(it.toFLTIconAnchor())
  }
  this.iconImage?.let {
    builder.setIconImage(it)
  }
  this.iconOffset?.let {
    builder.setIconOffset(it)
  }
  this.iconRotate?.let {
    builder.setIconRotate(it)
  }
  this.iconSize?.let {
    builder.setIconSize(it)
  }
  this.iconTextFit?.let {
    builder.setIconTextFit(it.toFLTIconTextFit())
  }
  this.iconTextFitPadding?.let {
    builder.setIconTextFitPadding(it)
  }
  this.symbolSortKey?.let {
    builder.setSymbolSortKey(it)
  }
  this.textAnchor?.let {
    builder.setTextAnchor(it.toFLTTextAnchor())
  }
  this.textField?.let {
    builder.setTextField(it)
  }
  this.textJustify?.let {
    builder.setTextJustify(it.toFLTTextJustify())
  }
  this.textLetterSpacing?.let {
    builder.setTextLetterSpacing(it)
  }
  this.textLineHeight?.let {
    builder.setTextLineHeight(it)
  }
  this.textMaxWidth?.let {
    builder.setTextMaxWidth(it)
  }
  this.textOffset?.let {
    builder.setTextOffset(it)
  }
  this.textRadialOffset?.let {
    builder.setTextRadialOffset(it)
  }
  this.textRotate?.let {
    builder.setTextRotate(it)
  }
  this.textSize?.let {
    builder.setTextSize(it)
  }
  this.textTransform?.let {
    builder.setTextTransform(it.toFLTTextTransform())
  }
  this.iconColorInt?.let {
    // colorInt is 32 bit and may be bigger than MAX_INT, so transfer to UInt firstly and then to Long.
    builder.setIconColor(it.toUInt().toLong())
  }
  this.iconEmissiveStrength?.let {
    builder.setIconEmissiveStrength(it)
  }
  this.iconHaloBlur?.let {
    builder.setIconHaloBlur(it)
  }
  this.iconHaloColorInt?.let {
    // colorInt is 32 bit and may be bigger than MAX_INT, so transfer to UInt firstly and then to Long.
    builder.setIconHaloColor(it.toUInt().toLong())
  }
  this.iconHaloWidth?.let {
    builder.setIconHaloWidth(it)
  }
  this.iconImageCrossFade?.let {
    builder.setIconImageCrossFade(it)
  }
  this.iconOpacity?.let {
    builder.setIconOpacity(it)
  }
  this.textColorInt?.let {
    // colorInt is 32 bit and may be bigger than MAX_INT, so transfer to UInt firstly and then to Long.
    builder.setTextColor(it.toUInt().toLong())
  }
  this.textEmissiveStrength?.let {
    builder.setTextEmissiveStrength(it)
  }
  this.textHaloBlur?.let {
    builder.setTextHaloBlur(it)
  }
  this.textHaloColorInt?.let {
    // colorInt is 32 bit and may be bigger than MAX_INT, so transfer to UInt firstly and then to Long.
    builder.setTextHaloColor(it.toUInt().toLong())
  }
  this.textHaloWidth?.let {
    builder.setTextHaloWidth(it)
  }
  this.textOpacity?.let {
    builder.setTextOpacity(it)
  }

  return builder.build()
}

fun FLTPointAnnotationMessager.PointAnnotationOptions.toPointAnnotationOptions(): PointAnnotationOptions {
  val options = PointAnnotationOptions()
  this.geometry?.let {
    options.withPoint(it.toPoint())
  }
  this.image?.let {
    options.withIconImage(BitmapFactory.decodeByteArray(it, 0, it.size))
  }
  this.iconAnchor?.let {
    options.withIconAnchor(it.toIconAnchor())
  }
  this.iconImage?.let {
    options.withIconImage(it)
  }
  this.iconOffset?.let {
    options.withIconOffset(it)
  }
  this.iconRotate?.let {
    options.withIconRotate(it)
  }
  this.iconSize?.let {
    options.withIconSize(it)
  }
  this.iconTextFit?.let {
    options.withIconTextFit(it.toIconTextFit())
  }
  this.iconTextFitPadding?.let {
    options.withIconTextFitPadding(it)
  }
  this.symbolSortKey?.let {
    options.withSymbolSortKey(it)
  }
  this.textAnchor?.let {
    options.withTextAnchor(it.toTextAnchor())
  }
  this.textField?.let {
    options.withTextField(it)
  }
  this.textJustify?.let {
    options.withTextJustify(it.toTextJustify())
  }
  this.textLetterSpacing?.let {
    options.withTextLetterSpacing(it)
  }
  this.textLineHeight?.let {
    options.withTextLineHeight(it)
  }
  this.textMaxWidth?.let {
    options.withTextMaxWidth(it)
  }
  this.textOffset?.let {
    options.withTextOffset(it)
  }
  this.textRadialOffset?.let {
    options.withTextRadialOffset(it)
  }
  this.textRotate?.let {
    options.withTextRotate(it)
  }
  this.textSize?.let {
    options.withTextSize(it)
  }
  this.textTransform?.let {
    options.withTextTransform(it.toTextTransform())
  }
  this.iconColor?.let {
    options.withIconColor(it.toInt())
  }
  this.iconEmissiveStrength?.let {
    options.withIconEmissiveStrength(it)
  }
  this.iconHaloBlur?.let {
    options.withIconHaloBlur(it)
  }
  this.iconHaloColor?.let {
    options.withIconHaloColor(it.toInt())
  }
  this.iconHaloWidth?.let {
    options.withIconHaloWidth(it)
  }
  this.iconImageCrossFade?.let {
    options.withIconImageCrossFade(it)
  }
  this.iconOpacity?.let {
    options.withIconOpacity(it)
  }
  this.textColor?.let {
    options.withTextColor(it.toInt())
  }
  this.textEmissiveStrength?.let {
    options.withTextEmissiveStrength(it)
  }
  this.textHaloBlur?.let {
    options.withTextHaloBlur(it)
  }
  this.textHaloColor?.let {
    options.withTextHaloColor(it.toInt())
  }
  this.textHaloWidth?.let {
    options.withTextHaloWidth(it)
  }
  this.textOpacity?.let {
    options.withTextOpacity(it)
  }
  return options
}
// End of generated file.